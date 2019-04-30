import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import pickle
import scipy.stats as stats

def success_helper(dd, e):
    return len([d for d in dd if d < e**2]) * 1.0 / len(dd)

def reward_plot(experiment, label, color):
    #file = open('experiments/' + experiment + '/agrewards.pkl', 'rb')
    file = open(experiment + '/lragrewards.pkl', 'rb')
    data = pickle.load(file)
    file.close()
    adv = [data[3*n] for n in range(int(len(data)/3))]
    ag = [data[3*n + 1] for n in range(int(len(data)/3))]
    x = np.arange(len(adv))
    #label_ag = label + '_agg'
    #print (label_ag)
    plt.plot(x, ag, color=color, label=label)

    #label_adv = label + '_adv'
    #print (label_adv)
    plt.plot(x, adv, linestyle='dashed', color=color)

def success_rate(experiment):
    #file = open('experiments/' + experiment + '/benchmark.pkl', 'rb')
    file = open(experiment + '/lrbenchmark.pkl', 'rb')
    data = pickle.load(file)
    file.close()
    adversary = [e[0][-1][0] for e in data]
    agent = [min(e[0][-1][1][2], e[0][-1][2][2]) for e in data]
    adversary.sort()
    agent.sort()
    return agent, adversary

def success_helper_multi(thresholds, a, b):
    a_index = 0
    b_index = 0
    a_cum = 0
    b_cum = 0
    a_output = np.zeros(len(thresholds))
    b_output = np.zeros(len(thresholds))
    for i, t in enumerate(thresholds):
        while a_index < len(a) and a[a_index] < t**2:
            a_index += 1
            a_cum += 1
        while b_index < len(b) and b[b_index] < t**2:
            b_index += 1
            b_cum += 1
        a_output[i] = a_cum
        b_output[i] = b_cum
    return (a_output / len(a), b_output / len(b))

def success_plot(experiment, label, color):
    agent, adversary = success_rate(experiment)
    x = np.arange(0, 1, .05)
    y, z = success_helper_multi(x, agent, adversary)
    plt.plot(x, y, color=color, label=label)
    plt.plot(x, z, color=color, linestyle='dashed')

def success_row(experiments, threshold):
    ag_data = []
    adv_data = []
    for e in experiments:
        ag, adv = success_rate(e)
        ag_data += ag
        adv_data += adv
    ag_data.sort()
    adv_data.sort()
    ag_succ = success_helper(ag_data, threshold)
    adv_succ = success_helper(adv_data, threshold)
    return [ag_succ, adv_succ, ag_succ - adv_succ]

c = ['b', 'r', 'g', 'y']
l = ['maddpg-maddpg', 'maddpg-ddpg', 'ddpg-maddpg', 'ddpg-ddpg']
e = ['simple_adversary/maddpg/vary_lr/001',
                          'simple_adversary/maddpg_ddpg',
                          'simple_adversary/ddpg_maddpg',
                          'simple_adversary/ddpg_ddpg']
for i in range(len(e)):
	reward_plot(e[i], l[i], c[i])
plt.xlabel("Timesteps (in thousands)")
plt.ylabel("Rewards")
plt.legend(loc='lower right')
plt.show()

for i in range(len(e)):
	success_plot(e[i], l[i], c[i])
plt.xlabel("Threshold")
plt.ylabel("Success Rate")
plt.legend(loc='lower right')
plt.show()

threshold = 0.4
table2 = pd.DataFrame([['maddpg', 'maddpg'] + success_row(['simple_adversary/maddpg/vary_lr/001'], threshold),
                       ['maddpg', 'ddpg'] + success_row(['simple_adversary/maddpg_ddpg'], threshold),
                       ['ddpg', 'maddpg'] + success_row(['simple_adversary/ddpg_maddpg'], threshold),
                       ['ddpg', 'ddpg'] + success_row(['simple_adversary/ddpg_ddpg'], threshold),
		       ],
 		       columns=['Agent policy',
                      		'Adversary policy',
                      		'Agent success rate',
                      		'Adversary success rate',
                      		'Difference of rates'])
print(table2)

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import pickle
import scipy.stats as stats

def success_helper(dd, e):
    return len([d for d in dd if d < e**2]) * 1.0 / len(dd)

def reward_plot(experiment, label, color, tot, adver):
    #file = open('experiments/' + experiment + '/agrewards.pkl', 'rb')
    file = open(experiment, 'rb')
    data = pickle.load(file)
    #print (data)
    file.close()
    adv = [data[tot*n] for n in range(int(len(data)/tot))]
    ag = [data[tot*n + adver] for n in range(int(len(data)/tot))]
    x = np.arange(len(adv))
    #label_ag = label + '_agg'
    #print (label_ag)
    plt.plot(x, ag, color=color, label=label)

    #label_adv = label + '_adv'
    #print (label_adv)
    plt.plot(x, adv, linestyle='dashed', color=color)

def success_rate(experiment, tot, adver):
    #file = open('experiments/' + experiment + '/benchmark.pkl', 'rb')
    file = open(experiment, 'rb')
    data = pickle.load(file)
    #print (data)
    file.close()
    agent = []
    adversary = []
    if tot == 3:
    	adversary = [e[0][-1][0] for e in data]
    	agent = [min(e[0][-1][1][2], e[0][-1][2][2]) for e in data]
    if tot == 4:
    	adversary = [min(e[0][-1][0], e[0][-1][1]) for e in data]
    	agent = [min(e[0][-1][2][2], e[0][-1][3][2]) for e in data]
    if tot == 5:
    	adversary = [min(e[0][-1][0], e[0][-1][1], e[0][-1][2]) for e in data]
    	agent = [min(e[0][-1][3][2], e[0][-1][4][2]) for e in data]
    if tot == 7:
    	adversary = [min(e[0][-1][0], e[0][-1][1], e[0][-1][2], e[0][-1][3]) for e in data]
    	agent = [min(e[0][-1][4][2], e[0][-1][5][2], e[0][-1][6][2]) for e in data]
    agent.sort()
    #print ("ADV", adversary)
    #print ("AG", agent)
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

def success_plot(experiment, label, color, tot, adver):
    agent, adversary = success_rate(experiment, tot, adver)
    x = np.arange(0, 1, .05)
    y, z = success_helper_multi(x, agent, adversary)
    plt.plot(x, y, color=color, label=label)
    plt.plot(x, z, color=color, linestyle='dashed')

def success_row(experiments, threshold, tot, adver):
    ag_data = []
    adv_data = []
    for e in experiments:
        ag, adv = success_rate(e, tot, adver)
        ag_data += ag
        adv_data += adv
    ag_data.sort()
    adv_data.sort()
    ag_succ = success_helper(ag_data, threshold)
    adv_succ = success_helper(adv_data, threshold)
    return [ag_succ, adv_succ, ag_succ - adv_succ]

c = ['b', 'r', 'g', 'y']
l = ['2_1', '4_2', '5_3', '7_4']
tot = [3, 4, 5, 7]
adv = [1, 2, 3, 4]
e = ['simple_adversary/maddpg/vary_lr/001/lragrewards.pkl',
                          'simple_adversary/maddpg/vary_agents/4_2/lragrewards.pkl',
                          'simple_adversary/maddpg/vary_agents/5_3/lragrewards.pkl',
                          'simple_adversary/maddpg/vary_agents/7_4/lragrewards.pkl']
eb = ['simple_adversary/maddpg/vary_lr/001/lrbenchmark.pkl',
                          'simple_adversary/maddpg/vary_agents/4_2/lrbenchmark.pkl',
                          'simple_adversary/maddpg/vary_agents/5_3/lrbenchmark.pkl',
                          'simple_adversary/maddpg/vary_agents/7_4/lrbenchmark.pkl']
for i in range(len(e)):
	reward_plot(e[i], l[i], c[i], tot[i], adv[i])
plt.xlabel("Timesteps (in thousands)")
plt.ylabel("Rewards")
plt.legend(loc='top left')
plt.show()

for i in range(len(e)):
	success_plot(eb[i], l[i], c[i], tot[i], adv[i])
plt.xlabel("Threshold")
plt.ylabel("Success Rate")
plt.legend(loc='top left')
plt.show()

threshold = 0.4
table2 = pd.DataFrame([['maddpg', 'maddpg', 2, 1] + success_row([eb[0]], threshold, tot[0], adv[0]),
                       ['maddpg', 'maddpg', 4, 2] + success_row([eb[1]], threshold, tot[1], adv[1]),
                       ['maddpg', 'maddpg', 5, 3] + success_row([eb[2]], threshold, tot[2], adv[2]),
                       ['maddpg', 'maddpg', 7, 4] + success_row([eb[3]], threshold, tot[3], adv[3]),
		       ],
 		       columns=['Agent policy',
                      		'Adversary policy',
				'Total Agents',
				'Total Adversarial Agents',
                      		'Agent success rate',
                      		'Adversary success rate',
                      		'Difference of rates'])
print(table2)

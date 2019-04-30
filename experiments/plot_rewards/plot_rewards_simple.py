import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import pickle
import scipy.stats as stats

def reward_plot(experiment, label, color):
    #file = open('experiments/' + experiment + '/agrewards.pkl', 'rb')
    file = open(experiment, 'rb')
    data = pickle.load(file)
    file.close()
    ag = [data[3*n] for n in range(int(len(data)/3))]
    x = np.arange(len(ag))
    plt.plot(x, ag, color=color, label=label)

def benchmark_data(experiment):
    #file = open('experiments/' + benchmark, 'rb')
    file = open(experiment, 'rb')
    data = pickle.load(file)
    file.close()
    # For each episode, average over frames of sum over landmarks of minimum over agents
    # of distance from agent to landmark.
    dist = [np.average([fr[0][2] for fr in ep[0]]) for ep in data]
    # For each episode, number of collisions
    coll = [np.sum([(ag[1] - 1)*1.0/2 for fr in ep[0] for ag in fr]) for ep in data]
    return (dist, coll)

def confidence_interval(a):
    return stats.norm.interval(0.95, loc=np.mean(a), scale=stats.sem(a))

def combine_benchmarks(benchmarks):
    dist = []
    coll = []
    for b in benchmarks:
        d, c = benchmark_data(b)
        dist += d
        coll += c
    return [np.average(dist), confidence_interval(dist), np.average(coll), confidence_interval(coll)]

c = ['b', 'r', 'g', 'y']
l = ['0.80', '0.95', '1.00']
e = ['simple_spread/maddpg/vary_gamma/080/gammaagrewards.pkl', 'simple_spread/maddpg/vary_lr/001/lragrewards.pkl', 'simple_spread/maddpg/vary_gamma/100/gammaagrewards.pkl']
eb = ['simple_spread/maddpg/vary_gamma/080/gammabenchmark.pkl', 'simple_spread/maddpg/vary_lr/001/lrbenchmark.pkl', 'simple_spread/maddpg/vary_gamma/100/gammabenchmark.pkl'] 
#e = ['simple_spread/maddpg/vary_lr/001/lragrewards.pkl', 'simple_spread/ddpg_ddpg/lragrewards.pkl']
#eb = ['simple_spread/maddpg/vary_lr/001/lrbenchmark.pkl', 'simple_spread/ddpg_ddpg/lrbenchmark.pkl'] 

for i in range(len(e)):
        reward_plot(e[i], l[i], c[i])
plt.xlabel("Timesteps (in thousands)")
plt.ylabel("Rewards")
plt.legend(loc='lower right')
plt.show()

table2 = pd.DataFrame([['maddpg', l[0]] + combine_benchmarks([eb[0]]),
                       ['maddpg', l[1]] + combine_benchmarks([eb[1]]),
                       ['maddpg', l[2]] + combine_benchmarks([eb[2]]),
                      ],
                      columns=['Agent policy',
			       'Discounting Factor',
                               'Average distance',
                               'Average distance conf. int.',
                               'Number of collisions',
                               'Number of collisions conf. int.',
                              ])
print(table2)

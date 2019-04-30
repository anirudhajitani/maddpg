import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import pickle
import scipy.stats as stats

def reward_plot(experiment, label, color, i):
    #file = open('experiments/' + experiment + '/agrewards.pkl', 'rb')
    file = open(experiment, 'rb')
    data = pickle.load(file)
    file.close()
    ag = [data[3*n] for n in range(int(len(data)/3))]
    x = np.arange(len(ag))
    if i < 2:
    	plt.plot(x, ag, color=color, label=label)
    else:
    	plt.plot(x, ag, color=color,linestyle='dashed', label=label)

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

c = ['b', 'r', 'b', 'r']
l = ['3-No Collison', '3-Collison', '5-No Collison', '5-Collison']
e = ['simple_spread/maddpg/no_coll/03/collagrewards.pkl', 'simple_spread/maddpg/vary_lr/001/lragrewards.pkl', 'simple_spread/maddpg/no_coll/05/collagrewards.pkl', 'simple_spread/maddpg/vary_agents/05/spread_maddpg_maagrewards.pkl']
eb = ['simple_spread/maddpg/no_coll/03/collbenchmark.pkl', 'simple_spread/maddpg/vary_lr/001/lrbenchmark.pkl', 'simple_spread/maddpg/no_coll/05/collbenchmark.pkl', 'simple_spread/maddpg/vary_agents/05/spread_maddpg_mabenchmark.pkl']

for i in range(len(e)):
        reward_plot(e[i], l[i], c[i], i)
plt.xlabel("Timesteps (in thousands)")
plt.ylabel("Rewards")
plt.legend(loc='lower right')
plt.show()

table2 = pd.DataFrame([['maddpg', 3, 'No'] + combine_benchmarks([eb[0]]),
                       ['maddpg', 3, 'Yes'] + combine_benchmarks([eb[1]]),
                       ['maddpg', 5, 'No'] + combine_benchmarks([eb[2]]),
                       ['maddpg', 5, 'Yes'] + combine_benchmarks([eb[3]]),
                      ],
                      columns=['Agent policy',
			       'Number of Agents',
			       'Negative Reward for Collison', 
                               'Average distance',
                               'Average distance conf. int.',
                               'Number of collisions',
                               'Number of collisions conf. int.',
                              ])
print(table2)

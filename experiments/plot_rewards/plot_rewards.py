import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import pickle
import scipy.stats as stats


REWARD_FILE = 'policy_ma_5/spread_maddpg_maagrewards.pkl'
BENCHMARK_FILE = 'policy_ma_5/spread_maddpg_mabenchmark.pkl'

def reward_plot():
    file = open(REWARD_FILE, 'rb')
    data = pickle.load(file)
    file.close()
    ag = [data[3*n] for n in range(int(len(data)/3))]
    x = np.arange(len(ag))
    plt.plot(x, ag, 'b')
    plt.show()

def benchmark_data(benchmark):
    file = open(BENCHMARK_FILE, 'rb')
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


reward_plot()
table2 = pd.DataFrame([['maddpg'] + combine_benchmarks([BENCHMARK_FILE]),],
                      columns=['Agent policy',
                               'Average distance',
                               'Average distance conf. int.',
                               'Number of collisions',
                               'Number of collisions conf. int.',
                              ])
print (table2)

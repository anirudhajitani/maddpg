echo "WITHOUT COLLISON"
mkdir -p ./simple_spread/maddpg/no_coll/03
python train_2.py --scenario simple_spread --exp-name no_coll_03 --save-dir ./simple_spread/maddpg/no_coll/03/coll --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name no_coll_03 --save-dir ./simple_spread/maddpg/no_coll/03/coll --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/no_coll/05
python train_2.py --scenario simple_spread --exp-name no_coll_03 --num-agents 5 --save-dir ./simple_spread/maddpg/no_coll/05/coll --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name no_coll_03 --num-agents 5 --save-dir ./simple_spread/maddpg/no_coll/05/coll --benchmark-iters=50000 --benchmark

echo "PROXIMITY BASED"
mkdir -p ./simple_adversary/maddpg/proximity/03
python train_2.py --scenario simple_adversary --exp-name prox_03 --num-adversaries 1 --save-dir ./simple_adversary/maddpg/proximity/03/prox --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name prox_03 --num-adversaries 1 --save-dir ./simple_adversary/maddpg/proximity/03/prox --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/proximity/05
python train_2.py --scenario simple_adversary --exp-name prox_05 --num-agents 5 --num-adversaries 2 --save-dir ./simple_adversary/maddpg/proximity/05/prox --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name prox_05 --num-agents 5 --num-adversaries 2 --save-dir ./simple_adversary/maddpg/proximity/05/prox --benchmark-iters=50000 --benchmark


echo "PROXIMITY BASED"
mkdir -p ./simple_adversary/maddpg/vary_gamma/100
python train_2.py --scenario simple_spread --exp-name gamma_100 --gamma 1.0 --save-dir ./simple_spread/maddpg/vary_gamma/100/gamma --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name gamma_100 --gamma 1.0 --save-dir ./simple_spread/maddpg/vary_gamma/100/gamma --benchmark-iters=50000 --benchmark

echo "VARY AGENT SIZE"
mkdir -p ./simple_spread/maddpg/vary_agent_size/010
python train_2.py --scenario simple_spread --exp-name agent_size_010 --save-dir ./simple_spread/maddpg/vary_agent_size/010/as --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name agent_size_010 --save-dir ./simple_spread/maddpg/vary_agent_size/010/as --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_agent_size/010
python train_2.py --scenario simple_adversary --exp-name agent_size_010 --save-dir ./simple_adversary/maddpg/vary_agent_size/010/as --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name agent_size_010 --save-dir ./simple_adversary/maddpg/vary_agent_size/010/as --benchmark-iters=50000 --benchmark

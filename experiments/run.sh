#Varying Learning Rate

echo "VARY AGENTS"

mkdir -p ./simple_adversary/maddpg/vary_agents/4_2
python train_2.py --scenario simple_adversary --exp-name agents_4_2 --num-agents 4 --num-adversaries 2 --save-dir ./simple_adversary/maddpg/vary_agents/4_2/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name agents_4_2 --num-agents 4 --num-adversaries 2 --save-dir ./simple_adversary/maddpg/vary_agents/4_2/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_agents/5_3
python train_2.py --scenario simple_adversary --exp-name agents_5_3 --num-agents 5 --num-adversaries 3 --save-dir ./simple_adversary/maddpg/vary_agents/5_3/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name agents_5_3 --num-agents 5 --num-adversaries 3 --save-dir ./simple_adversary/maddpg/vary_agents/5_3/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_agents/7_4
python train_2.py --scenario simple_adversary --exp-name agents_7_4 --num-agents 7 --num-adversaries 4 --save-dir ./simple_adversary/maddpg/vary_agents/7_4/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name agents_7_4 --num-agents 7 --num-adversaries 4 --save-dir ./simple_adversary/maddpg/vary_agents/7_4/lr --benchmark-iters=50000 --benchmark


mkdir -p ./simple_adversary/maddpg_ddpg/
python train_2.py --scenario simple_adversary --exp-name maddpg_ddpg --num-adversaries 1 --good-policy maddpg --adv-policy ddpg --save-dir ./simple_adversary/maddpg_ddpg/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name maddpg_ddpg --num-adversaries 1 --good-policy maddpg --adv-policy ddpg --save-dir ./simple_adversary/maddpg_ddpg/lr --benchmark-iters=50000 --benchmark

mkdir -p ./simple_adversary/ddpg_maddpg/
python train_2.py --scenario simple_adversary --exp-name ddpg_maddpg --num-adversaries 1 --good-policy ddpg --adv-policy maddpg --save-dir ./simple_adversary/ddpg_maddpg/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name ddpg_maddpg --num-adversaries 1 --good-policy ddpg --adv-policy maddpg --save-dir ./simple_adversary/ddpg_maddpg/lr --benchmark-iters=50000 --benchmark

mkdir -p ./simple_adversary/ddpg_ddpg/
python train_2.py --scenario simple_adversary --exp-name ddpg_ddpg --num-adversaries 1 --good-policy ddpg --adv-policy ddpg --save-dir ./simple_adversary/ddpg_ddpg/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name ddpg_ddpg --num-adversaries 1 --good-policy ddpg --adv-policy ddpg --save-dir ./simple_adversary/ddpg_ddpg/lr --benchmark-iters=50000 --benchmark

mkdir -p ./simple_spread/ddpg_ddpg/
python train_2.py --scenario simple_spread --exp-name ddpg_ddpg --good-policy ddpg --adv-policy ddpg --save-dir ./simple_spread/ddpg_ddpg/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name ddpg_ddpg --good-policy ddpg --adv-policy ddpg --save-dir ./simple_spread/ddpg_ddpg/lr --benchmark-iters=50000 --benchmark

mkdir -p ./simple_spread/maddpg/vary_agents/4
python train_2.py --scenario simple_spread --exp-name agents_4 --num-agents 4 --save-dir ./simple_spread/maddpg/vary_agents/4/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name agents_4 --num-agents 4 --save-dir ./simple_spread/maddpg/vary_agents/4/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/vary_agents/07
python train_2.py --scenario simple_spread --exp-name agents_07 --num-agents 7 --save-dir ./simple_spread/maddpg/vary_agents/07/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name agents_07 --num-agents 7 --save-dir ./simple_spread/maddpg/vary_agents/07/lr --benchmark-iters=50000 --benchmark

echo "VARY REPLAY BUFFER SIZE"

mkdir -p ./simple_spread/maddpg/vary_replay/10000000
python train_2.py --scenario simple_spread --exp-name replay_1e7 --replay-size 10000000 --save-dir ./simple_spread/maddpg/vary_replay/10000000/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name replay_1e7 --replay-size 10000000 --save-dir ./simple_spread/maddpg/vary_replay/10000000/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_replay/10000000
python train_2.py --scenario simple_adversary --exp-name replay_1e7 --replay-size 10000000 --save-dir ./simple_adversary/maddpg/vary_replay/10000000/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name replay_1e7 --replay-size 10000000 --save-dir ./simple_adversary/maddpg/vary_replay/10000000/lr --benchmark-iters=50000 --benchmark

mkdir -p ./simple_spread/maddpg/vary_replay/100000
python train_2.py --scenario simple_spread --exp-name replay_1e5 --replay-size 100000 --save-dir ./simple_spread/maddpg/vary_replay/100000/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name replay_1e5 --replay-size 100000 --save-dir ./simple_spread/maddpg/vary_replay/100000/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_replay/100000
python train_2.py --scenario simple_adversary --exp-name replay_1e5 --replay-size 100000 --save-dir ./simple_adversary/maddpg/vary_replay/100000/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name replay_1e5 --replay-size 100000 --save-dir ./simple_adversary/maddpg/vary_replay/100000/lr --benchmark-iters=50000 --benchmark



echo "VARY UPDATE FREQUENCY"
mkdir -p ./simple_spread/maddpg/vary_update/10
python train_2.py --scenario simple_spread --exp-name update_10 --update-step 10 --save-dir ./simple_spread/maddpg/vary_update/10/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name update_10 --update-step 10 --save-dir ./simple_spread/maddpg/vary_update/10/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_update/10
python train_2.py --scenario simple_adversary --exp-name update_10 --update-step 10 --save-dir ./simple_adversary/maddpg/vary_update/10/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name update_10 --update-step 10 --save-dir ./simple_adversary/maddpg/vary_update/10/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/vary_update/1000
python train_2.py --scenario simple_spread --exp-name update_1000 --update-step 1000 --save-dir ./simple_spread/maddpg/vary_update/1000/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name update_1000 --update-step 1000 --save-dir ./simple_spread/maddpg/vary_update/1000/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_update/1000
python train_2.py --scenario simple_adversary --exp-name update_1000 --update-step 1000 --save-dir ./simple_adversary/maddpg/vary_update/1000/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name update_1000 --update-step 1000 --save-dir ./simple_adversary/maddpg/vary_update/1000/lr --benchmark-iters=50000 --benchmark

echo "VARY LR SPREAD"
mkdir -p ./simple_spread/maddpg/vary_lr/001
python train_2.py --scenario simple_spread --exp-name lr_001 --lr 0.01 --save-dir ./simple_spread/maddpg/vary_lr/001/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name lr_001 --lr 0.01 --save-dir ./simple_spread/maddpg/vary_lr/001/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/vary_lr/0001
python train_2.py --scenario simple_spread --exp-name lr_0001 --lr 0.001 --save-dir ./simple_spread/maddpg/vary_lr/0001/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name lr_0001 --lr 0.001 --save-dir ./simple_spread/maddpg/vary_lr/0001/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/vary_lr/01
python train_2.py --scenario simple_spread --exp-name lr_01 --lr 0.1 --save-dir ./simple_spread/maddpg/vary_lr/01/lr --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name lr_01 --lr 0.1 --save-dir ./simple_spread/maddpg/vary_lr/01/lr --benchmark-iters=50000 --benchmark

echo "VARY LR ADVERSARY"
mkdir -p ./simple_adversary/maddpg/vary_lr/001
python train_2.py --scenario simple_adversary --exp-name lr_001 --lr 0.01 --save-dir ./simple_adversary/maddpg/vary_lr/001/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name lr_001 --lr 0.01 --save-dir ./simple_adversary/maddpg/vary_lr/001/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_lr/0001
python train_2.py --scenario simple_adversary --exp-name lr_0001 --lr 0.001 --save-dir ./simple_adversary/maddpg/vary_lr/0001/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name lr_0001 --lr 0.001 --save-dir ./simple_adversary/maddpg/vary_lr/0001/lr --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_lr/01
python train_2.py --scenario simple_adversary --exp-name lr_01 --lr 0.1 --save-dir ./simple_adversary/maddpg/vary_lr/01/lr --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name lr_01 --lr 0.1 --save-dir ./simple_adversary/maddpg/vary_lr/01/lr --benchmark-iters=50000 --benchmark

echo "VARY GAMMA SPREAD"
mkdir -p ./simple_spread/maddpg/vary_gamma/080
python train_2.py --scenario simple_spread --exp-name gamma_080 --gamma 0.8 --save-dir ./simple_spread/maddpg/vary_gamma/080/gamma --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name gamma_080 --gamma 0.8 --save-dir ./simple_spread/maddpg/vary_gamma/080/gamma --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/vary_gamma/100
python train_2.py --scenario simple_spread --exp-name gamma_100 --gamma 1.0 --save-dir ./simple_spread/maddpg/vary_gamma/100/gamma --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name gamma_100 --gamma 1.0 --save-dir ./simple_spread/maddpg/vary_gamma/100/gamma --benchmark-iters=50000 --benchmark

echo "VARY GAMMA ADVERSARY"
mkdir -p ./simple_adversary/maddpg/vary_gamma/080
python train_2.py --scenario simple_adversary --exp-name gamma_080 --gamma 0.8 --save-dir ./simple_adversary/maddpg/vary_gamma/080/gamma --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name gamma_080 --gamma 0.8 --save-dir ./simple_adversary/maddpg/vary_gamma/080/gamma --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_gamma/100
python train_2.py --scenario simple_adversary --exp-name gamma_100 --gamma 1.0 --save-dir ./simple_adversary/maddpg/vary_gamma/100/gamma --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name gamma_100 --gamma 1.0 --save-dir ./simple_adversary/maddpg/vary_gamma/100/gamma --benchmark-iters=50000 --benchmark

echo "VARY UNITS SPREAD"
mkdir -p ./simple_spread/maddpg/vary_units/128
python train_2.py --scenario simple_spread --exp-name units_128 --num-units 128 --save-dir ./simple_spread/maddpg/vary_units/128/units --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name units_128 --num-units 128 --save-dir ./simple_spread/maddpg/vary_units/128/units --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/vary_units/32
python train_2.py --scenario simple_spread --exp-name units_32 --num-units 32 --save-dir ./simple_spread/maddpg/vary_units/32/units --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name units_32 --num-units 32 --save-dir ./simple_spread/maddpg/vary_units/32/units --benchmark-iters=50000 --benchmark

echo "VARY UNITS ADVERSARY"
mkdir -p ./simple_adversary/maddpg/vary_units/128
python train_2.py --scenario simple_adversary --exp-name units_128 --num-units 128 --save-dir ./simple_adversary/maddpg/vary_units/128/units --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name units_128 --num-units 128 --save-dir ./simple_adversary/maddpg/vary_units/128/units --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_units/32
python train_2.py --scenario simple_adversary --exp-name units_32 --num-units 32 --save-dir ./simple_adversary/maddpg/vary_units/32/units --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name units_32 --num-units 32 --save-dir ./simple_adversary/maddpg/vary_units/32/units --benchmark-iters=50000 --benchmark

echo "VARY BATCH SPREAD"
mkdir -p ./simple_spread/maddpg/vary_batch/512
python train_2.py --scenario simple_spread --exp-name batch_512 --batch-size 512 --save-dir ./simple_spread/maddpg/vary_batch/512/batch --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name batch_512 --batch-size 512 --save-dir ./simple_spread/maddpg/vary_batch/512/batch --benchmark-iters=50000 --benchmark
mkdir -p ./simple_spread/maddpg/vary_batch/2048
python train_2.py --scenario simple_spread --exp-name batch_2048 --batch-size 2048 --save-dir ./simple_spread/maddpg/vary_batch/2048/batch --benchmark-iters=50000
python train_2.py --scenario simple_spread --exp-name batch_2048 --batch-size 2048 --save-dir ./simple_spread/maddpg/vary_batch/2048/batch --benchmark-iters=50000 --benchmark

echo "VARY BATCH SPREAD"
mkdir -p ./simple_adversary/maddpg/vary_batch/512
python train_2.py --scenario simple_adversary --exp-name batch_512 --batch-size 512 --save-dir ./simple_adversary/maddpg/vary_batch/512/batch --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name batch_512 --batch-size 512 --save-dir ./simple_adversary/maddpg/vary_batch/512/batch --benchmark-iters=50000 --benchmark
mkdir -p ./simple_adversary/maddpg/vary_batch/2048
python train_2.py --scenario simple_adversary --exp-name batch_2048 --batch-size 2048 --save-dir ./simple_adversary/maddpg/vary_batch/2048/batch --benchmark-iters=50000
python train_2.py --scenario simple_adversary --exp-name batch_2048 --batch-size 2048 --save-dir ./simple_adversary/maddpg/vary_batch/2048/batch --benchmark-iters=50000 --benchmark

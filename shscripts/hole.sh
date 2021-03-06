#!/bin/sh
#SBATCH --job-name=hole-gpu-lg
#SBATCH --output=/project2/jevans/aabir/weboftruth/logs/hole-lg-gpu.out
#SBATCH --error=/project2/jevans/aabir/weboftruth/logs/hole-lg-gpu.err
#SBATCH --mem=31GB
#SBATCH --time=32:00:00
#SBATCH --partition=gpu2
#SBATCH --gres=gpu:2

module load Anaconda3/5.3.0
module load cuda/9.1

echo 'run started at ' $(date)

for ts in 50 80 100
do
    python /project2/jevans/aabir/weboftruth/weboftruth/wotmodels.py -e 200 -m 'HolE' -lr 0.00005 -ts $ts -p '/project2/jevans/aabir/weboftruth'
done

echo echo 'run ended at ' $(date)

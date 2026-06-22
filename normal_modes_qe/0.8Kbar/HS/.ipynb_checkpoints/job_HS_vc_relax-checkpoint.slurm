#!/bin/bash
#SBATCH -A m1503
#SBATCH -C cpu
#SBATCH -q regular
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -J Fe_pap_vc_relax_HS_0_8Kbar

module load espresso/7.5-libxc-7.0.0-cpu

export OMP_NUM_THREADS=1
export OMP_PROC_BIND=spread
export OMP_PLACES=threads

srun -n 128 -c 1 --cpu-bind=cores pw.x -input vc_relax_HS.in > vc_relax_HS.out

#Create a Membrane with simple structure from Martini2
gmx insert-molecules -ci DPPC-em.gro -box 20 20 20 -nmol 1024 -radius 0.21 -try 500 -o 1024_noW.gro
#Create a Minimization
gmx grompp -f minimization.mdp -c 1024_noW.gro -p dppc.top -o dppc-min-init.tpr

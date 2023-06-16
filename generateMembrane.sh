#Create a Membrane with simple structure from Martini2
gmx insert-molecules -ci DPPC-em.gro -box 20 20 20 -nmol 1024 -radius 0.21 -try 500 -o 1024_noW.gro
#Create a Minimization
gmx grompp -f minimization.mdp -c 1024_noW.gro -p dppc.top -o dppc-min-init.tpr
#Min file
gmx mdrun -deffnm dppc-min-init -v -c 1024_min.gro
#Waterbox
#Edit a topol file with numbers of waters (3072)
gmx solvate -cp 1024_min.gro -cs water.gro -o waterbox.gro -maxsol 3072 -radius 0.21
gmx grompp -f minimization.mdp -c waterbox.gro -p dppc.top -o dppc-min-solvent.tpr
gmx mdrun -deffnm dppc-min-solvent -v -c minimized.gro
#grompp from molecular dynamics
gmx grompp -f martini_md.mdp -c minimized.gro -p dppc.top -o dppc-md.tpr
#run a md
gmx mdrun -deffnm dppc-md -v

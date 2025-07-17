## 

echo                           "BIENVENID@"

##

echo             "CREA TU FILOGENIA EN MENOS DE 15 MINUTOS"

##

mkdir ../Muscle/ 

mkdir ../IQTree/ 

mkdir ../Filogenias/

#concatenar
cat ../Fasta/*.fasta > ../secuencias.fasta

#alinear
../muscle3.8.31_i86linux64 -in ../secuencias.fasta -out ../secuencias_alineadas.fasta

#activar iqtree
module load iqtree/2.2.2.6

#Construcción de árboles filogenéticos
iqtree2 -s ../secuencias_alineadas.fasta

mv ../secuencias.fasta ../Fasta/

mv ../secuencias_alineadas.fasta ../Muscle/

mv ../secuencias_alineadas.fasta.treefile ../Filogenias/

mv ../secuencias_* ../IQTree/

##

##

echo                         ¡¡LISTO ANALISIS COMPLETADO!!

##

echo                                 !! GRACIAS ¡¡

## 

echo  NOTA: Sinecesitas mas informacion por favor dirigete al README.md



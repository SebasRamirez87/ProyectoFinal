# Analisis Filogenetico de Hongos Endofitos

## Introducción

El uso de morfotipos u OTUs puede subestimar los cálculos de diversidad de hongos endófitos, ya que se basan en parámetros subjetivos y no reflejan relaciones evolutivas reales (Nilsson et al. 2008; Tedersoo et al. 2014). En cambio, los análisis filogenéticos ofrecen mayor resolución en la delimitación de taxones.

Para ampliar el alcance de los estudios de diversidad, he desarrollado el programa **FILOGENIAS**, una herramienta que permite obtener resultados precisos en poco tiempo. Este programa emplea herramientas como **MUSCLE** e **IQ-TREE**, las cuales han demostrado ser eficaces en estudios de diversidad de hongos endófitos (Nguyen et al. 2015; Zhang et al. 2014). **FILOGENIAS** puede aplicarse al estudio de cualquier organismo para resolver relaciones evolutivas, identificar linajes específicos y detectar especies crípticas.

## Flujo de Trabajo del Programa

A continuación, se detallan los principales pasos y análisis que ejecuta el programa o script para generar como resultado final el archivo de filogenia.

- Es importante señalar que los scripts **`FILOGENIAS.sh`** ejecuta principalmente los tres primeros pasos del proceso.

**1**.**Entrada:** archivo **`secuencias.fasta`** con las secuencias ITS de hongos endófitos y un grupo externo.

**2**.**Alineamiento Múltiple de Secuencias con MUSCLE:** alinea secuencias homólogas para identificar sitios comparables entre especies, ya que las posiciones mal alineadas pueden afectar la topología del árbol y producir errores en la inferencia filogenética.

**3**.**Inferencia Filogenética con IQ-TREE:** infiere árboles filogenéticos utilizando algoritmos rápidos que optimizan automáticamente el modelo de evolución y evalúa el soporte estadístico de cada nodo del árbol.

**4**.**Arbol Filogenetico con FigTree** visualizacion y edicion del archivo **`.treefile`**. La visualización es esencial para interpretar la evolución de los taxones  y presentar resultados comprensibles.

# Dependencias o Prerrequisitos 

**1**. Para comenzar, es necesario instalar los programas **[MUSCLE](https://www.drive5.com/muscle/)** y **[IQTREE](https://www.ncbi.nlm.nih.gov)**. Una vez completada la instalación, se debe ubicar los archivo ejecutable de los programas dentro del directorio principal del proyecto, denominado **`Proyecto/`**. Esta organización facilita la ejecución de los análisis filogenéticos desde la terminal **[Git Bash](https://git-scm.com/downloads)**.

**2**. Dentro del directorio principal **`Proyecto/`**, se debe crear una subcarpeta denominada **`Fasta/`**. En esta carpeta deben almacenarse las secuencias de los organismos en formato **FASTA**. La presencia de esta carpeta es indispensable, ya que los scripts **`FILOGENIAS.sh`** depende de su existencia y del contenido allí alojado para ejecutarse correctamente.

**3**. Es necesario incorporar un **grupo externo**, es decir, la secuencia de un organismo relacionado filogenéticamente pero que no forma parte del grupo de estudio.  La inclusión de este, permite enraizar el árbol filogenético, lo cual facilita la interpretación del orden de divergencia entre las secuencias analizadas.

- Para obtener la secuencia del grupo externo, se busca en GeneBank el organismo deseado en formato **FASTA** , en este caso **[OP897031.1 *Saccharomyces cerevisiae*](https://www.ncbi.nlm.nih.gov/nuccore/OP897031.1?report=fasta)**.  

- Como se requiere únicamente una secuencia, se la puede guardar manualmente desde la terminal **Git Bash** como un archivo **`.fasta`** mediante el uso del editor **`nano`**.

-  Para que el nuevo archivo del grupo externo sea incluido en los análisis posteriores realizados por el script, debe ser ubicado en la carpeta **`Fasta/`**  junto con las demás secuencias del estudio.  

**4**. El encabezado o header de las secuncias en los archivos **`.fasta`** deben estar en la siguiente dispocision **`>OP897031.1_Saccharomyces_cerevisiae`** para que el programa se ejecute y el arbol pueda apreciarse de una manera clara. 

- En el caso de que el header de los archivos no se encuentre en esa dispocosion, se recomienda concatenar todos las secuencias en un solo archivo mediante el script **`Concat_Sec.sh`**  que se encuentra en la carpeta **`Scripts/`** o con el comando  **`cat Fasta/*.fasta > secuencias.fasta`**.

- Luego, el archivo se abre con el programa **[Atom](https://atom-editor.cc/)** para editar automaticamente todos los encabezados  mediante el uso de **expresiones regulares** (*Regular Expressions*). Para obtener mas informacion sobre este tema, se puede consultar el siguiente enlace: **[Capítulo 2 del libro Practical Computing for Biologists](https://www.cs.csustan.edu/~mmartin/teaching/CS4950S17/4950Ch2.pdf)**

**5**. Por ultimo, se instala la aplicacion **[FigTree](https://github.com/rambaut/figtree/releases)**  para la interpretacion de los arboles filogeneticos y edicion de los mismos segun las necesidades.

## Instrucciones

Para que el programa se ejecute se debe activar los scripts desde la carpeta **`Scripts/`** que se encuentra en la carpeta del proyecto: **`Proyecto/Scripts/`**

**A**. Si los archivos **`.fasta`** tienen el encabezado o header de la manera que se indico anteriormente por favor ejecutar el script **`FILOGENIAS_A.sh`** 

 - **1**. Este script realizara todos los pasos automaticamente, y se lo activa de la siguiente manera:
```
      chmod +x FILOGENIAS_A.sh
      ./FILOGENIAS_A.sh
```
- **2**. Despues de el analisis estaran listos los resultados.

**B**. En el caso de que los archivos **`.fasta`** no tengan el encabezado o header editado por favor siga los siguientes pasos:

 - **1**. Primero activar el script **`Concat_Sec.sh`** para hacer un solo archivo con todas las secuencias. 
```
      chmod +x Concat_Sec.sh
      ./Concat_Sec.sh
```
 - **2**. Luego se debe buscar el archivo **`secuencias.fasta`** en el directorio **`Proyecto/`** para ser editado con **Atom** 
 
 - **3**. Finalmente cuando el archivo  **`secuencias.fasta`** ya este editado se activa el script **`FILOGENIAS_B.sh`** 
```
      chmod +x FILOGENIAS_B.sh
      ./FILOGENIAS_B.sh
```
 - **4**.  Despues de el analisis estaran listos los resultados.

## Resultados Esperados

 Depues de que el programa se ejecute, se encontrara en el directorio **`Proyecto/`** tres nuevas carpetas:

- **`Muscle/`**: donde encontrara el archivo **`.fasta`** con las secuencias alineadas.
- **`IQTree:`**: aqui residen los archivos generados por el analisis filogenetico.
- **`Filogenias`**: en esta carpeta se encuentra el archivo **`.treefile`** que es el que servira para vizualizar el arbol con el programa **FigTree**.
-  Para este proyecto se obtuvo un arbol filogenetico del gen ITS, en donde se observa con claridad los diferentes clados que se forman. Debido a que la taxonomia presentada en el arbol es muy compleja se decidio identificar las 3 principales Clases que representa a esta muestra de endofitos (ver **`Filogenia.pdf`**) . En los casos mas relevantes se llego hasta generos. Por ejemplo la "especie" *Xylaria sp1* que anteriormente conformaba un solo OTU, ahora se subdividio en el arbol. El genero *Diaporthe* que solo contaba con 6 ssp ahora se subdivio en mas nodos (en rojo y morado respectivamente, en la figura de la filogenia, **`Filogenia.pdf`**), lo cual indica que efectivamente los OTUs podrian estar subestimando el numero de "especies". Los arboles filogeneticos demuestran ser una heramienta poderosa al momento de delimitar mejor la diversidad de organismos. Hay autores que indican que en el ambito de hongos endofitos el gen ITS suele ser suficiente para la delimitacion de especies y estimaciones mas precisas de diversias (Schoch et al. 2012; Gazis et al., 2012; Arnold et al., 2007). Sin embargo, existen otros autores que anuncian que el gen ITS no siempre es suficiente para la delimitacion de especies, por lo cual en necesario realizar estudios multilocus para poder aclarecer de manera mas adecuada la delimitacion de especies (U’Ren et al. 2016).

## Recomendaciones 

* Si se desea trabajar filogenias con multilocus para la determinacion de especies se recomienda utilizar el programa **[ASTRAL](https://github.com/smirarab/ASTRAL/commit/f491c623d9545a13353e0f607f81ce848f035798)**. Para dicho analisis el procedimeinto seria igual, hasta que se obtenga los archivos de IQTree, despues se debe concatenar los **`.treefile`** en un solo archivo para poder correr el program **ASTRAL**. Despues del ananlisis se podra ya observar el arbol de especies. Para un mejor entendimiento se deja un **[tutoria para ASTRAL](https://tandy.cs.illinois.edu/astral-tutorial.pdf?utm_source=chatgpt.com)**.

* En el caso de que se tenga que editar los encabezados de las secuencias con **Atom**, tener en cuenta que el archivo final debe llevar el mismo nombre original (**`secuencias.fasta`** ) y esatar ubicado en el directorio  **`Proyecto/`**.

* entrando a Hoffman seguir la siguiente ruta: **`/u/scratch/d/dechavez/Bioinformatica-PUCE/RediseBio/Sebasra/Proyecto
`**. En el directorio **`Proyecto/`** encontrara la carpeta  **`Fasta/`** con las secuencias o archivos necesarios para ejecutar los scripts.  

* En Github dentro del directorio **`Proyecto/`**tambien encontra la carpeta  **`Results/`** con los archivos **`EndofitosA.fasta`** con las secuencias editadas en **MUSCLE**, **`Filogenias_EndofitosA.fasta.treefile`** con el arbol de endofitos de este estudio y el archivo  **`Filogenia.pdf`** con el arbol analizado y editado. 

## Autor
 
 * Iván Sebastián Ramírez Restrepo estudiante de la Pontificia Universidad Católica del Ecuador.
 
 ## Licencia
 * Este programa no tiene licencias, es de uso publico.  
 
## Agradecimientos

* A el profesor Daniel Chavez por ampliar los conocimientos, estuvo divertido, a los compañeros por el apoyo y a todos los que me acompañan en el proceso.


## Referencias
 
* Nilsson, R. H., Kristiansson, T., Ryberg, M., Hallenberg, N., & Larsson, K. H. 2008. "Intraspecific ITS variability in the kingdom Fungi as expressed in the international sequence databases and its implications for molecular species identification." *Evolutionary Bioinformatics* 4: 193–201.

* Tedersoo, L., Anslan, S., Bahram, M., Põlme, S., Riit, U., Liiv, I., et al. 2014. "Shotgun metagenomes and multiple primer pair-barcode combinations of amplicons reveal biases in metabarcoding analyses of fungi." *MycoKeys* 10: 1–43.

* Nguyen, L.-T., Schmidt, H. A., von Haeseler, A., & Minh, B. Q. 2015. "IQ-TREE: A fast and effective stochastic algorithm for estimating maximum-likelihood phylogenies." *Molecular Biology and Evolution* 32(1): 268–274.

* Zhang, J., Kobert, K., Flouri, T., & Stamatakis, A. 2014. "PEAR: a fast and accurate Illumina Paired-End reAd mergeR." *Bioinformatics* 30(5): 614–620.

* Haddock, Steven H. D., y Casey W. Dunn. “Regular Expressions: Powerful Search and Replace.” En *Practical Computing for Biologists*, 17‑29. Sunderland, MA: Sinauer Associates, 2012. PDF.

* Schoch, C. L., Seifert, K. A., Huhndorf, S., Robert, V., Spouge, J. L., Levesque, C. A., & Chen, W. (2012). Nuclear ribosomal internal transcribed spacer (ITS) region as a universal DNA barcode marker for Fungi. Proceedings of the National Academy of Sciences, 109(16), 6241–6246.

* Gazis, R., Rehner, S., & Chaverri, P. (2012). Hidden fungal diversity in an Amazonian rainforest. New Phytologist, 195(3), 900–912.

* Arnold, A. E., Mejía, L. C., Kyllo, D., Rojas, E. I., Maynard, Z., Robbins, N., & Herre, E. A. (2007). Understanding the diversity of foliar endophytic fungi: progress, challenges, and frontiers. Fungal Biology Reviews, 21(2–3), 51–66.

* U’Ren, J. M., Lutzoni, F., Miadlikowska, J., Laetsch, A. D., & Arnold, A. E. (2016). Host availability drives distributions of fungal endophytes in the imperilled boreal realm. Nature Ecology & Evolution, 1, Article 17.


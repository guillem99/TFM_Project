# TFM_Project

Aquest repositori conté la informació addicional pel Treball de Final de Màster del màster universitari en Ciència de Dades de la UOC.

En concret, conté la següent informació:
* **Anàlisi Adicional - sobre l'Atròfia dels Nodes.ipynb:** Fitxer del tipus Jupyter Notebook en el qual es mostra l'anàlisi aplicat per estudiar l'atròfia dels nodes entre pacients amb EM i VS.
* **Anàlisi de les 2850 connexions (76x76) - Functional.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'han aplicat els algoritmes ML per estudiar les 2850 connexions utilitzant dades funcionals.
* **Anàlisi de les 2850 connexions (76x76) .ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'han aplicat els algoritmes ML per estudiar les 2850 connexions utilitzant dades estructurals i aplicar la generació de connectogrames.
* **Anàlisi de les 2850 connexions (76x76) - Morphological.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'han aplicat els algoritmes ML per estudiar les 2850 connexions utilitzant dades morfològiques.
* **Basic Analysis.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'ha realitzat l'estudi demogràfic de les dades clíniques i l'estudi de col·lapse de xarxa.
* **MNI152_T1_1mm_N4.nii.gz:** Imatge T1w de l'espai comú (MNI152).
* **MultiLayer Anàlisis.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'ha realitzat l'anàlisi del graf multicapa.
* **PipeLine - After MatLab Functional.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'ha realitzat l'execució d'algoritmes ML per mètriques locals i globals de les dades funcionals.
* **PipeLine - After MatLab.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'ha realitzat l'execució d'algoritmes ML per mètriques locals i globals de les dades estructurals.
* **PipeLine - After MatLab Morphological.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'ha realitzat l'execució d'algoritmes ML per mètriques locals i globals de les dades morfològiques.
* **PipeLine - Before MatLab.ipynb:** Fitxer del tipus Jupyter Notebook en el qual s'ha realitzat el preprocessament de les dades abans d'aplicar l'anàlisi de connexions i execució d'algoritmes a partir de mètriques globals i regionals.
* **nodes_mindboggle.nii.gz:** Nodes d'interès en l'espai comú.
* **pipeline_metrics.m:** Fitxer amb el format '.m' de MATLAB, per tal de calcular les mètriques globals de les dades funcionals, estructurals i morfològiques.
* **pipeline_metrics_local.m:** Fitxer amb el format '.m' de MATLAB, per tal de calcular les mètriques locals de les dades funcionals, estructurals i morfològiques.


## Models
En la carpeta models es troben els 5 models (RFC, SVM, KNN, LR i GNB) obtinguts a partir de l'anàlisi de 2850 connexions de dades estructurals i guardats en format '.joblib'. Per tal de poder executar l'anàlisi de col·lapse de xarxa.

## Plots
En la carpeta plots s'han guardat alguns dels connectogrames incorporats al document final.

## Documents
En la carpeta documents s'ha guardat el treball de final de màster definitiu.

# L2_databases
https://github.com/guipostic/L2_databases  

Durant les trois premières séances de TD, nous étudierons les différentes phases de la conception d'une base de données, selon trois niveaux d'abstraction (du plus haut au plus bas) :  
* **Conceptuel**, avec ici le [modèle entité-association](https://fr.wikipedia.org/wiki/Mod%C3%A8le_entit%C3%A9-association) (diagramme) ;
* **Logique**, avec ici le [modèle relationnel](https://fr.wikipedia.org/wiki/Mod%C3%A8le_relationnel) ;
* **Physique**, c'est-à-dire l'implémentation, avec ici le langage de requête [SQL](https://fr.wikipedia.org/wiki/Structured_Query_Language) et le système de gestion de bases de données [MySQL](https://fr.wikipedia.org/wiki/Structured_Query_Language).

Les deux séances suivantes auront lieu en salle machines et consisteront en des travaux pratiques en langage SQL.  

Enfin, la dernière séance sera consacrée à l'[algèbre relationnelle](https://fr.wikipedia.org/wiki/Alg%C3%A8bre_relationnelle).

## Du modèle conceptuel des données au modèle logique
La transcription des diagrammes du **modèle entité-association** dans un **modèle relationnel** obéit aux règles suivantes :
* Toutes les entités deviennent des *relations*, également appelées tables ;
* Les attributs des entités sont les colonnes de ces tables (note : après implémentation, chaque enregistrement dans la base ajoutera une ligne, aussi appelée uplet ou *tuple*, à ces tables) ;
* L'identifiant est appelé *clef primaire* ;
* Pour les associations, deux cas possibles :
  * Si cardinalités (x,n)/(x,n), l'association est représentée par une **table intermédiaire**, dont la clef primaire résulte de la concaténation de celles des deux tables associées ;
  * Si cardinalité (x,1)/(x,n), l'association est représentée par ajout de la clef primaire d'une table aux attributs de l'autre ; celle-ci est alors appelée *clef étrangère* ; les éventuels attributs de l'association sont alors déplacés vers les tables associées.

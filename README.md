# L2_databases
https://github.com/guipostic/L2_databases  

Durant les trois premières séances de TD, nous étudierons les différentes phases de la conception d'une base de données, selon trois niveaux d'abstraction (du plus haut au plus bas) :  
* **Conceptuel**, avec ici le [modèle entité-association](https://fr.wikipedia.org/wiki/Mod%C3%A8le_entit%C3%A9-association) (diagramme) ;
* **Logique**, avec ici le [modèle relationnel](https://fr.wikipedia.org/wiki/Mod%C3%A8le_relationnel) ;
* **Physique**, c'est-à-dire l'implémentation, avec ici le langage de requête [SQL](https://fr.wikipedia.org/wiki/Structured_Query_Language) et le système de gestion de bases de données [MySQL](https://fr.wikipedia.org/wiki/Structured_Query_Language).

Les deux séances suivantes auront lieu en salle machines et consisteront en des travaux pratiques en langage SQL.  

Enfin, la dernière séance sera consacrée à l'[algèbre relationnelle](https://fr.wikipedia.org/wiki/Alg%C3%A8bre_relationnelle).

## Modèle conceptuel des données : diagramme entité-association
Établir un schéma conceptuel, selon le modèle entité-association, consiste à identifier :
- les entités, qu’elles soient concrètes (individu, objet, etc.) ou abstraites (langue parlée, catégorie d’objet, etc.) ;
- les associations qui les relient avec une certaine cardinalité ; les noms donnés aux associations sont le plus souvent des verbes ;
- les attributs des entités (au minimum un : l’identifiant) et, éventuellement, ceux des associations.

**L’espace mémoire alloué pour les valeurs que peut prendre un attribut est fixe.** Autrement dit, la valeur associée à un attribut ne peut pas être une liste de taille variable. Cette contrainte nécessitera parfois de créer une entité pour ce qui aurait pu autrement être un attribut. Par exemple, dans le Problème 1, si on ne retient que le premier centre d'intérêt du CV, alors celui-ci peut être utilisé comme attribut. En revanche, si l’on autorise une liste non-limitée de centres d’intérêts, alors il faut créer une entité qui les listera.

Dans le cadre de cette UE, les diagrammes conceptuels représenteront les entités par des rectangles, les associations par des ovales et les cardinalités par des paires de chiffres. Dans la solution alternative présentée pour le Problème 4 (extraite des travaux de [De Gorostiza *et al.*, 2017](http://dx.doi.org/10.25147/ijcsr.2017.001.1.15)), la convention d'écriture utilisée est différente de celle vue en cours : les cardinalités y sont représentées par des symboles.

## Modèle logique
La transcription des diagrammes du **modèle entité-association** dans un **modèle relationnel** obéit aux règles suivantes :
* Toutes les entités deviennent des *relations*, également appelées tables ;
* Les attributs des entités sont les colonnes de ces tables (note : après implémentation, chaque enregistrement dans la base ajoutera une ligne, aussi appelée uplet ou *tuple*, à ces tables) ;
* L'identifiant est appelé *clef primaire* ;
* Pour les associations, deux cas possibles :
  * Si cardinalités (x,n)/(x,n), l'association est représentée par une **table intermédiaire**, dont la clef primaire résulte de la concaténation de celles des deux tables associées ;
  * Si cardinalité (x,1)/(x,n), l'association est représentée par ajout de la clef primaire d'une table aux attributs de l'autre ; celle-ci est alors appelée *clef étrangère* ; les éventuels attributs de l'association sont alors déplacés vers les tables associées.

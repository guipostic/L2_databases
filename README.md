# L2_databases
https://github.com/guipostic/L2_databases  

Durant les trois premières séances de TD, nous étudierons les différentes phases de la conception d'une base de données, selon trois niveaux d'abstraction (du plus haut au plus bas) :  
* **Conceptuel**, avec ici le [modèle entité-association](https://fr.wikipedia.org/wiki/Mod%C3%A8le_entit%C3%A9-association) (diagramme) ;
* **Logique**, avec ici le [modèle relationnel](https://fr.wikipedia.org/wiki/Mod%C3%A8le_relationnel) ;
* **Physique**, c'est-à-dire l'implémentation, avec ici le langage de requête [SQL](https://fr.wikipedia.org/wiki/Structured_Query_Language) et le système de gestion de bases de données [MySQL](https://fr.wikipedia.org/wiki/Structured_Query_Language).

Les deux séances suivantes auront lieu en salle machines et consisteront en des travaux pratiques en langage SQL.  

Enfin, la dernière séance sera consacrée à l'[algèbre relationnelle](https://fr.wikipedia.org/wiki/Alg%C3%A8bre_relationnelle).

## 1. Modèle conceptuel des données : diagramme entité-association
Établir un schéma conceptuel, selon le modèle entité-association, consiste à identifier :
- les [entités](https://fr.wikipedia.org/wiki/Entit%C3%A9#En_informatique), qu’elles soient concrètes (individu, objet, etc.) ou abstraites (langue parlée, catégorie d’objet, etc.) ;
- les **associations** qui les relient avec une certaine [cardinalité](https://fr.wikipedia.org/wiki/Cardinalit%C3%A9_(programmation)) ; les noms donnés aux associations sont le plus souvent des verbes ;
- les **attributs** qui décrivent les entités (au minimum un : **l’identifiant**) et, éventuellement, ceux des associations.

**L’espace mémoire alloué pour les valeurs que peut prendre un attribut est statique.** Autrement dit, la valeur associée à un attribut ne peut pas être une liste de taille variable. Cette contrainte nécessitera parfois de créer une entité pour ce qui aurait pu autrement être un attribut. Par exemple, dans le Problème 1, si on ne retient que le premier centre d'intérêt du CV, alors celui-ci peut être utilisé comme attribut. En revanche, si l’on autorise une liste non-limitée de centres d’intérêts, alors il faut créer une entité qui les listera.

Dans le cadre de cette UE, les diagrammes conceptuels représenteront les entités par des rectangles, les associations par des ovales et les cardinalités par des paires de chiffres. Dans la solution alternative présentée pour le Problème 4 (extraite des travaux de [De Gorostiza *et al.*, 2017](http://dx.doi.org/10.25147/ijcsr.2017.001.1.15)), la convention d'écriture utilisée est différente de celle vue en cours : les cardinalités y sont [représentées par des symboles](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model#/media/File:ERD_Representation.svg).

## 2. Modèle logique : schéma relationnel
La transcription des diagrammes du **modèle entité-association** dans un **modèle relationnel** obéit aux règles suivantes :
* Toutes les entités deviennent des **relations**, également appelées tables ;
* Les attributs des entités sont les colonnes de ces tables. Après implémentation, chaque enregistrement dans la base ajoutera une ligne, aussi appelée [uplet](https://fr.wikipedia.org/wiki/Uplet) ou *tuple*, à ces tables ; cela signifie que chaque ligne aura nécessairement le même nombre de colonnes, quitte à ce que certains attributs aient une valeur nulle ;
* L'identifiant est appelé [clef primaire](https://fr.wikipedia.org/wiki/Cl%C3%A9_primaire) ;
* Pour les associations, deux cas possibles :
  * Si cardinalité (x,n)/(x,n), l'association est représentée par une **table intermédiaire**, dont la clef primaire, dite [composite](https://en.wikipedia.org/wiki/Composite_key), résulte de la concaténation de celles des deux tables associées. **Dans la pratique**, la concaténation nécessitera parfois l’inclusion d’une information supplémentaire[^1] ;
  * Si cardinalité [(x,1)](https://fr.wikipedia.org/wiki/Association_plusieurs-%C3%A0-un)/(x,n), l'association est représentée par ajout de la clef primaire d'une table aux attributs de l'autre[^2] ; celle-ci est alors appelée [clef étrangère](https://fr.wikipedia.org/wiki/Cl%C3%A9_%C3%A9trang%C3%A8re) ; les éventuels attributs de l'association sont alors déplacés vers les tables associées. C’est l’entité associée avec une cardinalité de (x,n) qui voit son identifiant être utilisé comme clé étrangère. C’est l’interdiction d’avoir une liste comme valeur associée à un attribut qui fait que l’identifiant de l’entité associée avec une cardinalité de (x,1) ne peut pas être utilisé comme clef étrangère[^3]. La valeur de la clef étrangère ne permet d'accéder qu'à un seul *tuple* (une seule ligne) de la « table parente », puisqu'elle est associée à une clef primaire (avec sa contrainte d'unicité). Néanmoins, il est possible de définir une **clef secondaire**, une adresse ni unique, ni obligatoire, qui renvoie à un ou plusieurs enregistrements.

Une clef étrangère est donc un attribut de la relation, c. -à-d. une colonne de la table. En lui-même, cet attribut ne fournit aucune description : il n’est qu’un code. Cependant, sa valeur renvoie à un enregistrement dans une autre table, dont il est la clef primaire.

En général, une [cardinalité (1,1)](https://fr.wikipedia.org/wiki/Association_un-%C3%A0-un) ne devrait pas apparaître sur les diagrammes conceptuels.

Si le minimum de la cardinalité est strictement supérieur à 1 (« plusieurs »), celle-ci sera notée (2,n) ou parfois [(n,n)](https://fr.wikipedia.org/wiki/Mod%C3%A8le_relationnel#Relation_N:N), selon les conventions.

[^1]: Par exemple, dans le Problème 3, les entrées dans une table enregistrant des emprunts de livres devront être identifiées par concaténation de la clef primaire du livre, de celle du lecteur et de la date d’emprunt. Autrement, la contrainte d’unicité sur les clefs primaires empêche un lecteur d’emprunter un exemplaire de livre particulier plus d’une fois.

[^2]: Il est techniquement possible de représenter une association (x,n)/(x,1) par une table intermédiaire, mais cela créerait inutilement de la redondance.

[^3]: Dans le Problème 3, puisqu’un livre ne peut appartenir qu’à une seule catégorie de livre, l’identifiant de la catégorie sera clef étrangère dans la table enregistrant les livres. Dans le Problème 2, l'identifiant d’un salarié ne pourrait pas être utilisé comme attribut d’une entreprise.


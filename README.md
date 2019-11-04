# HandsOn SwiftUI
SwiftUI, c'est le nouveau SDK pour développer des apps cross-plateform dans l'éco-système Apple.

Il repose sur deux notions que nous allons voir à travers ce TP :
1. La programmation déclarative : pas de XML, JSX, storyboard... tout est code !
2. La programmation réactive pour la gestion d'état et du "DOM".

## Useful Shortcuts
* `Option-Cmd-Enter` - Toggle Live Preview
* `Option-Command-P` - Resume Live Preview
* `Command + Shift + L` - Quick Insert
* `Command + click on Code` - Open SwiftUI actions

## Exercice 1 - SwiftUI le premier contact

  > Le but de l'exercice est d'apprendre à créer une nouvelle `View` sur `Xcode`.

1. Créez un nouvelle `View` appelée `TalkRow` dans `Xcode`

Choisissez sur le menu en haut `File > New > File...` et `SwiftUI View` comme dans l'image pour créer le fichier.

<img src="ImagesREADME/choose-swiftUIView.png" width="640"/>
&nbsp;

Vous remarquez que `TalkRow` implémente le protocole `View`. C'est le type "primitif" de SwiftUI : tous les éléments visuels sont de type `View`. La mise en forme d'une `View` se définit dans sa propriété `body` à base... de `View` !.

2. Passez un `Talk` en paramètre de `TalkRow` et remplacez le contenu de `Text` par le titre de `Talk`.
3. Mettez à jour sa preview et vérifiez que votre titre s'affiche bien.
4. Remplissez notre `TalkRow` avec le type et la salle du `Talk` pour qu'il resemble à l'image suivante:

<img src="ImagesREADME/fillViewNoStyle.png" width="640"/>
&nbsp;
&nbsp;

> Pour combiner plusieurs view, nous allons utiliser 3 stacks: HStack, VStack.


### QUIZZ

1. Quand vous créez une `View`, où déclarez-vous le layout ?
2. Combien de root view `body` peut-il contenir ?
3. Comment passe-t-on des données à une `View` ?

## Exercice 2 - Composition
  > Vous allez découvrir comment composer vos propres `View`.

Le code de notre `View` commence à devenir gros et difficilement lisible. Il est de temps de séparer quelque peu les choses.

Créez un nouveau composant, `Time` pour afficher la date d'un slot. Le résultat doit ressembler à celui-ci :
<img src="ImagesREADME/fillView2.png" width="640"/>

Vous aurez besoin de mettre en forme la date, pour cela utilisez le code ci-dessous :
```swift
static private var formatter = { () -> DateFormatter in
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("HH:mm")

    return formatter
}()
```

## Exercice 3 - Modifiers
  > Cet exercice a pour but de vous découvrir comment "transformer" une vue

SwiftUI vient avec plusieurs modifiers pré-définis :
* background
* font
* alignment
* ...

1. Changez le titre pour qu'il ressemble à l'image ci-dessous (si vous cherchez la couleur, elle est définie dans "Assets.xcassets")
3. Appliquez un padding, un background et une ombre sur pour donner un style à votre `TalkRow`.

4. Changez votre preview pour qu'elle s'affiche en 480x50. Profitez-en pour afficher 2 previews du composant `TalkRow` : 1 avec un titre long et un autre avec un titre court.

5. *Bonus :* Créez une struct `CardModifier` qui implémente `ViewModifier`. Déplacez-y tous les effets appliqués à `TalkRow`, puis utilisez-le en appelant `.modifier()`.

Vous devriez arriver au résultat suivant :

<img src="ImagesREADME/multiPreview.png" width="640"/>
&nbsp;

### QUIZZ
1. Quel type renvoie un `Modifier` ?
1. (Bonus) Comment crée-t-on son propre `Modifier` ?

## Exercice 4 - Faisons des listes !
  > Le but de l'exercice est d'être capable d'afficher une liste d'éléments avec SwiftUI.

1. Créez une nouvelle `View` appelée `TalkRowList`
2. Créez une liste, et ajoutez-y 2 `TalkRow` avec du contenu statique. Pensez à mettre à jour votre preview !
3. Passez les talks en paramètre de TalkListView. Bouclez dessus pour afficher un `TalkRow` pour chaque.
4. Ajoutez un background à la liste.

Ca marche, mais nous devons écrire du contenu en dur dans chacune de nos `Views`, pas très pratique... Heureusement, Xcode fournit un dossier `Preview Content` dans lequel vous pouvez mettre du contenu à destination... des previews ! On va donc s'en servir pour définir nos contenus à destination de nos previews.

5. Créez un fichier `TalkPreview` dans `Preview Content`. Définissez-y un `TalkPreview` avec votre talk long et court.
2. Utilisez-les dans `TalkRow` et `TalkRowList`.

### QUIZZ
1. Comment itère-t-on sur une liste d'éléments ?

## Exercice 5 - Navigation
  > Le but de l'exercice est d'utiliser la navigation pour afficher une nouvelle vue.

Dans SwiftUI, la navigation se fait grâce à deux classes :
- `NavigationView`, pour la hiérarchie des vues
- `NavigationLink`, pour effectuer la navigation

1. Wrappez la liste dans un NavigationView.
2. Faites en sorte qu'au tap sur une row, l'utilisateur soit redirigé vers `TalkDetail`.

  > Vous pouvez tester la navigation depuis la Preview. Il faut juste rentrer en mode *Live Preview* (voir image ci-dessous). Le fond devient alors bleu/gris au lieu de blanc pour vous l'indiquer.

  <img src="ImagesREADME/livePreview.png"/>

## Exercice 6 - Stateful
  > Le but de l'exercice est de découvrir comment gérer un état avec SwiftUI

Maintenant que nous pouvons naviguer, nous allons ajouter la possibilité de noter un talk.

1. Dans `TalkDetail`, ajoutez un nouvel attribut `rating: Rating?`, et passez le à la vue de notation pour qu'elle le mette à jour. Normalement, vous aurez un message d'erreur "'self' is immutable".

Pour pouvoir "modifier" `TalkDetail` et, surtout, tracker sa valeur au fil du temps, SwiftUI utilise la programmation réactive. Grâce aux *Property Wrappers* c'est assez simple à utiliser.

2. Ajoutez `@State` devant rating. Magie, ça compile et vous pouvez tester la notation depuis le *Live Preview*.
Testez depuis `TalkRowList`. Ca fonctionne, mais la notation n'est pas gardée entre chaque aller-retour !

> `@State` c'est quoi ? C'est un *Property Wrapper*, une struct qui va venir wrapper notre attribut et nous fournir des fonctionnalités/patterns. A la compilation, vous allez avoir 3 attributs auxquelles vous allez pouvoir accéder :
- `_rating`, le wrapper en lui-même, le "storage". Ici `state<Int?>`
- `rating`, la valeur. Juste des getter/setter qui vont aller piocher dans `_rating`.
- `$rating`, une valeur "projetée" fournit par notre wrapper. Ici `Binding<Int?>`.

> C'est grâce à `Binding` que SwiftUI va, en interne, tracker et mettre à jour l'état de notre vue.

Il nous faut modifier `talk` directment afin de gader sa notation à jour.

4. Retirez l'attribut `rating`, et utilisez `talk.rating` à la place. Ajoutez `@Binding` à `talk`.
4. Il faut maintenant pouvoir mettre à jour les talks dans `TalkDetail`. On a déjà vu un property wrapper qui permettait de faire ça, il vous suffit de l'ajouter à `talks`.
4. Il faut passer un `Binding<Talk>` à `TalkDetail`. Mettez à jour `ForEach` avec `ForEach(talks.indices)`, puis utilisez l'index pour récupérer :
* un `Talk` (pour `TalkRow`)
* un `Binding<Talk>` (pour `TalkDetail`)

### QUIZZ
1. Qu'est-ce qu'un *Property Wrapper* ?
1. A quel moment est-il résolu (compilation ou runtime) ?
1. Quelle est la différence entre `tate` et `Binding` ?

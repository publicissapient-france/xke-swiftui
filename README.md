SwiftUI est le nouveau SDK pour développer des apps de manière cross-plateforme sur l'environnement Apple.

Il adopte une approche déclarative déjà vu chez d'autres comme ReactJS ou VueJS.

# Exercice 1 - SwiftUI le premier contact

  > Le but de l'exercice est d'apprendre à créer une nouvelle `View` sur `Xcode`.


1. Créez un nouvelle `View` appelée `TalkRow` dans `Xcode`

<img src="ImagesREADME/choose-swiftUIView.png" width="640"/>

2. Passez un `Talk` en paramètre de `TalkRow` et remplacez le contenu de `Text` par le titre de `Talk`.
3. Mettez à jour la preview et vérifiez que votre titre s'affiche bien.

## 4. Remplir notre `TalkRow` avec un `Talk`

# Exercice 2 - Styling
  > Le but de l'exercice est d'apprendre à manipuler une `View`.

## 5. Créer un autre composant pour la date - format inclus

## 6. Montrer les modifiers, quelques exemples et puis comment les retrouver.

## 7. Utiliser les modifiers

## 8. 2 PREVIEW = 1 titre court et 1 titre long

# Exercice 3 - Faisons des listes !
  > Le but de l'exercice est d'apprendre à manipuler des listes avec SwiftUI.

1. Créez une nouvelle `View` appelée `TalkRowList`
1. Créez une liste, et ajoutez-y 2 `TalkRow` avec du contenu statique. Pensez à mettre à jour votre preview !

Ca marche, mais nous devons écrire du contenu en dur dans chacune de nos `Views`, pas très pratique... Heureusement, Xcode fournit un dossier `Preview Content` dans lequel vous pouvez mettre du contenu à destination... des previews ! On va donc s'en servir pour définir nos contenus à destination de nos previews.

1. Créez un fichier `TalkPreview` dans `Preview Content`. Définissez-y un enum `TalkPreview` dans lequel vous déclarerez deux contenus statiques :
  - un `Talk` appelé `longTitle` avec le titre ""
  - un autre `rex` avec le titre "" et de type `.rex`
2. Remplacez vos contenus statiques dans `TalkRow` et `TalkRowList` par ces nouvelles références.

## 11. Passer les talks comme paramètres de TalkListView

## 12. Mettre un background à la liste

# Exercice 4 - Navigation
  > Le but de l'exercice est d'utiliser la navigation pour afficher une nouvelle vue.

## 13. donner une DestinationView (avec les étoiles) pour utiliser NavigationView

## 14. Tester la navigation avec la preview

# Exercice 5 - Stateful
  > Le but de l'exercice est de découvrir comment gérer un état avec SwiftUI

## 15. Utiliser State pour garder les étoiles d’un talk  ( A FAIRE  !!!?? )
## 16. Utiliser EnvirommentObject pour garder  les étoiles d’un talk

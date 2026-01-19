# YLove
---

YLove est un projet d'école éfféctué dans le cadre de la fin du module [Machine Learning](https://github.com/Yann-Fournier/Machine_Learning-M1). Il a été réaliser par [Elodie Senel](https://github.com/Esenel19) et [Yann Fournier](https://github.com/Yann-Fournier).

Ce projet a pour but de recréer le système de recommandation que l'on pourrais retrouver sur une appli de rencontre.

### Création de l'environnement python

Veuillez recréez l'environnement dans lequelle nous avons développer ce projet avec les commandes suivante.

- Création de l'environnement
```bash
python -m venv YLove_env
```

- Activation de l'environnement sur Window
```bash
YLove_env\Scripts\activate
```

- Activation de l'environnement sur Unix ou MacOS
```bash
source YLove_env/bin/activate
```

- Installation des dépendances
```bash
pip install -r requirements.txt
```

### Création de faux utilisateurs et sauvegarde

Un fois l'environnement de développement créer nous allons pouvoir créer nos faux utilisateurs.

Pour créer ces faux utilisateurs, vous devez lancer le fichier 'data/fake_data.ipynb'. Une fois l'éxecution du fichier terminé, les données seront stockées dans le dossier 'data/Fake_profiles'.

Après avoir créer nos faux utilisateurs, nous allons devoir les stockés dans notre base de données. Pour cela, veuillez éxecuter le fichier 'data/bdd.ipynb'.

> [!warning]
> L'éxecution du fichier 'data/bdd.ipynb' entrainera la création de la base de données sous le nom de 'data/Y-love.db'.
> 
> Il est important que vous supprimiez cette base de données avant l'éxecution du fichier si elle existe déjà.

### Script de recommandation

Pour finir, nous allons pouvoir éxecuter le script de recommandation 'Modèle_modèle_Faiss.ipynb'.



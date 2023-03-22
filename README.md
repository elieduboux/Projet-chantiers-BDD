# Projetbdd

projet finale de base de donnée Goupe 5 9t

> [PISTILLI Loris](loris.pistilli@edu.esdiee.fr)

> [MASSON Erwann](elie.duboux@edu.esiee.fr)

> [JIANG Franck](franck.jiang@edu.esiee.fr)

> [DUBOUX Elie](elie.duboux@edu.esiee.fr)

# Mise en route du projet

Nous recommandons l'utilisation d'une machine sous environement linux mais notre projet fonctionne aussi sous windows:

## logiciels requis

- [python 3.9]([Download Python | Python.org](https://www.python.org/downloads/)) (ou supérieur)
  
- [docker](https://docs.docker.com/) & [docker-compose]([Install Docker Compose | Docker Documentation](https://docs.docker.com/compose/install/))
  

## Executer le projet

cloner le projet ou télécharger le zip de ce dernier puis:

1. lancer les applications via docker-compose:
  
  dans le dossier du projet:
  
  ```bash
  docker-compose -f docker-compose.yml up
  ```
  
2. Une fois la base de donnée mise en place via docker
  
  Installer tous les packages avec la commande suivante :
  
  ```python
  pip3 install -r requirements.txt
  ```
  

3. Executer le script python
  
  la commande pour éxecuté le script qui remplira la Base de donnée est:
  
  ```python
  python3 APIcall.py [update|show]
  ```
  
  les options possible sont:
  
  - update : permet de forcer un appel a l'API opendata Paris afin de mettre a jour le fichier JSON utiliser pour remplir la Base de donnée
    
  - show: affiche le JSON utilisé pour remplir la Base de donnée
    

# Erreur possible

Si l'import du module mariadb ne fonctionne pas sur Linux exécuter les deux commandes suivantes :

- `sudo apt-get update -y`
- `sudo apt-get install -y libmariadb-dev`

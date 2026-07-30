module Data.Project exposing (..)

import Data.Translation exposing (Translation)


type alias Project =
    { title : Translation
    , description : Translation
    }

    
projects : List Project
projects =
    [ adultWebcomicWebsite
    , portfolio2023
    , laVoute
    ]
    
    
adultWebcomicWebsite : Project
adultWebcomicWebsite =
    { title =
          { en = "Adult Webcomic Website"
          , fr = "Site Web de bande dessinée pour public averti"
          }
    , description =
          { en =
                """
                 waifuwebcomics.com was a website to publish some erotic work of fiction.\n
                 The website was written in Javascript using Angular for its frontend and in Java with Spring Boot for its backend.\n
                 It had a full content management system enabling the admin (me) to publish, modify and delete the displayed comics.\n
                 It also had a login system using the standard username/password authentication method.\n
                 The website was hosted on a DigitalOcean dropplet and configured manually by me.\n
                 The webserver was Nginx and was configured with tls encryption also known as https.\n
                 The project does not exist anymore.\n
                """
          , fr =
                """
                 waifuwebcomics.com était un site web permettant de publier des œuvres de fiction érotiques.                 
                 Le site a été développé avec Angular pour le frontend et Spring Boot pour le backend.
                 Il comportait un système de gestion de contenu complet permettant à l'administrateur (moi) de publier, modifier et supprimer les bandes dessinées affichées.
                 Il disposait également d'un système de connexion utilisant la méthode d'authentification standard par nom d'utilisateur et mot de passe.
                 Le site était hébergé sur un droplet DigitalOcean, configuré manuellement par mes soins.
                 Le serveur web utilisé était Nginx, configuré avec le chiffrement TLS, aussi connu sous le nom de HTTPS.
                 Le projet n'existe plus.
                """
          }
    }

    
portfolio2023 : Project
portfolio2023 =
    { title =
          { en = "Portfolio (2023)"
          , fr = "Portfolio (2023)"
          }
    , description
          =
          { en =
                """
                 My old portfolio is frontend only. Meaning that there is no business logic, databases or servers in the background.
                 For simple static websites like these, interactions with data are not needed.
                 Like all portfolios, the website was meant to display my technical skills, talk a little bit about who I am, my experience ,etc.
                 The website is written in Javascript using the React frontend framework. The portfolio features a 3d cube with a mapped texture of my face spinning in the background with a parallax scrolling effect.
                 It is more meant as a joke but also to show my capabilities with the Three.js library which enables a web page to render these 3d scenes.                 
                """
          , fr =
                """
                 Mon ancien portfolio est uniquement en frontend. Cela signifie qu'il n'y a pas de logique d'affaires, de bases de données ou de serveurs en arrière-plan.
                 Pour des sites web statiques simples comme celui-ci, les interactions avec des données ne sont pas nécessaires.
                 Comme tous les portfolios, ce site avait pour but de présenter mes compétences techniques, de parler un peu de qui je suis, de mon expérience, etc.
                 Le site est écrit en Javascript avec le framework frontend React. Le portfolio met en vedette un cube 3D avec une texture de mon visage qui tourne en arrière-plan, accompagné d'un effet de défilement en parallaxe.
                 C'est surtout pensé comme une blague, mais aussi pour démontrer mes compétences avec la librairie Three.js, qui permet à une page web de faire le rendu de ces scènes 3D.
                """
          }
    }

    
laVoute : Project
laVoute =
    { title =
          { en = "Lavoute.xyz - A Personal Cloud Storage"
          , fr =
                "Lavoute.xyz - Un stockage nuagique personnel"
          }
    , description =
          { en =
                """
                 For those who are familiar with Google Drive, OneDrive and others. This website is an implementation of those type of services. It was a final project for my last year of College.
                 This project was made with a team of 3 developpers, I was lead backend in charge of security, backend architecture and the implementation of file downloads.
                 The website is still available as of 2026-07-19. As it was my teammate who was in charge of devops and frontend, I do not have access to the servers or the deployment which means it could be closed at any moment.
                 The frontend was written in Javascript using the VueJS framework and the backend in Spring Boot.
                 It featured a standard login system using username/password authentication and web sessions as authentication management all using Spring Security.                 
                 
                 """
          , fr =
                """
                 Pour ceux qui connaissent Google Drive, OneDrive et autres. Ce site web est une implémentation de ce type de services. C'était un projet final pour ma dernière session de Cégep.
                 Ce projet a été réalisé avec une équipe de 3 développeurs; j'étais le lead backend, en charge de la sécurité, de l'architecture backend et de l'implémentation des téléchargements de fichiers.
                 Le site est toujours disponible en date du 2026-07-19. Comme c'était mon coéquipier qui était en charge du devops et du frontend, je n'ai pas accès aux serveurs ni au déploiement, ce qui veut dire qu'il pourrait être fermé à tout moment.
                 Le frontend a été écrit en Javascript avec le framework VueJS, et le backend en Spring Boot.
                 Il comportait un système de connexion standard utilisant l'authentification par nom d'utilisateur/mot de passe et des sessions web comme gestion de l'authentification, le tout via Spring Security.
                 """
          }    
    }
    

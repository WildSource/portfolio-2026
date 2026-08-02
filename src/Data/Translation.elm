module Data.Translation exposing (..)

type Language
    = EN
    | FR

      
type alias Translation =
    { en : String
    , fr : String
    }

    
translate : Language -> Translation -> String
translate language translation =
    if language == FR then
        translation.fr
    else
        translation.en

            
{-
Translations (better to store them in a seperate file out of elm code but,
for the size of this project it's fine)
-}
titles : List Translation
titles =
    [ aboutTitle
    , experiencesTitle
    , technologyTitle
    , projectsTitle
    ]

    
aboutTitle : Translation
aboutTitle =
    { en = "About me"
    , fr = "À propos de moi"
    }


experiencesTitle : Translation
experiencesTitle =
    { en = "My experiences"
    , fr = "Mes expériences"
    }
    

technologyTitle : Translation
technologyTitle =
    { en = "Technologies"
    , fr = "Technologies"
    }

    
projectsTitle : Translation
projectsTitle =
    { en = "Projects"
    , fr = "Projets"
    }

    
heroTitle : List Translation
heroTitle =
    [ firstHeroTitle
    , secondHeroTitle
    , lastHeroTitle
    ]


firstHeroTitle : Translation
firstHeroTitle =
    { en = "Hi, I'm "
    , fr = "Bonjour, je m'appelle "
    }

    
secondHeroTitle : Translation
secondHeroTitle =
    { en = " and I make "
    , fr = " et je fais des "
    }

    
lastHeroTitle : Translation
lastHeroTitle =
    { en = "websites\n"
    , fr = "sites webs\n"
    }


subHeroTitle : List Translation
subHeroTitle =
    [ subHeroTitle1
    , subHeroTitle2
    , subHeroTitle3
    ]
    
    
subHeroTitle1 : Translation
subHeroTitle1 =
    { en = "I'm a fullstack developer"
    , fr = "Je suis un dévelopeur fullstack"
    }

    
subHeroTitle2 : Translation
subHeroTitle2 =
    { en = " a.k.a. "
    , fr = " c'est-à-dire "
    }

subHeroTitle3 : Translation
subHeroTitle3 =
    { en = "backend dev that can do frontend dev"
    , fr = "un dev backend qui peut faire du frontend"
    }


aboutContent : List Translation
aboutContent =
    [ aboutContent1
    , aboutContent2
    , aboutContent3
    , aboutContent4        
    ]
    
    
aboutContent1 : Translation
aboutContent1 =
    { en = "Based in Quebec Canada, I have experience in web development in various programming languages and technologies."
    , fr = "Basé au Québec, j'ai de l'expérience en développement d'application web dans de nombreux language de programmation et technologies diverses."
    }


aboutContent2 : Translation
aboutContent2 =
    { en = "I specialize and prefer to work on the backend but I am fully capable to do fullstack development."
    , fr = "Je suis spécialisé et préfère le développement backend cependant, j'ai les aptitudes pour concevoir une application fullstack complète."
    }

aboutContent3 : Translation
aboutContent3 =
    { en = "I am bilingual and able to speak both french and english fluently."
    , fr = "Je suis bilingue et je suis capable de parler le français et l'anglais couramment."
    }    


aboutContent4 : Translation
aboutContent4 =
    { en = "I am open to work remotely."
    , fr = "Ma localisation géographique ne m'empêche pas de travailler à distance, donc je suis ouvert au télétravail."
    }    
                                             

experienceJobTitle : Translation
experienceJobTitle =                     
    { en = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Internship (2023-2026)\n"
    , fr = "Régie des marchés agricoles et alimentaires du Québec (RMMAQ) - Stage (2023-2026)\n"
    }                     


experienceContent : List Translation
experienceContent =
    [ experienceContent1
    , experienceContent2
    , experienceContent3
    , experienceContent4
    , experienceContent5
    ]

    
experienceContent1 : Translation
experienceContent1 =
    { en = "During my internship at RMAAQ, I developed fullstack internal web applications in PHP using the Laravel framework, used daily by Board Members and administrative staff."
    , fr = "Dans le cadre de mon stage à la RMAAQ, j'ai développé des applications web internes complètes en PHP avec le framework Laravel, utilisées quotidiennement par les membres du conseil d'administration et le personnel administratif."
    }


experienceContent2 : Translation
experienceContent2 =
    { en = "I designed and implemented a document synchronization system that transferred legal documents from NextCloud to the server's file system and website database, later adapting it to integrate with Microsoft SharePoint via the Microsoft Graph API."
    , fr = "J'ai conçu et implémenté un système de synchronisation de documents permettant le transfert de documents légaux de NextCloud vers le système de fichiers du serveur et la base de données du site web, système que j'ai ensuite adapté pour l'intégrer à Microsoft SharePoint via l'API Microsoft Graph."
    }

    
experienceContent3 : Translation
experienceContent3 =
    { en = "I implemented automated PDF generation using the DomPDF library, enabling documents to be emailed directly to relevant parties."
    , fr = "J'ai mis en place la génération automatisée de documents PDF à l'aide de la librairie DomPDF, permettant l'envoi direct des documents par courriel aux parties concernées."
    }


experienceContent4 : Translation
experienceContent4 =
    { en = "I also built the intake system for legal requests submitted through RMAAQ's public website, allowing agricultural workers to file requests on various regulatory matters, and synchronized the incoming data across NextCloud, SharePoint, and the internal database."
    , fr = "J'ai également conçu le système de prise en charge des demandes légales soumises via le site web public de la RMAAQ, permettant aux travailleurs agricoles de déposer des demandes sur divers enjeux réglementaires, tout en synchronisant les données entrantes entre NextCloud, SharePoint et la base de données interne."
    }


experienceContent5 : Translation
experienceContent5 =
    { en = "Originally planned as a standard 3–4 month internship, I was retained for a full year due to strong performance and ongoing project needs."
    , fr = "Initialement prévu pour une durée de 3 à 4 mois, mon stage a été prolongé sur une pleine année en raison de mon rendement et des besoins continus des projets en cours."
    }    
   
    
projectAdultComicTitle : Translation
projectAdultComicTitle =
    { en = "Webcomic Website"
    , fr = "Site Web de Webcomique"
    }
    

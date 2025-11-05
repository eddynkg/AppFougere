//
//  ActivitiesData.swift
//  AppFougere
//
//  Created by JulietteM on 29/10/2025.
//

import Foundation
import SwiftData

// --- Datas for activities ---

let activities: [Activity] = [
    Activity(
        name: "Les Balmes de Montbrun",
        actDescription:
            "Grottes troglodytiques médiévales et paysages volcaniques peu connus, avec une ambiance sauvage.",
        location: "Les Beaumes, 07580 Saint-Gineys-en-Coiron",
        difficulty: 3.0,
        handicap: false,
        userId: users[0].id,
        accessibility: [.train, .foot, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Marais du Quellen",
        actDescription:
            "Marais à deux pas de la plage, très agréable en été avec la fraîcheur qu’il amène, comme en automne quand il est à sec.",
        location: "16 Rue du Quellen, 22560 Trébeurden",
        difficulty: 2.0,
        handicap: false,
        userId: users[1].id,
        accessibility: [.foot, .bike, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Les Tourbières de l’Herrétang",
        actDescription:
            "Petit cirque calcaire caché, falaises sculptées et ruisseau clair, parfait pour pique-nique et courtes randos.",
        location: "220 Chemin des Terpends 38380 Saint-Laurent-du-Pont",
        difficulty: 3.5,
        handicap: false,
        userId: users[2].id,
        accessibility: [.train, .bus, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Massif de l’Étoile",
        actDescription:
            "Massif méditerranéen moins fréquenté que les grands sommets, belle immersion nature et vue panoramique sur Marseille et Allauch.",
        location: "72 Rue de la Trinière, 13190 Allauch",
        difficulty: 4.0,
        handicap: false,
        userId: users[3].id,
        accessibility: [.bus, .foot, .bike, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le balcon des Pyrénées",
        actDescription:
            "Une petite randonnée bien agréable, parfaitement balisée et pas trop difficile. La vue sur les Pyrénées et les vallées sont superbes, l'effort sur les quelques montées est bien récompensé.",
        location: "1 Place Lastic, 31310 Rieux-Volvestre",
        difficulty: 2.5,
        handicap: false,
        userId: users[4].id,
        accessibility: [.car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Château de la Chasse",
        actDescription:
            "Dans la forêt de Montmorency, ancienne forêt de chasse royale, ce château médiéval relie des sentiers pédestres et cyclables.",
        location: "Ruisseau du Petit Moulin, 95390 Saint-Prix",
        difficulty: 1.0,
        handicap: true,
        userId: users[5].id,
        accessibility: [.bus, .foot, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Gorges de la Sioule",
        actDescription:
            "Vallée fluviale, forêts denses et nature sauvage, très bon pour rando loin des foules.",
        location: "6 Les Tarteaux, 63560 Menat",
        difficulty: 3.5,
        handicap: false,
        userId: users[6].id,
        accessibility: [.car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Allée des hêtres tortueux géants",
        actDescription:
            "Un moment solennel lors de la promenade. Nous avons l'impression que chaque arbre raconte une histoire, le bruit de la nature est simplement hypnotisant.",
        location: "28 Rue de Boffet, 03250 Saint-Nicolas-des-Biefs",
        difficulty: 2.5,
        handicap: false,
        userId: users[7].id,
        accessibility: [.car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Les Gorges de la Save",
        actDescription:
            "Défilé karstique creusé par la Save, falaises, cavités et nature préservée. C’est aussi un site préhistorique.",
        location: "28 Moulin de Gouerris, 31350 Lespugue",
        difficulty: 3.0,
        handicap: false,
        userId: users[8].id,
        accessibility: [.car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "L'Étang de Haute-Jarrie",
        actDescription:
            "Petit havre riche en faune et flore, où plusieurs oiseaux et amphibiens sont visibles si l’on sait où regarder !",
        location: "797 Route du Plâtre 465, 38560 Jarrie",
        difficulty: 2.0,
        handicap: false,
        userId: users[9].id,
        accessibility: [.bus, .bike, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Parc du Confluent",
        actDescription:
            "Balade tranquille le long de la rivière Ariège, zone naturelle classée, ambiance boisée et méandre du fleuve.",
        location: "Chemin du Port, 31120 Portet-sur-Garonne",
        difficulty: 1.5,
        handicap: false,
        userId: users[10].id,
        accessibility: [.bike, .foot, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Domaine des Oiseaux",
        actDescription:
            "Promenade facile autour d’étangs et prairies humides, observation de la faune et de la flore, immersion calme.",
        location: "Domaine des Oiseaux, Rte de Calmont, 09270 Mazères",
        difficulty: 0.9,
        handicap: false,
        userId: users[11].id,
        accessibility: [.car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Plateau de Beille",
        actDescription:
            "Plateau de moyenne montagne, randonnée enneigée avec vue panoramique dans les Pyrénées ariégeoises, nature préservée.",
        location: "Plateau de Beille, 09310 Les Cabannes",
        difficulty: 4.5,
        handicap: false,
        userId: users[12].id,
        accessibility: [.car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "La Vallée d’Oô",
        actDescription:
            "Vallée botanique avec de nombreux lacs dans les Pyrénées, riche en flore alpine, un coin moins fréquenté pour randonner en nature.",
        location: "1 route d'Astau, 31110 Oô",
        difficulty: 3.0,
        handicap: false,
        userId: users[13].id,
        accessibility: [.bike, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Les Mille Étangs",
        actDescription:
            "Surnommé la « Petite Finlande », ce plateau offre une biodiversité riche et des paysages pittoresques.",
        location: "70310 Faucogney-et-la-Mer",
        difficulty: 3.0,
        handicap: false,
        userId: users[14].id,
        accessibility: [.car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Causse Comtal",
        actDescription:
            "Un espace naturel sensible présentant une grande diversité faunistique et floristique, idéal pour l'observation de la nature.",
        location: "12630 Agen-d'Aveyron",
        difficulty: 2.5,
        handicap: false,
        userId: users[15].id,
        accessibility: [.bike, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Dolmen de la Pierre de la Fée",
        actDescription:
            "Dolmen entouré d’une ambiance mystique, n’hésitez pas à faire un vœu.",
        location: "Av. de Montferrat, 83300 Draguignan",
        difficulty: 0.5,
        handicap: true,
        userId: users[16].id,
        accessibility: [.bus, .bike, .foot, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Marais de Bourges",
        actDescription:
            "Un vaste marais classé, abritant une faune et une flore exceptionnelles, avec des sentiers aménagés.",
        location: "5 Bd du Général Chanzy, 18000 Bourges",
        difficulty: 0.7,
        handicap: true,
        userId: users[17].id,
        accessibility: [.bike, .foot, .train, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Mont Boron",
        actDescription:
            "En plein Nice, cette formation rocheuse recouverte d’un maquis abrite aussi des forts à visiter.",
        location: "4 Boulevard Maurice Maeterlinck, 06300 Nice",
        difficulty: 2.5,
        handicap: false,
        userId: users[18].id,
        accessibility: [.bus, .car],
        durationHour: 2,
        durationMin: 20
    ),

    Activity(
        name: "Le Cirque de Navacelles",
        actDescription:
            "Un cirque naturel classé au patrimoine mondial de l'UNESCO, offrant des paysages rocheux époustouflants.",
        location: "18 Chem. des Faïsses, 34520 Saint-Maurice-Navacelles",
        difficulty: 4.0,
        handicap: false,
        userId: users[19].id,
        accessibility: [.bike, .car],
        durationHour: 2,
        durationMin: 20
    ),

    
    

    Activity(
        name: "Le Colorado français",
        actDescription: "Une rando incroyable dans le Luberon ! 😍 On se croirait dans un mini Colorado avec ces falaises ocres rouges et jaunes. Le contraste avec la végétation est fou. Une vraie claque visuelle, à faire absolument si vous êtes dans la région ! 🏜️✨",
        location: "Lubéron, France",
        difficulty: 2.5,
        handicap: true,
        userId: users[19].id,
        accessibility: [.foot, .car, .bus],
        durationHour: 2,
        durationMin: 20
    )
]

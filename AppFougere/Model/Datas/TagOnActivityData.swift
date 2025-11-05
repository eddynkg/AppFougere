//
//  TagOnActivityData.swift
//  AppFougere
//
//  Created by Eddy Charles on 04/11/2025.
//

import Foundation
import SwiftData

// --- Datas for Tag <-> Activity associations ---
// Hypothèse: les fichiers ActivitiesData.swift et TagData.swift sont chargés avant celui-ci.

let tagsOnActivity: [TagOnActivity] = [

    // 0 - Les Balmes de Montbrun (grottes, paysage volcanique, ambiance sauvage)
    TagOnActivity(idTag: tags[31].id, idActivity: activities[0].id), // sauvage
    TagOnActivity(idTag: tags[8].id,  idActivity: activities[0].id), // falaise
    TagOnActivity(idTag: tags[32].id, idActivity: activities[0].id), // naturel
    TagOnActivity(idTag: tags[38].id, idActivity: activities[0].id), // inspirant

    // 1 - Le Marais du Quellen (marais, fraîcheur, bord de mer)
    TagOnActivity(idTag: tags[10].id, idActivity: activities[1].id), // marais
    TagOnActivity(idTag: tags[26].id, idActivity: activities[1].id), // frais
    TagOnActivity(idTag: tags[27].id, idActivity: activities[1].id), // ombragé
    TagOnActivity(idTag: tags[43].id, idActivity: activities[1].id), // rafraîchissant

    // 2 - Les Tourbières de l’Herrétang (cirque calcaire caché, nature préservée)
    TagOnActivity(idTag: tags[32].id, idActivity: activities[2].id), // naturel
    TagOnActivity(idTag: tags[31].id, idActivity: activities[2].id), // sauvage
    TagOnActivity(idTag: tags[37].id, idActivity: activities[2].id), // serein
    TagOnActivity(idTag: tags[18].id, idActivity: activities[2].id), // prairie

    // 3 - Massif de l’Étoile (massif méditerranéen, panoramas, garrigue)
    TagOnActivity(idTag: tags[4].id,  idActivity: activities[3].id), // massif
    TagOnActivity(idTag: tags[24].id, idActivity: activities[3].id), // garrigue
    TagOnActivity(idTag: tags[41].id, idActivity: activities[3].id), // contemplatif
    TagOnActivity(idTag: tags[44].id, idActivity: activities[3].id), // vivifiant

    // 4 - Le balcon des Pyrénées (vue, montées douces, panoramas)
    TagOnActivity(idTag: tags[1].id,  idActivity: activities[4].id), // montagne
    TagOnActivity(idTag: tags[41].id, idActivity: activities[4].id), // contemplatif
    TagOnActivity(idTag: tags[39].id, idActivity: activities[4].id), // ressourçant
    TagOnActivity(idTag: tags[28].id, idActivity: activities[4].id), // lumineux

    // 5 - Le Château de la Chasse (forêt, sentiers, accessible)
    TagOnActivity(idTag: tags[0].id,  idActivity: activities[5].id), // forêt
    TagOnActivity(idTag: tags[27].id, idActivity: activities[5].id), // ombragé
    TagOnActivity(idTag: tags[30].id, idActivity: activities[5].id), // paisible
    TagOnActivity(idTag: tags[47].id, idActivity: activities[5].id), // authentique

    // 6 - Gorges de la Sioule (vallée fluviale, falaises, sauvage)
    TagOnActivity(idTag: tags[2].id,  idActivity: activities[6].id), // vallée
    TagOnActivity(idTag: tags[13].id, idActivity: activities[6].id), // rivière
    TagOnActivity(idTag: tags[8].id,  idActivity: activities[6].id), // falaise
    TagOnActivity(idTag: tags[31].id, idActivity: activities[6].id), // sauvage

    // 7 - Allée des hêtres tortueux géants (forêt, magique, contemplatif)
    TagOnActivity(idTag: tags[0].id,  idActivity: activities[7].id), // forêt
    TagOnActivity(idTag: tags[42].id, idActivity: activities[7].id), // magique
    TagOnActivity(idTag: tags[41].id, idActivity: activities[7].id), // contemplatif
    TagOnActivity(idTag: tags[36].id, idActivity: activities[7].id), // coloré

    // 8 - Les Gorges de la Save (karst, cavités, préservé)
    TagOnActivity(idTag: tags[8].id,  idActivity: activities[8].id), // falaise
    TagOnActivity(idTag: tags[13].id, idActivity: activities[8].id), // rivière
    TagOnActivity(idTag: tags[31].id, idActivity: activities[8].id), // sauvage
    TagOnActivity(idTag: tags[32].id, idActivity: activities[8].id), // naturel

    // 9 - L'Étang de Haute-Jarrie (étang, faune/flore, paisible)
    TagOnActivity(idTag: tags[16].id, idActivity: activities[9].id), // étang
    TagOnActivity(idTag: tags[30].id, idActivity: activities[9].id), // paisible
    TagOnActivity(idTag: tags[27].id, idActivity: activities[9].id), // ombragé
    TagOnActivity(idTag: tags[43].id, idActivity: activities[9].id), // rafraîchissant

    // 10 - Le Parc du Confluent (rivière, boisé, méandre)
    TagOnActivity(idTag: tags[13].id, idActivity: activities[10].id), // rivière
    TagOnActivity(idTag: tags[0].id,  idActivity: activities[10].id), // forêt
    TagOnActivity(idTag: tags[30].id, idActivity: activities[10].id), // paisible
    TagOnActivity(idTag: tags[39].id, idActivity: activities[10].id), // ressourçant

    // 11 - Le Domaine des Oiseaux (étangs, prairies humides, observation)
    TagOnActivity(idTag: tags[16].id, idActivity: activities[11].id), // étang
    TagOnActivity(idTag: tags[18].id, idActivity: activities[11].id), // prairie
    TagOnActivity(idTag: tags[37].id, idActivity: activities[11].id), // serein
    TagOnActivity(idTag: tags[32].id, idActivity: activities[11].id), // naturel

    // 12 - Le Plateau de Beille (neige, panoramas, montagne)
    TagOnActivity(idTag: tags[3].id,  idActivity: activities[12].id), // plateau
    TagOnActivity(idTag: tags[1].id,  idActivity: activities[12].id), // montagne
    TagOnActivity(idTag: tags[44].id, idActivity: activities[12].id), // vivifiant
    TagOnActivity(idTag: tags[41].id, idActivity: activities[12].id), // contemplatif

    // 13 - La Vallée d’Oô (lacs, botanique, accessible)
    TagOnActivity(idTag: tags[2].id,  idActivity: activities[13].id), // vallée
    TagOnActivity(idTag: tags[15].id, idActivity: activities[13].id), // lac
    TagOnActivity(idTag: tags[39].id, idActivity: activities[13].id), // ressourçant
    TagOnActivity(idTag: tags[28].id, idActivity: activities[13].id), // lumineux

    // 14 - Les Mille Étangs (plateau, étangs, “Petite Finlande”)
    TagOnActivity(idTag: tags[3].id,  idActivity: activities[14].id), // plateau
    TagOnActivity(idTag: tags[16].id, idActivity: activities[14].id), // étang
    TagOnActivity(idTag: tags[37].id, idActivity: activities[14].id), // serein
    TagOnActivity(idTag: tags[39].id, idActivity: activities[14].id), // ressourçant

    // 15 - Le Causse Comtal (diversité faune/flore, observation)
    TagOnActivity(idTag: tags[32].id, idActivity: activities[15].id), // naturel
    TagOnActivity(idTag: tags[18].id, idActivity: activities[15].id), // prairie
    TagOnActivity(idTag: tags[41].id, idActivity: activities[15].id), // contemplatif
    TagOnActivity(idTag: tags[39].id, idActivity: activities[15].id), // ressourçant

    // 16 - Dolmen de la Pierre de la Fée (mystique, accessible)
    TagOnActivity(idTag: tags[42].id, idActivity: activities[16].id), // magique
    TagOnActivity(idTag: tags[47].id, idActivity: activities[16].id), // authentique
    TagOnActivity(idTag: tags[30].id, idActivity: activities[16].id), // paisible
    TagOnActivity(idTag: tags[28].id, idActivity: activities[16].id), // lumineux

    // 17 - Le Marais de Bourges (marais classé, faune/flore)
    TagOnActivity(idTag: tags[10].id, idActivity: activities[17].id), // marais
    TagOnActivity(idTag: tags[30].id, idActivity: activities[17].id), // paisible
    TagOnActivity(idTag: tags[32].id, idActivity: activities[17].id), // naturel
    TagOnActivity(idTag: tags[39].id, idActivity: activities[17].id), // ressourçant

    // 18 - Le Mont Boron (maquis, forts, au-dessus de la ville)
    TagOnActivity(idTag: tags[24].id, idActivity: activities[18].id), // garrigue/maquis
    TagOnActivity(idTag: tags[28].id, idActivity: activities[18].id), // lumineux
    TagOnActivity(idTag: tags[41].id, idActivity: activities[18].id), // contemplatif
    TagOnActivity(idTag: tags[4].id,  idActivity: activities[18].id), // massif

    // 19 - Le Cirque de Navacelles (cirque naturel, paysages rocheux)
    TagOnActivity(idTag: tags[8].id,  idActivity: activities[19].id), // falaise
    TagOnActivity(idTag: tags[32].id, idActivity: activities[19].id), // naturel
    TagOnActivity(idTag: tags[41].id, idActivity: activities[19].id), // contemplatif
    TagOnActivity(idTag: tags[31].id, idActivity: activities[19].id), // sauvage

    // 20 - Le Colorado français (ocres, contrastes, boucle courte)
    TagOnActivity(idTag: tags[36].id, idActivity: activities[20].id), // coloré
    TagOnActivity(idTag: tags[8].id,  idActivity: activities[20].id), // falaise
    TagOnActivity(idTag: tags[24].id, idActivity: activities[20].id), // garrigue
    TagOnActivity(idTag: tags[28].id, idActivity: activities[20].id), // lumineux
    TagOnActivity(idTag: tags[39].id, idActivity: activities[20].id), // ressourçant
]


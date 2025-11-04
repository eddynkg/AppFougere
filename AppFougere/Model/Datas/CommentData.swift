//
//  CommentData.swift
//  AppFougere
//
//  Created by JulietteM on 02/11/2025.
//

import Foundation
import SwiftData

// --- Datas for comments on activities ---

let comments: [Comment] = [
    // --- Les Balmes de Montbrun (0) ---
    Comment(
        userId: users[3].id,
        activityId: activities[0].id,
        content:
            "Les grottes sont impressionnantes et la vue sur le paysage volcanique est superbe !",
        date: Date(timeIntervalSinceNow: -86400 * 2)
    ),
    Comment(
        userId: users[8].id,
        activityId: activities[0].id,
        content:
            "Balade fascinante, on sent vraiment la nature brute et sauvage.",
        date: Date(timeIntervalSinceNow: -86400 * 6)
    ),
    Comment(
        userId: users[12].id,
        activityId: activities[0].id,
        content:
            "Endroit mystique, parfait pour les amateurs d’histoire et de nature.",
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),

    // --- Le Marais du Quellen (1) ---
    Comment(
        userId: users[5].id,
        activityId: activities[1].id,
        content:
            "Superbe marais, les odeurs d’eau salée et de végétation marine sont enivrantes.",
        date: Date(timeIntervalSinceNow: -86400 * 8)
    ),
    Comment(
        userId: users[9].id,
        activityId: activities[1].id,
        content: "Très agréable pour une promenade au calme, surtout le matin.",
        date: Date(timeIntervalSinceNow: -86400 * 11)
    ),
    Comment(
        userId: users[2].id,
        activityId: activities[1].id,
        content: "La fraîcheur du marais en été est vraiment bienvenue !",
        date: Date(timeIntervalSinceNow: -86400 * 15)
    ),

    // --- Les Tourbières de l’Herrétang (2) ---
    Comment(
        userId: users[1].id,
        activityId: activities[2].id,
        content:
            "Site préservé et apaisant, parfait pour une sortie nature tranquille.",
        date: Date(timeIntervalSinceNow: -86400 * 4)
    ),
    Comment(
        userId: users[13].id,
        activityId: activities[2].id,
        content:
            "La diversité des paysages est incroyable sur un si petit périmètre.",
        date: Date(timeIntervalSinceNow: -86400 * 12)
    ),
    Comment(
        userId: users[7].id,
        activityId: activities[2].id,
        content: "Petite rando facile et dépaysante, je recommande !",
        date: Date(timeIntervalSinceNow: -86400 * 9)
    ),

    // --- Massif de l’Étoile (3) ---
    Comment(
        userId: users[6].id,
        activityId: activities[3].id,
        content:
            "Randonnée superbe, la vue sur Marseille vaut largement l’effort.",
        date: Date(timeIntervalSinceNow: -86400 * 3)
    ),
    Comment(
        userId: users[14].id,
        activityId: activities[3].id,
        content: "J’ai adoré le contraste entre la garrigue et la mer au loin.",
        date: Date(timeIntervalSinceNow: -86400 * 13)
    ),
    Comment(
        userId: users[0].id,
        activityId: activities[3].id,
        content:
            "Chemins bien balisés, un endroit idéal pour se reconnecter à la nature.",
        date: Date(timeIntervalSinceNow: -86400 * 5)
    ),

    // --- Le balcon des Pyrénées (4) ---
    Comment(
        userId: users[10].id,
        activityId: activities[4].id,
        content:
            "Magnifique point de vue ! La montée est douce et les paysages grandioses.",
        date: Date(timeIntervalSinceNow: -86400 * 7)
    ),
    Comment(
        userId: users[4].id,
        activityId: activities[4].id,
        content:
            "Une randonnée accessible et très agréable, idéale pour débuter.",
        date: Date(timeIntervalSinceNow: -86400 * 14)
    ),
    Comment(
        userId: users[8].id,
        activityId: activities[4].id,
        content: "Les couleurs au coucher du soleil sont sublimes.",
        date: Date(timeIntervalSinceNow: -86400 * 16)
    ),

    // --- Le Château de la Chasse (5) ---
    Comment(
        userId: users[3].id,
        activityId: activities[5].id,
        content: "Très belle balade en forêt, ombragée et pleine de charme.",
        date: Date(timeIntervalSinceNow: -86400 * 6)
    ),
    Comment(
        userId: users[9].id,
        activityId: activities[5].id,
        content:
            "Le château est pittoresque, et les sentiers sont bien entretenus.",
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),
    Comment(
        userId: users[15].id,
        activityId: activities[5].id,
        content: "Endroit parfait pour une sortie nature proche de la ville.",
        date: Date(timeIntervalSinceNow: -86400 * 11)
    ),

    // --- Gorges de la Sioule (6) ---
    Comment(
        userId: users[2].id,
        activityId: activities[6].id,
        content:
            "Superbe vallée, paysages sauvages et peu de monde, un vrai plaisir.",
        date: Date(timeIntervalSinceNow: -86400 * 9)
    ),
    Comment(
        userId: users[16].id,
        activityId: activities[6].id,
        content:
            "Les falaises et la rivière sont magnifiques. À faire absolument !",
        date: Date(timeIntervalSinceNow: -86400 * 17)
    ),
    Comment(
        userId: users[6].id,
        activityId: activities[6].id,
        content: "Parfait pour une journée de randonnée loin du bruit.",
        date: Date(timeIntervalSinceNow: -86400 * 13)
    ),

    // --- Allée des hêtres tortueux géants (7) ---
    Comment(
        userId: users[11].id,
        activityId: activities[7].id,
        content:
            "On se croirait dans un conte, les arbres ont des formes fascinantes.",
        date: Date(timeIntervalSinceNow: -86400 * 8)
    ),
    Comment(
        userId: users[5].id,
        activityId: activities[7].id,
        content:
            "Ambiance magique, on ressent une vraie connexion à la nature.",
        date: Date(timeIntervalSinceNow: -86400 * 18)
    ),
    Comment(
        userId: users[10].id,
        activityId: activities[7].id,
        content: "Très belle promenade, facile d’accès et pleine de charme.",
        date: Date(timeIntervalSinceNow: -86400 * 15)
    ),

    // --- Les Gorges de la Save (8) ---
    Comment(
        userId: users[17].id,
        activityId: activities[8].id,
        content:
            "Endroit paisible et sauvage, parfait pour les amateurs de géologie.",
        date: Date(timeIntervalSinceNow: -86400 * 6)
    ),
    Comment(
        userId: users[8].id,
        activityId: activities[8].id,
        content: "Falaises impressionnantes et belle diversité végétale.",
        date: Date(timeIntervalSinceNow: -86400 * 19)
    ),
    Comment(
        userId: users[1].id,
        activityId: activities[8].id,
        content: "Très belle découverte, lieu chargé d’histoire et de calme.",
        date: Date(timeIntervalSinceNow: -86400 * 11)
    ),

    // --- L'Étang de Haute-Jarrie (9) ---
    Comment(
        userId: users[4].id,
        activityId: activities[9].id,
        content:
            "Petit coin de nature reposant, idéal pour observer les oiseaux.",
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),
    Comment(
        userId: users[13].id,
        activityId: activities[9].id,
        content:
            "Superbe au printemps, les reflets dans l’eau sont magnifiques.",
        date: Date(timeIntervalSinceNow: -86400 * 14)
    ),
    Comment(
        userId: users[9].id,
        activityId: activities[9].id,
        content:
            "Un lieu paisible à deux pas de la ville, parfait pour se détendre.",
        date: Date(timeIntervalSinceNow: -86400 * 18)
    ),

    // --- Le Parc du Confluent (10) ---
    Comment(
        userId: users[12].id,
        activityId: activities[10].id,
        content:
            "Balade facile le long de la rivière, très agréable en famille.",
        date: Date(timeIntervalSinceNow: -86400 * 12)
    ),
    Comment(
        userId: users[15].id,
        activityId: activities[10].id,
        content: "Endroit ombragé, parfait pour courir ou marcher tranquille.",
        date: Date(timeIntervalSinceNow: -86400 * 7)
    ),
    Comment(
        userId: users[19].id,
        activityId: activities[10].id,
        content:
            "Nature préservée, très beau contraste entre rivière et forêt.",
        date: Date(timeIntervalSinceNow: -86400 * 5)
    ),

    // --- Le Domaine des Oiseaux (11) ---
    Comment(
        userId: users[3].id,
        activityId: activities[11].id,
        content: "On y voit énormément d’espèces d’oiseaux, très bien aménagé.",
        date: Date(timeIntervalSinceNow: -86400 * 16)
    ),
    Comment(
        userId: users[11].id,
        activityId: activities[11].id,
        content:
            "Endroit calme et reposant, parfait pour les amoureux d’ornithologie.",
        date: Date(timeIntervalSinceNow: -86400 * 9)
    ),
    Comment(
        userId: users[0].id,
        activityId: activities[11].id,
        content: "Le site est propre et paisible, très belle promenade.",
        date: Date(timeIntervalSinceNow: -86400 * 15)
    ),

    // --- Le Plateau de Beille (12) ---
    Comment(
        userId: users[6].id,
        activityId: activities[12].id,
        content:
            "Vue à couper le souffle ! Même sous la neige, c’est magnifique.",
        date: Date(timeIntervalSinceNow: -86400 * 17)
    ),
    Comment(
        userId: users[10].id,
        activityId: activities[12].id,
        content: "Excellent pour une randonnée hivernale, grand bol d’air pur.",
        date: Date(timeIntervalSinceNow: -86400 * 14)
    ),
    Comment(
        userId: users[18].id,
        activityId: activities[12].id,
        content: "Les paysages pyrénéens dans toute leur splendeur.",
        date: Date(timeIntervalSinceNow: -86400 * 20)
    ),

    // --- La Vallée d’Oô (13) ---
    Comment(
        userId: users[8].id,
        activityId: activities[13].id,
        content: "Sentier magnifique et lac splendide à l’arrivée !",
        date: Date(timeIntervalSinceNow: -86400 * 7)
    ),
    Comment(
        userId: users[2].id,
        activityId: activities[13].id,
        content:
            "Beaucoup de monde en été, mais la beauté du lieu compense largement.",
        date: Date(timeIntervalSinceNow: -86400 * 18)
    ),
    Comment(
        userId: users[17].id,
        activityId: activities[13].id,
        content: "Rando parfaite, accessible et ressourçante.",
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),

    // --- Les Mille Étangs (14) ---
    Comment(
        userId: users[5].id,
        activityId: activities[14].id,
        content: "Endroit magique, on se croirait en Scandinavie !",
        date: Date(timeIntervalSinceNow: -86400 * 21)
    ),
    Comment(
        userId: users[12].id,
        activityId: activities[14].id,
        content: "Les reflets des arbres dans les étangs sont magnifiques.",
        date: Date(timeIntervalSinceNow: -86400 * 19)
    ),
    Comment(
        userId: users[14].id,
        activityId: activities[14].id,
        content:
            "Lieu paisible, idéal pour se ressourcer au milieu de la nature.",
        date: Date(timeIntervalSinceNow: -86400 * 11)
    ),

    // --- Le Causse Comtal (15) ---
    Comment(
        userId: users[9].id,
        activityId: activities[15].id,
        content:
            "Très belle zone naturelle, les couleurs changent selon la lumière.",
        date: Date(timeIntervalSinceNow: -86400 * 8)
    ),
    Comment(
        userId: users[3].id,
        activityId: activities[15].id,
        content: "Parfait pour l’observation de la faune, beaucoup d’oiseaux.",
        date: Date(timeIntervalSinceNow: -86400 * 13)
    ),
    Comment(
        userId: users[10].id,
        activityId: activities[15].id,
        content: "Rando facile, ambiance paisible et nature intacte.",
        date: Date(timeIntervalSinceNow: -86400 * 5)
    ),

    // --- Le Dolmen de la Pierre de la Fée (16) ---
    Comment(
        userId: users[7].id,
        activityId: activities[16].id,
        content: "Endroit mystique, on sent la légende dans l’air.",
        date: Date(timeIntervalSinceNow: -86400 * 14)
    ),
    Comment(
        userId: users[4].id,
        activityId: activities[16].id,
        content: "Très belle balade, facile et pleine de charme.",
        date: Date(timeIntervalSinceNow: -86400 * 12)
    ),
    Comment(
        userId: users[16].id,
        activityId: activities[16].id,
        content: "Le site est bien conservé et l’ambiance apaisante.",
        date: Date(timeIntervalSinceNow: -86400 * 9)
    ),

    // --- Le Marais de Bourges (17) ---
    Comment(
        userId: users[13].id,
        activityId: activities[17].id,
        content: "Très beau marais, facile d’accès et riche en biodiversité.",
        date: Date(timeIntervalSinceNow: -86400 * 8)
    ),
    Comment(
        userId: users[0].id,
        activityId: activities[17].id,
        content: "Les sentiers sont bien entretenus et la promenade agréable.",
        date: Date(timeIntervalSinceNow: -86400 * 6)
    ),
    Comment(
        userId: users[18].id,
        activityId: activities[17].id,
        content: "Endroit parfait pour observer les oiseaux et se détendre.",
        date: Date(timeIntervalSinceNow: -86400 * 19)
    ),

    // --- Le Mont Boron (18) ---
    Comment(
        userId: users[5].id,
        activityId: activities[18].id,
        content: "Belle vue sur Nice et la mer, balade facile et agréable.",
        date: Date(timeIntervalSinceNow: -86400 * 17)
    ),
    Comment(
        userId: users[11].id,
        activityId: activities[18].id,
        content:
            "J’adore ce coin, on peut y marcher tranquillement au-dessus de la ville.",
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),
    Comment(
        userId: users[9].id,
        activityId: activities[18].id,
        content: "Parfait pour admirer le coucher du soleil sur la côte.",
        date: Date(timeIntervalSinceNow: -86400 * 15)
    ),

    // --- Le Cirque de Navacelles (19) ---
    Comment(
        userId: users[19].id,
        activityId: activities[19].id,
        content:
            "Un lieu absolument grandiose, à voir au moins une fois dans sa vie.",
        date: Date(timeIntervalSinceNow: -86400 * 20)
    ),
    Comment(
        userId: users[8].id,
        activityId: activities[19].id,
        content:
            "Paysages incroyables, falaises vertigineuses et panorama à couper le souffle.",
        date: Date(timeIntervalSinceNow: -86400 * 16)
    ),
    Comment(
        userId: users[2].id,
        activityId: activities[19].id,
        content: "Long trajet mais quel spectacle ! Site naturel exceptionnel.",
        date: Date(timeIntervalSinceNow: -86400 * 9)
    ),
        
    // --- Le colorado Français (20) ---
//        Comment(
//            userId: users[19].id,
//            activityId: activities[20].id,
//            content: "Couleurs ocres incroyables, on change totalement de décor en quelques pas. Un vrai dépaysement !",
//            date: Date(timeIntervalSinceNow: -86400 * 4)
//        ),
        Comment(
            userId: users[8].id,
            activityId: activities[20].id,
            content: "Les contrastes entre le rouge des falaises et le vert de la végétation sont dingues. À faire tôt le matin pour éviter la chaleur.",
            date: Date(timeIntervalSinceNow: -86400 * 9)
        ),
        Comment(
            userId: users[4].id,
            activityId: activities[20].id,
            content: "Sentier bien balisé et accessible. Les enfants ont adoré, on se croit dans un film !",
            date: Date(timeIntervalSinceNow: -86400 * 12)
        ),
        Comment(
            userId: users[16].id,
            activityId: activities[20].id,
            content: "Photographiquement parlant, c’est un paradis. Lumière du soir = couleurs de folie.",
            date: Date(timeIntervalSinceNow: -86400 * 6)
        ),
        Comment(
            userId: users[2].id,
            activityId: activities[20].id,
            content: "Beaucoup de monde le week-end, mais le site reste splendide. Prévoir de l’eau et des chaussures fermées.",
            date: Date(timeIntervalSinceNow: -86400 * 10)
        ),
        Comment(
            userId: users[10].id,
            activityId: activities[20].id,
            content: "Ambiance unique en France, l’ocre est partout. Boucle courte mais très immersive.",
            date: Date(timeIntervalSinceNow: -86400 * 7)
        )
]

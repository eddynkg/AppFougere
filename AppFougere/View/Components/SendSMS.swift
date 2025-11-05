//
//  SendSMS.swift
//  AppFougere
//
//  Created by apprenant114 on 05/11/2025.
//

import SwiftUI

/// Génère un code de vérification à 8 chiffres (avec zéros initiaux si besoin).
func generateVerificationCode() -> String {
    return String(format: "%08d", Int.random(in: 0...99_999_999))
}

/// Formate un numéro FR en E.164 (+33XXXXXXXXX).
/// - Garde uniquement les chiffres de l’entrée.
/// - Accepte déjà `33…`, ou `0XXXXXXXXX` (transformé en `+33XXXXXXXXX`).
/// - Sinon, préfixe simplement avec `+`.
func toE164FR(_ raw: String) -> String {
    let digits = raw.filter(\.isNumber)
    if digits.hasPrefix("33") { return "+\(digits)" }
    if digits.hasPrefix("0"), digits.count == 10 {
        return "+33" + String(digits.dropFirst())
    }
    return "+\(digits)"
}

/// Envoie un SMS via l’API Twilio.
/// Renseigner `accountSID`, `authToken`, et `from` avant usage.
func sendSMS(number: String, verifCode: String) async {
    // Identifiants Twilio
    let accountSID = ""   // À renseigner
    let authToken  = ""   // À renseigner
    let from       = ""   // Numéro/Messaging Service Twilio

    // Cible + contenu
    let to = toE164FR(number)
    let message = "Votre code de vérification : \(verifCode)"

    // Endpoint Twilio
    let url = URL(string: "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages.json")!
    var req = URLRequest(url: url)
    req.httpMethod = "POST"
    req.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

    // Auth Basic
    let creds = "\(accountSID):\(authToken)"
    req.addValue("Basic \(Data(creds.utf8).base64EncodedString())", forHTTPHeaderField: "Authorization")

    // Corps de requête
    let body = "From=\(from)&To=\(to)&Body=\(message)"
        .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    req.httpBody = body.data(using: .utf8)

    // Appel réseau
    do {
        let (data, resp) = try await URLSession.shared.data(for: req)
        if let http = resp as? HTTPURLResponse, (200..<300).contains(http.statusCode) {
            print("✅ SMS envoyé")
        } else {
            print("❌ Erreur Twilio:", String(data: data, encoding: .utf8) ?? "Réponse illisible")
        }
    } catch {
        print("⚠️ Erreur réseau:", error.localizedDescription)
    }
}

//
//  SendSMS.swift
//  AppFougere
//
//  Created by apprenant114 on 05/11/2025.
//

import SwiftUI

/// Génère un code à 8 chiffres, zéros initiaux inclus (ex. "00324567").
func generateVerificationCode() -> String {
    return String(format: "%08d", Int.random(in: 0...99_999_999))
}

/// Convertit un numéro FR en format E.164.
/// - Garde uniquement les chiffres.
/// - "33…" devient "+33…"
/// - "0XXXXXXXXX" (10 chiffres) devient "+33XXXXXXXXX"
/// - Sinon, préfixe avec "+" et renvoie tel quel.
func toE164FR(_ raw: String) -> String {
    let digits = raw.filter(\.isNumber)            // retire espaces, +, etc.
    if digits.hasPrefix("33") { return "+\(digits)" }
    if digits.hasPrefix("0"), digits.count == 10 {
        return "+33" + String(digits.dropFirst())
    }
    return "+\(digits)"                            // fallback générique
}

/// Envoie un SMS via Twilio (endpoint Messages).
/// Renseigne `accountSID`, `authToken`, `from`. Utilise Basic Auth.
/// Affiche le résultat en console (succès / erreur JSON Twilio).
func sendSMS(number: String, verifCode: String) async {
    // Identifiants Twilio
    let accountSID = "AC6bf99284ebff8a2ab43427860d7fae6d"
    let authToken  = "d5f22de5df722e65a4746243d5cb1a6b"
    let from       = "+12173874650"

    // Cible + contenu
    let to = toE164FR(number)
    let message = "Votre code de vérification : \(verifCode)"

    // Requête HTTP (POST form-urlencoded)
    let url = URL(string: "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages.json")!
    var req = URLRequest(url: url)
    req.httpMethod = "POST"
    req.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

    // Basic Auth: base64("SID:TOKEN")
    let creds = "\(accountSID):\(authToken)"
    req.addValue("Basic \(Data(creds.utf8).base64EncodedString())", forHTTPHeaderField: "Authorization")

    // Corps : From/To/Body encodés URL
    let body = "From=\(from)&To=\(to)&Body=\(message)"
        .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    req.httpBody = Data(body.utf8)

    // Appel réseau + logs simples
    do {
        let (data, resp) = try await URLSession.shared.data(for: req)
        if let http = resp as? HTTPURLResponse, (200..<300).contains(http.statusCode) {
            print("✅ SMS envoyé !")
        } else {
            print("❌ Erreur Twilio :", String(data: data, encoding: .utf8) ?? "")
        }
    } catch {
        print("⚠️ Erreur :", error.localizedDescription)
    }
}

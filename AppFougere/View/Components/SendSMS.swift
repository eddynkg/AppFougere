//
//  SendSMS.swift
//  AppFougere
//
//  Created by apprenant114 on 05/11/2025.
//

import SwiftUI

func generateVerificationCode() -> String {
    return String(format: "%08d", Int.random(in: 0...99_999_999))
}

func toE164FR(_ raw: String) -> String {
    // garde les chiffres
    let digits = raw.filter(\.isNumber)
    if digits.hasPrefix("33") { return "+\(digits)" }
    if digits.hasPrefix("0"), digits.count == 10 {
        return "+33" + String(digits.dropFirst())
    }
    return "+\(digits)"  // fallback
}

func sendSMS(number: String, verifCode: String) async {
    // Tes infos Twilio
    let accountSID = "" // A renseigner
    let authToken = "" // A renseigner
    let from = "" // a renseigner
    let to = toE164FR(number)
    let message = "Votre code de vérification : \(verifCode)"

    // Requête HTTP
    let url = URL(
        string:
            "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages.json"
    )!
    var req = URLRequest(url: url)
    req.httpMethod = "POST"
    req.addValue(
        "application/x-www-form-urlencoded",
        forHTTPHeaderField: "Content-Type"
    )

    let creds = "\(accountSID):\(authToken)"
    req.addValue(
        "Basic \(Data(creds.utf8).base64EncodedString())",
        forHTTPHeaderField: "Authorization"
    )

    let body = "From=\(from)&To=\(to)&Body=\(message)"
        .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    req.httpBody = body.data(using: .utf8)

    do {
        let (data, resp) = try await URLSession.shared.data(for: req)
        if let http = resp as? HTTPURLResponse,
            (200..<300).contains(http.statusCode)
        {
            print("✅ SMS envoyé !")
        } else {
            print(
                "❌ Erreur Twilio :",
                String(data: data, encoding: .utf8) ?? ""
            )
        }
    } catch {
        print("⚠️ Erreur :", error.localizedDescription)
    }
}

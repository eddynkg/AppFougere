//
//  ResetPswdDefineView.swift
//  AppFougere
//
//  Created by apprenant114 on 05/11/2025.
//
import SwiftUI

struct ResetPswdDefineView: View {
    @Binding var isLogin: Bool
    let phone: String
    let expectedCode: String

    @State private var code: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    @State private var error: String?
    @State private var showSuccess = false

    // 🔹 Pour revenir à la page précédente (AuthView)
    @Environment(\.dismiss) private var dismiss

    private var isCodeValid: Bool {
        let codeRegex = /^[0-9]{8}$/
        return code.wholeMatch(of: codeRegex) != nil
    }
    private var doPasswordsMatch: Bool {
        newPassword == confirmPassword && !newPassword.isEmpty
    }
    private var isFormValid: Bool {
        isCodeValid && doPasswordsMatch
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("Nouveau mot de passe")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)

            Text("Un code a été envoyé à \(phone).")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            CustomTextField(
                placeholder: "Code à 8 chiffres",
                text: $code,
                systemImage: "number"
            )
            .keyboardType(.numberPad)
            .onChange(of: code) { code = String(code.prefix(8)) }

            CustomSecureField(
                placeholder: "Nouveau mot de passe",
                text: $newPassword,
                showPassword: $showPassword,
                regexOn: true
            )

            CustomSecureField(
                placeholder: "Confirmer le mot de passe",
                text: $confirmPassword,
                showPassword: $showConfirmPassword,
                regexOn: false
            )

            VStack(alignment: .leading, spacing: 4) {
                if !isCodeValid && !code.isEmpty {
                    Text("Code invalide (8 chiffres attendus).")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                if !doPasswordsMatch && !confirmPassword.isEmpty {
                    Text("Les mots de passe ne correspondent pas.")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                if let error {
                    Text(error).foregroundColor(.red).font(.caption)
                }
            }

            Button("Valider") {
                if code == expectedCode {
                    showSuccess = true  // ⬅️ on affiche l’alerte
                } else {
                    error = "Le code saisi est incorrect."
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isFormValid ? Color.capVerde : Color.gray.opacity(0.4))
            .foregroundStyle(.chefHat)
            .cornerRadius(30)
            .disabled(!isFormValid)
        }
        .padding(.horizontal, 32)
        .alert(
            "Mot de passe mis à jour ✅",
            isPresented: $showSuccess,
            actions: {
                Button("OK") {
                    // ✅ Revient à la page AuthView
                    isLogin = true
                    dismiss()
                }
            },
            message: {
                Text(
                    "Tu peux maintenant te reconnecter avec ton nouveau mot de passe."
                )
            }
        )
    }
}

#Preview {
    ResetPswdDefineView(
        isLogin: .constant(false),
        phone: "06 12 34 56 78",
        expectedCode: "12345678"
    )
}

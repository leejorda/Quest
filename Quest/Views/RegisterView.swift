//
//  RegisterView.swift
//  Quest
//
//  Created by Jordan Lee on 2023-04-15.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var isRegistered: Bool = false
    @State private var alertTitle: LocalizedStringKey = ""
    @State private var alertMessage: LocalizedStringKey = ""
    
    var selectedLanguage: Locale
    
    private let authController = AuthenticationController.shared
    
    @Environment(\.presentationMode) var presentationMode
    
    func setAlertDetails(_ title: LocalizedStringKey, _ msg: LocalizedStringKey) {
        self.alertTitle = title
        self.alertMessage = msg
        self.showAlert.toggle()
    }
    
    var body: some View {
        if (self.isRegistered) {
            HomeView(selectedLanguage: selectedLanguage)
        }
        else {
            ZStack {
                VStack() {
                    Text("Register")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.blue)
                        .padding()
                    VStack() {
                        TextField("Email", text: $email)
                            .cornerRadius(4)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.blue)
                            .padding(.bottom)
                        SecureField("Password", text: $password)
                            .cornerRadius(4)
                            .padding(.top)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.blue)
                            .padding(.bottom)
                        
                        Button(action: {
                            if (email.isEmpty || password.isEmpty) {
                                setAlertDetails(LocalizedStringKey("emptyAlert"), LocalizedStringKey("emptyAlertDetails"))
                                return
                            }
                            else {
                                self.authController.registerUser(email, password) { success in
                                    if (success) {
                                        isRegistered.toggle()
                                        return
                                    }
                                    else {
                                        setAlertDetails(LocalizedStringKey("invalidAlert"), LocalizedStringKey(authController.getErrorMessage()))
                                        return
                                    }
                                }
                            }
                        }) {
                            ConfirmButtonText(text: "Register")
                        }
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            CancelButtonText(text: "Cancel")
                        }
                    }
                    .padding()
                    .cornerRadius(4)
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
            .environment(\.locale, selectedLanguage)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(selectedLanguage: Locale(identifier: "en"))
    }
}

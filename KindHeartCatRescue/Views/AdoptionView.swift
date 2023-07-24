//
//  AdoptionView.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/24/22.
//

import SwiftUI

struct AdoptionView: View {

    @EnvironmentObject private var modelView: ModelView
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var showingAlert = false

    var body: some View {
        let validForm: Bool = !firstName.isEmpty  && !lastName.isEmpty && modelView.isValidEmail(testStr: email) && modelView.isValidPhone(value: phoneNumber)
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("First Name")) {
                        TextField("First Name", text: $firstName)
                            .accentColor(Color("lightred"))
                            .tint(.red)
                            .foregroundColor(.red)
                            .disableAutocorrection(true)
                            .autocapitalization(UITextAutocapitalizationType.none)
                    }
                    Section(header: Text("Last Name")) {
                        TextField("Last Name", text: $lastName)
                            .accentColor(Color("lightred"))
                            .tint(.red)
                            .foregroundColor(.red)
                            .disableAutocorrection(true)
                            .autocapitalization(UITextAutocapitalizationType.none)
                    }
                    Section(header: Text("Email")) {
                        TextField("Email", text: $email)
                            .textContentType(.emailAddress)
                            .accentColor(Color("lightred"))
                            .tint(.red)
                            .foregroundColor(.red)
                            .disableAutocorrection(true)
                            .autocapitalization(UITextAutocapitalizationType.none)
                    }
                    Section(header: Text("Phone Number")) {
                        TextField("000-000-0000", text: $phoneNumber)
                            .textContentType(.telephoneNumber)
                            .accentColor(Color("lightred"))
                            .tint(.red)
                            .foregroundColor(.red)
                            .disableAutocorrection(true)
                            .autocapitalization(UITextAutocapitalizationType.none)
                    }
                    Button(action: {
                        showingAlert = true
                    }) {
                        HStack {
                            Image(!validForm ? "cat.lighterred" : "cat.red")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Submit")
                                .font(.system(size: 18, weight: .medium))
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(!validForm ? Color("lighterred") : .red)
                        .cornerRadius(15)
                    }
                    .disabled(!validForm)
                    .alert("Thank you for your inquiry, we will contact you within 5 business days", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                }
            }
            .navigationTitle("Adoption Form")
            .foregroundColor(Color.red)
            .navigationBarTitleDisplayMode(.large)
            .accentColor(.red)
        }
        .navigationBarBackButtonHidden(true)
        .foregroundColor(.red)
    }
}


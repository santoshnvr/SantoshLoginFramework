//
//  LoginView.swift
//  TextFieldSamples
//
//  Created by Santosh Kumar on 4/17/23.
//

import SwiftUI

public struct LoginView: View {
    @ObservedObject var signupVM = SignupViewModel()

    @State var name: String = ""


   public var body: some View {
        VStack(alignment: .leading) {
            Text("Register").font(.subheadline)
            CustomTextField(sfSymbolName: "envelope", placeHolder: "Email Address", prompt: signupVM.emailPrompt, field: $signupVM.email)
            CustomTextField(sfSymbolName: "lock", placeHolder: "Password", prompt: signupVM.passwordPrompt, field: $signupVM.password, isSecure: true)
            CustomTextField(sfSymbolName: "lock", placeHolder: "Confirm", prompt: signupVM.confirmPwPrompt, field: $signupVM.confirmPW, isSecure: true)
            
            
            
            VStack {
                Button {
                    print("do login action")
                } label: {
                    Text("LET'S GO")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background( signupVM.isSignUpComplete ? .green : .gray)
                .cornerRadius(20)
                .opacity(signupVM.isSignUpComplete ? 1 : 0.6)
                .disabled(!signupVM.isSignUpComplete)
                
                Text("We'll send one-time verification code via SMS to confirm your mobile number. Message and data rates may apply")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.gray)
            }
            
            Button {
                print("OTHER SIGN IN OPTIONS")
            } label: {
                Text("OTHER SIGN IN OPTIONS")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.green)
                    .frame(height: 40)
            }
            
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

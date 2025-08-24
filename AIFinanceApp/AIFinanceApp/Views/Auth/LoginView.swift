import SwiftUI

/// A simple interface for user login and registration.
struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var isCreatingAccount = false

    var body: some View {
        Form {
            Section(header: Text(isCreatingAccount ? "Sign Up" : "Login")) {
                TextField("Username", text: $viewModel.username)
                SecureField("Password", text: $viewModel.password)
                if isCreatingAccount {
                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                }
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
            }
            Section {
                Button(isCreatingAccount ? "Create Account" : "Login") {
                    if isCreatingAccount {
                        viewModel.createUser()
                    } else {
                        viewModel.login()
                    }
                }
                Button(isCreatingAccount ? "Have an account? Log In" : "Need an account? Sign Up") {
                    isCreatingAccount.toggle()
                }
            }
        }
        .navigationTitle(isCreatingAccount ? "Sign Up" : "Login")
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(appViewModel: AppViewModel()))
}

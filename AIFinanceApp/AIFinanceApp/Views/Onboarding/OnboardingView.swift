import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        Form {
            Section(header: Text("Welcome")) {
                TextField("Name", text: $viewModel.name)
                Picker("Currency", selection: $viewModel.currency) {
                    ForEach(UserSettings.availableCurrencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
            }
            Section {
                Button("Continue") {
                    viewModel.finish()
                }
            }
        }
        .navigationTitle("Onboarding")
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(appViewModel: AppViewModel()))
}

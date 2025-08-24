import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        Form {
            Section(header: Text("Welcome")) {
                TextField("Name", text: $viewModel.name)
                TextField("Currency", text: $viewModel.currency)
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

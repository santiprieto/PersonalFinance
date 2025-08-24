import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @FocusState private var isNameFocused: Bool

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome")
                        .font(.largeTitle.weight(.semibold))
                    Text("Let's personalize your experience")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                VStack(spacing: 16) {
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(.roundedBorder)
                        .focused($isNameFocused)
                        .submitLabel(.next)

                    Picker("Currency", selection: $viewModel.currency) {
                        ForEach(UserSettings.availableCurrencies, id: \.self) { currency in
                            Text(currency)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Button {
                    viewModel.finish()
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Onboarding")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(appViewModel: AppViewModel()))
}

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                TextField("Name", text: $viewModel.userSettings.name)
                Picker("Currency", selection: $viewModel.userSettings.currency) {
                    ForEach(UserSettings.availableCurrencies, id: \.self) { currency in
                        Text(currency).tag(currency)
                    }
                }
                .pickerStyle(.menu)
            }
            Section(header: Text("Appearance")) {
                Toggle("Dark Mode", isOn: $viewModel.userSettings.isDarkMode)
            }
            Section {
                Button("Restore Purchases") {}
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}

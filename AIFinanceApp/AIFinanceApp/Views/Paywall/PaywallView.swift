import SwiftUI

struct PaywallView: View {
    @ObservedObject var viewModel: PaywallViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Unlock Premium")
                .font(.title)
            Text("Access all features with a subscription")
                .multilineTextAlignment(.center)
            HStack(spacing: 20) {
                Button("Monthly") {
                    viewModel.subscribeMonthly()
                }
                .buttonStyle(.borderedProminent)

                Button("Annual") {
                    viewModel.subscribeAnnually()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationTitle("Paywall")
    }
}

#Preview {
    PaywallView(viewModel: PaywallViewModel(appViewModel: AppViewModel()))
}

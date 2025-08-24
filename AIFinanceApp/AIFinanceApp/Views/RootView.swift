import SwiftUI

/// Root view deciding whether to show onboarding, paywall or main app.
struct RootView: View {
    @StateObject private var appViewModel = AppViewModel()

    var body: some View {
        NavigationStack {
            if !appViewModel.isAuthenticated {
                LoginView(viewModel: LoginViewModel(appViewModel: appViewModel))
            } else if !appViewModel.isOnboarded {
                OnboardingView(viewModel: OnboardingViewModel(appViewModel: appViewModel))
            } else if !appViewModel.isSubscribed {
                PaywallView(viewModel: PaywallViewModel(appViewModel: appViewModel))
            } else {
                MainTabView()
                    .environmentObject(appViewModel)
            }
        }
    }
}

struct MainTabView: View {
    @EnvironmentObject private var appViewModel: AppViewModel

    var body: some View {
        TabView {
            HomeView(viewModel: HomeViewModel())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            TransactionsView(viewModel: TransactionsViewModel())
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
            BudgetsView(viewModel: BudgetsViewModel())
                .tabItem {
                    Label("Budgets", systemImage: "chart.pie")
                }
            GoalsView(viewModel: GoalsViewModel())
                .tabItem {
                    Label("Goals", systemImage: "target")
                }
            SettingsView(viewModel: SettingsViewModel(userSettings: appViewModel.userSettings))
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

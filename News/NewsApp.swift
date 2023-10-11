//
//  NewsApp.swift
//  News
//
//  Created by Michael Woo on 10/2/23.
//

import SwiftUI

@main
struct NewsApp: App {

    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
                .environmentObject(appCoordinator)
        }
    }
}

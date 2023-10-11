//
//  AppCoordinator.swift
//  News
//
//  Created by Michael Woo on 10/3/23.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init(path: NavigationPath) {
        self.path = path
    }
}

//
//  TestApp.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import SwiftUI

@main
struct TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            CurrencyView()
        }
    }
}

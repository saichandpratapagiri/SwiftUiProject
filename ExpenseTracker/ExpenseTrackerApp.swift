//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Saichand Pratapagiri on 24/07/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @State var txnViewModel = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(txnViewModel)
        }
    }
}

//
//  TxnDetailView.swift
//  ExpenseTracker
//
//  Created by Saichand Pratapagiri on 25/07/22.
//

import SwiftUI

struct TxnsDetailView: View {
    @EnvironmentObject var txnListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(txnListVM.groupTransactionByMonth()), id: \.key) { month, transactions in
                    Section {
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    
                }
            }
        }
        .navigationBarTitle("Transactions")
        
    }
}

struct TxnDetailView_Previews: PreviewProvider {
    static let txnViewModel: TransactionListViewModel = {
        let vm = TransactionListViewModel()
        vm.transactions = transactionListPreviewData
        return vm
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TxnsDetailView()
            }
            
            NavigationView {
                TxnsDetailView()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(txnViewModel)
        
    }
}

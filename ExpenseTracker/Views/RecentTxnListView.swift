//
//  RecentTxnList.swift
//  ExpenseTracker
//
//  Created by Saichand Pratapagiri on 24/07/22.
//

import SwiftUI

struct RecentTxnListView: View {
    
    @EnvironmentObject var txnViewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                Spacer()
                NavigationLink {
                   TxnsDetailView()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }.foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            ForEach(Array(txnViewModel.transactions.prefix(5)
                .enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

struct RecentTxnListView_Previews: PreviewProvider {
    static let txnViewModel: TransactionListViewModel = {
        let vm = TransactionListViewModel()
        vm.transactions = transactionListPreviewData
        return vm
    }()
    
    static var previews: some View {
        RecentTxnListView().environmentObject(txnViewModel)
        RecentTxnListView().environmentObject(txnViewModel)
            .preferredColorScheme(.dark)
    }
}

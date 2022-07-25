//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Saichand Pratapagiri on 24/07/22.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionViewModel: TransactionListViewModel
    
    @State private var wakeUp = "02/14/2022".dateParsed()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Overview")
                            .font(.title2)
                            .bold()
                        Spacer()
                        DatePicker("Please enter a date", selection: $wakeUp,
                                   displayedComponents: .date
                        )
                            .labelsHidden()
                    }
                    
                    let data = transactionViewModel.accumulateTransactions($wakeUp.wrappedValue)
                    if !data.isEmpty, let totalExpenses = data.last?.1 {
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title)
                                
                                LineChart()
                            }
                            .background(Color.systemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 0)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: .systemBackground, foregroundColor: [ColorGradient(Color.icon.opacity(0.4), Color.icon)]))
                        .frame(height: 300)
                        .background(Color.systemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 0)
                    }
                    
                    
                    RecentTxnListView()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            })
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.multicolor)
                        .foregroundStyle(Color.icon, .primary)
                        
                }
            }
            
        }
        .navigationViewStyle(.stack)
        .tint(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let txnViewModel: TransactionListViewModel = {
        let vm = TransactionListViewModel()
        vm.transactions = transactionListPreviewData
        return vm
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(txnViewModel)
    }
}

//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Saichand Pratapagiri on 24/07/22.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .foregroundColor(.icon)
                }
            VStack(alignment: .leading, spacing: 6) {
                Text(transaction.merchant ?? "")
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text(transaction.category ?? "")
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                Text(transaction.dateParsed ?? Date(), format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(transaction.signedAmount ?? 0, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
        TransactionRow(transaction: transactionPreviewData)
            .preferredColorScheme(.dark)
    }
}

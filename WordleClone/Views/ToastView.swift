//
//  ToastView.swift
//  WordleClone
//
//  Created by Ali Görkem Aksöz on 12.01.2025.
//

import SwiftUI

struct ToastView: View {
    let toastText: String
    var body: some View {
        Text(toastText)
            .foregroundStyle(.background)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.primary))
    }
}

#Preview {
    ToastView(toastText: "Not in word list.")
}

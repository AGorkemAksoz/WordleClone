//
//  SettingsView.swift
//  WordleClone
//
//  Created by Ali Görkem Aksöz on 12.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var csManager: ColorSchemeManager
    @EnvironmentObject var dm: WordleDataModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Hard Mode", isOn: $dm.hardMode)
                Text("Change Theme")
                Picker("Display Mode", selection: $csManager.colorScheme) {
                    Text("Dark").tag(ColorScheme.dark)
                    Text("Light").tag(ColorScheme.light)
                    Text("System").tag(ColorScheme.unspecified)
                }
                .pickerStyle(.inline)
                Spacer()
            }
            .padding()
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(ColorSchemeManager())
        .environmentObject(WordleDataModel())
}

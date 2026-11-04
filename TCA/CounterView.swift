//
//  CounterView.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {

    let store: StoreOf<CounterFeature>

    var body: some View {
        VStack(spacing: 20) {

            Text("\(store.count)")
                .font(.largeTitle)

            HStack(spacing: 20) {
                Button("-") {
                    store.send(
                        .decrementButtonTapped
                    )
                }

                Button("+") {
                    store.send(
                        .incrementButtonTapped
                    )
                }
            }
            .buttonStyle(.borderedProminent)

            Button("Reset") {
                store.send(
                    .resetButtonTapped
                )
            }
        }
        .padding()
    }
}

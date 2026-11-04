//
//  CounterFeature.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import ComposableArchitecture

@Reducer
struct CounterFeature {

    // ① 状態
    @ObservableState
    struct State: Equatable {
        var count = 0
    }

    // ② イベント
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
        case resetButtonTapped
    }

    // ③ 状態変更
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {

            case .incrementButtonTapped:
                state.count += 1
                return .none

            case .decrementButtonTapped:
                state.count -= 1
                return .none

            case .resetButtonTapped:
                state.count = 0
                return .none
            }
        }
    }
}

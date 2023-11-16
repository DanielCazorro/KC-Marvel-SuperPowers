//
//  RootViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var status = Status.log
}

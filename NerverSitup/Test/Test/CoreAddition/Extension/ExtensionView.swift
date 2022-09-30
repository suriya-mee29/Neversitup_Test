//
//  ExtensionView.swift
//  Test
//
//  Created by Suriya on 30/9/2565 BE.
//

import Foundation
import SwiftUI
import UIKit
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

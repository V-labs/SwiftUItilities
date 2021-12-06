//
//  File.swift
//  
//
//  Created by Cristian Rojas on 07/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
struct HiddenModifier: ViewModifier {
    let isHidden: Bool
    func body(content: Content) -> some View {
        if isHidden {
            content.hidden()
        } else {
            content
        }
    }
}

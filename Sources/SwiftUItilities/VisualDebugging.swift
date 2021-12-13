//
//  File.swift
//  
//
//  Created by Cristian Rojas on 13/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    func showVisualFeedback(color: Color = .blue, thickness: CGFloat = 1) -> some View {
        self
            .showPerimeter()
            .showAxis(color: color, thickness: thickness)
    }
    
    func showPerimeter(color: Color = .blue, thickness: CGFloat = 1) -> some View {
        self.border(color, width: thickness)
    }
    
    
    @ViewBuilder
    func showAxis(
        _ axis: Axis.Set? = nil,
        color: Color = .blue,
        thickness: CGFloat = 1
    ) -> some View {
        
        switch axis {
        case .some(.horizontal):
            self.showHorizontalAxis(color: color, thickness: thickness)
        case .some(.vertical):
            self.showVerticalAxis(color: color, thickness: thickness)
        case .none:
            self
                .showVerticalAxis(color: color, thickness: thickness)
                .showHorizontalAxis(color: color, thickness: thickness)
        default: EmptyView()
        }
    }
    
    func showHorizontalAxis(color: Color = .blue, thickness: CGFloat = 1) -> some View {
        
        self
            .overlay(
                Rectangle()
                    .foregroundColor(color)
                    .height(thickness)
                    .frame(maxWidth: .infinity)
            )
        
    }
    
    func showVerticalAxis(color: Color = .blue, thickness: CGFloat = 1) -> some View {
        self
            .overlay(
                Rectangle()
                    .foregroundColor(color)
                    .width(thickness)
                    .frame(maxHeight: .infinity)
            )
    }
}

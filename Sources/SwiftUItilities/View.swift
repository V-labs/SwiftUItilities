//
//  File.swift
//  
//
//  Created by cristian on 06/12/2021.
//

import SwiftUI

public extension View {
    
    /// Returns a view with a full screen height and width.
    func fullScreen() -> some View {
        self
            .frame(width: UIScreen.main.bounds.size.width)
            .frame(height: UIScreen.main.bounds.size.height)
    }
    
    /// Returns a view with same width and height for the specified value.
    /// Prevents repetition when we need both values to be the same.
    func size(_ value: CGFloat) -> some View {
        self
            .frame(width: value)
            .frame(height: value)
    }
    
    func height(_ value: CGFloat) -> some View {
        self.frame(height: value)
    }
    
    func width(_ value: CGFloat) -> some View {
        self.frame(width: value)
    }
    
    func align(_ alignment: HorizontalAlignment) -> some View  {
        
        HStack(spacing: 0) {
            switch alignment {
            case .leading:
                self
                Spacer()
            case .center:
                Spacer()
                self
                Spacer()
            case .trailing:
                Spacer()
                self
            default:
                self
            }
        }
    }
    
    func align(_ alignment: VerticalAlignment) -> some View {
        
        VStack(spacing: 0) {
            
            switch alignment {
            case .bottom:
                Spacer()
                self
            case .center:
                Spacer()
                self
                Spacer()
            case .top:
                self
                Spacer()
            default: self
            }
            
        }
    }
    
    /// Hidden navigation link.
    /// Pass the destination view as first parametter
    /// and a binding bool
    func navigationLink<Destination: View>(
        _ destination: Destination,
        _ isActive: Binding<Bool>
    ) -> some View {
        self
            .background(
                EmptyNavigationLink(
                    destination: destination,
                    isActive: isActive
                )
            )
    }
}

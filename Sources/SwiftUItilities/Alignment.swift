//
//  File.swift
//  
//
//  Created by Cristian Rojas on 13/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    func alignX(_ alignment: HorizontalAlignment) -> some View  {
        
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
    
    func alignY(_ alignment: VerticalAlignment) -> some View {
        
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
}

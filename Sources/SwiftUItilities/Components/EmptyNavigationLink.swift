//
//  File.swift
//  
//
//  Created by Cristian Rojas on 06/12/2021.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct EmptyNavigationLink<Destination: View>: View {
    
    let destination: Destination
    @Binding var isActive: Bool
    
    public init(
        destination: Destination,
        isActive: Binding<Bool>
    ) {
        self.destination = destination
        self._isActive = isActive
    }
    
    public var body: some View {
        
        NavigationLink(isActive: $isActive) {
            destination
        } label: { EmptyView() }
    }
}

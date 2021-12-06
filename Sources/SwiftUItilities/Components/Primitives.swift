//
//  File.swift
//
//
//  Created by Cristian Rojas on 06/12/2021.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct DefaultScrollView<Content: View>: View {
    
    let axis: Axis.Set
    let content: Content
    
    public init(
        _ axis: Axis.Set = .vertical,
        @ViewBuilder content: () -> Content
    ) {
        self.axis = axis
        self.content = content()
    }
    
    public var body: some View {
        
        ScrollView(axis, showsIndicators: false) { content }
    }
}

@available(iOS 13.0.0, *)
public struct DefaultVStack<Content: View>: View {
    
    let content: Content
    let alignment: HorizontalAlignment
    
    public init(
        _ alignment: HorizontalAlignment = .leading,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.alignment = alignment
    }
    
    public var body: some View {
        VStack(alignment: alignment, spacing: 0) {
            content
        }
    }
}

@available(iOS 13.0.0, *)
public struct DefaultHStack<Content: View>: View {
    
    let content: Content
    let alignment: VerticalAlignment
    
    public init(
        _ alignment: VerticalAlignment = .center,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.alignment = alignment
    }
    
    public var body: some View {
        HStack(alignment: alignment, spacing: 0) {
            content
        }
    }
}

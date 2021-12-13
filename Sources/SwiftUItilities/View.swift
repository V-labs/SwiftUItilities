//
//  File.swift
//  
//
//  Created by cristian on 06/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    /// Returns a view with a full screen height and width.
    func fullScreen() -> some View {
        self
            .frame(width: UIScreen.main.bounds.size.width)
            .frame(height: UIScreen.main.bounds.size.height)
            .edgesIgnoringSafeArea(.all)
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
    
    /// Navigate to view
    func onTap<Destination: View>(navigateTo destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            self
        }
    }
    
    func onTap<Destination: View>(navigateTo destination: () -> Destination) -> some View {
        NavigationLink(destination: destination()) {
            self
        }
    }
    
    /// Wraps the view around a Button View
    /// making it tappable.
    /// Use insted of native .onTapGesture to keep
    /// visual feedback (opacity transition on tap)
    func onTap(perform: @escaping () -> ()) -> some View {
        Button {
            perform()
        } label: {
            self
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
    
    func isHidden(_ value: Bool) -> some View {
        modifier(HiddenModifier(isHidden: value))
    }
    
    
    /// @todo: Delete overlay methods ecause they conflict with native method
    /// .overlay(alignment:, content:) is weirdly only avaialbe from iOS 15.
    /// This method provides a fallback. Accepts a closure that returns  a View
    func overlay<Content: View>(alignment: Alignment = .center, @ViewBuilder content: () -> Content ) -> some View {
        self.overlay(content(), alignment: alignment)
    }
    
    /// .overlay(alignment:, content:) is weirdly only avaialbe from iOS 15.
    /// This method provides a fallback
    func overlay<Content: View>(alignment: Alignment = .center, content: Content) -> some View {
        self.overlay(content, alignment: alignment)
    }
    
    
    func overlayView<Content: View>(alignment: Alignment = .center, @ViewBuilder content: () -> Content ) -> some View {
        self.overlay(content(), alignment: alignment)
    }
    
    /// .overlay(alignment:, content:) is weirdly only avaialbe from iOS 15.
    /// This method provides a fallback
    func overlayView<Content: View>(alignment: Alignment = .center, content: Content) -> some View {
        self.overlay(content, alignment: alignment)
    }

    
    func backgroundColor(_ color: Color) -> some View {
        self.background(color.fullScreen())
    }
    
    func top(_ value: CGFloat) -> some View {
        self.padding(.top, value)
    }
    
    func bottom(_ value: CGFloat) -> some View {
        self.padding(.bottom, value)
    }
    
    func leading(_ value: CGFloat) -> some View {
        self.padding(.leading, value)
    }
    
    func trailing(_ value: CGFloat) -> some View {
        self.padding(.trailing, value)
    }
    
    func vertical(_ value: CGFloat) -> some View {
        self.padding(.vertical, value)
    }
    
    func horizontal(_ value: CGFloat) -> some View {
        self.padding(.horizontal, value)
    }
    
    @ViewBuilder
    func spaceWrap() -> some View {
        Spacer()
        self
        Spacer()
    }
    
    func scrollify(_ axis: Axis.Set = .vertical) -> some View {
        
        ScrollView(axis, showsIndicators: false) {
            self
        }
    }
    
    
    /// Injects view inside an overlay modifer applied to a Spacer().
    /// Use when you need an Hstack with three elements and need to have
    /// one of them at the center. Apply to the other two
    func injectInSpacer() -> some View {
        Spacer()
            .overlay(self)
    }
    
    
    func showDebugGuidelines(color: Color = .blue, thickness: CGFloat = 1) -> some View {
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
    
    @ViewBuilder
    func displayIf(_ condition: Bool) -> some View {
        
        if condition {
            self
        } else {
            EmptyView()
        }
    }
    
    
}


//
//  FocusedEventMonitoringModifier.swift
//  
//
//  Created by Dima Koskin on 01.07.2023.
//

#if os(macOS)

import SwiftUI


// MARK: - FocusedEventMonitoringModifier

@available(macOS 12.0, *)
fileprivate struct FocusedEventMonitoringModifier: ViewModifier {
    
    // MARK: States
    
    @FocusState private var isFocused: Bool
    @StateObject private var windowObserver = WindowObserver()
    
    // MARK: Initializer

    var type: NSEvent.EventTypeMask
    var action: (NSEvent) -> NSEvent?
    
    // MARK: Body

    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .background { HostingWindowFinder { windowObserver.window = $0 } }
            .onEvent(type, perform: eventAction)
    }
    
    // MARK: Actions

    private func eventAction(_ event: NSEvent) -> NSEvent? {
        guard windowObserver.isKeyWindow, isFocused else { return event }
        return action(event)
    }
}


// MARK: - View + FocusedEventMonitoringModifier

@available(macOS 12.0, *)
public extension View {
    func onFocusedEvent(_ type: NSEvent.EventTypeMask, perform action: @escaping (NSEvent) -> NSEvent?) -> some View {
        modifier(FocusedEventMonitoringModifier(type: type, action: action))
    }
}

#endif

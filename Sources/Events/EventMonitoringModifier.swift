//
//  EventMonitoringModifier.swift
//  
//
//  Created by Dima Koskin on 01.07.2023.
//

#if os(macOS)

import SwiftUI


// MARK: - EventMonitoringModifier

@available(macOS 10.15, *)
fileprivate struct EventMonitoringModifier: ViewModifier {
    
    // MARK: ViewModel

    @StateObject private var observer = EventObserver()
    
    // MARK: Initializer

    var type: NSEvent.EventTypeMask
    var action: (NSEvent) -> NSEvent?
    
    // MARK: Body

    func body(content: Content) -> some View {
        content.onAppear { observer.monitor(type, action: action) }
    }
    
}


// MARK: - EventObserver

fileprivate extension EventMonitoringModifier {
    class EventObserver: ObservableObject {
        private var eventHandler: Any?
        
        func monitor(_ type: NSEvent.EventTypeMask, action: @escaping (NSEvent) -> NSEvent?) {
            self.eventHandler = NSEvent.addLocalMonitorForEvents(matching: type) { event in
                return action(event)
            }
        }
        
        deinit {
            if let eventHandler = self.eventHandler {
                NSEvent.removeMonitor(eventHandler)
                self.eventHandler = nil
            }
        }
    }
}


// MARK: - View + EventMonitoringModifier


@available(macOS 10.15, *)
public extension View {
    func onEvent(_ type: NSEvent.EventTypeMask, perform action: @escaping (NSEvent) -> NSEvent?) -> some View {
        modifier(EventMonitoringModifier(type: type, action: action))
    }
}


#endif

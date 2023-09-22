//
//  Convenience.swift
//  
//
//  Created by Dima Koskin on 01.07.2023.
//

#if os(macOS)

import SwiftUI


@available(macOS 10.15, *)
public extension View {
    func onKeyDown(_ keyCode: EventKeyCode, perform action: @escaping (NSEvent) -> NSEvent?) -> some View {
        self.onEvent(.keyDown) { event in
            if EventKeyCode(rawValue: event.keyCode) == keyCode {
                return action(event)
            }
            
            return event
        }
    }
}


@available(macOS 12.0, *)
public extension View {
    func onFocusedKeyDown(_ keyCode: EventKeyCode, perform action: @escaping (NSEvent) -> NSEvent?) -> some View {
        self.onFocusedEvent(.keyDown) { event in
            if EventKeyCode(rawValue: event.keyCode) == keyCode {
                return action(event)
            }
            
            return event
        }
    }
}

#endif

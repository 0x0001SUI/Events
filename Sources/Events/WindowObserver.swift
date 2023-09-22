//
//  WindowObserver.swift
//  
//
//  Created by Dima Koskin on 22.09.2023.
//

import SwiftUI
import Combine


class WindowObserver: ObservableObject {
    @Published private(set) var isKeyWindow: Bool = false

    weak var window: NSWindow? {
        didSet {
            self.isKeyWindow = window?.isKeyWindow ?? false
            
            self.cancel()
            
            if let window {
                NotificationCenter.default
                    .publisher(for: NSWindow.didBecomeKeyNotification, object: window)
                    .receive(on: RunLoop.main)
                    .sink { [weak self] (_) in self?.isKeyWindow = true }
                    .store(in: &cancellable)
                
                NotificationCenter.default
                    .publisher(for: NSWindow.didResignKeyNotification, object: window)
                    .receive(on: RunLoop.main)
                    .sink { [weak self] (_) in self?.isKeyWindow = false }
                    .store(in: &cancellable)
            }
        }
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    private func cancel() {
        cancellable.forEach { $0.cancel() }
    }
}

//
//  HostingWindowFinder.swift
//  
//
//  Created by Dima Koskin on 22.09.2023.
//

import SwiftUI

struct HostingWindowFinder: NSViewRepresentable {
    var callback: (NSWindow?) -> Void

    func makeNSView(context: Self.Context) -> NSView {
        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.main.async { [weak view] in
            self.callback(view?.window)
        }
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        return
    }
}

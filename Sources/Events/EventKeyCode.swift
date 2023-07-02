//
//  EventKeyCode.swift
//  
//
//  Created by Dima Koskin on 01.07.2023.
//

#if os(macOS)

import Foundation


// https://gist.github.com/swillits/df648e87016772c7f7e5dbed2b345066


public enum EventKeyCode: UInt16, CaseIterable {
    case `return` = 0x24
    case enter = 0x4C
    case tab = 0x30
    case space = 0x31
    case delete = 0x33
    case escape = 0x35
    case command = 0x37
    case shift = 0x38
    case capsLock = 0x39
    case option = 0x3A
    case control = 0x3B
    case shiftRight = 0x3C
    case optionRight = 0x3D
    case controlRight = 0x3E
    case arrowLeft = 0x7B
    case arrowRight = 0x7C
    case arrowDown = 0x7D
    case arrowUp = 0x7E
    case volumeUp = 0x48
    case volumeDown = 0x49
    case mute = 0x4A
    case help = 0x72
    case home = 0x73
    case pageUp = 0x74
    case forwardDelete = 0x75
    case end = 0x77
    case pageDown = 0x79
    case function = 0x3F
    case f1 = 0x7A
    case f2 = 0x78
    case f4 = 0x76
    case f5 = 0x60
    case f6 = 0x61
    case f7 = 0x62
    case f3 = 0x63
    case f8 = 0x64
    case f9 = 0x65
    case f10 = 0x6D
    case f11 = 0x67
    case f12 = 0x6F
    case f13 = 0x69
    case f14 = 0x6B
    case f15 = 0x71
    case f16 = 0x6A
    case f17 = 0x40
    case f18 = 0x4F
    case f19 = 0x50
    case f20 = 0x5A
}

#endif

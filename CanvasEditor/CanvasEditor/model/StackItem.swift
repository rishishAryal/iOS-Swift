//
//  StackItem.swift
//  CanvasEditor
//
//  Created by Rishish Aryal on 22/02/2024.
//

import Foundation
// Holds each Stack Item View
import SwiftUI
struct StackItem:Identifiable {
    var id = UUID().uuidString
    // Any view for more customization
    var view: AnyView
    //  Gesture Properties
        // for dragging
    
    var offset:CGSize = .zero
    var lastOffset:CGSize = .zero
        // for Scaling
    var scale:CGFloat = 1
    var lastScale:CGFloat = 1
    //for rotation
    var rotation:Angle = .zero
    var lastRotation:Angle = .zero
}

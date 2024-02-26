//
//  CanvasViewModel.swift
//  CanvasEditor
//
//  Created by Rishish Aryal on 22/02/2024.
//

import Foundation
import UIKit
import SwiftUI

//holds all canvas data
class CanvasViewModel : ObservableObject {
    
    
    //canvas stack
    @Published var stack: [StackItem] = []
    
        //Imagec Picker properties
    
    @Published var showImagePicker:Bool = false
    @Published var imageData: Data = .init(count: 0)
    
    //error
    @Published var showError:  Bool = false
    @Published var errorMessage:String = ""
    
    ////////// Mark : Adding Image to Stack
    
    func addImageToStack(image: UIImage) {
        let imageView = Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150 , height: 150)
        
        let anyView = AnyView(imageView) // Convert Image to AnyView
                stack.append(StackItem(view: anyView))
    }
}

//
//  ImagePicker.swift
//  CanvasEditor
//
//  Created by Rishish Aryal on 22/02/2024.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
 
   
    
    @Binding var showPicker:Bool
    @Binding var imageData: Data
    var quality: CGFloat = 0.45
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    
    
    func makeUIViewController(context: Context) ->  PHPickerViewController {
        
        var config =  PHPickerConfiguration()
        config.selectionLimit = 1
        
        let controller = PHPickerViewController(configuration: config)
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // delegate method
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker
        
         init(parent: ImagePicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let image = results.first?.itemProvider {
                image.loadObject(ofClass: UIImage.self) {
                    image, err in
                    if let data  = (image as? UIImage)?.jpegData(compressionQuality: self.parent.quality) {
                        DispatchQueue.main.async {
                            self.parent.imageData = data
                            self.parent.showPicker.toggle()
                        }
                    }
                        
                    
                }
            } else {
                self.parent.showPicker.toggle()
            }
        }
        
        
    }
    
    
    
    
//    func makeUIView(context: Context) -> PHPickerViewController  {
//        
//        
//    }
//    
//    func updatedUIView (_ uiView: UIViewType, context : Context) {
//
//    }
}


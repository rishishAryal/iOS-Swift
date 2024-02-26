//
//  Home.swift
//  CanvasEditor
//
//  Created by Rishish Aryal on 22/02/2024.
//

import SwiftUI

struct Home: View {
    @StateObject var canvasModel: CanvasViewModel = .init()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                //mark canvas view
            Canvas().environmentObject(canvasModel)
                //MARK : Canvaction Action
            
            HStack {
                Button(action: {}
                       , label: {
                 Image(systemName: "xmark")
                        .font(.title3)
                   
                })
                
                Spacer()
                
                Button(action: {
                    canvasModel.showImagePicker.toggle()
                }
                       , label: {
                 Image(systemName: "photo.on.rectangle")
                        .font(.title3)
                   
                })
            }
                .foregroundStyle(.white)
                .padding()
                .frame(maxHeight:   .infinity, alignment: .top)
            
            //save button
            
            Button(action: {}, label: {
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }).frame(maxWidth: .infinity ,maxHeight:   .infinity, alignment: .bottomTrailing)
            
        }.preferredColorScheme(.dark)
            .alert(canvasModel.errorMessage, isPresented: $canvasModel.showError) {
                
            }
        
//            .sheet(isPresented: $canvasModel.showImagePicker , onDismiss:
//                    
////                    if let image = UIImage(data: canvasModel.imageData) {
////                canvasModel.addImageToStack(image: image)
////            }
//                   
//                   if let image = UIImage(data: canvasModel.imageData) {
//                       canvasModel.addImageToStack(image: image)                    }
//                    , content: {
//                ImagePicker(showPicker: $canvasModel.showImagePicker, imageData: $canvasModel.imageData)
//            })
        
        
        
            .sheet(isPresented: $canvasModel.showImagePicker) {
                if let image = UIImage(data: canvasModel.imageData) {
                    canvasModel.addImageToStack(image: image)
                }
            } content: {
                ImagePicker(showPicker: $canvasModel.showImagePicker, imageData: $canvasModel.imageData)
            }
            
    }
}

#Preview {
    Home()
}

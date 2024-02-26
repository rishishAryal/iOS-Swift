//
//  Canvas.swift
//  CanvasEditor
//
//  Created by Rishish Aryal on 22/02/2024.
//

import SwiftUI

struct Canvas: View {
    var height : CGFloat = 250
    @EnvironmentObject var canvasModel: CanvasViewModel
    var body: some View {
        GeometryReader {proxy in
            
        let size = proxy.size
            
            ZStack {
                Color.white
                
                ForEach($canvasModel.stack) { $stack in
                    
                    CanvasSubView(stackItem: $stack) {
                        stack.view
                    }
                    
                }
                
            }.frame(width: size.width, height: size.height)
            
        }
        .frame(height: height)
    }
}


 // canvas subview


struct CanvasSubView <Content : View> : View {
    var content : Content
    @Binding var stackItem: StackItem
    init(stackItem: Binding<StackItem> , @ViewBuilder content: @escaping ()-> Content) {
        self.content = content()
        self._stackItem = stackItem
        
    }
    
    var body: some View {
     content
                
            //safe scale
            .rotationEffect(stackItem.rotation)
            .scaleEffect(stackItem.scale < 0.4 ? 0.4 : stackItem.scale)
            .offset(stackItem.offset)
            .gesture(
            
            DragGesture()
                .onChanged({ val in
                    stackItem.offset = CGSize(width: stackItem.lastOffset.width + val.translation.width , height: stackItem.lastOffset.height + val.translation.height)
                }).onEnded({ val in
                    stackItem.lastOffset = stackItem.offset
                })
                
            
            )
            .gesture(
                MagnificationGesture()
                    .onChanged({ val in
                        stackItem.scale = stackItem.lastScale + (val - 1)
                    })
                    .onEnded({ val in
                        stackItem.lastScale = stackItem.scale
                    })
                
                
                    .simultaneously(with:
                    RotateGesture()
                    
                        .onChanged({ value in
                            stackItem.rotation =  stackItem.lastRotation + value.rotation
                        })
                            .onEnded({ value in
                                stackItem.lastRotation = stackItem.rotation
                            })
                    )
                   
            )
    }
}

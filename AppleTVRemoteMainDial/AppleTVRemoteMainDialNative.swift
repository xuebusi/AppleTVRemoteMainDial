//
//  AppleTVRemoteMainDialNative.swift
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
//  AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  Created by Adam Fordyce on 26/06/2021.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//
import SwiftUI

private let backgroundGradient = LinearGradient(
    gradient: Gradient(colors: [Color(white: 0.85), Color(white: 0.65)]),
    startPoint: .topLeading, endPoint: .bottomTrailing)

private let outerDialGradient = LinearGradient(
    gradient: Gradient(colors: [Color(white: 0.18), nearBlack]),
    startPoint: .topLeading, endPoint: .bottomTrailing)

private let innerDialGradient = RadialGradient(
    gradient: Gradient(colors: [Color(white: 0.14), nearBlack]),
    center: UnitPoint(x: 0.8, y: 0.8), startRadius: 40, endRadius: 240)

private let innerDialHighlightGradient = LinearGradient(
    gradient: Gradient(colors: [Color(white: 0.7), .black, Color(white: 0.9)]),
    startPoint: .topLeading, endPoint: .bottomTrailing)

private let nearBlack = Color(white: 0.02)
private let buttonForegroundColor = Color(white: 0.65)

struct AppleTVRemoteMainDialNative: View {
    
    var body: some View {
        
        let outerDialCircle = Circle().fill(outerDialGradient)

        ZStack {
            RoundedRectangle(cornerRadius: 70)
                .fill(backgroundGradient)
                .shadow(color: Color.black, radius: 20, x: 10, y: 10)
            Group {
                ZStack {
                    outerDialCircle
                        .shadow(radius: 4, x: 2, y: 2)
                    Group {
                        outerDialCircle
                        outerDialCircle
                            .rotationEffect(.degrees(180))
                            .frame(width: 290, height: 290)
                    }
                    .blur(radius: 16)
                    Group {
                        innerDialGradient
                            .clipShape(Circle())
                        Circle()
                            .stroke(innerDialHighlightGradient, lineWidth: 1)
                            .offset(x: 1.5, y: 1.5)
                            .blur(radius: 1)
                        Circle()
                            .stroke(nearBlack, lineWidth: 4)
                    }
                    .frame(width: 210, height: 210)
                    ForEach(0..<4) { index in
                        Circle()
                            .fill(buttonForegroundColor)
                            .frame(width: 7, height: 7)
                            .offset(x: 160)
                            .rotationEffect(.degrees(90 * Double(index)))
                    }
                }
                .clipShape(Circle())
                .frame(width: 360, height: 360)
            }
            .foregroundColor(buttonForegroundColor)
        }
    }
}

struct AppleTVRemoteMainDialNative_Previews: PreviewProvider {
    struct AppleTVRemoteMainDialNative_Harness: View {
        
        var body: some View {
            AppleTVRemoteMainDialNative()
                .frame(width: 400, height: 400)
                .padding(50)
                .background(Color(white: 0.1))
        }
    }
    
    static var previews: some View {
        AppleTVRemoteMainDialNative_Harness()
            .previewLayout(.sizeThatFits)
    }
}

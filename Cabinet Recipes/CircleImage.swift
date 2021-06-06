//
//  CircleImage.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/4/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        
        ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 600, height: 600)
                Circle()
                    .strokeBorder(Color.blue,lineWidth: 15)
                    .background(Circle().foregroundColor(Color.yellow))
                    .frame(width: 450, height: 450)
                Circle()
                    .strokeBorder(Color.red,lineWidth: 15)
                    .background(Circle().foregroundColor(Color.yellow))
                    .frame(width: 300, height: 300)
        }.ignoresSafeArea()
        .padding(.bottom, 700)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}

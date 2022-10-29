//
//  FloatingButton.swift
//  mobflix
//
//  Created by Rian de Oliveira on 29/10/22.
//

import SwiftUI

struct FloatingButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    print("Botão adicionar")
                }, label: {
                    Text("+")
                        .font(.system(.largeTitle))
                        .padding(.bottom, 5)
                        .frame(width: 52, height: 52)
                        .foregroundColor(.white)
                })
                .background(Color("secondary"))
                .cornerRadius(26)
                .padding()
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}

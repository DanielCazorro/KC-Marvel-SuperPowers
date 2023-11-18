//
//  MainRowView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 17/11/23.
//

import SwiftUI

struct MainRowView: View {
    var character: Character
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                // NAme
                HStack{
                    Text(character.name)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .bold()
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                Spacer()
                
            }
        }
    }
}




#Preview {
    MainRowView(character: Character(id: 25, name: "Goku", description: "Yes", thumbnail: Thumbnail(path: "https://play-lh.googleusercontent.com/proxy/M--NmuntpIS0tBP4ImXSXDDPKglGdc1FSFfK8WR_5DHnfhaTVMed5bmvmhXx4-ZtP0RVxbIW7s90Z6Wg1wiT3l_Ajno-UYX-cSqOFKcgCzI2aDNGRnzhGrc=s1920-w1920-h1080", thumbnailExtension: .jpg), resourceURI: "", modified: ""))
}




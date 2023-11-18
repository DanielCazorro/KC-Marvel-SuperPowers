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
            
            AsyncImage(url: URL(string: character.thumbnail.path)) { photo in
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



/*
 #Preview {
 MainRowView(character: Character(id: 1, name: "Goku", description: "", thumbnail: Thumbnail(from: ), resourceURI: "", modified: ""))
 }
 */
/*
struct MainRowView: View {
    var character: Character
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: character.thumbnail.path)) { photo in
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
*/

//
//  SeriesRowView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 27/2/24.
//

import SwiftUI

struct SeriesRowView: View {
    var serie: Series
    @State private var isExpanded = false // Estado para controlar si la descripción está expandida o no
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: "\(serie.thumbnail.path)/landscape_small.\(serie.thumbnail.thumbnailExtension)")) { image in
                    image
                        .resizable()
                        .cornerRadius(8)
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.7)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .cornerRadius(8)
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.7)
                }
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(serie.title)")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 4)
//                        .background(Color.black.opacity(0.7))
                        .cornerRadius(8)
                    
                    GeometryReader { geometry in
                        ScrollView {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(serie.description ?? "")")
                                    .foregroundStyle(.secondary)
                                    .font(.body)
                                    .lineLimit(isExpanded ? nil : 2) // Limitar a 3 líneas si no está expandido
                                
                                Spacer()
                                
                                if !isExpanded {
                                    Button(action: {
                                        isExpanded.toggle() // Cambiar el estado para expandir o contraer la descripción
                                    }) {
                                        Text("Ver más")
                                            .font(.caption)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                            .padding(.horizontal, 8)
                            .frame(height: isExpanded ? nil : geometry.size.height / 2) // Limitar la altura
                        }
                    }
                }
                .padding(.bottom, 10)
            }
        }
    }
}


#Preview {
    SeriesRowView(serie: Series(id: 1, title: "Daniel", description: "The best", resourceURI: "", startYear: 5, endYear: 10, rating: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg)))
}

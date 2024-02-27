//
//  MainViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import UIKit
import Combine
import SwiftUI

class MainViewModel: ObservableObject {
    
    // Lista de personajes que se mostrarán en la aplicación
    @Published var characters: [Character] = []
    
    // Conjunto de suscriptores para cancelar las solicitudes de red cuando sea necesario
    private var suscriptor = Set<AnyCancellable>()
    
    // Inicializador del ViewModel
    init(testing: Bool = false) {
        if(testing) {
            getCharacterTest() // Obtiene datos de prueba si la bandera de prueba está activada
        } else {
            getCharacters() // Obtiene datos reales si no está en modo de prueba
        }
    }
    
    /// Función para obtener la lista de personajes desde la API de Marvel
    func getCharacters() {
        // Realiza una solicitud de red para obtener la lista de personajes
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHero()) // Utiliza el método getSessionHero() de BaseNetwork para obtener la solicitud URLRequest
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: CharacterDataWrapper.self, decoder: JSONDecoder()) // Decodifica los datos recibidos en objetos de tipo CharacterDataWrapper
            .receive(on: DispatchQueue.main) // Recibe los resultados en el hilo principal para actualizar la interfaz de usuario
            .sink(receiveCompletion: { _ in }) { data in
                self.characters = data.data.results // Actualiza la lista de personajes con los datos recibidos del servidor
            }
            .store(in: &suscriptor) // Almacena el suscriptor para poder cancelarlo más tarde si es necesario
    }
    
    /// Función para obtener datos de prueba de personajes
    func getCharacterTest() {
        let ironManDescription = "Iron Man, también conocido como Tony Stark, es uno de los personajes más icónicos de Marvel Comics. Este superhéroe ficticio apareció por primera vez en los cómics de Marvel en marzo de 1963, creado por el escritor Stan Lee, el guionista Larry Lieber, el dibujante Don Heck y el diseñador Jack Kirby. Tony Stark es un genio inventor, ingeniero y empresario multimillonario. Es reconocido por su intelecto prodigioso y su habilidad para desarrollar tecnología avanzada, especialmente su armadura de combate de alta tecnología, que él mismo diseña y construye. La armadura de Iron Man le otorga fuerza sobrehumana, vuelo, armas avanzadas y diversas capacidades defensivas. La historia de Iron Man es fascinante. Tony Stark inicialmente se ve obligado a crear la armadura para escapar de un secuestro. Posteriormente, decide utilizar su tecnología para luchar contra el crimen y proteger al mundo como Iron Man. A lo largo de su carrera como superhéroe, Stark enfrenta una serie de desafíos personales y profesionales, incluyendo la gestión de su empresa, Stark Industries, y su lucha con sus propios demonios internos. Además de ser un miembro destacado de los Vengadores, Iron Man ha sido parte integral de numerosas historias, eventos y crossover en el universo Marvel. Su evolución como héroe ha sido notable, mostrando no solo valentía en la lucha contra villanos, sino también un profundo sentido de responsabilidad y sacrificio por el bien mayor. La caracterización de Iron Man ha sido llevada al cine, interpretado magistralmente por el actor Robert Downey Jr. en el Universo Cinematográfico de Marvel, lo que ha contribuido significativamente a la popularidad del personaje en la cultura popular actual."
        
        let spiderManDescription = "Spider-Man, también conocido como Peter Parker, es uno de los superhéroes más queridos y reconocibles de Marvel Comics. Creado por el escritor Stan Lee y el dibujante Steve Ditko, Spider-Man hizo su primera aparición en Amazing Fantasy #15 en 1962. Peter Parker es un estudiante de secundaria tímido y talentoso que adquiere habilidades sobrehumanas después de ser picado por una araña radiactiva en un experimento científico. Convertido en Spider-Man, Peter lucha contra el crimen en la ciudad de Nueva York mientras trata de equilibrar su vida personal y su identidad secreta. Spider-Man es conocido por su agilidad, su fuerza sobrehumana, su capacidad para trepar paredes y su sentido arácnido, que le permite detectar el peligro inminente. A lo largo de los años, Spider-Man ha enfrentado a una amplia gama de villanos, incluyendo al icónico Duende Verde, Doctor Octopus, Venom y muchos más. A pesar de sus luchas personales y las tragedias que ha enfrentado, Spider-Man sigue siendo un símbolo de esperanza y perseverancia, representando los valores de responsabilidad y altruismo. El personaje ha sido adaptado a numerosas películas, series de televisión y otros medios, ganando la admiración de millones de fans en todo el mundo."
        
        let hulkDescription = "Hulk, también conocido como Bruce Banner, es uno de los superhéroes más poderosos y reconocibles de Marvel Comics. Creado por Stan Lee y Jack Kirby, Hulk hizo su primera aparición en The Incredible Hulk #1 en 1962. Bruce Banner es un brillante científico que, después de ser expuesto a la radiación gamma en un experimento, se transforma en Hulk cuando experimenta emociones intensas como el enojo o la ira. Como Hulk, Banner posee una fuerza sobrehumana inmensa y es virtualmente invulnerable. A pesar de su apariencia monstruosa y su naturaleza impredecible, Hulk es un héroe valiente que lucha por proteger a los inocentes y derrotar a los villanos. A lo largo de los años, Hulk ha tenido numerosas batallas épicas contra enemigos formidables como Abominación, The Leader y Red Hulk. A pesar de sus luchas internas y sus conflictos con otros héroes, Hulk sigue siendo un miembro valioso de los Vengadores y un símbolo de fuerza y determinación inquebrantables."
        
        let captainAmericaDescription = "Capitán América, también conocido como Steve Rogers, es uno de los superhéroes más icónicos y respetados de Marvel Comics. Creado por Joe Simon y Jack Kirby, Capitán América hizo su primera aparición en Captain America Comics #1 en 1941. Steve Rogers es un joven valiente y patriótico que se ofrece como voluntario para un programa experimental durante la Segunda Guerra Mundial para convertirse en un super soldado conocido como Capitán América. Equipado con un escudo indestructible y habilidades físicas mejoradas, Capitán América lucha contra las fuerzas del mal tanto durante la guerra como en los tiempos modernos. A lo largo de los años, Capitán América ha sido un símbolo de valentía, honor y justicia, defendiendo los ideales de libertad y democracia. Ha sido un miembro destacado de los Vengadores y ha liderado el equipo en numerosas batallas contra enemigos formidables como Red Skull, Hydra y Thanos. Capitán América es conocido por su ética de trabajo duro y su dedicación a proteger a los inocentes, lo que lo convierte en uno de los héroes más admirados y respetados del Universo Marvel."
        
        // Crea personajes con las descripciones mejoradas y títulos
        let character1 = Character(id: 1, title: "Genio Inventor y Líder de los Vengadores", name: "Iron Man", description: ironManDescription, thumbnail: Thumbnail(path: "https://i.blogs.es/0f256b/iron-man/450_1000", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/1", modified: "2023-11-17T12:00:00Z")
        let character2 = Character(id: 2, title: "El Hombre Araña", name: "Spider-Man", description: spiderManDescription, thumbnail: Thumbnail(path: "https://img2.rtve.es/i/?w=1600&i=1442912664626", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/2", modified: "2023-11-17T12:00:00Z")
        let character3 = Character(id: 3, title: "La Máquina de Destrucción", name: "Hulk", description: hulkDescription, thumbnail: Thumbnail(path: "https://cdn.vegaoo.es/images/rep_art/gra/321/0/321071/figura-de-plastico-hulk-avengers-9-cm", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/3", modified: "2023-11-17T12:00:00Z")
        let character4 = Character(id: 10, title: "El Primer Vengador", name: "Capitán América", description: captainAmericaDescription, thumbnail: Thumbnail(path: "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2014/07/351628-marvel-anuncia-nuevo-capitan-america", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/10", modified: "2023-11-17T12:00:00Z")
        
        // Agrega los personajes a la lista de personajes
        self.characters = [character1, character2, character3, character4]
    }
    
}

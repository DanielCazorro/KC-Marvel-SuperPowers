//
//  KC_Marvel_SuperPowersTests.swift
//  KC-Marvel-SuperPowersTests
//
//  Created by Daniel Cazorro Frías on 10/11/23.
//

import XCTest
import SwiftUI
@testable import KC_Marvel_SuperPowers

// MARK: Main View Test

final class MainViewTests: XCTestCase {
    
    func testViewLoads() {
        let mainViewModel = MainViewModel()
        let mainView = MainView(mainViewModel: mainViewModel)
        XCTAssertNotNil(mainView)
    }
}


// MARK: Main View Model Tests
final class MainViewModelTests: XCTestCase {
    var viewModel: MainViewModel!
    
    override func setUp() {
        viewModel = MainViewModel(testing: true)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testGetCharacters() {
        
        // Llamamos a getCharacters
        viewModel.getCharacters()
        
        // Después de la llamada, characters no debe ser nil
        XCTAssertNotNil(viewModel.characters)
        
    }
}


// MARK: Test Base Network

final class BaseNetworkTests: XCTestCase {
    var baseNetwork: BaseNetwork!
    
    override func setUp() {
        super.setUp()
        baseNetwork = BaseNetwork()
    }
    
    override func tearDown() {
        baseNetwork = nil
        super.tearDown()
    }
    
    func testGetSessionHero() {
        let request = baseNetwork.getSessionHero()
        
        // Verificar que la solicitud no sea nula
        XCTAssertNotNil(request)
        
        // Verificar que el método HTTP sea GET
        XCTAssertEqual(request.httpMethod, "GET")
        
        // Verificar que la URL sea válida
        guard let url = request.url else {
            XCTFail("URL should not be nil")
            return
        }
        
        // Verificar la estructura básica de la URL
        XCTAssertEqual(url.scheme, "https")
        XCTAssertEqual(url.host, "gateway.marvel.com")
        XCTAssertEqual(url.path, "/v1/public/characters")
        
        // Verificar que los parámetros estén presentes en la URL
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertNotNil(components?.queryItems)
        
    }
}

// MARK: Test Main Row View

class MainRowViewTests: XCTestCase {
    func testMainRowView() {
        let character = Character(id: 25, title: "The boss", name: "Goku", description: "Yes", thumbnail: Thumbnail(path: "https://play-lh.googleusercontent.com/proxy/M--NmuntpIS0tBP4ImXSXDDPKglGdc1FSFfK8WR_5DHnfhaTVMed5bmvmhXx4-ZtP0RVxbIW7s90Z6Wg1wiT3l_Ajno-UYX-cSqOFKcgCzI2aDNGRnzhGrc=s1920-w1920-h1080", thumbnailExtension: Thumbnail.Extension(rawValue: "jpg") ?? .jpg), resourceURI: "", modified: "")
        
        let mainRowView = MainRowView(character: character)
        
        // Obtener la vista envuelta por UIHostingController
        let viewController = UIHostingController(rootView: mainRowView)
        
        // Verificar que la vista no sea nula
        XCTAssertNotNil(viewController.view)
        
    }
}

// MARK: MarvelCharacters Test

final class MarvelCharactersTests: XCTestCase {
    func testCharacterDecoding() {
        let json = """
        {
            "id": 123,
            "name": "Spider-Man",
            "description": "Your friendly neighborhood Spider-Man!",
            "thumbnail": {
                "path": "https://example.com/spiderman",
                "extension": "jpg"
            },
            "resourceURI": "https://example.com/spiderman/info",
            "modified": "2023-11-17T12:00:00Z"
        }
        """
        
        let jsonData = json.data(using: .utf8)!
        
        do {
            let character = try JSONDecoder().decode(Character.self, from: jsonData)
            
            XCTAssertEqual(character.id, 123)
            XCTAssertEqual(character.name, "Spider-Man")
            XCTAssertEqual(character.description, "Your friendly neighborhood Spider-Man!")
            XCTAssertEqual(character.thumbnail.path, "https://example.com/spiderman")
            XCTAssertEqual(character.thumbnail.thumbnailExtension, .jpg)
            XCTAssertEqual(character.resourceURI, "https://example.com/spiderman/info")
            XCTAssertEqual(character.modified, "2023-11-17T12:00:00Z")
        } catch {
            XCTFail("Failed to decode Character: \(error.localizedDescription)")
        }
    }
    
    
    // MARK: Test
    
    final class KC_Marvel_SuperPowersTests: XCTestCase {
        
        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
        }
        
        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }
        
        func testExample() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            // Any test you write for XCTest can be annotated as throws and async.
            // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
            // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        }
        
        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }
        
    }
    
}

// MARK: - SeriesViewModel Test

class SeriesViewModelTests: XCTestCase {

    var viewModel: SeriesViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SeriesViewModel(testing: true, idHero: 1)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testGetSeriesTest() {
        // Given
        let expectedSeriesCount = 3

        // When
        viewModel.getSeriesTest()

        // Then
        XCTAssertEqual(viewModel.series?.count, expectedSeriesCount)
    }

    func testGetSeries() {
        // Given
        let expectation = XCTestExpectation(description: "Series loaded successfully")

        // When
        viewModel.getSeries(idHero: 1)

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.series)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }
}

// MARK: - SeriesView Test

class SeriesViewTests: XCTestCase {

    func testSeriesView_WithSeriesLoaded() {
        // Given
        let seriesViewModel = SeriesViewModel(testing: true, idHero: 1)
        let seriesView = SeriesView(seriesViewModel: seriesViewModel)

        // When
        let viewController = UIHostingController(rootView: seriesView)

        // Then
        XCTAssertNotNil(viewController.view)

    }

    func testSeriesView_WithNoSeriesLoaded() {
        // Given
        let seriesViewModel = SeriesViewModel(testing: true, idHero: 1)
        let seriesView = SeriesView(seriesViewModel: seriesViewModel)

        // When
        let viewController = UIHostingController(rootView: seriesView)

        // Then
        XCTAssertNotNil(viewController.view)

    }
}

// MARK: - SeriesRowView Test


class SeriesRowViewTests: XCTestCase {

    func testSeriesRowView_WithExpandedDescription() {
        // Given
        let serie = Series(id: 1, title: "Daniel", description: "The best description ever!", resourceURI: "", startYear: 5, endYear: 10, rating: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg))
        let seriesRowView = SeriesRowView(serie: serie)

        // When
        let viewController = UIHostingController(rootView: seriesRowView)

        // Then
        XCTAssertNotNil(viewController.view)

    }

    func testSeriesRowView_WithCollapsedDescription() {
        // Given
        let serie = Series(id: 1, title: "Daniel", description: "The best description ever!", resourceURI: "", startYear: 5, endYear: 10, rating: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg))
        let seriesRowView = SeriesRowView(serie: serie)

        // When
        let viewController = UIHostingController(rootView: seriesRowView)

        // Then
        XCTAssertNotNil(viewController.view)

    }
}

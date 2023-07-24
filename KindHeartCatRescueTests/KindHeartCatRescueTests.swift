//
//  KindHeartCatRescueTests.swift
//  KindHeartCatRescueTests
//
//  Created by m_959058 on 8/26/22.
//

import XCTest
@testable import KindHeartCatRescue

class KindHeartCatRescueTests: XCTestCase {

    var apiData: APIData = APIData()
    var modelView: ModelView = ModelView()
    var dataReceived: Bool = false
    //apiData?.fetchCats()


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
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testFetch() {
        //apiData?.fetchCats()
        XCTAssertNotNil(apiData.fetchCats())
    }

    func testBreedAbr() {
        //print(modelView?.getBreedName(breedAbrevation: "bomb")!)
        XCTAssertTrue(modelView.getBreedName(breedAbrevation: "bomb") == "Bombay", "This is correct")
    }

    func testEmail() {
        XCTAssertTrue(modelView.isValidEmail(testStr: "janedoe@gmail.com") == true, "This is correct")
    }

    func testPhone() {
        XCTAssertTrue(modelView.isValidPhone(value: "000-000-0000") == true, "This is correct")
    }

    func testList() {
        XCTAssertNotNil(modelView.toggleLocationsList)
    }


}

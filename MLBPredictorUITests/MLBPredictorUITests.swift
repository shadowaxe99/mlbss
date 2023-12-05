import XCTest
@testable import MLBPredictor

class MLBPredictorUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testPlayerView() {
        let playerView = app.otherElements["PlayerView"]
        XCTAssertTrue(playerView.exists)
    }

    func testPitcherView() {
        let pitcherView = app.otherElements["PitcherView"]
        XCTAssertTrue(pitcherView.exists)
    }

    func testHitterView() {
        let hitterView = app.otherElements["HitterView"]
        XCTAssertTrue(hitterView.exists)
    }

    func testVideoUploadView() {
        let videoUploadView = app.otherElements["VideoUploadView"]
        XCTAssertTrue(videoUploadView.exists)
    }

    func testBiomechanicsView() {
        let biomechanicsView = app.otherElements["BiomechanicsView"]
        XCTAssertTrue(biomechanicsView.exists)
    }

    func testVideoAnalysis() {
        app.buttons["Upload Video"].tap()
        let videoAnalysis = app.otherElements["VideoAnalysis"]
        XCTAssertTrue(videoAnalysis.exists)
    }

    func testAIModelPrediction() {
        app.buttons["Predict"].tap()
        let prediction = app.otherElements["AIModel"]
        XCTAssertTrue(prediction.exists)
    }
}
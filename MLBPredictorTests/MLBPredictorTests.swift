import XCTest
@testable import MLBPredictor

class MLBPredictorTests: XCTestCase {

    var player: Player!
    var pitcher: Pitcher!
    var hitter: Hitter!
    var aiModel: AIModel!
    var videoAnalysis: VideoAnalysis!
    var biomechanics: Biomechanics!

    override func setUp() {
        super.setUp()
        player = Player()
        pitcher = Pitcher()
        hitter = Hitter()
        aiModel = AIModel()
        videoAnalysis = VideoAnalysis()
        biomechanics = Biomechanics()
    }

    override func tearDown() {
        player = nil
        pitcher = nil
        hitter = nil
        aiModel = nil
        videoAnalysis = nil
        biomechanics = nil
        super.tearDown()
    }

    func testPlayer() {
        XCTAssertNotNil(player)
    }

    func testPitcher() {
        XCTAssertNotNil(pitcher)
    }

    func testHitter() {
        XCTAssertNotNil(hitter)
    }

    func testAIModel() {
        XCTAssertNotNil(aiModel)
    }

    func testVideoAnalysis() {
        XCTAssertNotNil(videoAnalysis)
    }

    func testBiomechanics() {
        XCTAssertNotNil(biomechanics)
    }

    func testPrediction() {
        let prediction = aiModel.predict(player: player, pitcher: pitcher, hitter: hitter)
        XCTAssertNotNil(prediction)
    }

    func testVideoUploadAndAnalysis() {
        let videoURL = URL(fileURLWithPath: "testVideo.mov")
        let analysisResult = videoAnalysis.analyze(videoURL: videoURL)
        XCTAssertNotNil(analysisResult)
    }

    func testBiomechanicsBreakdown() {
        let breakdown = biomechanics.breakdown(player: player)
        XCTAssertNotNil(breakdown)
    }
}
//
//  mobflixTests.swift
//  mobflixTests
//
//  Created by Rian de Oliveira on 26/10/22.
//

import XCTest
@testable import mobflix

final class mobflixTests: XCTestCase {

    func testVideoDecoderCanDecodeVideoArray() throws {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode([Video].self, from: testData)
        
        XCTAssertEqual(decoded.count, 8)
        XCTAssertEqual(decoded[0].category, Category.programming)
    }
    
    func testClientDoesFetchVideoData() async throws {
        let downloader = TestDownloader()
        let client = VideoClient(downloader: downloader)
        
        let videos = try await client.videos
        
        XCTAssertEqual(videos.count, 8)
    }
    
    func testProviderCanFetch() async throws {
        let downloader = TestDownloader()
        let client = VideoClient(downloader: downloader)
        let provider = await VideosProvider(client: client)
        
        try await provider.fetchVideos()
                                 
        let videos = await provider.videos
        
        XCTAssertEqual(videos.count, 7)
    }

}

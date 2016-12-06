//
//  OTTMediaProviderTest.swift
//  PlayKit
//
//  Created by Rivka Peleg on 04/12/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import PlayKit



class OTTMediaProviderTest: XCTestCase, SessionProvider {
    


    
    let mediaID = "258656"
    var partnerId: Int64 = 198
    var serverURL: String  = "http://52.210.223.65:8080/v4_0/api_v3"
    
    public func loadKS(completion: @escaping (Result<String>) -> Void) {
         completion(Result(data: "djJ8MTk4fLsl2jWZfTLBHh80n32POkgauZLWcLXhEEySDRL9yRtOLtr92sPWaKpnCaz4nJgsjjXIxD6PkOLXlOvpEHV3Wizc384sF3F4Kj1MfiqJRQd8", error: nil))
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegularCaseTest() {
        
        let theExeption = expectation(description: "test")
        
        let provider = OTTMediaProvider()
        .set(sessionProvider: self)
        .set(mediaId: mediaID)
        .set(type: AssetType.media)
        .set(formats: ["Mobile_Devices_Main_HD"])
        
        provider.loadMedia { (r:Result<MediaEntry>) in
            print(r)
            if (r.error != nil){
                theExeption.fulfill()
            }else{
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 6.0) { (_) -> Void in
            
        }

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}



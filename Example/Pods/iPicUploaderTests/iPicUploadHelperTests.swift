//
//  iPicUploaderTests.swift
//  iPicUploaderTests
//
//  Created by Jason Zheng on 9/1/16.
//
//

import XCTest
@testable import iPicUploader

class iPicUploadHelperTests: XCTestCase {
  
  func testiPic() {
    XCTAssertNil(iPicUploadHelper.launchiPic())
    XCTAssertTrue(iPicUploadHelper.isiPicRunning())
  }
  
  func test_generateiPicImage() {
    var image: iPicImage?
    var error: NSError?
    
    (image, error) = iPicUploadHelper.generateiPicImage(UTConstants.imageFilePath)
    XCTAssertNotNil(image)
    XCTAssertNil(error)
    
    let theImage = NSImage(contentsOfFile: UTConstants.imageFilePath)!
    (image, error) = iPicUploadHelper.generateiPicImage(theImage)
    XCTAssertNotNil(image)
    XCTAssertNil(error)
    
    let pasteboard = NSPasteboard.general()
    pasteboard.clearContents()
    let url = URL(fileURLWithPath: UTConstants.imageFilePath)
    pasteboard.writeObjects([url as NSPasteboardWriting])
    let imageDataList = iPicUploadHelper.generateImageDataListFrom(pasteboard)
    XCTAssertTrue(!imageDataList.isEmpty)
  }
}

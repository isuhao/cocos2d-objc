//
//  CCPackageManagerTests.m
//  cocos2d-tests-ios
//
//  Created by Nicky Weber on 23.09.14.
//  Copyright (c) 2014 Cocos2d. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CCPackageManager.h"
#import "CCPackage.h"
#import "CCFileUtils.h"

@interface CCPackageManagerTests : XCTestCase

@property (nonatomic, strong) CCPackageManager *packageManager;

@end

@implementation CCPackageManagerTests

- (void)setUp
{
    [super setUp];
    self.packageManager = [[CCPackageManager alloc] init];
}

- (void)testPackageWithName
{
    // NOTE: This will kill many other tests due to a bug in CCFileUtils
    // So we assume until the bug's fixed that phonehd is the default resolution
    // [CCFileUtils sharedFileUtils].searchResolutionsOrder = @[CCFileUtilsSuffixiPadHD];

    CCPackage *aPackage = [[CCPackage alloc] initWithName:@"foo"
                                               // resolution:@"tablethd" // See note above
                                               resolution:@"phonehd"
                                                       os:@"iOS"
                                                remoteURL:[NSURL URLWithString:@"http://foo.fake"]];

    [_packageManager addPackage:aPackage];

    CCPackage *result = [_packageManager packageWithName:@"foo"];

    XCTAssertEqual(aPackage, result);
}

@end

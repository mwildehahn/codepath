//
//  TipCalculatorTests.m
//  TipCalculator
//
//  Created by mhahn on 5/7/14.
//  Copyright (c) 2014 Michael Hahn. All rights reserved.
//

#import "TipCalculatorTests.h"
#import "TipCalculator.h"

@implementation TipCalculatorTests

- (void)testThat10PercentTipOf100TotalIs10
{
    XCTAssertEqual([TipCalculator calculateTip:100.0 withTipPercent:0.10], 10.0, @"10%% tip for a $100 bill should be $10");
}

- (void)testThatTotalFor100TotalWith10PercentTipIs110 {
    float tipAmount = [TipCalculator calculateTip:100.00 withTipPercent:0.10];
    XCTAssertEqual([TipCalculator calculateTotal:100.00 withTip:tipAmount], 110.00, @"$100 bill with 10%% tip should be $110");
}

@end

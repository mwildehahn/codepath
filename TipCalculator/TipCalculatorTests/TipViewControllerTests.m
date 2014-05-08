//
//  TipViewControllerTests.m
//  TipCalculator
//
//  Created by mhahn on 5/7/14.
//  Copyright (c) 2014 Michael Hahn. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "TipViewControllerTests.h"
#import "TipViewController_Private.h"

@implementation TipViewControllerTests

- (void)setUp {
    [super setUp];
    TipViewController *tipViewController =[[TipViewController alloc]init];
    tipViewController = [[TipViewController alloc]init];
    
    // setup mocks
    self.mockTipViewController = [OCMockObject partialMockForObject:tipViewController];
    
    self.mockBillTextField = [OCMockObject mockForClass:[UITextField class]];
    [[[self.mockTipViewController stub] andReturn:self.mockBillTextField] billTextField];
    
    self.mockTipControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    [[[self.mockTipViewController stub] andReturn:self.mockTipControl] tipControl];
    
    self.mockTipLabel = [OCMockObject mockForClass:[UILabel class]];
    [[[self.mockTipViewController stub] andReturn:self.mockTipLabel] tipLabel];
    
    self.mockTotalLabel = [OCMockObject mockForClass:[UILabel class]];
    [[[self.mockTipViewController stub] andReturn:self.mockTotalLabel] totalLabel];
    
    self.mockTipPercentLabel = [OCMockObject mockForClass:[UILabel class]];
    [[[self.mockTipViewController stub] andReturn:self.mockTipPercentLabel] tipPercentLabel];
    
}

- (void)setUpMocksWithBillTotal:(NSString *)billTotal andWithTipIndex:(id)tipIndex {

    [[[self.mockBillTextField stub] andReturn:billTotal] text];
    [[[self.mockTipControl stub] andReturnValue:tipIndex] selectedSegmentIndex];

    // mock out the tip control titles
    [[[self.mockTipControl stub] andReturn:@"10%"] titleForSegmentAtIndex:0];
    [[[self.mockTipControl stub] andReturn:@"15%"] titleForSegmentAtIndex:1];
    [[[self.mockTipControl stub] andReturn:@"20%"] titleForSegmentAtIndex:2];
    
}

- (void)verifyUpdateValuesExpectTipLabelText:(NSString *)expectedTip andExpectTotalLabelText:(NSString *)expectedTotal andExpectedTipPercentLabelText:(NSString *)expectedTipPercentLabel {
    
    [[self.mockTipLabel expect] setText:expectedTip];
    [[self.mockTotalLabel expect] setText:expectedTotal];
    [[self.mockTipPercentLabel expect] setText:expectedTipPercentLabel];
    
    [self.mockTipViewController updateValues];
    [self.mockTipLabel verify];
    [self.mockTotalLabel verify];
    [self.mockTipPercentLabel verify];
    
}

- (void)testUpdateValuesFor100BillWith10PercentTax {
    // setup $100 bill total with 10% tax
    [self setUpMocksWithBillTotal:@"100.00" andWithTipIndex:@0];
    [self verifyUpdateValuesExpectTipLabelText:@"$10.00"
                       andExpectTotalLabelText:@"$110.00"
                andExpectedTipPercentLabelText:@"(10%)"];

}

- (void)testUpdateValuesFor100BillWith15PercentTax {
    // setup $100 bill total with 15% tax
    [self setUpMocksWithBillTotal:@"100.00" andWithTipIndex:@1];
    [self verifyUpdateValuesExpectTipLabelText:@"$15.00"
                       andExpectTotalLabelText:@"$115.00"
                andExpectedTipPercentLabelText:@"(15%)"];
    
}

- (void)testUpdateValuesFor100BillWith20PercentTax {
    // setup $100 bill total with 20% tax
    [self setUpMocksWithBillTotal:@"100.00" andWithTipIndex:@2];
    [self verifyUpdateValuesExpectTipLabelText:@"$20.00"
                       andExpectTotalLabelText:@"$120.00"
                andExpectedTipPercentLabelText:@"(20%)"];
}

@end

//
//  TipCalculator.m
//  TipCalculator
//
//  Created by mhahn on 5/7/14.
//  Copyright (c) 2014 Michael Hahn. All rights reserved.
//

#import "TipCalculator.h"

@implementation TipCalculator

+ (float)calculateTip:(float)total withTipPercent:(float)tipPercent {
    return total * tipPercent;
}

+ (float)calculateTotal:(float)total withTip:(float)tip {
    return total + tip;
}

@end

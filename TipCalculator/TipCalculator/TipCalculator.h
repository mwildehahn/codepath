//
//  TipCalculator.h
//  TipCalculator
//
//  Created by mhahn on 5/7/14.
//  Copyright (c) 2014 Michael Hahn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipCalculator : NSObject

+ (float)calculateTip:(float)total withTipPercent:(float)tipPercent;
+ (float)calculateTotal:(float)total withTip:(float)tip;

@end

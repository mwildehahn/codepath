//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by mhahn on 5/7/14.
//  Copyright (c) 2014 Michael Hahn. All rights reserved.
//

#import "SettingsViewController.h"
#import "Constants.h"

@interface SettingsViewController () {
    NSUserDefaults *defaults;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
- (IBAction)onSelect:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!defaults) {
        defaults = [NSUserDefaults standardUserDefaults];
    }
    self.defaultTipControl.selectedSegmentIndex =  [defaults integerForKey:DEFAULTS_TIP_INDEX_KEY];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSelect:(id)sender {
    int defaultTipIndex = self.defaultTipControl.selectedSegmentIndex;
    [defaults setInteger:defaultTipIndex forKey:DEFAULTS_TIP_INDEX_KEY];
    [defaults synchronize];
}
@end

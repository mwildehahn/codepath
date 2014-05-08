//
//  TipViewController.m
//  TipCalculator
//
//  Created by mhahn on 5/7/14.
//  Copyright (c) 2014 Michael Hahn. All rights reserved.
//

#import "TipCalculator.h"
#import "TipViewController.h"
#import "TipViewController_Private.h"
#import "SettingsViewController.h"
#import "Constants.h"

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // clear any previous values when we load the app
    [self updateValues];
    
    // add a "settings" button to the navigation
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onSettingsButton)];

    // activate the billTextField when the user resumes the app
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(activateBillTextField)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    // update our totals as the user types in the bill total
    [self.billTextField addTarget:self
                           action:@selector(updateValues)
                 forControlEvents:UIControlEventEditingChanged];

}

- (void)viewWillAppear:(BOOL)animated {
    // set any defaults
    if (!defaults) {
        defaults = [NSUserDefaults standardUserDefaults];
    }
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:DEFAULTS_TIP_INDEX_KEY];
    
    // make sure we update the values if the defaults changed
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)activateBillTextField {
    // clear any previous input
    self.billTextField.text = [[NSString alloc]init];
    
    // activate the keyboard for the textField
    [self.billTextField becomeFirstResponder];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    float tipAmount = [TipCalculator calculateTip:billAmount
                                   withTipPercent:TIP_SELECTIONS[self.tipControl.selectedSegmentIndex]];
    
    float totalAmount = [TipCalculator calculateTotal:billAmount
                                              withTip:tipAmount];

    self.tipPercentLabel.text = [[NSString alloc]initWithFormat:@"(%@)", [self.tipControl titleForSegmentAtIndex:self.tipControl.selectedSegmentIndex]];
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc]init] animated:YES];
}

@end

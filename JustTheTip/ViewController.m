//
//  ViewController.m
//  JustTheTip
//
//  Created by Jeffrey C Rosenthal on 3/20/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import "ViewController.h"
#define FLATTIP()
@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (assign, nonatomic) NSInteger tipper;
@property (weak, nonatomic) IBOutlet UILabel *tipShowLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipValueShowLabel;

@end

@implementation ViewController
- (IBAction)slidingTipPicker:(UISlider *)sender {
    self.tipper = sender.value;
    self.tipShowLabel.text = [NSString stringWithFormat:@"%ld percent", (long)self.tipper];

}
- (IBAction)mealCostValue:(UITextField *)sender {

    self.tipAmountLabel.text = [NSString stringWithFormat:@"yur bill is $%.3g, wif da tip lul", ([sender.text integerValue] + ([sender.text integerValue]*(self.tipper * 0.01)))];

    self.tipValueShowLabel.text = [NSString stringWithFormat:@"%f", ([sender.text integerValue]*(self.tipper * 0.01))];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.tipAmountLabel.text = textField.text = @"";
[textField resignFirstResponder];
return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

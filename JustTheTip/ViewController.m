//
//  ViewController.m
//  JustTheTip
//
//  Created by Jeffrey C Rosenthal on 3/20/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import "ViewController.h"
#define FLATTIP()
@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipShowLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipValueShowLabel;
//@property (assign, nonatomic) NSInteger tipper;
//@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *partyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *pricePerPerson;




@end

@implementation ViewController{
    NSArray *pickerData;
    NSInteger tipPercentage;
    NSInteger partyCount;
    NSInteger totalBill;

}

//- (IBAction)slidingTipPicker:(UISlider *)sender {
//    tipPercentage = sender.value;
//    self.tipShowLabel.text = [NSString stringWithFormat:@"%ld percent", (long)tipPercentage];
//
//}
- (IBAction)mealCostValue:(UITextField *)sender {

    totalBill = ([sender.text integerValue] + ([sender.text integerValue]*(tipPercentage * 0.01)));
    self.tipAmountLabel.text = [NSString stringWithFormat:@"yur bill is $%.2ld, wif da tip lul", totalBill];
    self.pricePerPerson.text = [NSString stringWithFormat:@"$%.2ld per person",(totalBill / partyCount)];
    self.tipValueShowLabel.text = [NSString stringWithFormat:@"%.2f", ([sender.text integerValue]*(tipPercentage * 0.01))];
    

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.tipAmountLabel.text = textField.text = @"";
[textField resignFirstResponder];
return YES;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    pickerData = @[ @[@5, @7, @10, @13, @15, @17, @20, @23, @25, @27, @30, @33, @35],
                    @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12],
                    ];
    tipPercentage = 5;
    partyCount = 1;
// m (party count)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [pickerData[component] count];
}

    
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSNumber *myNumber = pickerData[component][row];
    if (component == 0){
        return [NSString stringWithFormat:@"%@%% tip",myNumber];
    }
    else if (component == 1){
        return [NSString stringWithFormat:@"%@ people",myNumber];
    }
    else return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    if (component == 0){
        tipPercentage = [pickerData[0][row] integerValue];
        
        
        
        
        self.tipShowLabel.text = [NSString stringWithFormat:@"you are tipping %d%%", (int)tipPercentage];
    }
    if (component == 1){
        partyCount = [pickerData[1][row] integerValue];
        self.partyCountLabel.text = [NSString stringWithFormat:@"your party has %d people", (int)partyCount];
    }


    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

@end

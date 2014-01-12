//
//  TemperatureViewController.m
//  Temperature Converter
//
//  Created by Thanawat Kaewka on 1/11/14.
//  Copyright (c) 2014 thanawat. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@property (nonatomic, strong) IBOutlet UITextField * fahrenheitTextField;
@property (nonatomic, strong) IBOutlet UITextField * celsiusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

- (IBAction)onDone:(id)sender;
- (IBAction)onConvert:(id)sender;
- (double)celsiusToFahrenheit:(double) celsius;
- (double)fahrenheitToCelsius:(double) fahrenheit;
- (void)convertTemperature;
@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenheitTextField.delegate = self;
    self.celsiusTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDone:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onConvert:(id)sender {
    [self.view endEditing:YES];
    [self convertTemperature];
}

#pragma mark - UITextField delegate
-(void) textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.fahrenheitTextField) {
        self.celsiusTextField.text = @"";
    }
    else if(textField == self.celsiusTextField) {
        self.fahrenheitTextField.text = @"";
    }
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
    [self convertTemperature];
}

#pragma mark - Private methods
- (double)celsiusToFahrenheit:(double) celsius {
    return (celsius * 9.0/5.0) + 32.0;
}

- (double)fahrenheitToCelsius:(double) fahrenheit {
    return ((fahrenheit - 32.0)*5.0)/(9.0);
}

- (void)convertTemperature {
    if ([self.fahrenheitTextField.text length] > 0) {
        double celsius = [self fahrenheitToCelsius:[self.fahrenheitTextField.text doubleValue]];
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", celsius];
    }
    else if([self.celsiusTextField.text length] > 0) {
        double fahrenheit = [self celsiusToFahrenheit:[self.celsiusTextField.text doubleValue]];
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheit];
    }
}

@end

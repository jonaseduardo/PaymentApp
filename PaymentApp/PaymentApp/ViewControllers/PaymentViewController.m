//
//  PaymentViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentViewController.h"
#import "AmountView.h"
#import "Utils.h"

@interface PaymentViewController () <AmountViewDelegate>

@property (strong, nonatomic) IBOutlet AmountView *amountView;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;
@property (strong, nonatomic) NSString *amount;

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configViews];
}

#pragma mark - IBActions

- (IBAction)continueTouched:(id)sender {
    [self.delegate amountCompleted:self.amount];
}

#pragma mark - Custom Methods

- (void)configViews {

    self.title = @"Monto";
    
    [self.amountView setDelegate:self];
    [self.amountView textFieldBecomeFirstResponder];
}

#pragma mark - Override Methods

- (void)cleanData {
    
    [self.amountView clearAmount];
}

#pragma mark - Override Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.amountView textFieldResignFirstResponder];
}

#pragma mark - AmountViewDelegate methods

- (void)amountChanged:(AmountView *)sender amount:(NSString *)amount {
    self.amount = [Utils formatAmount:amount];
    
    if (![self.amount isEqualToString:ZERO]) {
        [self.continueButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.continueButton setEnabled:YES];
    }else {
        [self.continueButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.continueButton setEnabled:NO];
    }
}

@end

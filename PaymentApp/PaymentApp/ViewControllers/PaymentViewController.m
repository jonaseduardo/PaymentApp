//
//  PaymentViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentViewController.h"
#import "AmountView.h"

@interface PaymentViewController () <AmountViewDelegate>

@property (strong, nonatomic) IBOutlet AmountView *amountView;

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configViews];
}

#pragma mark - Custom Methods

- (void)configViews {

    self.title = @"Monto";
    
    [self.amountView setDelegate:self];
}

#pragma mark - AmountViewDelegate methods

- (void)amountChanged:(AmountView *)sender amount:(NSString *)amount {
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end

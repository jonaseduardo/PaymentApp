//
//  SummaryViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "SummaryViewController.h"
#import "SummaryViewModel.h"

@interface SummaryViewController ()

@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UILabel *paymentMethodLabel;
@property (strong, nonatomic) IBOutlet UILabel *bankLabel;
@property (strong, nonatomic) IBOutlet UILabel *feeLabel;

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViews];
}

#pragma mark - IBActions

- (IBAction)endTouched:(id)sender {
    [self.delegate endProcess];
}

#pragma mark - Custom Methods

- (void)configViews {

    self.title = self.summaryViewModel.title;
    
    self.amountLabel.text = self.summaryViewModel.amount;
    self.paymentMethodLabel.text = self.summaryViewModel.paymentMethod;
    self.bankLabel.text = self.summaryViewModel.bank;
    self.feeLabel.text = self.summaryViewModel.fee;
    
    self.amountLabel.hidden = self.summaryViewModel.amount? NO:YES;
    self.paymentMethodLabel.hidden = self.summaryViewModel.amount? NO:YES;
    self.bankLabel.hidden = self.summaryViewModel.amount? NO:YES;
    self.feeLabel.hidden = self.summaryViewModel.amount? NO:YES;

}


@end

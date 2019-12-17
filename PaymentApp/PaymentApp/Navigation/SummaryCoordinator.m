//
//  SummaryCoordinator.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "SummaryCoordinator.h"
#import "SummaryViewController.h"
#import "SummaryViewModel.h"
#import "BasePaymentViewController.h"

@interface SummaryCoordinator () <SummaryViewControllerDelegate>

@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) SummaryViewController *summaryViewController;

@end

@implementation SummaryCoordinator

- (instancetype)initWithPresenter:(UINavigationController *)presenter {

    self = [super init];
    if(self) {
        
        self.presenter = presenter;
    }
    return self;
}

- (void)start {

    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SummaryViewController * summaryViewController = (SummaryViewController *)[mystoryboard instantiateViewControllerWithIdentifier:@"SummaryViewController"];
    
    SummaryViewModel *summaryViewModel = [SummaryViewModel new];
    summaryViewModel.amount = self.amount;
    summaryViewModel.paymentMethod = self.paymentMethodId;
    summaryViewModel.fee = self.installment;
    summaryViewModel.bank = self.issuerId;
    summaryViewController.summaryViewModel = summaryViewModel;
    
    summaryViewController.delegate = self;
    [self.presenter pushViewController:summaryViewController animated:YES];
    
    self.summaryViewController = summaryViewController;
}

- (void)endProcess {
    
    BasePaymentViewController *vc = (BasePaymentViewController *)[self.presenter.viewControllers firstObject];
    [vc cleanData];
    
    [self.presenter popToRootViewControllerAnimated:YES];
}

@end

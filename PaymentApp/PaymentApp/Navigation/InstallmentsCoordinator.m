//
//  InstallmentsCoordinator.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "InstallmentsCoordinator.h"
#import "InstallmentsViewController.h"
#import "SummaryCoordinator.h"
#import "InstallmentsViewModel.h"
#import "InstallmentCellViewModel.h"

@interface InstallmentsCoordinator () <InstallmentsViewControllerDelegate>

@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) InstallmentsViewController *installmentsViewController;
@property (strong, nonatomic) SummaryCoordinator *summaryCoordinator;

@end

@implementation InstallmentsCoordinator

- (instancetype)initWithPresenter:(UINavigationController *)presenter {

    self = [super init];
    if(self) {
        
        self.presenter = presenter;
    }
    return self;
}

- (void)start {

    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InstallmentsViewController * installmentsViewController = (InstallmentsViewController *)[mystoryboard instantiateViewControllerWithIdentifier:@"InstallmentsViewController"];
    
    InstallmentsViewModel *installmentsViewModel = [InstallmentsViewModel new];
    installmentsViewModel.amount = self.amount;
    installmentsViewModel.paymentMethodId = self.paymentMethodId;
    installmentsViewModel.issuerId = self.issuerId;
    installmentsViewController.installmentsViewModel = installmentsViewModel;
    
    installmentsViewController.delegate = self;
    [self.presenter pushViewController:installmentsViewController animated:YES];
    
    self.installmentsViewController = installmentsViewController;
}

#pragma mark - InstallmentsViewControllerDelegate

- (void)InstallmentSelected:(InstallmentCellViewModel *)item {
    
    self.summaryCoordinator = [[SummaryCoordinator alloc] initWithPresenter:self.presenter];
    
    self.summaryCoordinator.amount = self.amount;
    self.summaryCoordinator.paymentMethodId = self.paymentMethodId;
    self.summaryCoordinator.issuerId = self.issuerId;
    self.summaryCoordinator.installment = item.fee;
    
    [self.summaryCoordinator start];
}

@end

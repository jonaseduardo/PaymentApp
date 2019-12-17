//
//  BanksCoordinator.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BanksCoordinator.h"
#import "BanksViewController.h"
#import "InstallmentsCoordinator.h"
#import "BanksViewModel.h"
#import "BankCellViewModel.h"

@interface BanksCoordinator () <BanksViewControllerDelegate>

@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) BanksViewController *banksViewController;
@property (strong, nonatomic) InstallmentsCoordinator *installmentsCoordinator;

@end

@implementation BanksCoordinator

- (instancetype)initWithPresenter:(UINavigationController *)presenter {

    self = [super init];
    if(self) {
        
        self.presenter = presenter;
    }
    return self;
}

- (void)start {

    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BanksViewController * banksViewController = (BanksViewController *)[mystoryboard instantiateViewControllerWithIdentifier:@"BanksViewController"];
    
    BanksViewModel *banksViewModel = [BanksViewModel new];
    banksViewModel.paymentMethodId = self.paymentMethodId;
    banksViewController.banksViewModel = banksViewModel;
    
    banksViewController.delegate = self;
    [self.presenter pushViewController:banksViewController animated:YES];
    
    self.banksViewController = banksViewController;
}

#pragma mark - BanksViewControllerDelegate

- (void)bankSelected:(BankCellViewModel *)item {

    self.installmentsCoordinator = [[InstallmentsCoordinator alloc] initWithPresenter:self.presenter];
    
    self.installmentsCoordinator.amount = self.amount;
    self.installmentsCoordinator.paymentMethodId = self.paymentMethodId;
    self.installmentsCoordinator.issuerId = item.issuerId;
    
    [self.installmentsCoordinator start];

}

@end

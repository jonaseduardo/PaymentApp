//
//  PaymentMethodsViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentMethodsViewController.h"
#import "PaymentMethodsViewModel.h"
#import "PaymentMethodTableViewCell.h"
#import "PaymentMethodCellViewModel.h"
#import "UIImageView+AFNetworking.h"

@interface PaymentMethodsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) PaymentMethodsViewModel *paymentMethodsViewModel;

@end

@implementation PaymentMethodsViewController

#pragma mark - Getters/Setters

- (PaymentMethodsViewModel *)paymentMethodsViewModel {
    if (_paymentMethodsViewModel == nil) {
        _paymentMethodsViewModel = [PaymentMethodsViewModel new];
    }
    return _paymentMethodsViewModel;
}

#pragma mark - View lyfeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self getPaymentMethods];
}

#pragma mark - Bindings

- (void)bindViewModel {
    
    __weak UITableView *weakSelfTableView = self.tableView;
    self.paymentMethodsViewModel.reloadTableView = ^(){
        [weakSelfTableView reloadData];
    };
}

#pragma mark - Custom Methods

- (void)getPaymentMethods {
    
    [self.paymentMethodsViewModel getPaymentMethods];
}

#pragma mark - UITableView Delegate & DataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    PaymentMethodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PaymentMethodCell"];
    
    PaymentMethodCellViewModel *viewModel = [self.paymentMethodsViewModel getCellViewModel:indexPath.row];
    cell.nameLabel.text = viewModel.name;
    [cell.paymentImageView setImageWithURL:[NSURL URLWithString:viewModel.urlImage]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.paymentMethodsViewModel.numberOfCells;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
}

@end

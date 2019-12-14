//
//  BanksViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BanksViewController.h"
#import "BanksViewModel.h"
#import "BankTableViewCell.h"
#import "BankCellViewModel.h"
#import "UIImageView+AFNetworking.h"

@interface BanksViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BanksViewController

#pragma mark - Getters/Setters

- (BanksViewModel *)banksViewModel {
    if (_banksViewModel == nil) {
        _banksViewModel = [BanksViewModel new];
    }
    return _banksViewModel;
}

#pragma mark - View lyfeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViews];
    [self bindViewModel];
    [self getBanks];
}

#pragma mark - Bindings

- (void)bindViewModel {
    
    __weak UITableView *weakSelfTableView = self.tableView;
    self.banksViewModel.reloadTableView = ^(){
        [weakSelfTableView reloadData];
    };
    
    self.banksViewModel.error = ^(NSString * _Nullable message){
        // retry
    };
}

#pragma mark - Custom Methods

- (void)getBanks {
    
    self.banksViewModel.paymentMethodId = @"visa";
    [self.banksViewModel getBanks];
}

- (void)configViews {

    self.title = @"Bancos";
}

#pragma mark - UITableView DataSource & Delegate

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.banksViewModel.numberOfCells;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    BankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BankTableViewCell"];
    
    BankCellViewModel *viewModel = [self.banksViewModel getCellViewModel:indexPath.row];

    [cell.bankImageView setImageWithURL:[NSURL URLWithString:viewModel.urlImage]];
    cell.nameLabel.text = viewModel.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end

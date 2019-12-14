//
//  InstallmentsViewController.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "InstallmentsViewController.h"
#import "InstallmentsViewModel.h"
#import "InstallmentTableViewCell.h"
#import "InstallmentCellViewModel.h"

@interface InstallmentsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation InstallmentsViewController

#pragma mark - Getters/Setters

- (InstallmentsViewModel *)installmentsViewModel {
    if (_installmentsViewModel == nil) {
        _installmentsViewModel = [InstallmentsViewModel new];
    }
    return _installmentsViewModel;
}

#pragma mark - View lyfeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViews];
    [self bindViewModel];
    [self getInstallments];
}

#pragma mark - Bindings

- (void)bindViewModel {
    
    __weak UITableView *weakSelfTableView = self.tableView;
    self.installmentsViewModel.reloadTableView = ^(){
        [weakSelfTableView reloadData];
    };
    
    self.installmentsViewModel.error = ^(NSString * _Nullable message){
        // retry
    };
}

#pragma mark - Custom Methods

- (void)getInstallments {
    
    [self.installmentsViewModel getInstallments];
}

- (void)configViews {

    self.title = @"Cuotas";
}

#pragma mark - UITableView DataSource & Delegate

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.installmentsViewModel.numberOfCells;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    InstallmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstallmentTableViewCell"];
    
    InstallmentCellViewModel *viewModel = [self.installmentsViewModel getCellViewModel:indexPath.row];

    cell.cuotaLabel.text = viewModel.cuota;
    cell.cftLabel.text = viewModel.cft;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}


@end

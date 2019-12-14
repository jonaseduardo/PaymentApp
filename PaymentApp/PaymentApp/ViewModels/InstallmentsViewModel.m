//
//  InstallmentsViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "InstallmentsViewModel.h"
#import "APIManager.h"
#import "InstallmentCellViewModel.h"
#import "InstallmentModel.h"
#import "PayerCostsModel.h"

@interface InstallmentsViewModel ()

@property (nonatomic, strong) APIManager *myAPIManager;
@property (nonatomic, strong) NSMutableArray * _Nullable installments;

@end

@implementation InstallmentsViewModel

- (instancetype)init {
    
    self = [super init];
    if(self) {
        self.myAPIManager = [APIManager new];
    }
    return self;
}

- (NSInteger)numberOfCells {
    return self.cellViewModels.count;
}

- (void)setCellViewModels:(NSArray *)cellViewModels {
    
    if (_cellViewModels != cellViewModels) {
        _cellViewModels = cellViewModels;
        self.reloadTableView();
    }
}

- (InstallmentCellViewModel *)getCellViewModel:(NSUInteger)index {
    
    if (self.cellViewModels.count > index) {
        return [self.cellViewModels objectAtIndex:index];
    }else {
        return nil;
    }
}

- (void)getInstallments {
    
    [self.myAPIManager doRequest:@"payment_methods/installments" parameters:@{@"public_key":PUBLIC_KEY,
                                                              @"payment_method_id":@"visa",
                                                                              @"amount":@"200",
                                                                              @"issuer.id":@"310"
    } response:^(NSMutableArray *data, NSError *error) {
        
        if(!error) {
            [self processInstallments:data];
        }else {
            self.error(@"error");
        }
    }];
}

- (void)processInstallments :(NSMutableArray *)installments {
    
    self.installments = installments;
    
    NSMutableArray *temp = [NSMutableArray new];
    for (InstallmentModel *installment in installments) {
        for (PayerCostsModel *payerCost in installment.payerCosts) {
            [temp addObject: [[InstallmentCellViewModel alloc] initWithModel:payerCost]];
        }
    }
    
    self.cellViewModels = [temp copy];
}

@end

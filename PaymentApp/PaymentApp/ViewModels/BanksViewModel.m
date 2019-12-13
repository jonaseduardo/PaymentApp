//
//  BanksViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BanksViewModel.h"
#import "APIManager.h"
#import "BankCellViewModel.h"
#import "CardIssuerModel.h"

@interface BanksViewModel ()

@property (nonatomic, strong) APIManager *myAPIManager;
@property (nonatomic, strong) NSMutableArray * _Nullable banks;

@end

@implementation BanksViewModel

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

- (BankCellViewModel *)getCellViewModel:(NSUInteger)index {
    
    if (self.cellViewModels.count > index) {
        return [self.cellViewModels objectAtIndex:index];
    }else {
        return nil;
    }
}

- (void)getBanks {
    
    [self.myAPIManager doRequest:@"payment_methods/card_issuers" parameters:@{@"public_key":PUBLIC_KEY,
                                                              @"payment_method_id":self.paymentMethodId
    } response:^(NSMutableArray *data, NSError *error) {
        
        if(!error) {
            [self processBanks:data];
        }else {
            self.error(@"error");
        }
    }];
}

- (void)processBanks :(NSMutableArray *)banks {
    
    self.banks = banks;
    
    NSMutableArray *temp = [NSMutableArray new];
    for (CardIssuerModel *bank in banks) {
        [temp addObject: [[BankCellViewModel alloc] initWithModel:bank]];
    }
    
    self.cellViewModels = [temp copy];
}

@end

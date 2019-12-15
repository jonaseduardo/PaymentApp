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

static NSString * const PATH_REQUEST = @"payment_methods/card_issuers";

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

- (NSString *)title {
    return @"Bancos";
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
    
    [self.myAPIManager doRequest:PATH_REQUEST parameters:@{PUBLIC_KEY:PUBLIC_KEY_VALUE,
                                                           PAYMENT_METHOD_ID:self.paymentMethodId
    } response:^(id data, NSError *error) {
        
        if(!error) {
            
            NSMutableArray *banks;
            
            if ([data isKindOfClass:[NSArray class]]) {
                banks = [CardIssuerModel arrayOfModelsFromDictionaries:data error:nil];
            }
            [self processBanks:banks];
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

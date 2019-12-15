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

static NSString * const PATH_REQUEST = @"payment_methods/installments";

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

- (NSString *)title {
    return @"Cuotas";
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
    
    [self.myAPIManager doRequest:PATH_REQUEST parameters:@{PUBLIC_KEY:PUBLIC_KEY_VALUE,
                                                                              PAYMENT_METHOD_ID:@"visa",
                                                                              AMOUNT:@"200",
                                                                              ISSUER_ID:@"310"
    } response:^(id data, NSError *error) {
        
        if(!error) {
            
            NSMutableArray *installments;
            
            if ([data isKindOfClass:[NSArray class]]) {
                installments = [InstallmentModel arrayOfModelsFromDictionaries:data error:nil];
            }
            [self processInstallments:installments];
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

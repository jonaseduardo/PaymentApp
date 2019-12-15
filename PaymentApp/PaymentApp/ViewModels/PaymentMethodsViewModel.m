//
//  PaymentMethodsViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 11/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentMethodsViewModel.h"
#import "APIManager.h"
#import "PaymentMethodCellViewModel.h"
#import "PaymentMethodModel.h"

static NSString * const PATH_REQUEST = @"payment_methods";

@interface PaymentMethodsViewModel ()

@property (nonatomic, strong) APIManager *myAPIManager;
@property (nonatomic, strong) NSMutableArray * _Nullable paymentMethods;

@end

@implementation PaymentMethodsViewModel

- (instancetype)init {
    
    self = [super init];
    if(self) {
        self.myAPIManager = [APIManager new];
    }
    return self;
}

- (NSString *)title {
    return @"Método de pago";
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

- (PaymentMethodCellViewModel *)getCellViewModel:(NSUInteger)index {
    
    if (self.cellViewModels.count > index) {
        return [self.cellViewModels objectAtIndex:index];
    }else {
        return nil;
    }
}

- (void)getPaymentMethods {
    
    [self.myAPIManager doRequest:PATH_REQUEST parameters:@{PUBLIC_KEY:PUBLIC_KEY_VALUE} response:^(id data, NSError *error) {
        
        if(!error) {
            
            NSMutableArray *paymentMethods;
            
            if ([data isKindOfClass:[NSArray class]]) {
                paymentMethods = [PaymentMethodModel arrayOfModelsFromDictionaries:data error:nil];
            }
            [self processPaymentMethods:paymentMethods];
        }else {
            self.error(@"error");
        }
    }];
}

- (void)processPaymentMethods :(NSMutableArray *)paymentMethods {
    
    self.paymentMethods = paymentMethods;
    
    NSMutableArray *temp = [NSMutableArray new];
    for (PaymentMethodModel *paymentMethod in paymentMethods) {
        [temp addObject: [[PaymentMethodCellViewModel alloc] initWithModel:paymentMethod]];
    }
    
    self.cellViewModels = [temp copy];
}

@end

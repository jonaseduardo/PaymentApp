//
//  PaymentMethodCellViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 12/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "PaymentMethodCellViewModel.h"

@interface PaymentMethodCellViewModel ()

@property (nonatomic, strong) PaymentMethodModel *model;

@end

@implementation PaymentMethodCellViewModel

- (instancetype)initWithModel:(PaymentMethodModel *)model {
    
    self = [super init];
    if(self) {
        
        self.model = model; 
        
        self.name = model.name;
        self.paymentType = model.paymentTypeId;
        self.urlImage = model.secureThumbnail;
    }
    return self;
}

- (NSString *)paymentType {
    
    NSArray *str = [_paymentType componentsSeparatedByString:@"_"];
    return [str componentsJoinedByString:@" "];
}

- (NSString *)paymentMethodId {
    return self.model.id;
}

@end

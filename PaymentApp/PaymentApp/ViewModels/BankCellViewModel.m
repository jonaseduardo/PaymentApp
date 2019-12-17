//
//  BankCellViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 13/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "BankCellViewModel.h"

@interface BankCellViewModel ()

@property (nonatomic, strong) CardIssuerModel *model;

@end

@implementation BankCellViewModel

- (instancetype)initWithModel:(CardIssuerModel *)model {
    
    self = [super init];
    if(self) {
        
        self.model = model;
        
        self.name = model.name;
        self.urlImage = model.secureThumbnail;
    }
    return self;
}

- (NSString *)issuerId {
    return self.model.id;
}

@end

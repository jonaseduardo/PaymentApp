//
//  InstallmentCellViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "InstallmentCellViewModel.h"

@interface InstallmentCellViewModel ()

@property (nonatomic, strong) PayerCostsModel *model;

@end

@implementation InstallmentCellViewModel

- (instancetype)initWithModel:(PayerCostsModel *)model {
    
    self = [super init];
    if(self) {
        
        self.model = model;
        
        self.cuota = model.recommendedMessage;
        
        for (NSString *str in model.labels) {
            if ([str hasPrefix:@"CFT"]) {
                self.cft = str;
                break;
            }
        }
    }
    return self;
}

@end

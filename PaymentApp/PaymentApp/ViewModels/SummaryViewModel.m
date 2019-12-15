//
//  SummaryViewModel.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 14/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "SummaryViewModel.h"

@implementation SummaryViewModel

#pragma mark - Getters/Setters

- (NSString *)title {
    return @"Resumen";
}

- (NSString *)amount {
    return [NSString stringWithFormat:@"%@ %@", @"Monto:", _amount];
}

- (NSString *)paymentMethod {
    return [NSString stringWithFormat:@"%@ %@", @"Método de pago:", _paymentMethod];
}

- (NSString *)bank {
    return [NSString stringWithFormat:@"%@ %@", @"Banco:", _bank];
}

- (NSString *)fee {
    return [NSString stringWithFormat:@"%@ %@", @"Cuotas:", _fee];
}

@end

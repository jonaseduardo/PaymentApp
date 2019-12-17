//
//  Utils.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 17/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString *)formatAmount:(NSString *)amount {
    
    amount = [amount stringByReplacingOccurrencesOfString:@"$" withString:@""];
    amount = [amount stringByReplacingOccurrencesOfString:@"." withString:@""];
    amount = [amount stringByReplacingOccurrencesOfString:@"," withString:@"."];
    amount = [amount stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return amount;
}

@end

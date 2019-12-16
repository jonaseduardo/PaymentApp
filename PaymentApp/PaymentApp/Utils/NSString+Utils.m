//
//  NSString+Utils.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 15/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (BOOL)stringIsNumeric {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:self];
    return number;
}

@end

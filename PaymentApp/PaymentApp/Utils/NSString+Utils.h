//
//  NSString+Utils.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 15/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

- (BOOL)stringIsNumeric;
- (NSString *)formatAmount;

@end

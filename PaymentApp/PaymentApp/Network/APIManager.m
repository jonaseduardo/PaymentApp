//
//  APIManager.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "APIManager.h"
#import "AFHTTPSessionManager.h"
#import "PaymentMethodModel.h"
#import "CardIssuerModel.h"

static NSString * const BASE_URL = @"https://api.mercadopago.com/v1/";

@implementation APIManager

- (void)doRequest:(NSString *)methodName parameters:(NSDictionary *)parameters response:(void (^)(NSMutableArray * _Nullable, NSError * _Nullable))response {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_URL, methodName];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);

        if ([responseObject isKindOfClass:[NSArray class]]) {
            
            if ([methodName isEqualToString:@"payment_methods"]) {
                
                NSMutableArray *paymentMethods = [PaymentMethodModel arrayOfModelsFromDictionaries:responseObject error:nil];
                NSLog(@"JSON: %@", paymentMethods);
                
                response(paymentMethods, nil);
                
            }else if ([methodName isEqualToString:@"payment_methods/card_issuers"]) {
                
                NSMutableArray *banks = [CardIssuerModel arrayOfModelsFromDictionaries:responseObject error:nil];
                NSLog(@"JSON: %@", banks);
                
                response(banks, nil);
            }
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        response(nil, error);
    }];
}

@end

//
//  APIManager.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "APIManager.h"
#import "AFHTTPSessionManager.h"

static NSString * const BASE_URL = @"https://api.mercadopago.com/v1/";

@implementation APIManager

- (void)doRequest:(NSString *)path parameters:(NSDictionary *)parameters response:(void (^)(id _Nullable, NSError * _Nullable))response {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_URL, path];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
       
        response(responseObject, nil);
                
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        response(nil, error);
    }];
}

@end

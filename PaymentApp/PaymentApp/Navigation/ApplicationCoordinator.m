//
//  ApplicationCoordinator.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationCoordinator.h"
#import "PaymentCoordinator.h"

@interface ApplicationCoordinator ()

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *rootViewController;
@property (strong, nonatomic) PaymentCoordinator *paymentCoordinator;

@end

@implementation ApplicationCoordinator

- (instancetype)initWithUIWindow:(UIWindow *)window {
    
    self = [super init];
    if(self) {
        
        self.window = window;
        
        self.rootViewController = [UINavigationController new];
        self.paymentCoordinator = [[PaymentCoordinator alloc] initWithPresenter:self.rootViewController];
    }
    return self;
}

- (void)start {
    
    self.window.rootViewController = self.rootViewController;
    [self.paymentCoordinator start];
    [self.window makeKeyAndVisible];
}

@end

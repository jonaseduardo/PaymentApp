//
//  AppDelegate.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 10/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "AppDelegate.h"
#import "ApplicationCoordinator.h"

@interface AppDelegate ()

@property (strong, nonatomic) ApplicationCoordinator *applicationCoordinator;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.applicationCoordinator = [[ApplicationCoordinator alloc] initWithUIWindow:self.window];
    
    [self.applicationCoordinator start];
    
    return YES;
}

@end

//
//  AmountView.h
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AmountView;

@protocol AmountViewDelegate

- (void)amountChanged:(AmountView *)sender amount:(NSString *)amount;

@end

@interface AmountView : UIView

@property (nonatomic, weak) id<AmountViewDelegate> delegate;

- (void)textFieldBecomeFirstResponder;

@end

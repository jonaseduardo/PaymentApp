//
//  AmountView.m
//  PaymentApp
//
//  Created by Jonathan Garcia on 16/12/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

#import "AmountView.h"
#import "NSString+Utils.h"

static NSUInteger const MAX_LENGTH = 12;

@interface AmountView () <UITextFieldDelegate> {
    
    NSUInteger typedValue;
}

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;

@end

@implementation AmountView

#pragma mark - Init methods

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if(self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if(self) {
        [self customInit];
    }
    return self;
}

- (void)customInit {
    
    [[NSBundle mainBundle] loadNibNamed:@"AmountView" owner:self options:nil];
    
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;
    
    typedValue = 0;
}

#pragma mark - Custom methods

- (void)textFieldBecomeFirstResponder {
    
    [self.amountTextField becomeFirstResponder];
}

- (void)textFieldResignFirstResponder {
 
    [self.amountTextField resignFirstResponder];
}

- (void)clearAmount {
    
    typedValue = 0;
    self.amountTextField.text = @"";
}

- (NSString *)typedValueToCurrency {
    
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    numberFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"es_AR"];
    numberFormatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    
    double amount = (double)(typedValue / 100) + (double)((double)(typedValue % 100)/100);
    NSString * str = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:amount]];
    str = [str stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    
    return str;
}


#pragma mark - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger currentCharacterCount = textField.text.length;
    
    if (range.length + range.location > currentCharacterCount) {
        return NO;
    }
    
    NSUInteger newLength = currentCharacterCount + string.length - range.length;
    if (newLength > MAX_LENGTH) {
        return NO;
    }
    
    if ([string stringIsNumeric]) {
        
        NSInteger digit = string.integerValue;
        typedValue = typedValue *10 + digit;
        self.amountTextField.text = [self typedValueToCurrency];
    }
        
    if ([string isEqualToString:@""]) {
        
        typedValue = typedValue / 10;
        self.amountTextField.text = [self typedValueToCurrency];
    }
    
    [self.delegate amountChanged:self amount:self.amountTextField.text];
    
    return NO;
}

@end

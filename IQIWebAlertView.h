//
//  IQIWebAlertView.h
//  Web Alert View Custom
//
//  Created by Paolo Musolino on 10/02/15.
//  Copyright (c) 2015 Codeido. All rights reserved. info@codeido.com
//

#import <UIKit/UIKit.h>

@interface IQIWebAlertView : UIView

#pragma mark - Properties
@property (nonatomic) UILabel* title;
@property (nonatomic) UIWebView *webView;
@property (nonatomic) UIButton *confirmationButton;
@property (nonatomic) UIView *maskView;

#pragma mark - Methods
- (instancetype)initWithTitle:(NSString*)title andFrame:(CGRect)frame;
-(void)addConfirmationButton:(NSString*)buttonText;
- (void)showAlertWithHTMLText:(NSString*)htmlCode inView:(UIView*)superview;
-(void)showAlertWithURL:(NSURL*)url inView:(UIView*)superview;
-(void)hideAlert;

@end

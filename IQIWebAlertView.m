//
//  IQIWebAlertView.m
//  Web Alert View Custom
//
//  Created by Paolo Musolino on 10/02/15.
//  Copyright (c) 2015 Codeido. All rights reserved. info@codeido.com
//

#import "IQIWebAlertView.h"

@implementation IQIWebAlertView

#pragma mark - Init & Configuration

- (instancetype)initWithTitle:(NSString*)title andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _title=[UILabel new];
        _title.text=title;
        _title.font=[UIFont boldSystemFontOfSize:18];
        _title.center=self.center;
        [_title setFrame:CGRectMake(0, 2, self.frame.size.width, 25)];
        _title.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_title];
        
        self.backgroundColor=[UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    return self;
}

-(void)configureMaskView:(CGRect)frame{
    _maskView=[[UIView alloc]initWithFrame:frame];
    _maskView.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.6];
}

#pragma mark - Button

-(void)addConfirmationButton:(NSString*)buttonText{
    _confirmationButton = [UIButton new];
    _confirmationButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    [_confirmationButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _confirmationButton.titleLabel.font=[UIFont boldSystemFontOfSize:18];
    [_confirmationButton setTitle:buttonText forState:UIControlStateNormal];
    _confirmationButton.center=self.center;
    
    [_confirmationButton setFrame:CGRectMake(0, self.frame.size.height-25, self.frame.size.width, 25)];
    
    //Gesture
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(confirmationButton:)];
    
    [_confirmationButton addGestureRecognizer:tap];
    
    [self addSubview:_confirmationButton];
}

#pragma mark - Showing

-(void)showAlertWithHTMLText:(NSString*)htmlCode inView:(UIView*)superview{
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, _title.frame.origin.y+_title.frame.size.height, self.frame.size.width, self.frame.size.height-(_title.frame.origin.y+_title.frame.size.height)-(_confirmationButton.frame.size.height))];
    
    _webView.backgroundColor=[UIColor clearColor];
    
    [_webView loadHTMLString:htmlCode baseURL:nil];
    _webView.scrollView.scrollEnabled=NO;
    
    
    [self addSubview:_webView];
    
    [self configureMaskView:superview.frame];
    [superview addSubview:_maskView];
    [superview addSubview:self];
    self.center=superview.center;
}

-(void)showAlertWithURL:(NSURL*)url inView:(UIView*)superview{
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, _title.frame.origin.y+_title.frame.size.height, self.frame.size.width, self.frame.size.height-(_title.frame.origin.y+_title.frame.size.height)-(_confirmationButton.frame.size.height))];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    _webView.backgroundColor=[UIColor clearColor];
    
    [_webView loadRequest:requestObj];
    _webView.scrollView.scrollEnabled=YES;
    
    [self addSubview:_webView];
    
    [self configureMaskView:superview.frame];
    [superview addSubview:_maskView];
    [superview addSubview:self];
    self.center=superview.center;
}

-(void)hideAlert{
    [_maskView removeFromSuperview];
    [self removeFromSuperview];
}

#pragma mark - Actions
-(void)confirmationButton:(id)sender{
    [self hideAlert];
}

@end

//
//  NSObject+UIViewController_ToastView.m
//  GeoPaymentSDK
//
//  Created by Vikash Kumar on 16/10/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

#import "NSObject+UIViewController_ToastView.h"



@implementation NSObject (UIViewController_ToastView)
-(void)showToastMessage:(NSString *)message : (UIView *)view{
    
    
    if([view viewWithTag:101])
        return;
    
    UILabel *lblMessage = [[UILabel alloc]init];
    lblMessage.tag = 101;
    lblMessage.textAlignment = NSTextAlignmentCenter;
    lblMessage.text=message;
    lblMessage.textColor = [UIColor whiteColor];
    lblMessage.font = [UIFont systemFontOfSize:12.0];
    lblMessage.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    
    CGSize textsize = [[lblMessage text]sizeWithAttributes:@{NSFontAttributeName:[lblMessage font]}];
    
    
    float X = view.center.x - textsize.width/2;
    //float X = self.window.rootViewController.view.center.x - textsize.width/2;
    float labelWidth = MIN(textsize.width,SCREEN_WIDTH - 40);
    
    lblMessage.frame = CGRectMake(X,SCREEN_HEIGHT - 120.f, labelWidth + 50, textsize.height + 20);
    
    CGRect oldFrame = lblMessage.frame;
    
    lblMessage.center = view.center;
    //lblMessage.center = self.window.rootViewController.view.center;
    X = lblMessage.frame.origin.x;
    lblMessage.frame = CGRectMake(X, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
    
    
    
    lblMessage.layer.cornerRadius = lblMessage.frame.size.height/2;
    lblMessage.layer.masksToBounds = true;
    
    [view addSubview:lblMessage];
    [self performSelector:@selector(removeToastMessage:) withObject:lblMessage afterDelay:1.5f];
    
}

-(void)removeToastMessage:(UILabel *)label {
    
    [UIView animateWithDuration:1.0f animations:^{
        label.alpha=0.f;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
    });
    
}

@end

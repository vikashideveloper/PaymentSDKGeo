//
//  NSObject+UIViewController_ToastView.h
//  GeoPaymentSDK
//
//  Created by Vikash Kumar on 16/10/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define IS_IPHONE_5 (([UIScreen mainScreen].scale == 2.f && [UIScreen mainScreen].bounds.size.height == 568)?YES:NO)

#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

@interface NSObject (UIViewController_ToastView)
-(void)showToastMessage:(NSString *)message : (UIView *)view;
-(void)removeToastMessage:(UILabel *)label;

@end

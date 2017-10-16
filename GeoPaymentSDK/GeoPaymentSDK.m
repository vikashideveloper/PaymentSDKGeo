//
//  GeoPaymentSDK.m
//  GeoPaymentSDK
//
//  Created by Vikash Kumar on 16/10/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

#import "GeoPaymentSDK.h"

@implementation GeoPaymentSDK


-(UIViewController*)paymentController {
    
    UIStoryboard *manStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[GeoPaymentSDK class]]];
    UINavigationController *nav = [manStoryboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    
    return  nav;
}


+ (GeoPaymentSDK *)sharedInstance {
    static GeoPaymentSDK *sharedInstance = nil;
    
    if (sharedInstance == nil) {
        sharedInstance = [[GeoPaymentSDK alloc] init];
    }
    
    return sharedInstance;
}


@end

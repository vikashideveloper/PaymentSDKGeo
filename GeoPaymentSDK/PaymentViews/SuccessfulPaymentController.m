//
//  SuccessfulPaymentController.m
//  GeoPaymentLibrary
//
//  Created by Mitesh on 10/10/17.
//  Copyright © 2017 Vyom Software Solutions. All rights reserved.
//

#import "SuccessfulPaymentController.h"
#import "NSObject+UIViewController_ToastView.h"
#import "GeoPaymentSDK.h"

@interface SuccessfulPaymentController ()

@end

@implementation SuccessfulPaymentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id amount = [GeoPaymentSDK sharedInstance].payableAmount;
    _lblCartAmt.text = [NSString stringWithFormat:@"Total : $%@", amount];
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    if(IS_IPHONE_5)
        [self.lblAccountNo setFont:[UIFont fontWithName:@"Trebuchet MS" size:14.0f]];
    
    self.lblAccountNo.text = [userDefaults objectForKey:@"accountNo"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneBtn:(id)sender {
    
    [[GeoPaymentSDK sharedInstance].delegate paymentDidFinish];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ConfirmationController.h
//  GeoPaymentLibrary
//
//  Created by Mitesh on 10/10/17.
//  Copyright © 2017 Vyom Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmationController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *tfCVV;
@property (strong, nonatomic) IBOutlet UILabel *lblAccountNo;
@property (strong, nonatomic) IBOutlet UILabel *lblCartAmt;
@property (strong, nonatomic) IBOutlet UILabel *lblCvv;

@end

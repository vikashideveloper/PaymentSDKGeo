//
//  CardViewController.h
//  GeoPaymentLibrary
//
//  Created by Mitesh on 09/10/17.
//  Copyright © 2017 Vyom Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *cardImage;
@property (strong, nonatomic) IBOutlet UITextField *tfAccountNo;
@property (nonatomic, strong) NSString *cardName;
@property (strong, nonatomic) IBOutlet UITextField *tfExpiryDate;
@property (strong, nonatomic) IBOutlet UILabel *lblExpiryDate;
@property (strong, nonatomic) IBOutlet UILabel *lblCartAmt;
@end

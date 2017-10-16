//
//  ViewController.m
//  GeoPaymentLibrary
//
//  Created by Mitesh on 05/10/17.
//  Copyright © 2017 Vyom Software Solutions. All rights reserved.
//

#import "SelectCardController.h"
#import "CardViewController.h"
#import "GeoPaymentSDK.h"

@interface SelectCardController ()

@end

@implementation SelectCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    id amount = [GeoPaymentSDK sharedInstance].payableAmount;
    _lblCartAmt.text = [NSString stringWithFormat:@"Total : $%@", amount];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    

    CardViewController *cardViewController = [segue destinationViewController];

    
    if([[segue identifier] isEqualToString:@"VisaSegue"])
        cardViewController.cardName = @"Visa Card";
    else if([[segue identifier] isEqualToString:@"MasterSegue"])
        cardViewController.cardName = @"Master Card";
    else
        cardViewController.cardName = @"Wing Card";
}


@end

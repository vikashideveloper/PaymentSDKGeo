//
//  ConfirmationController.m
//  GeoPaymentLibrary
//
//  Created by Mitesh on 10/10/17.
//  Copyright © 2017 Vyom Software Solutions. All rights reserved.
//

#import "ConfirmationController.h"
#import "NSObject+UIViewController_ToastView.h"
#import "GeoPaymentSDK.h"

@interface ConfirmationController ()<UITextFieldDelegate>


@end

NSUserDefaults *userDefaults;

@implementation ConfirmationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"Confirmation";
    
    id amount = [GeoPaymentSDK sharedInstance].payableAmount;
    _lblCartAmt.text = [NSString stringWithFormat:@"Total : $%@", amount];
    

    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    if(IS_IPHONE_5)
        [self.lblAccountNo setFont:[UIFont fontWithName:@"Trebuchet MS" size:14.0f]];
    
    self.lblAccountNo.text = [userDefaults objectForKey:@"accountNo"];
    
    if([[userDefaults objectForKey:@"cardType"] isEqualToString:@"Wing Card"]){
     
        if(IS_IPHONE_5)
            [self.lblCvv setFont:[UIFont fontWithName:@"Trebuchet MS" size:14.0f]];
        
        [self.lblCvv setText:@"Enter your Wing Account PIN to pay"];
        
        
    }
    else
        [self.lblCvv setText:@"Enter your CVV2 to pay"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payBtn:(id)sender {
    
    if([[userDefaults objectForKey:@"cardType"] isEqualToString:@"Wing Card"]){
    
        if(self.tfCVV.text.length !=4)
            [self showToastMessage:@"Enter valid Wing Pin" :self.view];
        else
            [self performSegueWithIdentifier:@"SuccessfulPaymentSegue" sender:self];
            
        
    }else{
        
        if(self.tfCVV.text.length !=3)
            [self showToastMessage:@"Enter valid CVV" :self.view];
        else
            [self performSegueWithIdentifier:@"SuccessfulPaymentSegue" sender:self];
        
    }
    
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    

    NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if([[userDefaults objectForKey:@"cardType"] isEqualToString:@"Wing Card"])
        return currentString.length<=4;
    else
        return currentString.length<=3;
    
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

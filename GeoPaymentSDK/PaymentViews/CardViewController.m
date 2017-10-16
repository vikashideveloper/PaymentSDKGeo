//
//  CardViewController.m
//  GeoPaymentLibrary
//
//  Created by Mitesh on 09/10/17.
//  Copyright © 2017 Vyom Software Solutions. All rights reserved.
//

#import "CardViewController.h"
#import "NSObject+UIViewController_ToastView.h"
#import "GeoPaymentSDK.h"

@interface CardViewController ()<UITextFieldDelegate>

@end

@implementation CardViewController
@synthesize cardName;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = cardName;
    
    id amount = [GeoPaymentSDK sharedInstance].payableAmount;
    _lblCartAmt.text = [NSString stringWithFormat:@"Total : $%@", amount];
    
    if([cardName isEqualToString:@"Visa Card"]){
        
        UIImage *cardTypeImage = [UIImage imageNamed:@"visa-card.png" inBundle:[NSBundle bundleForClass:[CardViewController class]] compatibleWithTraitCollection:nil];
        
        self.cardImage.image = cardTypeImage;
        self.lblExpiryDate.text=@"Expiry Date";
        [self.tfExpiryDate setPlaceholder:@"mm / yy"];
        
    }else if([cardName isEqualToString:@"Master Card"]){
        
        UIImage *cardTypeImage = [UIImage imageNamed:@"master-card.png" inBundle:[NSBundle bundleForClass:[CardViewController class]] compatibleWithTraitCollection:nil];

        self.cardImage.image = cardTypeImage;
        self.lblExpiryDate.text=@"Expiry Date";
        [self.tfExpiryDate setPlaceholder:@"mm / yy"];
        
    }else{
        UIImage *cardTypeImage = [UIImage imageNamed:@"wing-card.png" inBundle:[NSBundle bundleForClass:[CardViewController class]] compatibleWithTraitCollection:nil];

        self.cardImage.image = cardTypeImage;
        self.lblExpiryDate.text=@"Year of Birth";
        [self.tfExpiryDate setPlaceholder:@"yyyy"];
    }
    
    
    [self.tfAccountNo setKeyboardType:UIKeyboardTypeNumberPad];
    [self.tfExpiryDate setKeyboardType:UIKeyboardTypeNumberPad];

    
}
- (IBAction)nextBtn:(id)sender {
    
    if([self validateAccountNo]){
        
        if([self validateExpiryDate]){
         
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:self.tfAccountNo.text forKey:@"accountNo"];
            [userDefaults setObject:cardName forKey:@"cardType"];
            [userDefaults synchronize];
            
            [self performSegueWithIdentifier:@"ConfirmationSegue" sender:self];
            
        }
    }
    
}


-(BOOL)validateAccountNo{
    
    
    if([cardName isEqualToString:@"Wing Card"]){
        
        if(self.tfAccountNo.text.length !=0 && self.tfAccountNo.text.length == 9)
            return YES;
        else{
            
            [self showToastMessage:@"Enter Valid Wing Card No" :self.view];
            return NO;
            
        }
        
        
    }else{
        
        if(self.tfAccountNo.text.length !=0 && self.tfAccountNo.text.length == 19)
            return YES;
        else{
         
            [self showToastMessage:@"Enter Valid Account No" :self.view];
            return NO;
            
        }
        

    }
    
}


-(BOOL)validateExpiryDate{
    
    
    if([cardName isEqualToString:@"Wing Card"]){
        
        if(self.tfExpiryDate.text.length !=0 && self.tfExpiryDate.text.length == 4)
            return YES;
        else{
         
           [self showToastMessage:@"Enter Valid Year of Birth" :self.view];
            return NO;
            
        }
        
        
    }else{
        
        if(self.tfExpiryDate.text.length !=0 && self.tfExpiryDate.text.length == 7)
            return YES;
        else{
         
            [self showToastMessage:@"Enter Valid Expiry Date" :self.view];
            return NO;
            
        }
        
        
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(self.tfAccountNo == textField){
    
        if([cardName isEqualToString:@"Wing Card"]){
            
            // Wing Card
            
            if(range.location == 9)
                return NO;
            
            if([string length] == 0)
                return YES;
            
            if (range.location == 4)
            {
                
                NSString *cardString = [NSString stringWithFormat:@"%@ ",textField.text];
                textField.text = cardString;
                
            }

            
        }else{

            // Visa/Master Card
            
            // 8/16 digit card no and 3 spaces
            if (range.location == 19)
                return NO;
            
            
            // Backspace
            if ([string length] == 0)
                return YES;
            
            if ((range.location == 4) || (range.location == 9) || (range.location == 14))
            {
                
                NSString *cardString = [NSString stringWithFormat:@"%@ ",textField.text];
                textField.text = cardString;
            
            }
            
        }
        
    }
    
    if(self.tfExpiryDate == textField){
        
        if([cardName isEqualToString:@"Wing Card"]){
            
            // Wing Card
            
            if(range.location == 4)
                return NO;
            
            if([string length] == 0)
                return YES;
     
        }else{
        
            // Visa/Master Card

            if (range.location == 7)
                return NO;
            
            
            // Backspace
            if ([string length] == 0)
                return YES;
            
            if (range.location == 2)
            {
                
                NSString *expiryStr = [NSString stringWithFormat:@"%@ / ",textField.text];
                textField.text = expiryStr;
                
            }
            
            
        }
    }
    
    
    return YES;
    
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

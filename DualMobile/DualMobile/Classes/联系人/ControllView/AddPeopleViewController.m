//
//  AddPeopleViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/18.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "AddPeopleViewController.h"
#import <AddressBook/AddressBook.h>

@interface AddPeopleViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;

@end

@implementation AddPeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(addToContact)];
    
}

-(void)addToContact
{
    
    if (self.firstName.text.length < 1 || self.lastName.text.length < 1) {
        NSLog(@"请输入姓名");
    }else{
        
        printf("--------addToContact----Execute!!!------\n");
        ABAddressBookRef iPhoneAddressBook = ABAddressBookCreate();
        ABRecordRef newPerson = ABPersonCreate();
        CFErrorRef error = NULL;
        ABRecordSetValue(newPerson, kABPersonFirstNameProperty, (__bridge CFTypeRef)(self.lastName.text), &error);
        ABRecordSetValue(newPerson, kABPersonLastNameProperty, (__bridge CFTypeRef)(self.firstName.text), &error);
        ABRecordSetValue(newPerson, kABPersonOrganizationProperty, @"Model Metrics", &error);
        ABRecordSetValue(newPerson, kABPersonJobTitleProperty, @"Senior Slacker", &error);
        
        //phone number
        ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)(self.phoneNum.text), kABPersonPhoneMainLabel, NULL);
        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)(self.phoneNum.text), kABPersonPhoneMobileLabel, NULL);
        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)(self.phoneNum.text), kABOtherLabel, NULL);
        ABRecordSetValue(newPerson, kABPersonPhoneProperty, multiPhone,&error);
        CFRelease(multiPhone);
        
        //email
        ABMutableMultiValueRef multiEmail = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        ABMultiValueAddValueAndLabel(multiEmail, @"johndoe@modelmetrics.com", kABWorkLabel, NULL);
        ABRecordSetValue(newPerson, kABPersonEmailProperty, multiEmail, &error);
        CFRelease(multiEmail);
        
        //address
        ABMutableMultiValueRef multiAddress = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
        NSMutableDictionary *addressDictionary = [[NSMutableDictionary alloc] init];
        [addressDictionary setObject:@"750 North Orleans Street, Ste 601" forKey:(NSString *) kABPersonAddressStreetKey];
        [addressDictionary setObject:@"Chicago" forKey:(NSString *)kABPersonAddressCityKey];
        [addressDictionary setObject:@"IL" forKey:(NSString *)kABPersonAddressStateKey];
        [addressDictionary setObject:@"60654" forKey:(NSString *)kABPersonAddressZIPKey];
        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABWorkLabel, NULL);
        ABRecordSetValue(newPerson, kABPersonAddressProperty, multiAddress,&error);
        CFRelease(multiAddress);
        
        ABAddressBookAddRecord(iPhoneAddressBook, newPerson, &error);
        ABAddressBookSave(iPhoneAddressBook, &error);
        if (error != NULL)
        {
            NSLog(@"Danger Will Robinson! Danger!");
        }

        
    }

}

@end

//
//  ViewControllerThird.h
//  myViewProject
//
//  Created by 채종운 on 2013. 12. 3..
//  Copyright (c) 2013년 NHN NEXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerThird : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *idField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)onRegisterButtonClick:(id)sender;

@end

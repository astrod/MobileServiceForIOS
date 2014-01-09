//
//  ViewControllerSecond.h
//  myViewProject
//
//  Created by 채종운 on 13. 11. 27..
//  Copyright (c) 2013년 NHN NEXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerSecond : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *idField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)loginSubmit:(id)sender;



@end

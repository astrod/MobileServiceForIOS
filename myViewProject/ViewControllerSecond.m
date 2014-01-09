//
//  ViewControllerSecond.m
//  myViewProject
//
//  Created by 채종운 on 13. 11. 27..
//  Copyright (c) 2013년 NHN NEXT. All rights reserved.
//

#import "ViewControllerSecond.h"

@interface ViewControllerSecond () <UITextFieldDelegate>

@end

@implementation ViewControllerSecond


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(didTap:)];
    [self.view addGestureRecognizer:tap]; //바깥부분을 클릭할 시 키보드가 사라지게 함
    
    _idField.delegate = self;
    _passwordField.delegate = self;
}

-(void)didTap:(UITapGestureRecognizer*)rec {
    [self.idField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField == _idField) {
        [UIView beginAnimations:@"MyAnimation" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        CGRect newframe = self.view.frame;
        newframe.origin.y = -80;
        self.view.frame = newframe;
        [UIView commitAnimations];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if(textField == _idField) {
        [UIView beginAnimations:@"MyAnimation" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        CGRect newframe = self.view.frame;
        newframe.origin.y = 0;
        self.view.frame = newframe;
        [UIView commitAnimations];
    }
    return YES;
}

#pragma mark - TextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == _idField) {
        [_idField resignFirstResponder];
        [_passwordField becomeFirstResponder];
    }
    else if (textField == _passwordField) {
        [_passwordField resignFirstResponder];
        [self loginSubmit:self];
    }
    return NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender { //id와 password를 판정하는 메소드;
//    
//}

//-(IBAction)returned:(UIStoryboardSegue*)segue {
//    
//}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"sender = %@, seque = %@", sender, segue);
//}



- (IBAction)loginSubmit:(id)sender {
}
@end

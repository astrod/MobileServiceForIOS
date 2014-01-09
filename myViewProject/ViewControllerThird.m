//
//  ViewControllerThird.m
//  myViewProject
//
//  Created by 채종운 on 2013. 12. 3..
//  Copyright (c) 2013년 NHN NEXT. All rights reserved.
//

#import "ViewControllerThird.h"
#import "NXDataModel.h"



@interface ViewControllerThird ()

@end

@implementation ViewControllerThird
{
    NXDataModel* _dataModel;
}
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
    _dataModel = [[NXDataModel alloc] init];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(didTap:)];
    [self.view addGestureRecognizer:tap]; //바깥부분을 클릭할 시 키보드가 사라지게 함
}

-(void)didTap:(UITapGestureRecognizer*)rec {
    [self.idField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onRegisterButtonClick:(id)sender {
    [_dataModel saveID:self.idField.text
    withPassword:self.passwordField.text];
}
@end

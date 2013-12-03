//
//  ViewControllerSecond.m
//  myViewProject
//
//  Created by 채종운 on 13. 11. 27..
//  Copyright (c) 2013년 NHN NEXT. All rights reserved.
//

#import "ViewControllerSecond.h"

@interface ViewControllerSecond ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)returned:(UIStoryboardSegue*)segue {
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"sender = %@, seque = %@", sender, segue);
//}

@end

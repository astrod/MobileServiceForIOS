//
//  ViewController.m
//  myViewProject
//
//  Created by 채종운 on 13. 11. 27..
//  Copyright (c) 2013년 NHN NEXT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)returned:(UIStoryboardSegue*)segue {

}

//-(void)perform {
//    if(self.unwind) {
//        ViewController *containerVC = (ViewController*)[self.UIViewController parentViewController];
//        
//        [containerVC popToViewController:self.UIViewController animated:YES];
//    }
//}

@end

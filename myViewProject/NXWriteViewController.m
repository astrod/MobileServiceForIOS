//
//  NXWriteViewController.m
//  myViewProject
//
//  Created by 채종운 on 2014. 1. 8..
//  Copyright (c) 2014년 NHN NEXT. All rights reserved.
//

#import "NXWriteViewController.h"

@interface NXWriteViewController ()

@end

@implementation NXWriteViewController

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
    _ImageView.image = _internalImage;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(didTap:)];
    [self.view addGestureRecognizer:tap]; //바깥부분을 클릭할 시 키보드가 사라지게 함
}

-(void)didTap:(UITapGestureRecognizer*)rec {
    [self.TextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareData:(UIImage *)image {
    _internalImage = image;
}

//-(void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image{
//    NXWriteViewController* writeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WriteViewController"];
//    [writeVC prepareData:image];
//    [editor dismissViewControllerAnimated:NO completion:nil];
//    [self.navigationController pushViewController:writeVC animated:NO];
//}


- (IBAction)OnSendClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

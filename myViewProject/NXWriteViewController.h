//
//  NXWriteViewController.h
//  myViewProject
//
//  Created by 채종운 on 2014. 1. 8..
//  Copyright (c) 2014년 NHN NEXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXWriteViewController : UIViewController {
    UIImage* _internalImage;
}

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UITextView *TextField;
- (IBAction)OnSendClick:(id)sender;

-(void)prepareData:(UIImage*)image;


@end

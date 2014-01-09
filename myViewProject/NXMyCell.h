//
//  NXMyCell.h
//  myViewProject
//
//  Created by 채종운 on 2014. 1. 7..
//  Copyright (c) 2014년 NHN NEXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXMyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UIImageView *Picture;
@property (weak, nonatomic) IBOutlet UILabel *endTitle;

@end

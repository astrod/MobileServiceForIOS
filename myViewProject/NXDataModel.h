//
//  NXDataModel.h
//  myViewProject
//
//  Created by 채종운 on 2014. 1. 6..
//  Copyright (c) 2014년 NHN NEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXDataModel : NSObject

-(void)saveID:(NSString*)userid withPassword:(NSString*)password;
-(BOOL)outhenticateID:(NSString*)userid withPassword:(NSString*)password;
-(NSDictionary*)objectAtIndex:(NSUInteger)index;
@property UITableViewController* tableController;
@end

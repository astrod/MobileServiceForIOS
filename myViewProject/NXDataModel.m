//
//  NXDataModel.m
//  myViewProject
//
//  Created by 채종운 on 2014. 1. 6..
//  Copyright (c) 2014년 NHN NEXT. All rights reserved.
//

#import "NXDataModel.h"

#define kID_KEY @"id";
#define kPASSWORD_KEY @"pwd"; //이렇게 키를 한번에 정의하는 경우가 많다.

@implementation NXDataModel
{
    NSArray* _itemArray;
    NSDictionary* _itemDictionary;
    NSMutableDictionary* _loginData;
}

-(BOOL)outhenticateID:(NSString*)userid withPassword:(NSString*)password {
    NSString *aFormData = [NSString stringWithFormat:@"id=%@passwd=%@",userid, password];
    NSString *aURLSTring=@"http://1.234.2.8/login.php";
    NSURL *aURL = [NSURL URLWithString:aURLSTring];
    NSMutableURLRequest * aRequest = [NSMutableURLRequest requestWithURL:aURL];
    [aRequest setHTTPMethod:@"POST"];
    [aRequest setHTTPBody:[aFormData dataUsingEncoding:NSUTF8StringEncoding]];
    NSHTTPURLResponse *aResponse;
    NSError *aError;
    NSData *aResultData = [NSURLConnection sendSynchronousRequest:aRequest returningResponse:&aResponse error:&aError];
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:aResultData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"login response = %d", aResponse.statusCode);
    
    NSLog(@"login result = %@", dataDictionary);

    if([dataDictionary[@"code"] isEqualToString:@"200"])
    {
        return TRUE;
    }
    else {
        return FALSE;
    }
}

-(void)saveID:(NSString*)userid withPassword:(NSString*)password; {
    [_loginData setObject:userid forKey:@"id"]; //setObject 는 벨류, @"id" 는 키
    [_loginData setObject:password forKey:@"password"]; //이하동일;
    
}

- (id)init {
    self = [super init];
    if(self) {
        _itemArray = [@[
                           @{@"text" : @"첫번째", @"image" : @"1.png"},
                           @{@"text" : @"두번째글", @"image" : @"2.png"},
                           @{@"text" : @"마지막", @"image" : @"3.png"},
                        ]mutableCopy];
//        _itemDictionary = @{@"name" : @"hana", @"age": @4, @"female" : @YES, @"Array": _itemArray};
        //NSMutableDictionary *_newArray = [@[@"apple"] mutableCopy];
        _loginData = [[NSMutableDictionary alloc] initWithCapacity:2];
    }
    return self;
} //생성자를 생성하는 법. init Method를 드래그 앤 드롭하는 걸로도 만들어 낼 수 있다.

-(NSDictionary*)objectAtIndex:(NSUInteger)index {
    return _itemArray[index];
}

-(NSString*)description //객체의 설명을 해주는 메소드
{
    return _itemArray.description; //string으로 리턴이 댐
    return _itemDictionary.description;
}





@end

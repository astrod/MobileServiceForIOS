//
//  NXTableViewController.m
//  myViewProject
//
//  Created by 채종운 on 2014. 1. 7..
//  Copyright (c) 2014년 NHN NEXT. All rights reserved.
//

#import "NXTableViewController.h"
#import "NXDataModel.h" // 1; import
#import "NXMyCell.h"
#import "UIImageView+WebCache.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "CLImageEditor.h"
#import "NXWriteViewController.h"

@interface NXTableViewController () <UIImagePickerControllerDelegate, CLImageEditorDelegate>

@end

@implementation NXTableViewController
{
    NXDataModel* _dataModel; //2; 선언
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
    _dataModel = [[NXDataModel alloc] init]; //3; 초기화
	// Do any additional setup after loading the view.
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(newImage:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)newImage:(id)sender {
    UIImagePickerController *picker =[[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self.navigationController presentViewController:picker animated:YES completion:^{}];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if([mediaType isEqualToString:(__bridge id)kUTTypeImage])
    {
        UIImage* aImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        //
        CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:aImage];
        editor.delegate = self;
        [picker pushViewController:editor animated:YES];
        
        UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"이미지" message:@"골랐어요" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        alertView1.alertViewStyle = UIAlertViewStyleDefault;
        [alertView1 show];
    }
}

#pragma mark- CLImageEditor delegate

-(void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image{
    //image 사용
    [editor dismissViewControllerAnimated:YES completion:nil];
    NXWriteViewController* writeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WriteViewController"];
    [writeVC prepareData:image];
    [editor dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController pushViewController:writeVC animated:NO];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - DataSource
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* item = [_dataModel objectAtIndex:indexPath.row];
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    NXMyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
//    cell.textLabel.text = [item objectForKey:@"text"];
//    cell.detailTextLabel.text = [item objectForKey:@"image"];
    cell.Title.text = [item objectForKey:@"text"];
    [cell.Picture setImageWithURL:[NSURL URLWithString:@"http://1.234.2.8/img/1.jpg"]];
    cell.endTitle.text = [item objectForKey:@"image"];
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"goToDetailPage" sender:self];
}

@end

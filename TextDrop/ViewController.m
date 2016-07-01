//
//  ViewController.m
//  TextDrop
//
//  Created by macavilang on 16/7/1.
//  Copyright © 2016年 Snoopy. All rights reserved.
//

#import "ViewController.h"
#import "GCMDropList.h"

@interface ViewController ()<UITextFieldDelegate,GCMDropListDelegate>

@end

@implementation ViewController
{
    UITextField *_textField;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 250, 50)];
    _textField.delegate =self;
    _textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_textField];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.view endEditing:YES];
    GCMDropList *list = [[GCMDropList alloc] initWithFrameEqualTo:_textField];
    list.delegate = self;
    
}

- (void)dropListDidDismissGetData:(NSString *)string
{
    _textField.text = string;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

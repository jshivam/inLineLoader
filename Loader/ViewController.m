//
//  ViewController.m
//  Loader
//
//  Created by Shivam Jaiswal on 10/9/16.
//  Copyright © 2016 AppStreet Software Pvt. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "LoaderView.h"

@interface ViewController ()
@property (nonatomic, strong) LoaderView *loader;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.loader = [[LoaderView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_loader];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.loader.center = self.view.center;
}


@end

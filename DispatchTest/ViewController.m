//
//  ViewController.m
//  DispatchTest
//
//  Created by Johnny Sparks on 12/10/14.
//  Copyright (c) 2014 Johnny Sparks. All rights reserved.
//

#import "ViewController.h"

static NSString *staticString = @"some const value string to referece";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dictionary;
    NSString *string;
    NSDate *staticStart = [NSDate date];
    NSLog(@"start timing");
    int times = 10000000;
    while (times--) {
        static dispatch_once_t onceToken;
        static NSDictionary *dict;
        dispatch_once(&onceToken, ^{
            dict = @{@"somekey":@"someotherlongvalue", @"someotherkey":@"someotherlongvalue", @"onelastkey":@"onelastvalue"};
        });
        dictionary = dict;
    }
    NSDate *staticEnd = [NSDate date];
    NSLog(@"finished static dict in %f sec", [staticEnd timeIntervalSinceDate:staticStart]);
    
    times = 10000000;
    while (times--) {
        dictionary = @{@"somekey":@"someotherlongvalue", @"someotherkey":@"someotherlongvalue", @"onelastkey":@"onelastvalue"};
    }
    
    NSDate *dictEnd = [NSDate date];
    NSLog(@"finished dict create in %f sec", [dictEnd timeIntervalSinceDate:staticEnd]);

    times = 10000000;
    while (times--) {
        static dispatch_once_t stringOnceToken;
        static NSString *dispatchString;
        dispatch_once(&stringOnceToken, ^{
            dispatchString = @"someotherlongvalue";
        });
        string = dispatchString;
    }
    NSDate *staticStringEnd = [NSDate date];
    NSLog(@"finished static string in %f sec", [staticStringEnd timeIntervalSinceDate:dictEnd]);
    times = 10000000;
    while (times--) {
        string = @"someotherlongvalue";
    }
    NSDate *stringEnd = [NSDate date];
    NSLog(@"finished string create in %f sec", [stringEnd timeIntervalSinceDate:staticStringEnd]);
    times = 10000000;
    while (times--) {
        string = staticString;
    }
    NSDate *refEnd = [NSDate date];
    NSLog(@"finished string reference in %f sec", [refEnd timeIntervalSinceDate:stringEnd]);
}

@end
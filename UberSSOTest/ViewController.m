//
//  ViewController.m
//  UberSSOTest
//
//  Created by Lee Hasiuk on 1/29/18.
//  Copyright © 2018 Migo. All rights reserved.
//

#import "ViewController.h"
@import UberCore;

@interface ViewController () <UBSDKLoginButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray<UBSDKScope *> *scopes = @[UBSDKScope.profile];
    
    UBSDKLoginManager *loginManager = [[UBSDKLoginManager alloc] initWithLoginType:UBSDKLoginTypeNative];
    
    UBSDKLoginButton *loginButton = [[UBSDKLoginButton alloc] initWithFrame:CGRectZero scopes:scopes loginManager:loginManager];
    loginButton.presentingViewController = self;
    [loginButton sizeToFit];
    loginButton.delegate = self;
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

- (void)loginButton:(UBSDKLoginButton *)button didLogoutWithSuccess:(BOOL)success {
    NSLog(@"signed out");
}

- (void)loginButton:(UBSDKLoginButton *)button didCompleteLoginWithToken:(UBSDKAccessToken *)accessToken error:(NSError *)error {
    if (accessToken) {
        NSLog(@"success, token %@", accessToken.tokenString);
    } else if (error) {
        NSLog(@"failed, error %@", error);
    }
}


@end

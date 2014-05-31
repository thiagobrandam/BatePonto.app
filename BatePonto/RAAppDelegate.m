//
//  RAAppDelegate.m
//  BatePonto
//
//  Created by thiago on 5/27/14.
//  Copyright (c) 2014 redealumni. All rights reserved.
//

#import "RAAppDelegate.h"
#import "NSRails.h"

@implementation RAAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSRConfig *defaultConfig = [NSRConfig defaultConfig];
    
    [defaultConfig setAppURL:@"http://localhost:3000"];
    
}

- (IBAction)retrievePunches:(id)sender
{
    NSError *error;
    
    NSRRequest *request
    = [[NSRRequest GET] routeTo:@"/api/punches"];
    
    // AuthorizationSettings.plist in Supporting Files
    // Containing a KV pair "API Token" - "Value of API Token"
    NSString *authSettingsFile = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"AuthorizationSettings.plist"];
    
    NSDictionary *authSettings = [NSDictionary dictionaryWithContentsOfFile:authSettingsFile];
    
    request.queryParameters = @{
       @"user_token": @"02c8957ff68e21b24ac46004a6a0790b",
       @"api_token": authSettings[@"API Token"]
    };
    
    
    [request sendSynchronous:&error];    
    
}

@end

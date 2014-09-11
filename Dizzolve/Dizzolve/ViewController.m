//
//  ViewController.m
//  Dizzolve
//
//  Created by Leo Mdivani on 11/09/2014.
//  Copyright (c) 2014 Dizzolve. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize  spinner;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Allocate a reachability object
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Set the blocks
    reach.reachableBlock = ^(Reachability*reach)
    {
        // keep in mind this is called on a background thread
        // and if you are updating the UI it needs to happen
        // on the main thread, like this:
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"REACHABLE!");
        });
    };
    
    reach.unreachableBlock = ^(Reachability*reach)
    {
        NSLog(@"UNREACHABLE!");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Dizzolve" message:@"Dizzolve requires a good internet connection, please connect to the internet." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    };
    
    // Start the notifier, which will cause the reachability object to retain itself!
    [reach startNotifier];
    
    NSString *dizzolveURL = @"http://www.dizzolve.co.uk";
    NSURL *url = [NSURL URLWithString:dizzolveURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_DizzolveWebView loadRequest:requestObj];
    _DizzolveWebView.scrollView.bounces = NO;
    [_DizzolveWebView setDelegate:self];
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
//    [labelLoading setHidden:NO];
    spinner.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    [labelLoading setHidden:YES];
    spinner.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

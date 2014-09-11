//
//  ViewController.h
//  Dizzolve
//
//  Created by Leo Mdivani on 11/09/2014.
//  Copyright (c) 2014 Dizzolve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  ViewController  : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *DizzolveWebView;

@property (weak, nonatomic) IBOutlet UIImageView *loadingImage;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

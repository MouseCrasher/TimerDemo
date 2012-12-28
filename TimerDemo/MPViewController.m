//
//  MPViewController.m
//  TimerDemo
//
//  Created by infoshore on 17/12/12.
//  Copyright (c) 2012 infoshore. All rights reserved.
//

#import "MPViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface MPViewController ()

@end

@implementation MPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // [self.view setBackgroundColor:[UIColor whiteColor]];
    label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
    [label setText:@"Hello! its timer"];
    [self.view addSubview:label];
    [self performSelector:@selector(hideLabel) withObject:self afterDelay:1];
    
    labelTimer = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 200, 20)];
    [labelTimer setText:@"Timer Right Now"];
    [self.view addSubview:labelTimer];
    
    dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH : mm : ss.S"];
    NSDate *today = [[NSDate alloc]init];
    NSString *currentDate = [dateFormatter stringFromDate:today];
    labelTimer.text = currentDate;
    
    NSLog(@"%@",[[NSRunLoop currentRunLoop] description]);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    pollingtimer = [NSTimer scheduledTimerWithTimeInterval:(1/10) target:self selector:@selector(pollTime) userInfo:nil repeats:YES];
}

- (void)showLabel
{
    [label setText:@"Hello! its timer"];
    [self performSelector:@selector(hideLabel) withObject:self afterDelay:1];
}

- (void)hideLabel
{
    [label setText:@""];
    [self performSelector:@selector(showLabel) withObject:self afterDelay:1];
}


- (void) pollTime
{
    NSDate *today = [[NSDate alloc] init];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    labelTimer.text = currentTime;
    NSLog(@"%@",[[NSRunLoop currentRunLoop] description]);
    
/*    NSString *postStr = [NSString stringWithFormat:@"xml_request=<?xml version='1.0' encoding='UTF-8'?><category><Id>1</Id><Data>;pList</Data></category>"];
    NSString *urlString =[NSString stringWithFormat:@"http://global.thinlenses.co.uk/virtualMirror/productlisting.php"];
    NSURL *url= [NSURL URLWithString:urlString];
    NSString *contentType = [NSString stringWithFormat:@"text/xml"];
    
    NSData *postData = [postStr dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:url];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
 */
}
@end

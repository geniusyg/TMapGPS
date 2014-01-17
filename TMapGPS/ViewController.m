//
//  ViewController.m
//  TMapGPS
//
//  Created by SDT-1 on 2014. 1. 17..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "TMapView.h"

@interface ViewController () <TMapGpsManagerDelegate>

@property TMapGpsManager *gpsManager;
@property TMapView *mapView;

@end

@implementation ViewController

#pragma GPS Manager`s Delegate

- (void)locationChanged:(TMapPoint *)newTmp {
	NSLog(@"Location Changed %@", newTmp);
	[_mapView setCenterPoint:newTmp];
}

- (void)headingChanged:(double)heading {
	
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	CGRect rect = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44);
	
	_mapView = [[TMapView alloc] initWithFrame:rect];
	[_mapView setSKPMapApiKey:@"86a2bcf5-5df8-3727-a7b2-55957bfda634"];
	
	_mapView.zoomLevel = 12.0;
	
	[self.view addSubview:_mapView];
	
	[_gpsManager setDelegate:self];

	
}
- (IBAction)switchGPS:(id)sender {
	UISwitch *_switch = (UISwitch *)sender;
	
	if(YES == _switch.on) {
		[_gpsManager openGps];
	} else {
		[_gpsManager closeGps];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

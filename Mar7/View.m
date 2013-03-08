//
//  View.m
//  Feb28
//
//  Created by Salvatore Lentini on 2/27/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
// Fromn OZ

#import "View.h"
#import "JProbeView.h"
@implementation View


- (void) pinch: (UIPinchGestureRecognizer *) recognizer
{
	label.bounds = CGRectMake(
                              (self.bounds.size.width - width * recognizer.scale) / 2,
                              (self.bounds.size.height - height * recognizer.scale) / 2,
                              width * recognizer.scale,
                              height * recognizer.scale
                              );
	
	label.font = [UIFont systemFontOfSize: 20 * recognizer.scale];
	NSString *verdict;
	
	if (recognizer.scale > oldScale) {
		verdict = @"spread";
	} else if (recognizer.scale < oldScale) {
		verdict = @"pinch";
	} else {
		verdict = @"ouch";
	}
	oldScale = recognizer.scale;
    
	label.text = [NSString stringWithFormat: @"%@ %g",
                  verdict, recognizer.scale
                  ];
}


- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor clearColor];
		width = self.bounds.size.width / 2;
		height = width / 2;
        
//		CGRect f = CGRectMake(
//                              (self.bounds.size.width - width) / 2,
//                              (self.bounds.size.height - height) / 2,
//                              width,
//                              height
//                              );
//        
//		label = [[UILabel alloc] initWithFrame: f];
//		label.textAlignment = UITextAlignmentCenter;
//		label.backgroundColor = [UIColor yellowColor];
//
        
        
        UIImage * jpImage = [UIImage imageNamed: @"jprobe.png"];
        jprobeView = [[JProbeView alloc] initWithImage: jpImage];
        
        
		UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(pinch:)
                                                ];
        
		oldScale = recognizer.scale;
        [label setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"jprobe.png"]]];
		[self pinch: recognizer];
		[self addGestureRecognizer: recognizer];
		[self addSubview: jprobeView];
        
	}
	return self;
}
- (void)drawRect:(CGRect)rect
{
    //The actor George C. Scott played General George S. Patton (1970).
    UIImage * image = [UIImage imageNamed: @"Jupiter.png"];	//100 by 100
    if (image == nil) {
        NSLog(@"could not find the image");
        return;
    }
    
    //upper left corner of image
    CGPoint point = CGPointMake(0,0 );
    
    
    [image drawAtPoint: point];
}
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        jprobeView.center = point;	//Move the littleView to a new location.
        
        //Can combine the above three statements to
        //littleView.center = [[touches anyObject] locationInView: self];
    }
}
@end

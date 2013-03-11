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
    NSLog( @"Pinch Me");
	NSString *verdict;
	
	if (recognizer.scale > oldScale) {
		verdict = @"spread";
	} else if (recognizer.scale < oldScale) {
		verdict = @"pinch";
	} else {
		verdict = @"ouch";
	}
	oldScale = recognizer.scale;
    NSLog ( @"Jupiter Scale %g", oldScale );
    self.bounds = CGRectMake(
                             self.bounds.origin.x,
                             self.bounds.origin.y,
                             self.bounds.size.width * oldScale,
                             self.bounds.size.height * oldScale
                             );
    
    
}


- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor clearColor];
		width = self.bounds.size.width / 2;
		height = width / 2;
        

        
        jpImage = [UIImage imageNamed: @"jprobe.png"];
        
        jprobeView = [[JProbeView alloc] initWithImage: jpImage];
        
        
		UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(pinch:)
                                                ];
        
		oldScale = recognizer.scale;
        [label setBackgroundColor:[UIColor colorWithPatternImage:jpImage]];
		[self pinch: recognizer];
		[self addGestureRecognizer: recognizer];
		[self addSubview: jprobeView];
        
	}
	return self;
}
- (void)drawRect:(CGRect)rect
{
    //The actor George C. Scott played General George S. Patton (1970).
    jpImage = [UIImage imageNamed: @"Jupiter.png"];	//100 by 100
    if (jpImage == nil) {
        NSLog(@"could not find the image");
        return;
    }
    
    //upper left corner of image
    CGPoint point = CGPointMake(0,0 );
    
    
    [jpImage drawAtPoint: point];
}
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
 //       CGPoint point = [touch locationInView: self];
        //jprobeView.center = point;	//Move the littleView to a new location.
        
		[UIView animateWithDuration: 1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             //This block describes what the animation should do.
                             jprobeView.center = [[touches anyObject] locationInView: self];
                         }
                         completion: ^(BOOL b) {
                             [UIView animateWithDuration: 1.0
                                                   delay: 0.0
                                                 options: UIViewAnimationOptionCurveEaseInOut
                                              animations: ^{
                                                  //This block describes what the animation should do.
                                                  jprobeView.center =CGPointMake(50, 50);
                                              }
                                              completion: NULL
                              ];
                         }
         ];
    }
}
@end

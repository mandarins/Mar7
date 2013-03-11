//
//  View.h
//  Mar 7
//
//  Created by Salvatore Lentini on 3/07/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//


#import <UIKit/UIKit.h>
@class JProbeView;
@interface View: UIView {
	CGFloat oldScale;	//wider or narrower?
    
	UILabel *label;
	CGFloat width;	//of label
	CGFloat height;
    JProbeView *jprobeView;
    UIImage * jpImage;
}

@end


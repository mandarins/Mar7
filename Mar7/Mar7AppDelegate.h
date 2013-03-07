//
//  Mar7AppDelegate.h
//  Mar7
//
//  Created by Salvatore Lentini on 3/5/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;
@class JProbeView;

@interface Mar7AppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;

    UIWindow *_window;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@property (strong, nonatomic) UIWindow *window;
@end




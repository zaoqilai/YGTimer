//
//  NSTimer+WeakTimer.m
//  NSTimer
//
//  Created by 造起来 on 2021/11/24.
//

#import "NSTimer+WeakTimer.h"

@interface WeakTimerObject: NSObject

@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, weak) id target;

@property (nonatomic, assign) SEL selector;

- (void)fire:(NSTimer *)timer;

@end

@implementation WeakTimerObject

- (void)fire:(NSTimer *)timer{
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            [self.target performSelector:self.selector withObject:timer.userInfo];
        }
    }else{
        [self.timer invalidate];
    }
}

@end


@implementation NSTimer (WeakTimer)

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti target:(id)target selector:(SEL)selector userInfo:(nullable id)userInfo repeats:(BOOL)repeats{
    
    WeakTimerObject *object = [[WeakTimerObject alloc] init];
    object.target = target;
    object.selector = selector;
    object.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:object selector:@selector(fire:) userInfo:userInfo repeats:repeats];
    return object.timer;
    
}


@end

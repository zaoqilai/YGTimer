//
//  NSTimer+WeakTimer.h
//  NSTimer
//
//  Created by 造起来 on 2021/11/24.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WeakTimer)

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti target:(id)target selector:(SEL)selector userInfo:(nullable id)userInfo repeats:(BOOL)repeats;

@end



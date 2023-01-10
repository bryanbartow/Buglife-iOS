//
//  LIFEDisclosureIndicator.m
//  Copyright (C) 2023 Buglife, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//

#import <Foundation/Foundation.h>
#import "LIFEDisclosureIndicator.h"

@interface LIFEDisclosureIndicator ()

@property(nonatomic) CGFloat red;
@property(nonatomic) CGFloat green;
@property(nonatomic) CGFloat blue;
@property(nonatomic) CGFloat alpha;

@end

@implementation LIFEDisclosureIndicator

- (void)drawRect:(CGRect)rect {
    // (x,y) is the tip of the arrow
    CGFloat x = CGRectGetMaxX(self.bounds)-3.0;
    CGFloat y = CGRectGetMidY(self.bounds);
    const CGFloat R = 4.5;
    CGContextRef ctxt = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctxt, x-R, y-R);
    CGContextAddLineToPoint(ctxt, x, y);
    CGContextAddLineToPoint(ctxt, x-R, y+R);
    CGContextSetLineCap(ctxt, kCGLineCapSquare);
    CGContextSetLineJoin(ctxt, kCGLineJoinMiter);
    CGContextSetLineWidth(ctxt, 3);

    CGContextStrokePath(ctxt);
}

- (LIFEDisclosureIndicator *)initWithColor:(UIColor *)color {
    self = [super initWithFrame:CGRectMake(0, 0, 16, 24)];
    self.backgroundColor = [UIColor clearColor];

    self.color = color;
    [self setNeedsDisplay];

    return self;
}

- (void)setColor:(UIColor *)color {
    _color = color;

    [self.color getRed:&_red green:&_green blue:&_blue alpha:&_alpha];

    [self setNeedsDisplay];
}

@end

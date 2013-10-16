# UIView+RevealAnimation

Marginally useful UView category that allows revealing a view by animating a shape mask. Currently supports Ellipse or Rect mask


## Usage

```objc
#import "UIView+RevealAnimation.h"

/* ... */

UIView *toReveal = [[UIView alloc] initWithFrame:CGRectMale(0, 0, 100, 100)];
toReveal.backgroundColor = [UIColor redColor];

// Convenience method
[toReveal RA_animateRevealWithDuration:0.3];

// Config method
[toReveal RA_animateRevealWithDuration:0.3
                                    maskType:RAMaskRectangle
                                    delay:0.3
                               startScale:0
                                 endScale:1.0
                            completeBlock:^(BOOL stopped){
                            	NSLog(@" animation stopped");
                            }];
```

## History

TODO: Write history

## License


The MIT License (MIT)

Copyright (c) [2013] [Adrian Geana]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

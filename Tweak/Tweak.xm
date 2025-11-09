%hook SBLockScreenViewController

- (void)viewDidLoad {
    %orig;

    UIView *lockView = self.view;

    UILabel *slideLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, lockView.bounds.size.height - 100, lockView.bounds.size.width, 50)];
    slideLabel.text = @"Slide to unlock";
    slideLabel.textAlignment = NSTextAlignmentCenter;
    slideLabel.textColor = [UIColor whiteColor];
    slideLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightLight];
    slideLabel.alpha = 0.8;
    [lockView addSubview:slideLabel];

    CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fade.fromValue = @(0.2);
    fade.toValue = @(1.0);
    fade.duration = 1.5;
    fade.autoreverses = YES;
    fade.repeatCount = HUGE_VALF;
    [slideLabel.layer addAnimation:fade forKey:@"fade"];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSlide:)];
    [lockView addGestureRecognizer:pan];
}

%new
- (void)handleSlide:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:self.view];
    if (translation.x > 200) {
        [[%c(SBLockScreenManager) sharedInstance] unlockUIFromSource:0];
    }
}

%end

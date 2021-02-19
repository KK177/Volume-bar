//
//  ViewController.m
//  音量震动条
//
//  Created by MacBook pro on 2021/2/19.
//

#import "ViewController.h"
#import "VoiceView.h"

@interface ViewController ()

@property (nonatomic, strong)VoiceView *voiceView;

@end

@implementation ViewController

- (VoiceView *)voiceView {
    if (!_voiceView) {
        _voiceView = [[VoiceView alloc] init];
    }
    return _voiceView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
}

- (void)setUI {
    [self.view addSubview:self.voiceView];
}

@end

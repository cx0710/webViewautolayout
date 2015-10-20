//
//  ViewController.m
//  webViewautoLayout
//
//  Created by 蔡向南 on 15/10/19.
//  Copyright (c) 2015年 蔡向南. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
{
    UIWebView *myWebView;
    UIScrollView *myScrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
    myWebView.delegate = self;
    myWebView.scrollView.bounces = NO;
    myWebView.scrollView.scrollEnabled = NO;

    NSLog(@"saaaa");
    
//    [self.view addSubview:myWebView];
    [myWebView loadHTMLString:@"<p><span style=\"font-size:16px;font-family:宋体;color:#333333\">Febo</span><span style=\"font-size:16px;font-family:宋体;color:#333333\">是由Rosalia Galeano 等三位意大利创作者共同带来的作品，她们基于“利用基本的自然原则创造永恒艺术”的产品理念，设计出这个可以直接利用太阳光作画的简单工具。</span></p><p><span style=\"font-size:16px;font-family:宋体;color:#333333\"><br/></span></p><p><span style=\"font-size:16px;font-family:宋体;color:#333333\"><img src=\"http://img.ilohas.com/upload/ueditor/php/upload/image/20151014/1444817089355856.png\" title=\"1444817089355856.png\" alt=\"2_副本.png\"/></span></p><p><span style=\"font-size:16px;font-family:宋体;color:#333333\">运用类似于放大镜的原理，Febo通过镜面聚焦将太阳的能量集中到木材、软木、胶合板或皮革等选定的画布上，配合随赠的模板，让原本无形的阳光变为你手中可以掌握的画笔。</span></p><p><span style=\"font-size:16px;font-family:宋体;color:#333333\"><br/></span></p><p><span style=\"font-size:16px;font-family:宋体;color:#333333\"><img src=\"http://img.ilohas.com/upload/ueditor/php/upload/image/20151014/1444817121602043.png\" title=\"1444817121602043.png\" alt=\"4.png\"/></span></p><p><span style=\"font-size:16px;font-family:宋体;color:#333333\"><img src=\"http://img.ilohas.com/upload/ueditor/php/upload/image/20151014/1444817433656395.jpg\" title=\"1444817433656395.jpg\" alt=\"5.jpg\"/>木材和玻璃的组合，使得它精致和耐用；贴心的设计使几乎所有年龄的人都能轻松上手、简单作画。</span></p><p><span style=\"font-size:16px;font-family:宋体;color:#333333\"><br/></span></p><p><img src=\"http://img.ilohas.com/upload/ueditor/php/upload/image/20151014/1444817388687312.jpg\" style=\"\" title=\"1444817388687312.jpg\"/></p><p><img src=\"http://img.ilohas.com/upload/ueditor/php/upload/image/20151014/1444817388439037.png\" style=\"\" title=\"1444817388439037.png\"/></p><p><span style=\"line-height: 1.7;\"><span style=\"color: rgb(51, 51, 51); font-family: 宋体; line-height: 27px;\">而在高效的聚焦下，只需在阳台上花上几分钟，就可以在自己喜爱的物品上留上个性化的印记。</span></span></p><p><span style=\"line-height: 1.7;\">（选编自网络）</span><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>" baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView stringByEvaluatingJavaScriptFromString:
     @"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function ResizeImages() { "
     "var myimg,oldwidth;"
     "var maxwidth = window.screen.availWidth-15;" // UIWebView中显示的图片宽度
     "for(i=0;i <document.images.length;i++){"
     "myimg = document.images[i];"
     "if(myimg.width > maxwidth){"
     "oldwidth = myimg.width;"
     "myimg.width = maxwidth;"
     "}"
     "}"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
    //
    NSString *meta = [NSString stringWithFormat:@"document.getElementsByName(\"viewport\")[0].content = \"width=self.view.frame.size.width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\""];
    [webView stringByEvaluatingJavaScriptFromString:meta];


    NSString *height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    int height = [height_str intValue];
    webView.frame = CGRectMake(0,200,self.view.frame.size.width,height+100);
    
    
   
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
    myScrollView.contentSize = CGSizeMake(self.view.frame.size.width, myWebView.frame.size.height + 300);
    [myScrollView addSubview:myWebView];
    
}
@end

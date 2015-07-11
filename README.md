![image](./CFRuntime/show.png)<br />


CFRuntime 只要你会用MJExtension，你会马上上手CFRuntime！
==========

    运行时、反射与一键字典模型互转

<br /><br />
组织信息 Charlin Feng：
===============
<br />
#### 特别群：请西部省市朋友实名加入组织。其他地区朋友请添加2-4群：谢谢。
<br />
【西部区域】西部大开发群号： 473185026  -追赶北上广！为振兴西部IT而努力！<br />
热烈欢迎中国西部各省市的从事iOS开发朋友实名进群！本群为是聚集西部零散开发者，大家齐心协力共进退！ <br /><br />

【全国可加】四群： 347446259<br />
新开，可加！欢迎全国朋友加入组织 <br /><br />

【全国可加】三群： 474377358<br />
新开，可加！欢迎全国朋友加入组织 <br /><br />

【全国可加】二群： 369870753<br />
可加<br /><br />

【全国可加】一群：163865401<br />
已爆满，加不上了<br /><br />

<br /><br /><br />

框架说明：EXPLAIN
===============
<br/><br/>
>.1.这个框架是做什么的？
这个框架可以理解为MJExtension的Swift版本，主要是实现类反射，
并在实现反射功能的基础上实现字典-模型一键互转！

MJExtension(OC): https://github.com/CoderMJLee/MJExtension

<br/><br/>
>.2.这个框架是对MJExtension的纯Swift翻译吗？
不是的，虽然两者功能一致，但底层完全不一样。在反射这块上基本代码无任何相同点，只是最终功能效果一致。
在字典-模型一键互转这点上，思路是一致的，都是站在反射功能上实现。

<br/><br/>
>.3.Swift中有Runtime吗？
OC中的Runtime在Swift中经过我多次测试，发现是可以用的（但结果比较稀奇古怪），不过Swift底层发动比较大，
而且本身Swift已经不主张Runtime运行时机制，在Swift中是叫Reflect反射，基本可以认为Runtime已经不好用了。

<br/><br/>
>.4.框架为什么要加CFRuntime？
CF是Charlin Feng的缩写，Runtime主要是我非常这个OC这个特性，就算Swift叫Reflect，但我个人仍想延续经典。


<br/><br/>
>.5.框架是如何写出来的？
这个问题比较综合了，因为我公司正式项目已经全部Swift化，但个人对MJExtension依赖太深，同时写了大量延伸框架
，对这套框架需求迫切！最近也在研究Reflect，在参考了国外大量资料和别人的作品，综合MJExtension的理念，
从昨天晚上（2015.07.10 19点）开始连续工作10多个小时写出了这套框架，力求API与MJExtension保持高度一致，
只要你会用MJExtension，你会马上上手CFRuntime！

















##北理FTP联盟定时自动刷贴

### 计划实现
>1. 将登录的cookie记录（设置一年有效期），模拟浏览器登录

>2. 找到需要顶的帖子，竞争对手的帖子和一些用来顶贴的帖子，记录所需要的内容

>3. 将竞争对手顶贴出去，将自己顶贴出来

>4. 按照不同的时间段来进行不同的顶贴处理

### 进展

>1. cookie登录，自己顶贴

>2. 现在还没确定竞争对手帖子，代码已经可以区分首页中是否含有竞争对手帖子。自己手动找到确定后直接记录在setting中，可用注释代码进行测试

>3. 现在还未找到帖子，为了保障联盟帖子的纯净，下一步需要将最新的非竞争对手帖子爬出来，而非指定某些帖子。可用注释代码测试

###部署[heroku--sinatra](http://heroku.com/)

>1. 50.19.85.132 www.heroku.com

>2. heroku login

>3. git init

>4. heroku git:remote -a appname

>5. git add .  | git commit 

>6. git push heroku master

###note

heroku app 会在一个小时后有休眠的可能性，为保证正常使用，如下两个网站可以使用：

>1. https://uptimerobot.com

>2. http://jk.cloud.360.cn/








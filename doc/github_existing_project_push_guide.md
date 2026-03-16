# 已存在项目推送到 GitHub 操作记录

作者：曾袁任\
日期：2026-03-16

------------------------------------------------------------------------

# 一、背景

当前情况：

-   本地已经存在一个完整项目（例如 `makefile_demo`）
-   本地尚未初始化 Git 仓库
-   GitHub 上也尚未创建远程仓库

目标：

> 将 **已经存在的本地项目直接推送到 GitHub 仓库进行版本管理**。

------------------------------------------------------------------------

# 二、环境准备

需要安装以下工具：

1.  Git
2.  VSCode（可选，但推荐）
3.  GitHub 账号

## 检查 Git 是否安装

在终端执行：

``` bash
git --version
```

如果返回版本号，例如：

    git version 2.x.x

说明 Git 已正确安装。

------------------------------------------------------------------------

# 三、整体流程

已经存在项目时的标准流程：

    本地项目
       ↓
    git init
       ↓
    git add
       ↓
    git commit
       ↓
    GitHub 创建仓库
       ↓
    git remote add origin
       ↓
    git push

注意：

**这种情况不需要 clone 仓库。**

clone 只用于：

    远程仓库 → 下载到本地

而本案例是：

    本地项目 → 上传到远程

------------------------------------------------------------------------

# 四、具体操作步骤

假设项目路径：

    C:\test\makefile_demo

## 1 初始化 Git 仓库

进入项目目录：

``` bash
git init
```

作用：

-   创建 `.git` 目录
-   当前项目开始由 Git 管理

------------------------------------------------------------------------

## 2 添加文件到 Git

``` bash
git add .
```

含义：

-   将当前目录所有文件加入 Git 暂存区

------------------------------------------------------------------------

## 3 创建第一次提交

``` bash
git commit -m "initial commit"
```

此时本地仓库已经创建完成。

------------------------------------------------------------------------

## 4 在 GitHub 创建仓库

登录 GitHub

创建新仓库：

    New Repository

填写：

    Repository name: makefile-demo
    Public / Private: 自选

注意：

不要勾选：

    Add README
    Add .gitignore
    Add License

否则可能产生冲突。

创建完成后获得仓库地址，例如：

    https://github.com/zengyuanren/makefile-demo.git

或者：

    git@github.com:zengyuanren/makefile-demo.git

------------------------------------------------------------------------

## 5 关联远程仓库

``` bash
git remote add origin https://github.com/zengyuanren/makefile-demo.git
```

查看远程仓库：

``` bash
git remote -v
```

------------------------------------------------------------------------

## 6 设置主分支

``` bash
git branch -M main
```

------------------------------------------------------------------------

## 7 推送到 GitHub

``` bash
git push -u origin main
```

成功后 GitHub 就能看到项目代码。

------------------------------------------------------------------------

# 五、本次遇到的问题

最初执行：

    git push -u origin main

出现错误：

    fatal: unable to access 'https://github.com/...':
    Failed to connect to github.com port 443

错误原因：

-   HTTPS 方式访问 GitHub 连接异常

虽然：

    ping github.com

是正常的，但 Git HTTPS 连接仍然失败。

------------------------------------------------------------------------

# 六、解决方法

改用 **SSH 方式推送仓库**。

## 修改远程仓库地址

    git remote set-url origin git@github.com:zengyuanren/makefile-demo.git

再次执行：

    git push -u origin main

成功输出：

    [new branch] main -> main
    branch 'main' set up to track 'origin/main'

说明：

-   本地 main 分支已成功推送
-   本地分支已与远程分支建立跟踪关系

------------------------------------------------------------------------

# 七、后续日常开发流程

以后每次修改代码只需要执行：

    git add .
    git commit -m "update description"
    git push

标准开发流程：

    修改代码
       ↓
    git add
       ↓
    git commit
       ↓
    git push

------------------------------------------------------------------------

# 八、常用 Git 命令

## 查看仓库状态

    git status

## 查看提交历史

    git log --oneline

## 查看远程仓库

    git remote -v

------------------------------------------------------------------------

# 九、建议添加 .gitignore

Makefile 或 C 项目建议忽略：

    build/
    *.o
    *.d
    *.elf
    *.map
    *.bin
    *.out
    .vscode/

避免将编译文件上传到仓库。

------------------------------------------------------------------------

# 十、总结

已经存在项目上传 GitHub 的核心步骤：

    git init
    git add .
    git commit
    git remote add origin <repo>
    git branch -M main
    git push -u origin main

如果 HTTPS push 出现问题，可以改为：

    SSH 推送
    git@github.com:user/repo.git

这种方式通常更加稳定。

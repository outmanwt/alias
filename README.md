# alias
一些便携的alias

- pfind: pfind xxx # 查找xxx进程
- hfind: hfind xxx # 查找xxx历史命令
- dexec: dexec # 根据输入进入docker容器

# 使用方法

```bash
cd ~
git clone https://github.com/outmanwt/alias.git
vi ~/.bashrc
```

在最后加入

```bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias hfind='history | grep '
alias pfind='ps aux | grep '
alias dexec='sh ~/alias/exec-docker.sh'
```

最后
```bash
source ~/.bashrc
```

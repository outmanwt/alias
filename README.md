# alias
一些便携的alias

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

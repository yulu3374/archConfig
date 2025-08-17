PROMPT='%{%F{black}%K{yellow}%}%n%~:%{%k%f%}'

# 启用自动纠正功能
setopt CORRECT          # 尝试纠正命令拼写错误
setopt CORRECT_ALL      # 尝试纠正所有参数拼写错误

# 自定义纠正提示信息
SPROMPT="%R to %r(yena)"

# 更智能的自动补全和纠正
autoload -Uz compinit
compinit

# 启用高级补全功能
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:approximate:*' max-errors 2

# 设置纠正的敏感度 (0-10, 默认5)
# 值越高，纠正越积极
CORRECT_IGNORE='_*'      # 忽略以_开头的命令
CORRECT_IGNORE_FILE='.*' # 忽略隐藏文件

# 可选：为特定命令禁用自动纠正
# 例如，对于git命令禁用自动纠正
alias git='nocorrect git'
alias sudo='nocorrect sudo'

# 可选：启用更强大的近似匹配
# 允许在补全时最多3个错误
zstyle ':completion:*:approximate:*' max-errors 3

# 可选：添加命令未找到时的建议
if [[ -x /usr/lib/command-not-found ]]; then
    command_not_found_handler() {
        /usr/lib/command-not-found --no-failure-msg -- "$1"
    }
fi
# 在~/.zshrc中添加
autoload -U colors && colors
# 设置zsh补全系统的颜色
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Linux用户（使用GNU ls）
alias ls='ls --color=auto'
# 设置历史记录文件大小
HISTSIZE=10000                   # 内存中保存的历史命令数量
SAVEHIST=10000                   # 历史文件中保存的命令数量
HISTFILE=~/.zsh_history          # 历史文件路径（默认是 ~/.zsh_history）

# 可选配置项
setopt append_history            # 追加模式（避免多个会话覆盖历史）
setopt extended_history          # 记录时间戳（格式为: ": 开始时间:执行时间;命令"）
setopt share_history             # 多个会话共享历史（实时同步）
setopt hist_ignore_all_dups      # 忽略重复命令（旧的重复项会被删除）
setopt hist_ignore_space         # 忽略以空格开头的命令（不会记录到历史）
setopt hist_reduce_blanks        # 删除多余空格后再记录
alias pacman='sudo pacman'
alias vim='sudo vim'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias chmod='sudo chmod'
alias psa='ps aux | grep'
alias f='sudo find / -name'
alias stopv='sudo killall v2raya'





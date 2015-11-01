set PATH $PATH ~/bin ~/dev/clojurescript/bin .
setenv EDITOR "subl -w"
setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
setenv CLOJURESCRIPT_HOME ~/dev/clojurescript/
alias joyspring "rlwrap java -jar ~/dev/netflix/joyspring/target/joyspring-0.1.0-SNAPSHOT-standalone.jar"
alias emacs 'open -a /Applications/Emacs.app $1'
# alias backup "rsync -rlptP --delete-excluded --delete-before --exclude-from ~/.dotfiles/backup-excludes.txt ~ /Volumes/MiniMe/Backups"

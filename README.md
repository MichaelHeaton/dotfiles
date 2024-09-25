# My OSX Dotfiles

While researching storing my dotfiles into Git there are many great options and tooling. This design doesn't require anything more than  Git.

OSX Version: macOS Sequoia 15.0

# Setup Git repo
## Create a bare Git repository, which is an empty Git repository without a working directory.
```bash
mkdir .dotfiles
git init --bare $HOME/.dotfiles
```

## Create an alias for git e.g. dot to configure the .dotfiles repository.
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

# Since this demo uses github.com to share the repository, we set the name of the branch to main.
```bash
dotfiles branch -M main
```

## (Optional) Add git alias to ~/.bashrc. 
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
source ~/.bashrc
```

## (Optional) Add git alias to ~/.zshrc.
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
source ~/.zshrc
```

## Configure Git so it does not show local files, that are not being tracked when using commands like git status.
```bash
dotfiles config --local status.showUntrackedFiles no
```

## add bashrc & zshrc to repo
```bash
dotfiles add ~/.bashrc
dotfiles add ~/.zshrc
dotfiles commit -m "Commit ~/.bashrc & ~/.zshrc"
```

## Connecting local branch to Github repo
This command assumes you have configured your GitHub account with an SSH key. [Link](https://github.com/settings/keys)
```bash
dotfiles remote add origin git@github.com:MichaelHeaton/dotfiles.git
```

## Pushing changes to Github
```bash
dotfiles push -u origin main
```

# How to add new files to repo
```bash
dotfiles add {path to file}
dotfiles commit -m "Commit {Your commit notes}"
dotfiles push -u origin main
```

# How to Clone to new system

git clone --bare https://github.com/MichaelHeaton/dotfiles $HOME/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot checkout
dot config --local status.showUntrackedFiles no

#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# install vim craps.
mkdir -p ~/.vim/colors
cd ~/.vim/colors
wget https://raw.github.com/tomasr/molokai/master/colors/molokai.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -o ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"



# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $dir/*; do
    filename=`basename $file`
    if [ $filename == "install.sh" ]
    then
      continue
    fi
    mv ~/.$filename ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $file ~/.$filename
done

# Add git completion.
#!/bin/bash
kernel="2.6.39";
distro="xyz";

# Append into bash_profile
printf "if [ -f ~/.git-completion.bash ]; then\n\t. ~/.git-completion.bash\nfi" >> ~/.bash_profile

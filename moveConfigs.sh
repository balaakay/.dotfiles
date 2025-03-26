#!/bin/bash

# Is there any way to trigger a reload of the tool that has been changed via 
# 'rsync' when running this? or do I have to go to the .config directory to find
# exactly where I can run the reload script? 
#
# For nvim, I can just quit and re-enter, tmux, there is a source-file command
# that I should bind to the location of the config file. But for things like 
# terminal emulator configs, or i3 changes, I don't know how to trigger those 
# reloads correctly.

input_dirs=(
  "./nvim"
  "./tmux"
  "./i3"
  "./i3status"
  "./alacritty"
  "./ghostty"
  "./.local/bin"
)

output_dirs=(
  "$HOME/.config/nvim"
  "$HOME/.config/tmux"
  "$HOME/.config/i3"
  "$HOME/.config/i3status"
  "$HOME/.config/alacritty"
  "$HOME/.config/ghostty"
  "$HOME/.local/bin"
)



# For Linux
if [ "$(uname)" = "Linux" ] ; then

  for (( i=0; i<${#input_dirs[@]}; i++)); do
    input_dir="${input_dirs[$i]}"
    output_dir="${output_dirs[$i]}"

    echo "Processing $input_dir -> $output_dir"


    if ! diff -qr "$input_dir" "$output_dir" > /dev/null; then
      echo "Differences found. Updating the destination directory..."
      rsync -av --delete "$input_dir/" "$output_dir/"
      echo "Destination directory updated."
    else
      echo "No differences found. Nothing to do."
    fi

    echo "-----------------------------------------------"
    echo ""
  done


  # zsh config
  echo "moving zsh config"
  rsync -a --delete ./zsh/ ~/.config/zsh/
  rm -rf ~/.zshrc
  cp ./zsh/.zshrc ~/.zshrc


  # bash config
  echo "moving bash config"
  rm -rf ~/.profile
  cp ./.profile ~/.profile
  rm -rf ~/.bashrc
  cp ./.bashrc ~/.bashrc


  # git config
  echo "moving git config"
  rm -rf ~/.gitconfig
  cp ./.gitconfig ~/.gitconfig


elif [ "$(uname)" = "Darwin" ] ; then
  echo "This is a Mac."
  # MacOS Configuration

  # nvim config


  # tmux config


  # i3 config


  # alacritty config


  # ghostty config


  # zsh config


  # bash config


  # .local directory

else 
  echo "You're trying to use something other than Mac or Linux. Please handle this case"

fi

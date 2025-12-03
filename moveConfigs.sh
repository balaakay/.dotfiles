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
  "./hypr"
  # "./waybar"
)

output_dirs=(
  "$HOME/.config/nvim"
  "$HOME/.config/tmux"
  "$HOME/.config/i3"
  "$HOME/.config/i3status"
  "$HOME/.config/alacritty"
  "$HOME/.config/ghostty"
  "$HOME/.local/bin"
  "$HOME/.config/hypr"
  # "$HOME/.config/waybar"
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

  for (( i=0; i<${#input_dirs[@]}; i++)); do
    input_dir="${input_dirs[$i]}"
    output_dir="${output_dirs[$i]}"

    # i3 and i3status are Linux-specific, so skip them on macOS
    if [[ "$input_dir" == "./i3" || "$input_dir" == "./i3status" || "$input_dir" == "./hypr" ]]; then
      echo "Skipping $input_dir (Linux-specific) on macOS."
      echo "-----------------------------------------------"
      echo ""
      continue
    fi

    echo "Processing $input_dir -> $output_dir"

    # Ensure the parent directory exists for the output_dir
    mkdir -p "$(dirname "$output_dir")"

    if ! diff -qr "$input_dir" "$output_dir" > /dev/null; then
      echo "Differences found. Updating the destination directory..."
      # Use rsync for directory synchronization
      rsync -av --delete "$input_dir/" "$output_dir/"
      echo "Destination directory updated."
    else
      echo "No differences found. Nothing to do."
    fi

    echo "-----------------------------------------------"
    echo ""
  done

  # zsh config
  # echo "moving zsh config"
  # mkdir -p ~/.config/zsh/
  # rsync -a --delete ./zsh/ ~/.config/zsh/
  # rm -f ~/.zshrc
  # cp ./zsh/.zshrc ~/.zshrc


  # bash config
  # echo "moving bash config"
  # rm -f ~/.profile
  # cp ./.profile ~/.profile
  # rm -f ~/.bashrc
  # cp ./.bashrc ~/.bashrc

  # git config
  # echo "moving git config"
  # rm -f ~/.gitconfig
  # cp ./.gitconfig ~/.gitconfig


else 
  echo "You're trying to use something other than Mac or Linux. Please handle this case"

fi

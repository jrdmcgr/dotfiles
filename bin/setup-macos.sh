#!/bin/bash
# macos-setup.sh
set -euo pipefail

# Dock Settings
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock "static-only" -bool "true" # Only keep open application in the Dock.
defaults write com.apple.dock "scroll-to-open" -bool "true"
killall Dock

# Safari Settings
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"
killall Safari

# Finder Settings 
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true" # Sort folders first in Finder and on Desktop
defaults write com.apple.finder "FinderSpawnTab" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # Search in current folder by default
defaults write com.apple.finder "ShowPathbar" -bool "false"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "false" # Do not automatically remove old items from Trash
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" # Disable warning when changing file extensions
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false" # Save new documents to local disk by default
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true" 

defaults write com.apple.finder "CreateDesktop" -bool "true"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false" &
killall Finder

# Menu Clock

❯ defaults read com.apple.menuextra.clock
{
    FlashDateSeparators = 0;
    ShowAMPM = 0;
    ShowDate = 2;
    ShowDayOfWeek = 0;
    ShowSeconds = 1;
}

com.apple.menuextra.clock
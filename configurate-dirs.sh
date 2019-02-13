#!/bin/bash

declare -A NEW_NAMES
NEW_NAMES[DESKTOP]=$HOME/.desktop
NEW_NAMES[DOWNLOAD]=$HOME/downloads
NEW_NAMES[TEMPLATES]=$HOME/.templates
NEW_NAMES[PUBLICSHARE]=$HOME/.publicshare
NEW_NAMES[DOCUMENTS]=$HOME/media/documents
NEW_NAMES[MUSIC]=$HOME/media/music
NEW_NAMES[PICTURES]=$HOME/media/pictures
NEW_NAMES[VIDEOS]=$HOME/media/video

for DIR in DESKTOP DOWNLOAD TEMPLATES PUBLICSHARE DOCUMENTS MUSIC PICTURES VIDEOS; do
    mkdir -p ${NEW_NAMES[$DIR]}
    mv $(xdg-user-dir $DIR)/* ${NEW_NAMES[$DIR]}/*
    xdg-user-dirs-update --set $DIR ${NEW_NAMES[$DIR]}
done

mkdir $HOME/projects

#!/usr/bin/env bash

# p = picture
if [[ $# -eq 1 ]] && [[ $1 == "p" ]]; then
    sed -i "" 's/post_asset_folder\: true/post_asset_folder\: false/' _config.yml
fi

hexo clean
hexo g
hexo d
hexo s

#! /bin/bash


# $1为[layout] $2为[title]
if [ $2 ]; then
   hexo new $1 $2 && code ~/Blog/pengzou89.github.io/source/_posts/$2.md

# 默认布局为[cs]
else 
   hexo new cs $1 && code ~/Blog/pengzou89.github.io/source/_posts/$1.md

fi

exit 0

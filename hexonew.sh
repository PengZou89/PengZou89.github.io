#! /bin/bash


# $1为[layout] $2为[title]
if [ ! $1 ]; then
    echo "Error: Missing Title!"

elif [ $2 ]; then
   hexo new $1 $2 && typora ~/Blog/pengzou89.github.io/source/_posts/$2.md

# 默认布局为[cs]
else 
   hexo new cs $1 && typora ~/Blog/pengzou89.github.io/source/_posts/$1.md

fi

exit 0

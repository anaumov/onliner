#!/usr/bin/env bash

ORIGINAL_REPO='git://github.com/BrandyMint/rails4_template.git'

usage()
{
  printf "%b" "
Запуск

 ./bootstrap <ИМЯ_ПРОЕКТА> --git <git_repo>
"
}

set_name()
{
  name=$1
  if echo $name | grep -e '^[A-Z]' > /dev/null; then
    echo "Название проекта: $name"
  elif [ -z "$name" ]; then
    usage
    exit 2
  else
    echo "Проект должен называться с заглавной буквы, $name не подходит."
    exit 4
  fi
}

set_name $1
shift

while (( $# > 0 ))
do
  token="$1"
  shift
  case "$token" in
    --git)
      git=$1
      echo "Кину проект в репозтоирий: $git"
      shift
      ;;
    help|usage)
      usage
      exit 0
      ;;
    *)
      usage
      exit 12
      ;;
  esac
done

if [ -n "$name" ]; then
  lc_name=`echo $name | tr '[A-Z]' '[a-z]'`
  dest=$lc_name

  echo "Создаю проект в каталоге $dest"

  if git clone --depth 1 --branch master $ORIGINAL_REPO $dest && cd $dest; then
    rm -rf .git
   
    echo "Именую проект" 
    perl -i -p -e "s/Rails4Template/$name/g" */**/*.rb **/*.rb **/*.yml Rakefile

    echo "Устанавливаю настройки базы"
    perl -i -p -e "s/ttt/$lc_name/g" ./config/database.yml*
    cp ./config/database.yml.example ./config/database.yml

    pwd | grep -v rails4_template | rm ./bootstrap.sh # Самоуничтажаемся

    bundle

    CURRENTDIR=${PWD#*/}

    echo "Continue..."
    git init
    git add .
    git commit -m "first commit"
    if [ -n "$git" ]; then
      echo "Добавлять remote origin: $git"
      git remote add origin $git
    else
      #echo -n "Enter the login on github.com : "
      #read GITHUBUSER

      GITHUBUSER='BrandyMint'
      #echo "Создаем репозиторий на гитхабе"
      #curl -u ${GITHUBUSER} https://api.github.com/user/repos -d "{\"name\": \"${CURRENTDIR}\" }"
      echo "Добавь репозиторий после создания: git remote add origin git@github.com:${GITHUBUSER}/${dest}.git"
    fi
    # git remote add origin git@github.com:${GITHUBUSER}/${CURRENTDIR}.git
    # git push -u origin master

  else
    echo "Ощутил проблемы при клонировании шаблона"
  fi

else
  usage
  exit 2
fi

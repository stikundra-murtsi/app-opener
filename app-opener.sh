#!/bin/bash

# Переменные
com="$1" # Команда
app="$2" # Приложение
error="For a hint use command - help..." # Ошибка
p="$(dirname $(realpath $0))/"
config="$HOME/.config/app-opener/app-opener.conf"

if [[ -f $config ]]; then
	while IFS='=' read -r key value; do
		[[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
		key=$(echo "$key" | xargs)
		value=$(echo "$value" | xargs)

		export "$key"="$value"
	done < "$config"
fi

case $com in
	# Отсек приложений
	open)
		$p"apps/$app"
		;;
	# Установка приложений/скриптов
	setup)
		$p"setup.sh" "$app" "$3" "$4" "$5" "$p"
		;;
	# Удаление
	remove)
		$p"remove.sh" "$app" "$3" "$p"
		;;
	# Лист
	list)
		$p"list.sh" "$app" "$p"
		;;
	# Отсек скриптов
	start)
		$p"scripts/"$app
		;;
	# Редактор скриптов
	edit)
		if [ $app == "help" ]; then
			echo -e "\e[32medit - Needed to edit scripts in the installed editor."
			echo -e "To replace the editor, edit the config with the command - app edit config\e[0m"
		elif [ $app == "config" ]; then
			echo -e "\e[32mEditing the configuration app-opener...\e[0m"
			$Editor "$HOME/.config/app-opener/app-opener.conf"
		elif [[ -f $p"scripts/"$app ]]; then
			echo -e "\e[32mOpening the script $app in $Editor...\e[0m"
			$Editor $p"scripts/"$app
		else
			echo -e "\e[31mSpecify the script...\e[0m"
		fi
		;;
	recovery)
		$p"recovery.sh" "$p"
		;;
	# Помощь
	help)
		echo -e "\e[32mapp-opener - Complex for launching scripts and programs"
		echo -e "app-opener - called by the command - app."
		echo -e "--------------------------------------------------\e[0m"
		echo "open  - open programm."
		echo "start - run script."
		echo "list  - show the installed packages."
		echo "help  - show this is menu."
		echo "path  - show path installed app-opener."
		exit 0
		;;
	path)
		echo -e "Path to the root catalog app-opener: \e[32m$p\e[0m"
		;;
	# Ошибка
	*)
		echo $error
		exit 1
		;;
esac

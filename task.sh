#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4
mkdir -p task/dir3/dir4
mkdir task/dir1
mkdir task/dir2

# изменяем текущую директорию на task
cd task

# сама добавила для удобства
cd dir2

# создаём пустой файл task/dir2/empty
touch empty

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
echo '#!/bin/bash
echo "$1, привет!"' >> hello.sh

# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 hello.sh

# сохраняем список файлов task/dir2 в task/dir2/list.txt
ls > list.txt

# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cd ..
cp -r -T dir2 dir3/dir4

# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
find . -name "*.txt" > dir1/summary.txt

# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat dir2/list.txt >> dir1/summary.txt

# определяем переменную окружения NAME со значением "Всем студентам"
NAME='Всем студентам'

# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
dir2/hello.sh $NAME >> dir1/summary.txt

# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mv dir1/summary.txt ./"Практическое задание.txt"

# выводим на консоль содержимое файла task/Практическое задание
cat "Практическое задание.txt"

# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep -i "dir" "Практическое задание.txt" | sort

# меняем текущую директорию на родительскую для task
cd ..

# удаляем директорию task со всем содержимым
rm -r -f task
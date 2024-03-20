# netology terraform
.terraformrc необходимо переместить  в корень домашнего каталога\
файл из архива скопировать в один из путей 'echo $PATH'\
установить yc (Yandex Cloud CLI) по документации: https://cloud.yandex.ru/ru/docs/cli/quickstart#install\
\
Занести в ~/.bashrc:\
export YC_TOKEN=$(yc iam create-token)\
export YC_CLOUD_ID=$(yc config get cloud-id)\
export YC_FOLDER_ID=$(yc config get folder-id)


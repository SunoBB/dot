#!/bin/bash
echo "Path/to: "
read path1
path2="/venv"
venv_path="$path1$path2"

# Kiểm tra xem thư mục cho môi trường ảo đã tồn tại chưa
#
# Check if the directory for the venv already exists
if [ ! -d "$venv_path" ]; then
    # Tạo môi trường ảo
    python3 -m venv "$venv_path"
    echo "Created virtual environment at $venv_path"
else
    echo "Virtual environment already exists at $venv_path"
fi

# active venv

source "$venv_path/bin/activate"


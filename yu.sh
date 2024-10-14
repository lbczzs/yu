#!/bin/bash

# 定义主菜单
show_main_menu() {
    clear  # 清屏
    echo "欢迎使用专属页面!"
}

# 定义子菜单1: 系统操作
show_system_menu() {
    echo "常用命令:"
    echo "1. 更新系统"
    echo "2. 安装curl"
    echo "3. 安装sudo"
    echo "4. 返回主菜单"
    echo "5. 退出脚本"
}

# 处理子菜单1的选项
handle_system_choice() {
    read -p "请输入你的选择 [1-5]: " system_choice
    case $system_choice in
        1)
            echo "正在更新系统..."
            sudo apt update && sudo apt upgrade -y
            ;;
        2)
            echo "正在安装curl..."
            apt-get update -y && apt-get install curl -y
            ;;
        3)
            echo "正在安装sudo"
            apt-get install sudo
            ;;
        4)
            return  # 返回主菜单
            ;;
        5)
            echo "退出脚本。"
            exit 0
            ;;
        *)
            echo "无效选项，请重新输入。"
            handle_system_choice
            ;;
    esac
}

# 处理主菜单选项
handle_main_choice() {
    read -p "请输入你的选择 [1-5]: " choice
    case $choice in
        1)
            clear  # 清屏
            show_system_menu  # 进入系统操作菜单
            handle_system_choice
            ;;
        2)
            echo "网络配置操作待实现..."
            ;;
        3)
            echo "文件管理操作待实现..."
            ;;
        4)
            echo "日志查看操作待实现..."
            ;;
        5)
            echo "退出脚本。"
            exit 0
            ;;
        *)
            echo "无效选项，请重新输入。"
            handle_main_choice
            ;;
    esac
}

# 定义主菜单的循环
main_menu() {
    while true; do
        show_main_menu
        handle_main_choice
    done
}

# 启动脚本，从主菜单开始
main_menu

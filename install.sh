#!/bin/bash
echo "Setup Python 開發環境..."

# 1. 幫雲端 VS Code 自動安裝最核心嘅 Python 同 AI 插件
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension continue.continue  # AI 寫 Code 插件

# 2. 設定精簡漂亮的 Terminal 提示字眼 (Zsh / Bash)
echo "alias py='python'" >> ~/.bashrc
echo "alias pipinstall='pip install dotenv openai langchain' # 快捷鍵" >> ~/.bashrc

echo "Setup end。"

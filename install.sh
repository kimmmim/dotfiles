#!/bin/bash

set -e

# =================================================================
# 1.  VS Code 核心插件
# =================================================================
if command -v code >/dev/null 2>&1; then
  echo "📦 正在安裝 VS Code 插件..."
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance
  code --install-extension continue.continue
fi

# =================================================================
# 2. Python 管理工具 uv
# =================================================================
echo "⚡ 正在安裝 Rust 版 Python 管理神器 uv..."
# 使用官方獨立安裝指令（無需依賴系統 pip，速度最快）
curl -LsSf https://astral.sh/uv/install.sh | sh

# 迫使當前腳本環境立刻認到 uv 指令嘅路徑
export PATH="$HOME/.local/bin:$PATH"

# =================================================================
# 3. 全域安裝常用嘅 Python 庫（利用 uv pip）
# =================================================================
echo "核心依賴庫..."
# 備註：Codespaces 預設是一個全域環境，可以直接用 uv pip install 幫全域塞入常用庫
uv pip install --system dotenv openai langchain langgraph qwen-agent csv os math datetime numpy pandas matplotlib yfinance sysseaborn 

# =================================================================
# 4. 配置 Terminal 終端機快捷鍵 (Alias)
# =================================================================
echo "⚙️ 正在配置終端機快捷鍵..."
# 幫你將常用的命令簡化
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
echo "alias py='python'" >> ~/.bashrc
echo "alias pip='uv pip'" >> ~/.bashrc  # 以後打 pip 自動用 uv 代替，快到飛起！
echo "💡 提示：你可以用 'source .venv/bin/activate' 啟用環境，或者直接用 'uv run main.py' 嚟執行你嘅程式！"
echo "Setup end。"
exit 0

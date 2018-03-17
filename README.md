# learn_haskell
learing haskell

## 参考文献

これです。ネットとかも必要に応じて。
http://gihyo.jp/book/2017/978-4-7741-9237-6

## 環境構築

```bash
# stackの導入(5分くらい)
curl -sSL https://get.haskellstack.org/ | sh
# 確認
stack
# GHCコンパイラのインストール(ダウンロードにかなり時間かかる)
stack setup
# ghcのreplを起動(最初はダウンロードがいるため遅い)
stack ghci
```

# ビルドと実行、テスト

```bash
# コンパイルしてそのまま実行
stack runghc [PATH]
# ビルドと実行
stack build
stack exec myproject-exe
# REPL読み込み
# cabal以外とかなら:rでリロードできる
stack ghci
# テスト
stack test
```
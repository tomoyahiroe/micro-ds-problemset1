# ミクロデータサイエンス problemset1

# コードの実行方法

1. 以下のコードを実行しリポジトリをクローン

```
$ git clone https://github.com/tomoyahiroe/problemset1-2125178
```

2. RStudio コンソールもしくは 任意の CLI 上で起動した 
R console で、リポジトリのルートパスをワーキングディレクトリに設定する

```
> setwd('repository-path')
```

3. renv パッケージをインストール

```
> install.packages("renv")
```

4. このリポジトリで使用しているパッケージを復元

```
> renv::restore()
```

5. ファイル毎にコードを実行

```
soure("file path")

## ホスト
### 起動
```
mysql.server start
```
### 終了
```
mysql.server stop
```

### 再起動
```
mysql.server restart
```

## 全員
### 接続法

```
# localhostのMySQLサーバに接続する場合
$ mysql -u [ユーザー名] -p

# 外部MySQLサーバに接続する場合
$ mysql -u [ユーザー名] -p -h [host名] -P [ポート番号]
```
ポート番号は通常3306

### ユーザーの追加
```
create user 'user'@'localhost' identified by 'password';
```
### ユーザーへの権限の追加
#### グローバルレベル
```
GRANT ALL ON *.* TO user;
```
```
GRANT SELECT, INSERT ON *.* TO user;
```

#### データベースレベル
```
grant all privileges on DB名.* to 'user'@'localhost';
```
```
GRANT SELECT, INSERT ON DB名.* TO user;
```

#### テーブルレベル
```
GRANT ALL ON db_name.table_name TO user;
```
```
GRANT SELECT, INSERT ON db_name.table_name TO user;
```
#### カラムレベル
```
GRANT SELECT (col1), INSERT (col1, col2) ON db_name.table_name TO user;
```

### my.cnfの場所を調べる

```
mysql --help | grep my.cnf
```

### 接続可能ipアドレスの変更

```
sudo vi ???/my.cnf
```
bind-adressを追加していく。
全てコメントアウトしたらどのホストからも接続可能。
```
bind-address = 127.0.0.1
bind-address = ????
```

## 設定
### パスワードのポリシー等を確認
```
show variables like 'validate_password%'
```

### ポリシーの変更
```
set global validate_password.policy=LOW;
```


https://qiita.com/CyberMergina/items/f889519e6be19c46f5f4
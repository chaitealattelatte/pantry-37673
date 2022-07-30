# アプリケーション名
Pantry

# アプリケーション概要
食品の賞味・消費期限を管理することで、フードロスを削減する。

# URL
https://pantry-37673.herokuapp.com/

# テスト用アカウント
・Basic認証ID：admin

・Basic認証パスワード：2222

・メールアドレス：test@test

・パスワード：testtest

# 利用方法
## パントリー（食品庫）の新規登録
1.NewPantryボタンをクリック

2.NewPantryボタンから、パントリー名（野菜、飲み物、調味料など）を入力する

3.任意の備考には、アレルギーや好き嫌い、食べたい献立などを入力する


## 食品登録
1.登録したパントリーのページから、食品の登録を行う

2.NewFoodボタンから、食品名、購入日、記載があるものは賞味期限や消費期限を入力して登録する


# アプリケーションを作成した背景
私の家では、期限を過ぎた為に食品を捨ててしまう事があった。週１回の買い物では一度にたくさんの買い物をしていたが、期限日を管理出来ずに、特に野菜を廃棄してしまう率が高かった。

課題を分析した結果、「何を買ったのか忘れてしまう」「買ってから何日経っているか把握できていない」ということが真因であると仮説を立てた。

同様の問題を抱えている方も多いと推測し、真因を解決する為に食品購入日や期限日を明確に出来るアプリケーションを開発することにした。


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/06461236252eac223a57eb055e94cf88.png)](https://gyazo.com/06461236252eac223a57eb055e94cf88)


## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |

### Association
- has_many :pantries

## pantriesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       |                                |
| user            | references | null: false, foreign_key: true |

### Association
- has_many :foods
- belongs_to :user

## foodsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| purchase_day | date       | null: false                    |
| limit_day    | date       |                                |
| pantry       | references | null: false, foreign_key: true |

### Association
- belongs_to :pantry

# 開発環境
Ruby

HTML

CSS


# ローカルでの動作方法
以下のコマンドを順に実行。

% git clone https://github.com/chaitealattelatte/pantry-37673

% cd pantry-37673

% bundle install

% yarn install

% rails db:create

% rails db:migrate

% rails s

# 工夫したポイント
買い物をする主婦が食品管理し易くなるように実装した

また主婦だけではなく、同一世帯の家族も食品を確認出来て、好き嫌いやアレルギー、食べたい献立を備考欄に入力できるようにした

これにより、食品ロスや家族の食べたい献立の把握がし易くなる
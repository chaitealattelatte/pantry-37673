# アプリケーション名
Pantry

# アプリケーション概要
食品の賞味・消費期限を管理することで、フードロスを削減する。

# URL
https://pantry-37673.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード：2222

・Basic認証ID：admin

・メールアドレス：test@test

・パスワード：testtest

# 利用方法
## パントリー（食品庫）登録
1.トップページ（一覧ページ）のヘッダーから新規登録を行う

2.NewPantryボタンから、パントリー名（野菜、飲み物、調味料など）と任意の備考を入力して登録する


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
私の家の猫を題材としました。猫好きな方が笑顔になることを意識して、所々に猫が出てくるようにしました。
また、パステルカラーを基調として、優しい印象を与えられるようにしました。
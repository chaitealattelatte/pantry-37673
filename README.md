# アプリケーション名
Pantry

# アプリケーション概要
食材の賞味・消費期限を管理することで、フードロスを削減する。

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
私の家庭では、食品の消費期限を過ぎて捨ててしまう事が多々あった。
買い物は週１回で一度にたくさんの買い物をしていたが、特に野菜は期限内に使えない事が多かった。
課題を分析した結果、「何を買ったのか忘れてしまう」「買ってから何日経っているか把握できていない」
ということが真因であると仮説を立てた。同様の問題を抱えている方も多いと推測し、真因を解決する為に
食品購入日や期限日を明確に出来るアプリケーションを開発することにした。

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

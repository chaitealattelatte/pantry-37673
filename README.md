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

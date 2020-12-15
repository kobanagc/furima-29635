# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| nick_name          | string  | null: false,              |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false,              |
| family_name        | string  | null: false,              |
| first_name         | string  | null: false,              |
| family_name_kana   | string  | null: false,              |
| first_name_kana    | string  | null: false,              |
| birth_day          | date    | null: false,              | 
### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| user(FK)                | references | null: false, foreign_key: true |
| name                    | string     | null: false,                   |
| description             | text       | null: false,                   |
| category_id             | integer    | null: false,                   |
| condition_id            | integer    | null: false,                   |
| payment_for_shipping_id | integer    | null: false,                   |
| prefecture_id           | integer    | null: false,                   |
| number_of_days_id       | integer    | null: false,                   |
| price                   | integer    | null: false,                   |
### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user(FK)  | references | null: false, foreign_key: true |
| item(FK)  | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_cord       | string     | null: false,                   |
| prefecture_id     | integer    | null: false,                   |
| city              | string     | null: false,                   |
| block             | string     | null: false,                   |
| building          | string     |                                |
| tell              | string     | null: false, unique: true      |
| purchase(FK)      | references | null: false, foreign_key: true |
### Association
- belongs_to :purchase
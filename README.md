# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| nick_name          | string  | null: false,              |
| mail               | string  | null: false, unique: true |
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
| user_id(FK)             | references | null: false, foreign_key: true |
| name                    | string     | null: false,                   |
| description             | text       | null: false,                   |
| category_id             | string     | null: false,                   |
| condition_id            | string     | null: false,                   |
| payment_for_shipping_id | string     | null: false,                   |
| prefecture_id           | string     | null: false,                   |
| number_of_days_id       | integer    | null: false,                   |
| price                   | integer    | null: false,                   |
### Association
- belongs_to :user
- belongs_to :purchase

## purchases テーブル
| Column                        | Type       | Options                        |
| ----------------------------- | ---------- | ------------------------------ |
| user_id(FK)                   | references | null: false, foreign_key: true |
| item_id(FK)                   | references | null: false, foreign_key: true |
| delivery_address_id(FK)       | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- belongs_to :delivery_address  

## delivery_addresses テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_cord       | integer    | null: false,                   |
| prefecture        | string     | null: false,                   |
| city              | string     | null: false,                   |
| block             | string     | null: false,                   |
| building          | string     |                                |
| tell              | integer    | null: false, unique: true      |
### Association
- belongs_to :purchase
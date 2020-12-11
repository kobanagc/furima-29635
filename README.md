# テーブル設計

## users テーブル
| Column                 | Type    | Options                   |
| ---------------------- | --------| ------------------------- |
| nick_name              | string  | null: false,              |
| mail                   | string  | null: false, unique: true |
| password               | string  | null: false,              |
| password_confirmation  | string  | null: false,              |
| family_name            | string  | null: false,              |
| first_name             | string  | null: false,              |
| family_name_kana       | string  | null: false,              |
| first_name_kana        | string  | null: false,              |
| birth_year             | integer | null: false,              |
| birth_month            | integer | null: false,              |
| birth_day              | integer | null: false,              | 
### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column                | Type     | Options      |
| --------------------- | -------- | ------------ |
| image                 | text     | null: false, |
| name                  | string   | null: false, |
| description           | text     | null: false, |
| category              | string   | null: false, |
| condition             | string   | null: false, |
| payment_for_shipping  | string   | null: false, |
| pref                  | string   | null: false, |
| number_of_days        | integer  | null: false, |
| price                 | integer  | null: false, |
### Association
- belongs_to :user
- belongs_to :purchase

## purchases テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id(FK)       | references | null: false, foreign_key: true |
| item_id(FK)       | references | null: false, foreign_key: true |
| card_number       | integer    | null: false, unique: true      |
| expiration_month  | integer    | null: false,                   |
| expiration_day    | integer    | null: false,                   |
| security_cord     | integer    | null: false,                   |
| postal_cord       | integer    | null: false,                   |
| pref              | string     | null: false,                   |
| city              | string     | null: false,                   |
| block             | string     | null: false,                   |
| building          | string     |                                |
| tell              | integer    | null: false, unique: true      |
### Association
- belongs_to :user
- belongs_to :purchase
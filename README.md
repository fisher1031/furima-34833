# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| second_name         | string | null: false               |
| first_name_kana     | string | null: false               |
| second_name_kana    | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many    :items
- has_many    :orders

## items テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| name              | string     | null: false       |
| text              | text       | null: false       |
| category_id       | integer    | null: false       |
| item_condition_id | integer    | null: false       |
| delivery_fee_id   | integer    | null: false       |
| delivery_day_id   | integer    | null: false       |
| street_address_id | integer    | null: false       |
| price             | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| user              | references | foreign_key: true |
| item              | references | foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one    :dealing

## dealings テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| street_address_id      | integer    | null: false       |
| municipality           | string     | null: false       |
| address                | string     | null: false       |
| building_name          | string     |                   |
| postal_code            | string     | null: false       |
| phone_number           | string     | null: false       |
| dealing                | references | foreign_key: true |

### Association

- belongs_to :dealing



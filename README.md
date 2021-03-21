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

- has_many    :purchases
- has_many    :items
- has_many    :transactions

## items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| name              | string     | null: false |
| text              | text       | null: false |
| category_id       | integer    | null: false |
| item_condition_id | integer    | null: false |
| delivery_fee_id   | integer    | null: false |
| delivery_day_id   | integer    | null: false |
| street_address_id | integer    | null: false |
| price             | string     | null: false |
| user              | references |             |
| transaction       | references |             |

### Association

- belongs_to :users
- has_one    :purchases
- has_many   :transactions
- has_many   :transactions_items

## transactions テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user              | references |             |
| item              | references |             |

- belongs_to :users
- has_many   :items
- has_one    :purchases
- has_many   :transactions_items

## transactions_items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| transaction       | references |             |
| item              | references |             |

- belongs_to :transactions
- belongs_to :items

## purchases テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| street_address_id      | integer    | null: false |
| municipality           | string     | null: false |
| address                | string     | null: false |
| building_name          | string     |             |
| postal_code            | string     | null: false |
| phone_number           | string     | null: false |
| user                   | references |             |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :transactions



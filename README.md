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
| price             | integer    | null: false |
| user              | references |             |

### Association

- belongs_to :user
- has_one    :purchases
- has_many   :transactions
- has_many   :transactions_items

## transactions テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user              | references |             |
| item              | references |             |

- belongs_to :user
- belongs_to :item
- has_many   :transactions_items

## transactions_items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| transaction       | references |             |
| item              | references |             |

- belongs_to :transaction
- belongs_to :item

## purchases テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| street_address_id      | integer    | null: false |
| municipality           | string     | null: false |
| address                | string     | null: false |
| building_name          | string     |             |
| postal_code            | integer    | null: false |
| phone_number           | integer    | null: false |

### Association

- belongs_to :item



# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| full_name           | string | null: false               |
| kana                | string | null: false               |
| birthday            | string | null: false               |

### Association

- has_one    :purchases
- belongs_to :items

## items テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| image          |            |             |
| name           | string     | null: false |
| text           | text       | null: false |
| category       | string     | null: false |
| item_condition | string     | null: false |
| street_address | string     | null: false |
| price          | string     | null: false |
| purchase       | references |             |
| prototype      | references |             |

### Association

- has_many :users
- has_many :purchases

## purchases テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| card_number            | string     | null: false |
| expiration_date        | string     | null: false |
| security_code          | string     | null: false |
| postal_code            | string     | null: false |
| prefectures            | string     | null: false |
| municipality           | string     | null: false |
| building_name          | string     |             |
| phone_number           | string     | null: false |


### Association

- belongs_to :users
- belongs_to :items



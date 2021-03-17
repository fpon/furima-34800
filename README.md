# テーブル設計

## usersテーブル

| Columns            | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| nickname           | string     | null: false                |
| email              | string     | null: false,  unique: true |
| encrypted_password | string     | null: false                |
| first_name         | string     | null: false                |
| last_name          | string     | null: false                |
| first_name_kana    | string     | null: false                |
| last_name_kana     | string     | null: false                |
| birthday           | date       | null: false                |

### Association

- has_many :items
- has_many :purchases



## itemsテーブル

| Columns     | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     | null: false       |
| introduce   | text       | null: false       |
| category_id | integer    | null: false       |
| state_id    | integer    | null: false       |
| shipping_id | integer    | null: false       |
| region_id   | integer    | null: false       |
| day_id      | integer    | null: false       |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |

###  Association

- belongs_to :user
- has_one :purchase


## addressesテーブル

| Columns       | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post          | string     | null: false       |
| region_id     | integer    | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| building_name | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to purchase


## purchasesテーブル

| Columns | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
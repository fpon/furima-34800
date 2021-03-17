# テーブル設計

## usersテーブル

| Columns         | Type       | Options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| first_name      | string     | null: false |
| last_name       | string     | null: false |
| first_name_kana | string     | null: false |
| last_name_kana  | string     | null: false |
| birthday        | date       | null: false |

### Association

- has_many :items
- has_one :addresses
- has_one :purchase



## itemsテーブル

| Columns   | Type       | Options           |
| --------- | ---------- | ----------------- |
| image     |            |                   |
| name      | string     | null: false       |
| introduce | string     | null: false       |
| category  | string     | null: false       |
| state     | string     | null: false       |
| shipping  | string     | null: false       |
| region    | string     | null: false       |
| days      | integer    | null: false       |
| price     | integer    | null: false       |
| user_id   | references | foreign_key: true |

###  Association

- belongs_to :user
- has_one :images


## addressesテーブル

| Columns       | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post          | string     | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| phone_number  | string     | null: false       |
| user_id       | references | foreign_key: user |

### Association

- belongs_to :user


## purchaseテーブル

| Columns | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: user |
| item_id | references | foreign_key: user |

### Association

- belongs_to :user
- belongs_to :item
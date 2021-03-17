# テーブル設計

## usersテーブル

| Columns  | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :profile
- has_one :addresses
- has_one :credit


## itemsテーブル

| Columns   | Type       | Options           |
| --------- | ---------- | ----------------- |
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


## imagesテーブル

| Columns | Type       | Options           |
| ------- | ---------- | ----------------- |
| image   | string     | null: false       |
| item_id | references | foreign_key: true |

### Association

- belongs_to :item


## profileテーブル

| Columns         | Type       | Options           |
| --------------- | ---------- | ----------------- |
| first_name      | string     | null: false       |
| last_name       | string     | null: false       |
| first_name_kana | string     | null: false       |
| last_name_kana  | string     | null: false       |
| birthday        | date       | null: false       |
| user_id         | references | foreign_key: true |

### Association

- belongs_to :user


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


## creditテーブル

| Columns     | Type       | Options           |
| ----------- | ---------- | ----------------- |
| price       | integer    | null: false       |
| card_number | integer    | null: false       |
| cvc         | integer    | null: false       |
| exp_mouth   | integer    | null: false       |
| exp_year    | integer    | null: false       |
| user_id     | references | foreign_key: user |

### Association

- belongs_to user

# README
#　テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
|                 |        |unique: true |#重複を防ぐ
| password        | string | null: false |
| first_name      | string | null: false |
| family_name     | string | null: false |
| first_name_kana | string | null: false |
| family_name_kana| string | null: false |
| birth_day       | date   | null: false |


- has_many :items, dependent::destroy #一緒に消える
- has_many :purchase

##  Itemsテーブル

| Column            | Type      | Options          |
| ----------------- | --------- | -----------      |
| item_image_id     | string    | null: false      |
| name              | string    | null: false      |
| introduction      | text      | null: false      |
| category_id       | integer   | null: false      |
| item_condition_id | integer   | null: false      |
| postage_payer_id  | integer   | null: false      |
| shipping_region_id| integer   | null: false      |
| shipping_days_id  | integer   | null: false      |
| price             | integer   | null: false      |
| user              | references| foreign_key :true|

### Association

- belongs_to :user
- has_one :purchase

##  Purchaseテーブル

| Column          | Type       | Options              |
| --------------  | ---------- | -------------------- |
| item            |references  | foreign_key: true    |
| user            |references  | foreign_key: true    |



### Association

- belongs_to :user
- belongs_to :item
- has_one :adress

## adress テーブル

| Column       | Type       | Options               |
| -----------  | ---------- | --------------------- |
| postal_code  | string     | null: false           |
| prefecture   | integer    | null: false           |
| city         | string     | null: false           |
| house_number | string     | null: false           |
| building_name| string     |                       |
| phone_number | string     | null: false           |
| purchase     | references | foreign_key :true     |

### Association

- belongs_to :purchase

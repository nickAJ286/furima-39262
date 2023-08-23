##　users テーブル

| Column            | Type   | Options                 |
| ----------------- |------- | ----------------------- |
| nickname          | string | null:false, unique:true |
| email             | string | null:false, unique:true |
| password          | string | null:false              |
| family_name       | string | null:false              |
| first_name        | string | null:false              |
| family_name_kana  | string | null:false              |
| first_name_kana   | string | null:false              |
| birthday          | date   | null:false              |


### Association

- has_many :items
- has_many :comments

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null:false                    |
| price       | integer    | null:false                    |
| status      | string     | null:false                    |
| postage     | integer    | null:false                    |
| region      | string     | null:false                    |
| post_day    | string     | null:false                    |
| user        | references | null:false, foreign_key: true |
| brand       | references | null:false, foreign_key: true |
| category    | references | null:false, foreign_key: true |


### Association
- belongs_to :users
- belongs_to :brands
- belongs_to :categories
- has_one :purchases

## comments テーブル

| Column     | Type       | Options                       |
| -----------| ---------- | ----------------------------- |
| content    | text       | null:false                    |
| item       | references | null:false, foreign_key: true |
| user       | references | null:false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## brands テーブル

| Column     | Type       | Options                       |
| -----------| ---------- | ----------------------------- |
| name       | string     | null:false                    |


### Association
- has_many :items

## categories テーブル

| Column     | Type       | Options                       |
| -----------| ---------- | ----------------------------- |
| name       | string     | null:false                    |


### Association
- has_many :items

## purchases テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_number   | integer    | null:false                    |
| prefecture    | string     | null:false                    |
| municipality  | string     | null:false                    |
| street_address| stiring    | null:false                    |
| prefecture    | string     | null:false                    |
| building_name | string     | null:true                     |
| phone_number  | integer    | null:false                    |
| item          | references | null:false, foreign_key: true |


### Association
- belongs_to :items
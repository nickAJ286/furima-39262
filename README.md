##　users テーブル

| Column             | Type   | Options                 |
| ------------------ |------- | ----------------------- |
| nickname           | string | null:false,             |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |
| family_name        | string | null:false              |
| first_name         | string | null:false              |
| family_name_kana   | string | null:false              |
| first_name_kana    | string | null:false              |
| birthday           | date   | null:false              |


### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| name           | string     | null:false                    |
| price          | integer    | null:false                    |
| explanation    | text       | null:false                    | 
| user           | references | null:false, foreign_key: true |
| category_id    | integer    | null:false                    |
| status_id      | integer    | null:false                    |
| postage_id     | integer    | null:false                    |
| prefecture_id  | integer    | null:false                    |
| post_day_id    | integer    | null:false                    |



### Association
- belongs_to :user
- has_one :purchase

## comments テーブル

| Column     | Type       | Options                       |
| -----------| ---------- | ----------------------------- |
| content    | text       | null:false                    |
| item       | references | null:false, foreign_key: true |
| user       | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| user          | references | null:false, foreign_key: true |
| item          | references | null:false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :destination


## destinations テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_number   | string     | null:false                    |
| prefecture_id | integer    | null:false                    |
| municipality  | string     | null:false                    |
| street_address| string     | null:false                    |
| building_name | string     |                               |
| phone_number  | string     | null:false                    |
| purchase      | references | null:false, foreign_key: true |


### Association
- belongs_to :purchase
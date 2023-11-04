## usersテーブル

| Column      | Type     | Options     |
| ------------| ---------| ------------|
| nickname    | string   | null: false |
| email       | string   | null: false |
| password    | string   | null: false |
| last_name   | string   | null: false |
| first_name  | string   | null: false |
| birth_date  | string   | null: false |




### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column      | Type       | Options       |
| ------------| -----------| --------------|
| item_image  | string     | null: false   |
| item_name   | string     | null: false   |
| item_info   | string     | null: false   |
|item_price   | string     | null| false   |
|user_id      | references | null false    |



### Association
- belongs_to :users
- has_one :orders


## ordersテーブル

| Column    | Type       | Options                        |
| ----------| -----------| ------------------------------ |
| item_name | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :addresses


## addressesテーブル

| Column        | Type         | Options                        |
| --------------| -------------| ------------------------------ |
| postal_code   | string       | null: false                    |
| prefecture    | string       | null: false                    |
| city          | string       | null: false                    |
| house_number  | string       | null: false                    |
| building_name | string        | null: false                    | 
| user_id       | references   | null: false, foreign_key: true |


### Association
- belongs_to :orders


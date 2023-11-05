## usersテーブル

| Column               | Type     | Options      |
| ---------------------| ---------| -------------|
| nickname             | string   | null: false  |
| email                | string   | unique: true |
| encrypted_password   | string   | null: false  |
| last_name            | string   | null: false  |
| first_name           | string   | null: false  |
| last_name (フリガナ) | string   | null: false  |
| first_name(フリガナ) | string   | null: false  |
| birth_date           | date     | null: false  |




### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column   | Type       | Options       |
| ---------| -----------| --------------|
| image    | string     | null: false   |
| name     | text       | null: false   |
| price    | integer    | null: false   |
| genre_id | integer    | null: false   |
| user     | references | null: false   |



### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column   | Type       | Options                        |
| ---------|------------| ------------------------------ |
| name     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column        | Type         | Options                        |
| --------------| -------------| ------------------------------ |
| postal_code   | string       | null: false                    |
| prefecture    | string       | null: false                    |
| city          | string       | null: false                    |
| house_number  | string       | null: false                    |
| building_name | string       |                    |           |
| user          | references   | null: false, foreign_key: true |


### Association
- belongs_to :order


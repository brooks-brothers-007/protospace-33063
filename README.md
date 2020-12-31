# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   | null: false |
| email    | text   | null: false |
| password | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments, through: prototypes
- has_many :comments

## prototypes テーブル

| Column     | Type       | Options      |
| ------     | ---------- | ------------ |
| title      | string     | null: false, |
| catch_copy | text       | null: false, |
| concept    | text       | null: false, |
| image      |          | null: false, foreign_key: true|
| user       |references| null: false, foreign_key: true|


### Association

- has_many :users
- has_many :users, through: comments
- has_many :comments


## comments テーブル

| Column   | Type       | Options                       |
| -------  | ---------- | ------------------------------|
| text     | string     | null: false,                  |
| user     | references | null: false, foreign_key: true|
| prototype| references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :prototype
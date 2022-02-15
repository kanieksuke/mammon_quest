# README

## users テーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|nickname|string|null: false|

### Association

- has_one :target

## targets テーブル

|Column|Type|Options|
|------|----|-------|
|max_hp|integer|null: false|
|max_mp|integer|null: false|
|current_hp|integer|null: false|
|current_mp|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :budget
- has_many :dates

## budgets テーブル

|Column|Type|Options|
|------|----|-------|
|attack|integer|null: false|
|resist|integer|null: false|
|target|references|null: false, foreign_key: true|

### Association

- belongs_to :target

## dates テーブル

|Column|Type|Options|
|------|----|-------|
|attack_date|date|null: false|
|target|references|null: false, foreign_key: true|

### Association

- belongs_to :target
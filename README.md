# README
## データベース設計
### usersテーブル

| Field |     Type     | Null | Key | unique | Default | index |
|-------|--------------|------|-----|--------|---------|-------|
| name  | string       | NOT  |     |  UNI   |  NULL   |   1   |

##### Association

```
has_many :group_users
has_many :groups, :through => :user_groups
has_many :messages
```

### messagesテーブル

|   Field   |     Type     | Null | Key | unique | Default | index |
|-----------|--------------|------|-----|--------|---------|-------|
| body      | text         | NOT  |     |        |  NULL   |       |
| image     | varcher(255) |      |     |        |  NULL   |       |
| group_id  | int(11)      | NOT  | MUL |        |  NULL   |   1   |
| user_id   | int(11)      | NOT  | MUL |        |  NULL   |   1   |

```
references: group_id, foreign_key:true
references: user_id, foreign_key:true
```

#### Association

```
belongs_to :group
belongs_to :user
```

### groupsテーブル

|   Field   |     Type     | Null | Key | unique | Default | index |
|-----------|--------------|------|-----|--------|---------|-------|
| name      | string       | NOT  |     |        |  NULL   |       |

```
####Association
has_many :group_users
has_many :users, :through => :user_groups
has_many :messages
```

### group_usersテーブル

|   Field   |     Type     | Null | Key | unique | Default | index |
|-----------|--------------|------|-----|--------|---------|-------|
| group_id  | int(11)      | NOT  | MUL |  UNI   |  NULL   |   1   |
| user_id   | int(11)      | NOT  | MUL |  UNI   |  NULL   |   1   |

```
references: group_id, foreign_key:true
references: user_id, foreign_key:true
```

####Association

```
belongs_to :group
belongs_to :user
```
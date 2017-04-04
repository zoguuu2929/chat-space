# README
# README
## データベース設計
##### usersテーブル

| Field |     Type     | Null | Key | Default | Extra |
|-------|--------------|------|-----|---------|-------|
| userid| int(11)      | NO   | PRI | NULL    |       |
| name  | varcher(255) | NO   | PRI | NULL    |       |
| email | varcher(255) | NO   | PRI | NULL    |       |
| pass  | varcher(255) | NO   | MUL | NULL    |       |

##### messagesテーブル

|  Field   |     Type     | Null | Key | Default |          Extra           |
|----------|--------------|------|-----|---------|--------------------------|
| messageid| int(11)      | NO   | PRI | NULL    |                          |
| body     | text         | YES  | MUL | NULL    |                          |
| image    | varcher(255) | YES  | MUL | NULL    |                          |
| group_id | int(11)      | NO   | PRI | NULL    |                          |
| user_id  | int(11)      | NO   | PRI | NULL    |                          |

##### groupsテーブル

|  Field   |     Type     | Null | Key | Default | Extra |
|----------|--------------|------|-----|---------|-------|
| group_id | int(11)      | NO   | PRI | NULL    |       |
| name     | varcher(255) | NO   | MUL | NULL    |       |


##### joinsテーブル（中間テーブル）

|  Field   |   Type  | Null | Key | Default |          Extra           |
|----------|---------|------|-----|---------|--------------------------|
| joins_id | int(11) | NO   | PRI | NULL    |                          |
| group_id | int(11) | NO   | PRI | NULL    |                          |
| user_id  | int(11) | NO   | PRI | NULL    |                          |

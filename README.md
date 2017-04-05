# README
## データベース設計
##### usersテーブル

| Field |     Type     | Null | Key | unique | Default | index |
|-------|--------------|------|-----|--------|---------|-------|
| name  | varcher(255) | NOT  |     |  UNI   |  NULL   |       |

##### messagesテーブル

|   Field   |     Type     | Null | Key | unique | Default | index |
|-----------|--------------|------|-----|--------|---------|-------|
| body      | text         | NOT  |     |        |  NULL   |       |
| image     | varcher(255) |      |     |        |  NULL   |       |
| group_id  | int(11)      | NOT  | MUL |        |  NULL   |   1   |
| user_id   | int(11)      | NOT  | MUL |        |  NULL   |   1   |
* references: group, foreign_key:true
* references: user_id, foreign_key:true

##### groupsテーブル

|   Field   |     Type     | Null | Key | unique | Default | index | |-----------|--------------|------|-----|--------|---------|-------|
| name      | varcher(255) | NOT  |     |        |  NULL   |       |


##### group_userテーブル

|   Field   |     Type     | Null | Key | unique | Default | index | |-----------|--------------|------|-----|--------|---------|-------|
| group_id  | int(11)      | NOT  | MUL |  UNI   |  NULL   |   1   |
| user_id   | int(11)      | NOT  | MUL |  UNI   |  NULL   |   1   |
* references: group, foreign_key:true
* references: user_id, foreign_key:true

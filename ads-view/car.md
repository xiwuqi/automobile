# car

## SQL

汽⻋展示⽹站需要管理以下信息：

- 汽⻋品牌
- 汽⻋系列
- 汽⻋⻋型
- 汽⻋配置
- 访问权限管理

根据这些信息，我们可以设计以下的数据库结构：

**car_brand(汽车品牌)**

| 列名 | 数据类型     | 描述     |
| ---- | ------------ | -------- |
| id   | BIGINT       | 主键     |
| name | VARCHAR(50)  | 品牌名称 |
| logo | VARCHAR(255) | 品牌Logo |

**car_series(汽车系列)**

| 列名     | 数据类型    | 描述                             |
| -------- | ----------- | -------------------------------- |
| id       | BIGINT      | 主键                             |
| name     | VARCHAR(50) | 系列名称                         |
| brand_id | BIGINT      | 外键，关联 car_brand 表的品牌 ID |

**car_model(汽车车型)**

| 列名           | 数据类型      | 描述                              |
| -------------- | ------------- | --------------------------------- |
| id             | BIGINT        | 主键                              |
| name           | VARCHAR(50)   | 车型名称                          |
| series_id      | BIGINT        | 外键，关联 car_series 表的系列 ID |
| price          | DECIMAL(10,2) | 车型价格                          |
| description    | TEXT          | 车型描述                          |
| photo          | VARCHAR(255)  | 车型照片                          |
| release_date   | DATE          | 发售日期                          |
| favorite_count | INT           | 被喜欢的数量                      |

**car_config(汽车配置)**

| 列名     | 数据类型     | 描述                             |
| -------- | ------------ | -------------------------------- |
| id       | BIGINT       | 主键                             |
| name     | VARCHAR(50)  | 配置名称                         |
| value    | VARCHAR(255) | 配置值                           |
| model_id | BIGINT       | 外键，关联 car_model 表的车型 ID |

**user(用户表)**

| 列名          | 数据类型     | 描述                |
| ------------- | ------------ | ------------------- |
| id            | BIGINT       | 主键                |
| username      | VARCHAR(50)  | 用户名              |
| password      | VARCHAR(255) | 密码                |
| role          | VARCHAR(50)  | 角色（管理员/访客） |
| favorite_cars | VARCHAR(255) | 喜欢的车型 ID 列表  |
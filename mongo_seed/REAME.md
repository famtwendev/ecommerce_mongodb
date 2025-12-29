📌 Giải thích
```
until mongo … chờ tới khi DB accept connections
```
Thay host “mongo” bằng bien môi trường bạn truyen

Đe thực hiện việc này trong **MongoDB** qua **mongo shell** hoặc command line, bạn cần thực hiện theo các bước sau:

---

### 1️⃣ Chọn hoặc tạo database `test`

```javascript
use test
```

> Lệnh `use test` sẽ chuyển sang database `test`. Nếu database này chưa tồn tại, nó sẽ được tạo khi bạn insert dữ liệu hoặc tạo user.

---

### 2️⃣ Tạo user `usertest` với password `usertest@123` và quyền cho database `test`

```javascript
db.createUser({
  user: "usertest",
  pwd: "usertest@123",
  roles: [{ role: "readWrite", db: "test" }]
})
```

* `user`: tên user
* `pwd`: mật khẩu
* `roles`: quyền của user (ở đây là `readWrite` trên database `test`)

---

✅ Sau khi thực hiện, bạn có thể đăng nhập bằng user này như sau:

```bash
mongo -u usertest -p 'usertest@123' --authenticationDatabase test
```

---

Nếu bạn muốn, mình có thể viết luôn một **dòng lệnh shell hoàn chỉnh** để tạo database và user mà không cần vào shell tương tác.

Bạn có muốn mình làm không?


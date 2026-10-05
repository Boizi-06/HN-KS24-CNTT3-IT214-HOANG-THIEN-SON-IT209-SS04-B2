#!/bin/bash
# ==============================================================================
# Script thực hành Bài 2: Quản lý nhánh và Giải quyết xung đột (Merge Conflict)
# Tác giả: Boizi06 <hson05542@gmail.com>
# ==============================================================================

echo "=== BẮT ĐẦU MÔ PHỎNG BÀI 2: TẠO VÀ XỬ LÝ MERGE CONFLICT ==="

# 1. Khởi tạo Git repo và cấu hình
git init
git config --local user.name "Boizi06"
git config --local user.email "hson05542@gmail.com"
git branch -M main

# 2. Tạo commit gốc
cat << 'EOF' > project.md
# Hệ Thống Quản Lý Dự Án - IT209
Phiên bản khởi tạo ban đầu.
Trạng thái: Đang phát triển.
EOF

git add project.md
git commit -m "docs: khoi tao du an voi noi dung ban dau tren main"

# 3. Tạo nhánh feature-update và sửa file
git checkout -b feature-update
cat << 'EOF' > project.md
# Hệ Thống Quản Lý Dự Án - IT209
Phiên bản khởi tạo ban đầu.
Trạng thái: Đang phát triển tính năng Notification Service (từ feature-update).
EOF

git add project.md
git commit -m "feat(notification): cap nhat trang thai tren feature-update"

# 4. Quay về main và tạo sửa đổi gây xung đột
git checkout main
cat << 'EOF' > project.md
# Hệ Thống Quản Lý Dự Án - IT209
Phiên bản khởi tạo ban đầu.
Trạng thái: Đang phát triển tính năng Authentication Service (từ main).
EOF

git add project.md
git commit -m "feat(auth): cap nhat trang thai tren main"

echo "Đang tiến hành gộp nhánh feature-update vào main (dự kiến xảy ra xung đột)..."
git merge feature-update

echo "=== TRẠNG THÁI XUNG ĐỘT (MERGE CONFLICT) ==="
git status

echo "Nội dung file project.md khi có xung đột:"
cat project.md

echo "Đang tiến hành giải quyết xung đột thủ công..."
cat << 'EOF' > project.md
# Hệ Thống Quản Lý Dự Án - IT209
Phiên bản khởi tạo ban đầu.
Trạng thái: Đang đồng thời phát triển hai tính năng:
- Authentication Service (từ main)
- Notification Service (từ feature-update)
EOF

git add project.md
git commit -m "merge: resolve conflict between main and feature-update, integrate both services"

echo "=== LỊCH SỬ COMMIT ĐỒ THỊ (git log --graph --oneline) ==="
git log --graph --oneline

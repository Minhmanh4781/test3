import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF8F8FB),
            borderRadius: BorderRadius.circular(9),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: const Color(0xFF5A6CF3)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Đưa logo lên trên
            Image.asset(
              'assets/images/error.png',
              width: 210,
              height: 300.65,
            ),
            SizedBox(height: 20),
            const Text(
              'Không tìm thấy kết quả',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            const Text(
              'Rất tiếc! Chúng tôi không thể tìm thấy kết quả trong lần quét vừa rồi.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: Color(0xFFF8F8FB),
              ),
              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Nhập mã thủ công',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Xử lý tìm kiếm mã
                      },
                      child: const Text(
                        'Tìm kiếm',
                        style: TextStyle(
                          color: Color(0xFF5A6CF3),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Đưa nút về trang chủ xuống dưới cùng
            Spacer(), // Thêm Spacer để đẩy nút xuống dưới cùng
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 170),
                backgroundColor: Color(0xFF5A6CF3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Về trang chủ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

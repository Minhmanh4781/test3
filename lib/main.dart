import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';
import 'error.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Center(child: LoginScreen()),
      ),
    ),
  ));
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 230),

              //đăng nhập
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tên đăng nhập',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Trường nhập mật khẩu
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  suffixIcon: const Icon(
                    Icons.visibility_off,
                    color: Color(0xFF5A6CF3),
                  ), // Icon hiển thị/ẩn mật khẩu
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Nút đăng nhập
              ElevatedButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(335, 64),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Bo góc 16px
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF5A6CF3), // Màu xanh từ yêu cầu của bạn
                ),
                onPressed: () {
                  // Điều hướng sang QuetMa khi đăng nhập thành công
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuetMa(userName: '12344...')), // Truyền tên người dùng
                  );
                },
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuetMa extends StatefulWidget {
  final String userName; // Thêm tên người dùng

  const QuetMa({super.key, required this.userName});

  @override
  State<QuetMa> createState() => _QuetMaState();
}

class _QuetMaState extends State<QuetMa> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {
                // Xử lý đăng xuất, điều hướng về màn hình đăng nhập
                Navigator.pop(context);
              },
              child: const Text(
                'Đăng xuất',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),

          // Hiển thị tên người dùng và nút Đăng xuất
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Thêm hành động Đăng xuất tại đây
                Navigator.pop(context); // Đăng xuất, quay lại màn hình đăng nhập
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.5), // Đặt độ bo tròn
                ),
                minimumSize: Size(190, 51), // Đặt kích thước tối thiểu cho nút (width, height)
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Điều chỉnh padding
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.userName, // Hiển thị tên người dùng truyền vào
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10), // Khoảng cách giữa tên người dùng và nút Đăng xuất
                  const Text(
                    'Đăng Xuất',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFFF3939),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Hiển thị logo ở giữa màn hình
          Container(
            width: 267,
            height: 267,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            width: 293,
            height: 150, // Tăng chiều cao lên 150 hoặc hơn
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quét mã ngay, check vé liền tay!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Quét mã QR để truy xuất thông tin trạng thái vé xem phim một cách nhanh gọn, chuẩn xác nhất.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Điều hướng đến màn hình TicketInfoScreen khi nhấn vào hình ảnh
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicketInfoScreen()),
                  );
                },
                child: (result != null)
                    ? Text('Mã QR: ${describeEnum(result!.format)} - ${result!.code}')
                    : Image.asset(
                  'assets/images/quetma.png',
                  width: 120, // Điều chỉnh chiều rộng
                  height: 120, // Điều chỉnh chiều cao
                  fit: BoxFit.cover, // Tùy chọn cách hiển thị ảnh
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class TicketInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF8F8FB), // Màu nền cho nút
            borderRadius: BorderRadius.circular(9), // Độ bo góc
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần hiển thị hình ảnh ở trên cùng
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 16),

            // Phần hiển thị chi tiết vé
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Quý Công Tử',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                      TextButton(
                          onPressed: (){
                          // xử lý nút
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: const Color(0xFF06CE6E),

                          ),
                          child: const Text('Chưa sử dụng')
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                       padding: const EdgeInsets.all(8),
                       decoration: BoxDecoration(
                         border: Border.all(color: const Color(0xFFBBDEFB), width: 2),
                         borderRadius: BorderRadius.circular(8),
                       ),
                        child: const Text('2D'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFBBDEFB), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Thuyết minh tiếng Việt'),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),  //line
                  const Divider(
                    color: Colors.grey,
                    thickness:0.5,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Người Đặt'),
                      Text('Ca chiều'),
                      Text('Ngày chiếu')
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phan Bá Mạnh',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text('16:40',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text('22-12-2023',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Người Đặt'),
                      Text('Ca chiều'),
                      Text('Ngày chiếu')
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phan Bá Mạnh',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text('16:40',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text('22-12-2023',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),  //line
                  const Divider(
                    color: Colors.grey,
                    thickness:0.5,
                  ),
                  const Text(
                    'Đồ ăn kèm (2)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                ],
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: [
                  _buildFoodItem('Combo bắp nước', '129.000đ', true),
                  _buildFoodItem('Combo bắp nước', '129.000đ', true),
                ],
              ),
            ),

            // Nút "Check in vé"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotFoundScreen()), // Đảm bảo lớp đúng tên
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 170),
                  backgroundColor: Color(0xFF5A6CF3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Check in vé',
                  style: TextStyle(fontSize: 18, color: Colors.white, ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  // Hàm tạo phần tử đồ ăn kèm
  Widget _buildFoodItem(String name, String price, bool delivered) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(price, style: TextStyle(color: Colors.grey)),
              ],
            ),
            Text(
              delivered ? 'Đã giao' : 'Chưa giao',
              style: TextStyle(
                color: delivered ? Colors.blue : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
        ,
      ),

    );

  }
}

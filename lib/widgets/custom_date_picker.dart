import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime? referenceDate; // Đây là ngày bắt đầu của kế hoạch
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    super.key,
    required this.initialDate,
    this.referenceDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime tempDate;

  @override
  void initState() {
    super.initState();
    tempDate = widget.initialDate;
  }

  // SỬA LOGIC TẠI ĐÂY
  void _addMonthsFromReference(int monthsToAdd) {
    // 1. Luôn lấy mốc cố định là referenceDate (Ngày bắt đầu)
    // Nếu không có referenceDate thì mới lấy ngày hiện tại
    final DateTime baseDate = widget.referenceDate ?? DateTime.now();

    setState(() {
      // 2. Tạo ngày mới bằng cách giữ nguyên Day, nhưng cộng thêm Month vào baseDate
      // Dart sẽ tự động xử lý việc tràn tháng (vd: 31/1 + 1 tháng thành đầu tháng 3)
      tempDate = DateTime(
        baseDate.year,
        baseDate.month + monthsToAdd,
        baseDate.day,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      child: Column(
        children: [
          Expanded(
            child: CalendarDatePicker(
              // ValueKey cực kỳ quan trọng: Khi tempDate đổi, lịch sẽ tự cuộn tới tháng đó
              key: ValueKey(tempDate),
              initialDate: tempDate,
              firstDate:
                  (widget.referenceDate != null &&
                      widget.referenceDate!.isBefore(tempDate))
                  ? widget.referenceDate!
                  : (tempDate.isBefore(DateTime(2023))
                        ? tempDate
                        : DateTime(2023)),
              lastDate: DateTime(2035),
              onDateChanged: (date) {
                setState(() => tempDate = date);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Kết thúc vào: ${tempDate.day}/${tempDate.month}/${tempDate.year}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 14,
              ),
            ),
          ),

          const Text(
            "Tính thời hạn từ ngày bắt đầu",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            children: [
              _buildMonthBtn('1 th', 1),
              _buildMonthBtn('3 th', 3),
              _buildMonthBtn('6 th', 6),
              _buildMonthBtn('1 năm', 12),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                widget.onDateSelected(tempDate);
                Navigator.pop(context);
              },
              child: const Text('Xác nhận chọn ngày'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMonthBtn(String title, int months) {
    return ActionChip(
      label: Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.purple),
      ),
      backgroundColor: Colors.purple[100]?.withOpacity(0.3),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () => _addMonthsFromReference(months),
    );
  }
}

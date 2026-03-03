import '../models/plan_model.dart';
import '../models/phase_model.dart';
import '../models/task_model.dart';

List<PlanModel> samplePlans = [
  PlanModel(
    title: 'Đỗ tốt nghiệp Đại học',
    category: 'Học tập',
    startDate: DateTime(2026, 1, 1),
    endDate: DateTime(2026, 7, 30),
    phases: [
      PhaseModel(
        title: 'Củng cố nền tảng',
        tasks: [
          TaskModel(title: 'Ôn lại môn Cấu trúc dữ liệu'),
          TaskModel(title: 'Ôn lại môn Hệ điều hành'),
        ],
      ),
      PhaseModel(
        title: 'Luyện đề',
        tasks: [
          TaskModel(title: 'Làm đề thi năm trước'),
          TaskModel(title: 'Phân tích lỗi sai'),
        ],
      ),
      PhaseModel(
        title: 'Chuẩn bị thi',
        tasks: [
          TaskModel(title: 'Ôn trọng tâm'),
          TaskModel(title: 'Giữ sức khỏe'),
        ],
      ),
    ],
  ),

  PlanModel(
    title: 'Trở thành Flutter Developer',
    category: 'Công việc',
    startDate: DateTime(2026, 2, 1),
    endDate: DateTime(2026, 12, 31),
    phases: [
      PhaseModel(
        title: 'Nền tảng Flutter',
        tasks: [
          TaskModel(title: 'Học widget cơ bản'),
          TaskModel(title: 'State management'),
        ],
      ),
      PhaseModel(
        title: 'Dự án thực tế',
        tasks: [
          TaskModel(title: 'Làm app quản lý kế hoạch'),
          TaskModel(title: 'Deploy & demo'),
        ],
      ),
      PhaseModel(
        title: 'Nâng cao',
        tasks: [
          TaskModel(title: 'Firebase'),
          TaskModel(title: 'Clean Architecture'),
        ],
      ),
    ],
  ),

  PlanModel(
    title: 'Cải thiện sức khỏe toàn diện',
    category: 'Sức khỏe',
    startDate: DateTime(2026, 1, 1),
    endDate: DateTime(2026, 12, 31),
    phases: [
      PhaseModel(
        title: 'Hình thành thói quen',
        tasks: [
          TaskModel(title: 'Ngủ trước 23h'),
          TaskModel(title: 'Uống đủ nước'),
        ],
      ),
      PhaseModel(
        title: 'Tăng thể lực',
        tasks: [
          TaskModel(title: 'Chạy bộ 3 buổi/tuần'),
          TaskModel(title: 'Tập gym nhẹ'),
        ],
      ),
    ],
  ),

  PlanModel(
    title: 'Quản lý tài chính cá nhân',
    category: 'Tài chính',
    startDate: DateTime(2026, 1, 1),
    endDate: DateTime(2026, 12, 31),
    phases: [
      PhaseModel(
        title: 'Kiểm soát chi tiêu',
        tasks: [
          TaskModel(title: 'Ghi chép chi tiêu hằng ngày'),
          TaskModel(title: 'Cắt giảm chi không cần thiết'),
        ],
      ),
      PhaseModel(
        title: 'Tích lũy & đầu tư',
        tasks: [
          TaskModel(title: 'Tiết kiệm hàng tháng'),
          TaskModel(title: 'Tìm hiểu đầu tư cơ bản'),
        ],
      ),
    ],
  ),
];

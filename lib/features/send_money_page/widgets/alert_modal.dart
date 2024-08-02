import 'package:flutter/material.dart';

enum ModalType {
  SUCCESS,
  FAIL,
}

class AlertModal extends StatelessWidget {
  const AlertModal({
    required this.onTapDismiss,
    required this.type,
    super.key,
  });

  final VoidCallback onTapDismiss;
  final ModalType type;

  factory AlertModal.success({required VoidCallback onTapDismiss}) => AlertModal(
        onTapDismiss: onTapDismiss,
        type: ModalType.SUCCESS,
      );
  factory AlertModal.fail({required VoidCallback onTapDismiss}) => AlertModal(
        onTapDismiss: onTapDismiss,
        type: ModalType.FAIL,
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSuccess = type == ModalType.SUCCESS;
    return Container(
      height: size.height / 4,
      width: size.width,
      padding: const EdgeInsets.all(32),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isSuccess ? 'Success' : 'Fail',
            style: const TextStyle(fontSize: 25),
          ),
          Icon(
            isSuccess ? Icons.check_circle : Icons.close_rounded,
            color: isSuccess ? Colors.lightGreen : Colors.redAccent,
            size: 30,
          ),
          ElevatedButton(
            onPressed: onTapDismiss,
            child: const Text('Dismiss'),
          ),
        ],
      )),
    );
  }
}

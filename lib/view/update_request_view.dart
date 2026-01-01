import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/widgets/inputs/app_text_field.dart';
import 'package:tech_app/widgets/inputs/primary_button.dart';
import 'package:tech_app/widgets/media_upload.dart';

class UpdateRequestView extends StatefulWidget {
  const UpdateRequestView({super.key});

  @override
  State<UpdateRequestView> createState() => _UpdateRequestViewState();
}

class _UpdateRequestViewState extends State<UpdateRequestView> {
  int selectedIndex = 0;
  final ImagePicker _picker = ImagePicker();
  List<XFile> selectedImages = [];
  final List<Map<String, dynamic>> status = [
    {"title": "Accepted"},
    {"title": "In Progress"},
    {"title": "OnHold"},
    {"title": "completed"},
  ];
  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        selectedImages.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(223, 221, 221, 1),
                ),
                child: Center(
                  child: Text(
                    "REQ-AP-001",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Updated Status"),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4,
                ),
                itemCount: status.length,
                itemBuilder: (context, index) {
                  final Status = status[index];
                  final bool isSelected = selectedIndex == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.scoundry_clr
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.scoundry_clr,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Status['title'],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.scoundry_clr,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 15),
              const Text("Add Notes"),
              const SizedBox(height: 15),
              AppTextField(
                maxLines: 5,
                label: "HJGFYUGBHJXZGRFYGRHBVYUGFRBXHJGEYGVH",
              ),
              const SizedBox(height: 15),
              const Text("Media Upload"),
              const SizedBox(height: 25),
              // UPLOAD BUTTON
              MediaUploadWidget(
                images: selectedImages,
                onAddTap: () {
                  showImagePickerSheet(context);
                },
                onRemoveTap: (index) {
                  setState(() {
                    selectedImages.removeAt(index);
                  });
                },
              ),

              const SizedBox(height: 25),
              PrimaryButton(
                radius: 15,
                Width: double.infinity,
                color: AppColors.scoundry_clr,
                onPressed: () {},
                text: "Save Updates",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

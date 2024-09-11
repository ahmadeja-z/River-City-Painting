import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

import '../../../../screens_model/controllers/nav_screens_controller/estimates_controllers/files_controller_info_estimates.dart';

class FilesTabsInfoEstimates extends StatelessWidget {
  FilesTabsInfoEstimates({super.key});

  @override
  Widget build(BuildContext context) {
    final filesController = Get.put(
        FilesControllerEstimates()); // Use Get.find to avoid reinitializing

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          CustomHeaderContainer(
            title: 'Files',
            onTap: () {
              filesController.showDialog();
            },
          ),
          Expanded(
            child: Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: filesController.filesList.length,
                  itemBuilder: (context, index) {
                    final filePath = filesController.filesList[index];
                    final fileName =
                        filePath.split('/').last; // Extract the file name

                    return ListTile(
                      onTap: () {
                        // Navigate to FileViewer and pass the file path
                        Get.to(() => FileViewer(filePath: filePath));
                      },
                      leading: Icon(
                        Icons.file_copy_outlined,
                        color: Colors.black38,
                      ),
                      title: Text(
                        fileName,
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          filesController.filesList
                              .removeAt(index); // Remove file from list
                        },
                        icon: Icon(
                          CupertinoIcons.delete,
                          color: AppColors.primaryRed,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class FileViewer extends StatelessWidget {
  final String filePath;

  const FileViewer({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    final file = File(filePath);
    final fileExtension = filePath.split('.').last.toLowerCase();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'File Viewer',
          style: TextStyle(
              color: Colors.white,
              fontFamily: AppFonts.poppinsRegular,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryRed,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'File Path: ${file.path}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              if (['jpg', 'jpeg', 'png'].contains(fileExtension))
                Image.file(file)
              else if (fileExtension == 'pdf')
                PdfView(filePath: file.path)
              else if (['doc', 'docx'].contains(fileExtension))
                  Text('Word document viewing is not supported.')
                else if (['xls', 'xlsx'].contains(fileExtension))
                    Text('Excel file viewing is not supported.')
                  else
                    Text('Unsupported file type: ${fileExtension.toUpperCase()}'),
            ],
          ),
        ),
      ),
    );
  }
}

class PdfView extends StatelessWidget {
  final String filePath;

  const PdfView({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600, // Set height for PDF viewer
      child: PDFView(
        filePath: filePath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
        pageSnap: true,
        fitPolicy: FitPolicy.BOTH,
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';
import 'package:painting/app/controllers/nav_screens_controller/estimates_controllers/notes_controller_info_estimates.dart';

class NotesInfoEstimatesView extends StatelessWidget {
  const NotesInfoEstimatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final notesController = Get.put(NotesControllerEstimates());

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.02),

          // Custom header with Add Note button
          CustomHeaderContainer(
            title: 'Notes',
            onTap: () {
              notesController
                  .showAddNoteDialog(); // Show the dialog to add a note
            },
          ),

          SizedBox(height: Get.height * 0.02),

          // Expanded widget to hold the list of notes
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: notesController.notesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(3, 3),
                              spreadRadius: 2,
                              blurRadius: 2)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        notesController.notesList[index],
                        style: TextStyle(
                          fontFamily: AppFonts.poppinsRegular,
                          fontSize: 13
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              notesController.showEditNoteDialog(
                                  index); // Edit note dialog
                            },
                          ),
                          IconButton(
                            icon:
                                Icon(CupertinoIcons.delete, color: AppColors.primaryRed),
                            onPressed: () {
                              notesController
                                  .deleteNoteAt(index); // Delete note
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

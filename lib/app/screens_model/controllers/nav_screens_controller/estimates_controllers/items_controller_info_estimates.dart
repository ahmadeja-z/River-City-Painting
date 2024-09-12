import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import '../../../../resources/app_colors/app_colors.dart';

class ItemsControllerEstimates extends GetxController {
  // Observables for managing state
  var selectedItem = ''.obs;
  var selectedSubOption = ''.obs;
  var description = ''.obs; // To hold the description of the selected option
  var note = ''.obs; // To hold additional notes
  var itemCount = 1.obs; // Counter for items

  var searchText = ''.obs;
  var filteredOptions = <String>[].obs;

  // Initialize with the full list of options.
  void initializeOptions(Map<String, String> itemOptions) {
    filteredOptions.value = itemOptions.keys.toList();
  }

  // Update the filtered options based on the search query.
  void updateSearchText(String value, Map<String, String> itemOptions) {
    searchText.value = value;
    filteredOptions.value = itemOptions.keys
        .where((String option) => option.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
  final Map<String, List<String>> itemOptions = {
    'Exterior Painting': [
      'Power wash Pressure wash exterior surface to remove dirt',
      'Scrape / Spot Prime visible scraping needed',
      'Caulking Caulk cracks, seams, gaps, and nail heads',
      'Remove Downspout(s) Remove downspouts in preparation',
      'Remove Exterior Storm Window(s) Remove Storm Windows',
      'Masking Mask areas not to be painted',
      'Patch & Spot Prime Patch & prime areas of bare wood',
      'Full Prime Prime Full Exterior',
      'Paint Gutters and Downspouts Paint gutters and downspouts',
      'Exterior Body Siding Smooth Paint Exterior Body Siding Smooth',
      'Exterior Body Siding Medium Paint Exterior Body Siding Medium',
      'Exterior Body Siding Rough Paint Exterior Body Siding Rough',
      'Exterior Body Siding Stucco Paint Exterior Body Siding Stucco',
      'Exterior Brick Prime and Paint Exterior Brick',
      'Exterior Trim Paint Exterior Trim in color of customer\'s choice',
    ],
    'Labour':[],
    'New Exterior Painting': [
      'Exterior Body Siding Rough Paint Exterior Body Siding Rough',
      'Exterior Siding Smooth Paint Exterior Siding Smooth',
      'Exterior Body Siding Medium Paint Exterior Body Siding Medium',
      'Exterior Body Siding Stucco Paint Exterior Body Siding Stucco',
      'Exterior Brick Prime and Paint Exterior Brick',
      'Exterior Trim Paint Exterior Trim in color of customer\'s choice',
      'Small Exterior Window(s) Paint Small Exterior Windows',
      'Paint Exterior Window(s) Paint Exterior Windows',
      'Large Exterior Window(s) Paint Large Exterior Windows',
      'Remove Exterior Storm Window(s) Remove Storm Windows',
      'Paint Exterior Door(s) Paint Exterior Doors',
      'Full Prime Prime Full Exterior',
      'Prepping materials such as plastic, tape, caulk',
      'Dormers Paint dormers including siding, trim, and soffit',
    ],
    'Scope of Work Details': [
      'River City Difference Every job has a standard',
      'Additional Details Additional notes and details',
      'LICENSED AND INSURED We are fully licensed and insured',
      'Repair Details If additional repairs are found during the work',
      'Interior Details Prep work consists of filling all imperfections',
      'Woodwork Details We will clean, sand, prime, and paint',
      'Gallery Series Get a factory-like finish FAST with this service',
      'Wallpaper Details Wallpaper removal price is provided upon request',
      'Popcorn Ceiling Removal Details This estimate includes removal of popcorn ceiling',
      'Exterior Details The following prep work will take place for exterior work',
      'Lead Based Painting - Pre 1978 EPA requires including lead-based paint management',
      'Deck Details The following prep work will be done on decks',
      'Window Details All windows must be able to be opened and closed for painting',
      'Sales Tax Sales Tax is not included in this proposal',
    ],
    'Deck and Fence': [
      'Deck Powerwash Pressure wash exterior surface',
      'Revive Deck Brightener Apply SuperDeck Revive Deck Brightener',
      'Scrape / Spot Prime No visible scraping needed',
      'Paint Deck Floor Paint Deck Floor in color of customer\'s choice',
      'Stain Deck Stairs Stain Deck Stairs in color of customer\'s choice',
      'Paint Deck Posts Paint Deck Posts in color of customer\'s choice',
      'Paint Deck Railing Paint Deck Railing in color of customer\'s choice',
      'Paint Deck Skirting Paint Deck Skirting in color of customer\'s choice',
      'Stain Deck Floor Stain Deck Floor in color of customer\'s choice',
      'Stain Deck Stairs Stain Deck Stairs in color of customer\'s choice',
      'Stain Deck Posts Stain Deck Posts in color of customer\'s choice',
      'Stain Deck Railing Stain Deck Railing in color of customer\'s choice',
      'Stain Deck Skirting Stain Deck Skirting in color of customer\'s choice',
      'Paint Rot Iron Fence (Per Side) Paint Rot Iron Fence',
      'Paint Wood Fence Paint Wood Fence in color of customer\'s choice',
      'Stain Wood Fence (Per Side) Stain Wood Fence',
    ],
    'Painting Interior - Walls': [
      'Interior Walls - Kitchen Paint interior walls. 2 coats of paint',
      'Interior Walls - Entryway Paint interior walls. 2 coats of paint',
      'Interior Walls - Dining Room Paint interior walls. 2 coats of paint',
      'Interior Walls - Family Room Paint interior walls. 2 coats of paint',
      'Interior Walls - Hall Bathroom Paint interior walls. 2 coats of paint',
      'Interior Walls - Office Paint interior walls. 2 coats of paint',
      'Interior Walls - Rec Room Paint interior walls. 2 coats of paint',
      'Interior Walls - Master Bedroom Paint interior walls. 2 coats of paint',
      'Interior Walls - Master Bathroom Paint interior walls. 2 coats of paint',
      'Interior Walls - Laundry Room Paint interior walls. 2 coats of paint',
      'Interior Walls - Bedroom 1 Paint interior walls. 2 coats of paint',
      'Interior Walls - Bedroom 2 Paint interior walls. 2 coats of paint',
      'Interior Walls - Bedroom 3 Paint interior walls. 2 coats of paint',
      'Interior Walls - Bedroom 4 Paint interior walls. 2 coats of paint',
    ],
    'Interior Repairs': [
      'Standard Drywall Crack Repair Repair standard-sized cracks in drywall',
      'Small Drywall Patch Repair small-sized drywall patches',
      'Large Drywall Crack Repair Repair large-sized cracks in drywall',
      'Standard Drywall Patch Repair standard-sized drywall patches',
      'Nail Pops Repair nail pops as needed',
      'Skim Coat Apply skim coat to the surface as needed to obtain a smooth finish',
      'Plaster Caulking Use White Lightning Pristine or similar for plaster caulking',
    ],
    'Exterior Repairs': [
      'Additional Details Additional notes and details',
      'Repair using Rock Hard Filler Use Rock Hard Filler to repair exterior surfaces',
      'Replace Bird Box Replace bird boxes that are damaged or deteriorated',
      'Repair Fascia Repair fascia by cutting off rotten sections',
      'Replace Fascia Replace fascia that is rotten and beyond repair',
      'Replace Corner Fascia Under Guttering Replace corner fascia under the guttering',
      'Replace Corner Board Replace corner board where it is damaged',
      'Replace Window Trim Replace rotten and/or damaged window trim',
      'Replace Door Trim Replace door trim that is rotting or damaged',
      'Replace Exterior Door Replace exterior doors that are damaged',
      'Repair Beadboard Soffit Replace damaged areas of beadboard soffit',
      'Repair Soffit Repair 1-2 ft sections of soffit that are damaged',
      'Replace LP Smart Lap Siding Replace LP Smart Lap siding that is damaged',
      'Replace LP Smart Lap Panel Siding Replace LP Smart Lap panel siding as needed',
      'Replace Fiber Cement Siding Replace fiber cement siding where necessary',
      'Replace Housewrap Install new house wrap to protect the exterior',
      'Stucco Repair Repair stucco surfaces that are damaged',
      'General Repair General repairs not specifically listed but required for maintaining the exterior',
    ],
    'Painting Interior - Woodwork': [
      'Paint White Baseboards/Trim Paint White Baseboards and Trim',
      'Paint Stained Baseboards/Trim Paint Stained Baseboards and Trim',
      'Paint Door(s) One Side w/ Trim Paint One Side of Doors with Trim',
      'Paint Door(s) Both Sides w/ Trim and Jamb Paint Both Sides of Doors with Trim and Jamb',
      'Paint Double Door(s) Both Sides w/ Trim and Jamb Paint Both Sides of Double Doors with Trim and Jamb',
      'Paint Crown Molding Paint Crown Molding',
      'Paint Chair Rail Paint Chair Rail. We will protect adjacent surfaces',
      'Paint Handrail Paint Handrail. We will protect surrounding areas',
      'Paint Fireplace Mantel Paint Fireplace Mantel',
      'Paint Fireplace Mantel and Surround Paint Fireplace Mantel and Surround',
      'Paint Wood Window and Trim Paint Wood Windows and Trim',
      'Paint Window w/ Muntin Bars and Trim Paint Windows with Muntin Bars and Trim',
      'Paint Wainscot Paint Wainscot. We will protect adjacent surfaces',
    ],
    'Painting Interior - Kitchen and Bath Vanity': [
      'Paint Kitchen Cabinet Door Paint both sides of kitchen cabinet doors',
      'Paint Kitchen Cabinet Drawer Paint both sides of kitchen cabinet drawers',
      'Paint Kitchen Cabinet Boxes Paint outside of kitchen cabinet boxes',
      'Paint Master Bathroom Vanity Paint both sides of master bathroom vanity',
      'Paint Small Bathroom Vanity Paint both sides of small bathroom vanity',
      'Paint Standard Bathroom Vanity Paint both sides of standard bathroom vanity',
      'Paint Linen Cabinet Paint both sides of linen cabinet',
      'Paint Shelves Paint shelves. We will protect adjacent areas',
    ],
    'Painting Interior - Popcorn Removal, Knockdown Texture, Painting Ceilings':
    [
      'Popcorn Ceiling Removal - Knockdown Texture Remove popcorn ceiling and apply knockdown texture finish',
      'Popcorn Ceiling Removal - No Texture Remove popcorn ceiling without applying texture',
      'Paint Textured Ceilings Paint interior ceilings with textured finish',
      'Paint Ceiling Paint interior ceilings with 2 coats of paint',
      'Skim Coat Apply a skim coat to the surface as needed to obtain a smooth finish',
    ],
  };


  // TextEditingControllers for description and note
  late final TextEditingController descriptionController;
  late final TextEditingController noteController;

  @override
  void onInit() {
    super.onInit();
    descriptionController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void onClose() {
    descriptionController.dispose();
    noteController.dispose();
    super.onClose();
  }

  // Function to update the selected item and reset other fields
  void setSelectedItem(String item) {
    selectedItem.value = item;
    selectedSubOption.value = ''; // Reset selected sub-option
    descriptionController.text = ''; // Reset description
    noteController.text = ''; // Reset note
    itemCount.value = 1; // Reset item count
  }

  Future<void> showSubOptionsDialog() async {
    await Get.dialog(
      AlertDialog(
        title: Text(
          'Details for ${selectedItem.value}',
          style: TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            color: AppColors.primaryRed,
            fontSize: Get.width * 0.04, // Adjust font size based on screen width
          ),
        ),
        content: Obx(() {
          final subOptions = itemOptions[selectedItem.value] ?? [];
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: subOptions.map((option) {
                    return customizeRow(
                      option,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => itemCount.value++,
                          ),
                          Text(itemCount.value.toString()),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              if (itemCount.value > 1) itemCount.value--;
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: Get.height * 0.02),
                const Text('Description:'),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter description here',
                    contentPadding: EdgeInsets.all(Get.width * 0.02),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                const Text('Notes:'),
                TextField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter notes here',
                    contentPadding: EdgeInsets.all(Get.width * 0.02),
                  ),
                ),
              ],
            ),
          );
        }),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Handle saving the information here
              print('Description: ${descriptionController.text}');
              print('Note: ${noteController.text}');
              print('Item count: ${itemCount.value}');
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> showDropdownMenu(BuildContext context) async {
    initializeOptions(itemOptions.cast<String, String>());

    String? selected = await showMenu<String>(
      context: context,
      menuPadding: EdgeInsets.symmetric(
        vertical: Get.height * 0.02,
        horizontal: Get.width * 0.02,
      ),
      color: Colors.white,
      position: RelativeRect.fromLTRB(
        Get.width * 0.2,
        Get.height * 0.3,
        Get.width * 0.2,
        Get.height * 0.1,
      ),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          enabled: false, // Disable the search field to avoid it being selectable.
          child: Column(
            children: [
              SizedBox(height: Get.height*0.05,
                child: TextField(

                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: 'Search...',
                    prefixIcon: Icon(CupertinoIcons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String value) {
                    updateSearchText(value, itemOptions.cast<String, String>());
                  },
                ),
              ),
              Obx(() {
                // Observe the filteredOptions list and build the dropdown items.
                return SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min,
                    children:   filteredOptions.map((String option) {
                      return PopupMenuItem<String>(
                        value: option,
                        child:Center(
                          child: Text(
                            option,
                            style: const TextStyle(fontFamily: AppFonts.poppinsRegular),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );

    if (selected != null) {
      setSelectedItem(selected);
      await showSubOptionsDialog();
    }
  }


  Widget customizeRow(String title, Widget leading) {
    return Column(
      children: [
        Row(
          children: [
            leading,
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 100,
                maxWidth: 170
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: AppFonts.interRegular,
                  fontSize: Get.width * 0.035, // Adjust font size based on screen width
                ),overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}

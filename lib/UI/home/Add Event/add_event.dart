import 'package:eventapp/UI/Widgets/custom_button.dart';
import 'package:eventapp/UI/Widgets/custom_text_formfield.dart';
import 'package:eventapp/UI/home/tabs/homeTab/event_tab_item.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/Utilis/firebaseutilis.dart';
import 'package:eventapp/models/event.dart';
import 'package:eventapp/providers/eventlist_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String selectedImage = '';
  String selectedeventName = '';

  late EventListProvider eventListProvider;

  int selectedIndex = 0;
  TextEditingController title_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String FormatedTime = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
    List<String> eventNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meating,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> eventImageList = [
      AppAsset.sportBg,
      AppAsset.birthdayBg,
      AppAsset.meetingBg,
      AppAsset.gamingBg,
      AppAsset.workShopBg,
      AppAsset.bookClubBg,
      AppAsset.exhibitionBg,
      AppAsset.holidayBg,
      AppAsset.eatingBg
    ];
    selectedImage = eventImageList[selectedIndex];
    selectedeventName = eventNameList[selectedIndex];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyle.bold20primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: height * 0.02),
                    height: height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                              eventImageList[selectedIndex],
                            ),
                            fit: BoxFit.fill))),
                SizedBox(
                  height: height * 0.04,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: eventNameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: EventTabItem(
                          selectedTextStyle:
                              Theme.of(context).textTheme.bodyMedium,
                          unSelectedTextStyle:
                              Theme.of(context).textTheme.bodySmall,
                          selectedGgColor: AppColor.primaryLightColor,
                          eventName: eventNameList[index],
                          isSelected: selectedIndex == index,
                          borderColor: AppColor.primaryLightColor,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox();
                    },
                  ),
                ),
                Text(
                  textAlign: TextAlign.start,
                  AppLocalizations.of(context)!.title,
                  style: AppStyle.bold20black,
                ),
                CustomTextFormField(
                  controller: title_controller,
                  prefixIcon: Icon(Icons.drive_file_rename_outline_sharp),
                  hintText: AppLocalizations.of(context)!.title_hint,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),
                Text(
                  textAlign: TextAlign.start,
                  AppLocalizations.of(context)!.description,
                  style: AppStyle.bold20black,
                ),
                CustomTextFormField(
                  controller: description_controller,
                  maxlines: 3,
                  hintText: AppLocalizations.of(context)!.description_hint,
                ),
                Row(
                  children: [
                    Icon(Icons.date_range_outlined),
                    Text(
                      AppLocalizations.of(context)!.date_hint,
                      style: AppStyle.bold16black,
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: chooseDate,
                        child: Text(selectedDate == null
                            ? AppLocalizations.of(context)!.choose_date
                            : ' ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    Text(
                      AppLocalizations.of(context)!.time_hint,
                      style: AppStyle.bold16black,
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: chooseTime,
                        child: Text(selectedTime == null
                            ? AppLocalizations.of(context)!.choose_time
                            : FormatedTime))
                  ],
                ),
                CustomButton(
                    onpressed: addEvent,
                    text: AppLocalizations.of(context)!.add_event)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      Event event = Event(
          title: title_controller.text,
          image: selectedImage,
          dateTime: selectedDate!,
          description: description_controller.text,
          eventName: selectedeventName,
          time: FormatedTime);
      FireBaseUtilis.addEventToFireStore(event).timeout(
        Duration(milliseconds: 500),
        onTimeout: () {
          Fluttertoast.showToast(
              msg: AppLocalizations.of(context)!.event_created,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: AppColor.primaryLightColor,
              textColor: Colors.white,
              fontSize: 16.0);
          eventListProvider.getAllEvent();
          Navigator.pop(context);
        },
      );
    }
  }

  Future<void> chooseTime() async {
    var chooseTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    selectedTime = chooseTime;
    FormatedTime = selectedTime!.format(context);
    setState(() {});
  }

  Future<void> chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    selectedDate = chooseDate;
    setState(() {});
  }
}

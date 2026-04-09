// ignore_for_file: unused_field

import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/models/expense_model.dart';
import 'package:expence_app/models/income_model.dart';
import 'package:expence_app/services/expence_services.dart';
import 'package:expence_app/services/income_service.dart';
import 'package:expence_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selectedmethode = 0;

  IncomeCategory _incomeCategory = IncomeCategory.salary;
  ExpenseCategories _expenceCategory = ExpenseCategories.health;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ammountController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _ammountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (_selectedmethode == 1) ? kRedColor : kGreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedmethode = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: (_selectedmethode == 0)
                                  ? kMainColor
                                  : Colors.transparent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (_selectedmethode == 0)
                                      ? kWhiteColor
                                      : kBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedmethode = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: (_selectedmethode == 1)
                                  ? kMainColor
                                  : Colors.transparent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (_selectedmethode == 1)
                                      ? kWhiteColor
                                      : kBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Container(
                    margin: EdgeInsets.only(top: 130),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How mutch?",
                          style: TextStyle(color: kWhiteColor, fontSize: 18),
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.w600,
                            color: kWhiteColor,
                          ),
                          decoration: InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: kWhiteColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 300),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(height: kDefaultPadding),
                          DropdownButtonFormField(
                            initialValue: (_selectedmethode == 0)
                                ? _incomeCategory
                                : _expenceCategory,
                            decoration: InputDecoration(
                              hintText: "Category",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            items: (_selectedmethode == 0)
                                ? IncomeCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList()
                                : ExpenseCategories.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList(),

                            onChanged: (value) {
                              setState(() {
                                (_selectedmethode == 0)
                                    ? _incomeCategory = value as IncomeCategory
                                    : _expenceCategory = value as ExpenseCategories;
                              });
                            },
                          ),
                          SizedBox(height: kDefaultPadding),
                          TextField(
                            keyboardType: TextInputType.text,
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Title",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          TextField(
                            keyboardType: TextInputType.text,
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _ammountController,
                            decoration: InputDecoration(
                              hintText: "Amonut",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(height: kDefaultPadding),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                    initialDate: DateTime.now(),
                                  ).then((value) {
                                    (value != null)
                                        ? setState(() {
                                            _selectedDate = value;
                                          })
                                        : _selectedDate;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kMainColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 30,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: kWhiteColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Select Date",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: kWhiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat('MMMM EEEE dd').format(_selectedDate),
                                style: TextStyle(
                                  color: kGrayColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),

                                //d --> 7
                                //EEE --> sat
                                //M --> 4
                                //MMM --> apr

                                //dd --> 07
                                //EEEE --> saturday
                                //M --> 4
                                //MMMM ---> april
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    (value != null)
                                        ? setState(() {
                                            _selectedTime = DateTime(
                                              _selectedDate.year,
                                              _selectedDate.month,
                                              _selectedDate.day,
                                              value.hour,
                                              value.minute,
                                            );
                                          })
                                        : _selectedTime;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kYellowColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 30,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time, color: kWhiteColor),
                                        SizedBox(width: 10),
                                        Text(
                                          "Select Time",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: kWhiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.jm().format(_selectedTime),
                                style: TextStyle(
                                  color: kGrayColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),

                                //d --> 7
                                //EEE --> sat
                                //M --> 4
                                //MMM --> apr

                                //dd --> 07
                                //EEEE --> saturday
                                //M --> 4
                                //MMMM ---> april
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(
                            color: kGrayColor,
                            thickness: 3,
                            radius: BorderRadius.circular(100),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              if (_selectedmethode == 0) {
                                List<Income> list = await IncomeServices().getIncome();

                                Income income = Income(
                                  id: list.length + 1,
                                  title: _nameController.text,
                                  amount: double.parse(_ammountController.text),
                                  category: _incomeCategory,
                                  date: _selectedDate,
                                  time: _selectedTime,
                                  description: _descriptionController.text,
                                );
                                if (context.mounted) {
                                  IncomeServices().saveIncome(income, context);
                                }
                              } else {
                                List<Expense> expenseList = await ExpenceServices()
                                    .loadExpense();

                                Expense expense = Expense(
                                  id: expenseList.length + 1,
                                  title: _nameController.text,
                                  amount: double.parse(_ammountController.text),
                                  category: _expenceCategory,
                                  date: _selectedDate,
                                  time: _selectedTime,
                                  description: _descriptionController.text,
                                );

                                if (context.mounted) {
                                  ExpenceServices().saveExpences(expense, context);
                                }
                              }
                              _nameController.clear();
                              _descriptionController.clear();
                              _ammountController.clear();

                              setState(() {});
                            },
                            child: CustomButton(
                              buttonName: "Add",
                              buttonColor: (_selectedmethode == 0)
                                  ? kGreenColor
                                  : kRedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:w12bus/models/busLine.dart';
import 'package:w12bus/widgets/mainList.dart';
import 'package:w12bus/models/passenger.dart';
import 'package:w12bus/widgets/sheetButton.dart';
import 'package:w12bus/widgets/listV.dart';
import 'package:w12bus/widgets/textFieldCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BusLine> busList = [
    BusLine(
        name: 'YUTONG',
        from: 'Асыката',
        to: 'Алматы',
        fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
        toDateTime: DateTime.parse("2020-02-07 06:10:00"),
        seats: '32 мест',
        carNumber: 'KZ 888 KN02',
        icon: 'bus1.jpg'),
    BusLine(
        name: 'End2End Test1',
        from: 'Город X',
        to: 'Сарыагаш',
        fromDateTime: DateTime.parse("2020-02-06 19:30:00"),
        toDateTime: DateTime.parse("2020-02-07 18:36:00"),
        seats: '53 мест',
        carNumber: 'KZ 123 ABC',
        icon: 'bus2.jpg'),
    BusLine(
        name: 'YUTONG',
        from: 'Сарыагаш',
        to: 'Алматы',
        fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
        toDateTime: DateTime.parse("2020-02-07 06:10:00"),
        seats: '32 мест',
        carNumber: 'KZ 888 KN02',
        icon: 'bus3.jpg'),
  ];

  Widget textTemp(text, [fontSize = 18.0, weight = FontWeight.normal]) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: fontSize,
          fontWeight: weight,
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget cardTemplate(BusLine bus) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/${bus.icon}',
                        fit: BoxFit.fitHeight,
                        width: 150,
                        height: 200,
                      ),
                    ),
                    SizedBox(height: 5),
                    textTemp(bus.name, 20.0),
                    SizedBox(height: 5),
                    textTemp(bus.carNumber, 18.0),
                    SizedBox(height: 5),
                    textTemp(bus.seats, 18.0)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    textTemp(bus.from + ' -', 24.0),
                    textTemp(bus.to, 24.0),
                    SizedBox(height: 15),
                    textTemp('Отправление', 20.0, FontWeight.bold),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textTemp(
                            'Дата  -  ' +
                                DateFormat('dd.MM.yyyy E')
                                    .format(bus.fromDateTime),
                            18.0),
                        SizedBox(height: 5),
                        textTemp(
                            'Время  -  ' +
                                DateFormat('HH:mm').format(bus.fromDateTime),
                            18.0)
                      ],
                    ),
                    SizedBox(height: 15),
                    textTemp('Прибытие', 20.0, FontWeight.bold),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textTemp(
                            'Дата  -  ' +
                                DateFormat('dd.MM.yyyy E')
                                    .format(bus.toDateTime),
                            18.0),
                        SizedBox(height: 5),
                        textTemp(
                            'Время  -  ' +
                                DateFormat('HH:mm').format(bus.toDateTime),
                            18.0)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          FlatButton(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            onPressed: () {
              Widget cancelButton = FlatButton(
                  child: Text(
                    "НЕТ",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  });
              Widget continueButton = FlatButton(
                child: Text(
                  "ДА",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () => setState(() {
                  busList.remove(bus);
                  Navigator.of(context).pop();
                }),
              );

              AlertDialog alert = AlertDialog(
                  content: Text(
                    "Вы хотите удалить этот рейс?",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 21.0),
                  ),
                  actions: [cancelButton, continueButton]);
              showDialog(context: context, builder: (context) => alert);
            },
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(7)),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: textTemp('Удалить рейс'),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 65.0,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Расписание',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: busList.map((bus) => cardTemplate(bus)).toList(),
      ),
      floatingActionButton: FlatButton(
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 00, 0, 50),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 105),
          child: Text(
            'Добавить рейс',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: Text(
                        'Test Company',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        'Aty Zhoni',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 36,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black87, width: 2),
                  ),
                ),
              ),
              listTile('Продажа билетов', Icon(Icons.credit_card), () {}),
              listTile('Список администраторов', Icon(Icons.people), () {}),
              listTile('Автобусы', Icon(Icons.departure_board), () {}),
              listTile('Статистика', Icon(Icons.equalizer), () {}),
              listTile('Пассажиры', Icon(Icons.airline_seat_recline_extra), () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PassengerScreen()));
              }),
              listTile('Расписание', Icon(Icons.date_range), () {}),
              listTile('История', Icon(Icons.library_books), () {}),
              listTile('Настройки', Icon(Icons.settings), () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class PassengerScreen extends StatefulWidget {
  @override
  _PassengerScreenState createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  List<Passenger> passengers = [
    Passenger(
      name: 'Aigerim',
      placeNumber: '0 A',
      placeType: PlaceType.up,
      buyType: BuyType.offline,
    ),
    Passenger(
      name: 'Arlan',
      placeNumber: '0 B',
      placeType: PlaceType.up,
      buyType: BuyType.offline,
    ),
    Passenger(
      name: 'Assel',
      placeNumber: '1',
      placeType: PlaceType.down,
      buyType: BuyType.online,
    ),
    Passenger(
      name: 'Temirlan',
      placeNumber: '1',
      placeType: PlaceType.up,
      buyType: BuyType.online,
    ),
  ];

  List<Passenger> emptyPlaces = [
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 A',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 B',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
  ];

  Widget childWidget(context, name, placeNumber, placeType, passenger) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: mWidth,
        height: mHeight * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Информация о пассажире',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            TextFieldCard(
              text: name,
              color: Colors.black,
            ),
            TextFieldCard(
              text: '87012345678',
              color: Colors.black,
            ),
            TextFieldCard(
              text: 'Почта',
              color: Colors.green,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Место',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Цена',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: TextFieldCard(
                    text: placeType == PlaceType.up
                        ? '$placeNumber верхний'
                        : '$placeNumber нижний',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: TextFieldCard(
                    text: '3000',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  child: SheetButton(
                    title: 'ИЗМЕНИТЬ',
                    onTap: () {},
                  ),
                ),
                Container(
                  height: 50,
                  child: SheetButton(
                    title: 'ОТПРАВИТЬ ЧЕК',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: SheetButton(
                title: 'ОТМЕНИТЬ ПОКУПКУ БИЛЕТА',
                onTap: () {
                  Navigator.pop(context);
                  Widget cancelButton = FlatButton(
                      child: Text(
                        "НЕТ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      });
                  Widget continueButton = FlatButton(
                      child: Text(
                        "ДА",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          passengers.remove(passenger);
                          emptyPlaces.insert(
                            0,
                            Passenger(
                              name: 'Нет Имени',
                              placeNumber: placeNumber,
                              placeType: placeType,
                              buyType: BuyType.noType,
                            ),
                          );
                        });
                        Navigator.pop(context);
                      });

                  AlertDialog alert = AlertDialog(
                      content: Text(
                        "Вы хотите отменить покупку билета?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 21.0),
                      ),
                      actions: [cancelButton, continueButton]);
                  showDialog(context: context, builder: (context) => alert);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Пассажиры',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Имя',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Место',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Тип',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: passengers
                      .map(
                        (passenger) => listElement(passenger, () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return childWidget(
                                context,
                                passenger.name,
                                passenger.placeNumber,
                                passenger.placeType,
                                passenger,
                              );
                            },
                          );
                        }),
                      )
                      .toList(),
                ),
                Text(
                  'Свободные места',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: emptyPlaces
                      .map(
                        (emptyPlace) => listElement(emptyPlace, () {}),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

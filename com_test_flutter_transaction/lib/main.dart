import 'package:com_test_flutter_transaction/widgets/chart.dart';
import 'package:com_test_flutter_transaction/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

void main() {
  // Lock the device orientations
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      // theme: ThemeData(
      //   primarySwatch: Colors.purple,
      //   accentColor: Colors.amber,
      //   fontFamily: 'Quicksand',
      //   textTheme: Theme.of(context).textTheme.copyWith(
      //         titleLarge: const TextStyle(
      //           fontFamily: 'OpenSans',
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //   appBarTheme: const AppBarTheme(
      //     titleTextStyle: TextStyle(
      //       fontFamily: 'OpenSans',
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              fontFamily: 'Quicksand',
            )
            .copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ).copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];
  bool _showChart = true;

  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      transactions.add(Transaction(
          id: DateTime.now().toString(),
          name: title,
          amount: amount,
          date: date));
    });
  }

  void _deleteTransaction(String transactionId) {
    setState(() {
      transactions
          .removeWhere((transaction) => transaction.id == transactionId);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return NewTransaction(commitCallback: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final appBar = AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => {_startAddNewTransaction(context)},
        ),
      ],
      title: Text(widget.title),
    );

    final contentHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    final transactionList = Container(
      height: contentHeight * 0.75,
      alignment: Alignment.center,
      child: TransactionList(
        transactions: transactions,
        deleteCallback: _deleteTransaction,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Show Chart"),
                    Switch(
                      value: _showChart,
                      onChanged: (value) {
                        setState(() {
                          _showChart = value;
                        });
                      },
                    )
                  ],
                ),
              if (isLandscape)
                _showChart
                    ? SizedBox(
                        child: Chart(recentTrasactions: transactions),
                        height: contentHeight * 0.75,
                      )
                    : transactionList,
              if (!isLandscape)
                SizedBox(
                  child: Chart(recentTrasactions: transactions),
                  height: contentHeight * 0.25,
                ),
              if (!isLandscape) transactionList,
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

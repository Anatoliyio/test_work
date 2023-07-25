part of 'models.dart';

class MvpScaffoldModel extends StatelessWidget {
  final Widget? child;
  final String appBarLabel;
  final VoidCallback? onTheme;

  const MvpScaffoldModel({
    super.key,
    this.child,
    required this.appBarLabel,
    this.onTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<SwapTheme>(context).getTheme ? AppTheme.backgroundColorLight : AppTheme.backgroundColorDark,
      appBar: CustomAppBar(
        onTheme: onTheme,
        name: appBarLabel,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: child,
        ),
      ),
    );
  }
}

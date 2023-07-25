part of 'models.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onTheme;
  final String name;
  static bool buttonTheme = false;

  const CustomAppBar({
    super.key,
    this.onBack,
    this.onTheme,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Provider.of<SwapTheme>(context).getTheme ? AppTheme.appBarManeColorLight : AppTheme.appBarManeColorDark,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GradientAnimatedIconButton(
            icon: 'assets/svg/arrow_back.svg',
            onPressed: onBack ?? () {},
          ),
          Text(
            name,
            style: TextLocalStyles.roboto400.copyWith(fontSize: 18, color: Provider.of<SwapTheme>(context).getTheme ? Color.fromRGBO(22, 26, 29, 1) : Colors.white),
            textAlign: TextAlign.center,
          ),
          GradientAnimatedIconButton(
            icon: Provider.of<SwapTheme>(context).getTheme ? 'assets/svg/moon.svg' : 'assets/svg/charm_sun.svg',
            onPressed: onTheme ?? () {
              Provider.of<SwapTheme>(context, listen: false).updateTheme();
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class GradientAnimatedIconButton extends StatefulWidget {
  final String icon;
  final VoidCallback onPressed;

  const GradientAnimatedIconButton({required this.icon, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<GradientAnimatedIconButton> createState() => _GradientAnimatedIconButtonState();
}

class _GradientAnimatedIconButtonState extends State<GradientAnimatedIconButton> {

  static const gradientColorsDark = [
  [AppTheme.appBarButtonFirstBorderColorDark, AppTheme.appBarButtonSecondBorderColorDark],
  [AppTheme.mainGreenColor, AppTheme.mainGreenColor],
  [AppTheme.appBarButtonFillColor2Dark, AppTheme.appBarButtonFillColor1Dark],
  ];

  static const gradientColorsLight = [
    [AppTheme.appBarButtonFirstBorderColorLight, AppTheme.appBarButtonSecondBorderColorLight],
    [AppTheme.mainGreenColor, AppTheme.mainGreenColor],
    [AppTheme.appBarButtonFillColor2Light, AppTheme.appBarButtonFillColor1Light],
  ];

  int index = 0;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: isPressed ? AppTheme.mainGreenColor : (Provider.of<SwapTheme>(context).getTheme ? AppTheme.appBarButtonFirstBorderColorLight : AppTheme.appBarButtonFirstBorderColorDark),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: Provider.of<SwapTheme>(context).getTheme ? gradientColorsLight[index] : gradientColorsDark[index],
            ),
          ),
          child: Container(
            height: 36,
            width: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: Provider.of<SwapTheme>(context).getTheme ? [AppTheme.appBarButtonFillColor2Light, AppTheme.appBarButtonFillColor1Light] : [AppTheme.appBarButtonFillColor2Dark, AppTheme.appBarButtonFillColor1Dark],
              ),
            ),
            child: SvgPicture.asset(
              widget.icon,
              colorFilter: ColorFilter.mode(
                isPressed ? AppTheme.mainGreenColor : AppTheme.appBarButtonIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        onPointerDown: (_) {
          index = 1;
          isPressed = true;

          setState(() {});
        },
        onPointerUp: (_) {
          index = 0;
          isPressed = false;

          widget.onPressed.call();
          setState(() {});
        });
  }
}

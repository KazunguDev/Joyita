import 'package:cervivorbd/Utils/Exports/packages.dart';

class loginSignupButton extends StatelessWidget {
  final String? label;
  final GestureTapCallback? onPressed;
  final IconData? icon;
  const loginSignupButton({@required this.onPressed, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            elevation: 0,
            primary: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: .5),
            side: const BorderSide(
                width: 1.0, color: Color.fromARGB(255, 0, 0, 0))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
                const SizedBox(width: 5),
                Text(
                  label!,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}

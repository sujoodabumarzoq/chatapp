import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';


class MySnackBars {

  static var rewrite = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: '',
      message:
      'Previously existing mail, re-write a new mail',
      contentType: ContentType.failure,
    ),
  );

  /// help
  static var retypepassword = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: '',
      message:
      'Weak password, retype it',
      contentType: ContentType.help,
    ),
  );
  static var successfully = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: '',
      message:
      'User created successfully!',
      contentType: ContentType.help,
    ),
  );
  static var warningSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Warning!',
      message: 'You Have a warning for this message.\nPlease read carefully!',
      contentType: ContentType.warning,
    ),
  );
}

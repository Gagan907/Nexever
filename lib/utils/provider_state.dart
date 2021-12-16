import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexever_flutter_task/utils/snackbar.dart';
import 'package:provider/provider.dart';
import 'custom_change_notifier.dart';
import 'di_container.dart';

abstract class ProviderState<K extends CustomChangeNotifier, T extends StatefulWidget> extends State<T> {

  K provider = sl();
  //SharedPreferences sharedPrefs = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<K>.value(
      value: provider,
      child: Consumer<K>(
        builder: (context, provider, child) {
          return provider.isLoading! ? _showLoading() : _buildLayout(provider);
        },
      ),
    );
  }

  Widget _showLoading() {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildLayout(K provider) {
    if (provider.isError == true) _onError(provider.error);
    provider.isError = false;
    return withProvider(provider);
  }

  Widget withProvider(K provider) {
    return const SizedBox();
  }

  _onError(String? error) async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      showInSnackBar(context, error!);
    });
  }

  showSuccess(String? msg) async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      showInSnackBar(context, msg!);
    });
  }

  showError(String? msg) async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      showInSnackBar(context, msg!);
    });
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }
}
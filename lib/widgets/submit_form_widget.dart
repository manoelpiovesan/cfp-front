import 'package:cfp_front/consumers/paper_consumer.dart';
import 'package:cfp_front/models/paper_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
///
///
class SubmitFormWidget extends StatefulWidget {
  const SubmitFormWidget({super.key});

  @override
  State<SubmitFormWidget> createState() => _SubmitFormWidgetState();
}

///
///
///
class _SubmitFormWidgetState extends State<SubmitFormWidget> {
  final PaperModel _paper = PaperModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 700,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
              child: Column(
            spacing: 18,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /// Text
              const Text(
                'Submeta um artigo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// Title
              TextFormField(
                validator: (final String? value) =>
                    value == null || value.isEmpty
                        ? 'Título é obrigatório'
                        : null,
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
                onChanged: (final String value) => _paper.title = value,
              ),

              /// Summary
              TextFormField(
                validator: (final String? value) =>
                    value == null || value.isEmpty
                        ? 'Resumo é obrigatório'
                        : null,
                minLines: 7,
                maxLines: 15,
                decoration: const InputDecoration(
                  labelText: 'Resumo',
                ),
                onChanged: (final String value) => _paper.summary = value,
              ),

              /// Button
              ElevatedButton.icon(
                onPressed: () async {

                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  final bool result = await PaperConsumer().create(_paper);

                  if (result) {
                    GoRouter.of(context).goNamed('home');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Artigo submetido com sucesso'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Erro ao submeter artigo'),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.upload_file),
                label: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Submeter'),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

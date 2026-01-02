import 'package:injectable/injectable.dart' hide Environment;
import 'package:shared/shared.dart';

@injectable
class NetworkPathResolver {
  final Environment env;
  const NetworkPathResolver(this.env);

  String getPath({String? uat, String? cug, String? prod}) {
    assert(
      uat != null || cug != null || prod != null,
      'All Network endpoints are null. At least one must be provided.',
    );
    return switch (env.flavor) {
      .uat => uat ?? cug ?? prod!,
      .cug => cug ?? uat ?? prod!,
      .prod => prod ?? uat ?? cug!,
    };
  }
}

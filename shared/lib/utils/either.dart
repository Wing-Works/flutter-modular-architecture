/// Represents which side of an [Either] value.
enum Side {
  /// The left side of an Either value.
  left,

  /// The right side of an Either value.
  right,
}

/// A union type containing either a left value [L] or a right value [R].
///
/// The Either type is commonly used for error handling where [L] represents
/// an error type and [R] represents a success type.
typedef Either<L, R> = ({L? left, R? right});

/// Creates a left value of type [L] for an [Either].
///
/// Example:
/// ```dart
/// final error = left<String, int>('Error occurred');
/// ```
Either<L, R> left<L, R>(L value) => (left: value, right: null);

/// Creates a right value of type [R] for an [Either].
///
/// Example:
/// ```dart
/// final success = right<String, int>(42);
/// ```
Either<L, R> right<L, R>(R value) => (left: null, right: value);

/// Extension providing utility methods for [Either] values.
extension EitherExtension<L, R> on Either<L, R> {
  /// Returns true if this contains a left value.
  bool get isLeft => this.left != null;

  /// Returns true if this contains a right value.
  bool get isRight => this.right != null;

  /// Gets the left value if present, otherwise returns null.
  ///
  /// This is a safe way to access the left value without throwing.
  L? get leftOrNull => this.left;

  /// Gets the right value if present, otherwise returns null.
  ///
  /// This is a safe way to access the right value without throwing.
  R? get rightOrNull => this.right;

  /// Gets the left value if present, otherwise throws a [StateError].
  ///
  /// Use [leftOrNull] for safe access or check [isLeft] before calling.
  L get leftValue {
    final leftVal = this.left;
    if (leftVal != null) return leftVal;
    throw StateError('Either contains a right value, not a left value');
  }

  /// Gets the right value if present, otherwise throws a [StateError].
  ///
  /// Use [rightOrNull] for safe access or check [isRight] before calling.
  R get rightValue {
    final rightVal = this.right;
    if (rightVal != null) return rightVal;
    throw StateError('Either contains a left value, not a right value');
  }

  /// Applies [onLeft] if this contains a left value, [onRight] if this contains a right value.
  ///
  /// This is the primary way to handle both cases of an Either.
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) {
    final leftVal = this.left;
    if (leftVal != null) return onLeft(leftVal);

    final rightVal = this.right;
    if (rightVal != null) return onRight(rightVal);

    throw StateError(
      'Either is in an invalid state - both left and right are null',
    );
  }

  /// Applies [onLeft] if this contains a left value, [onRight] if this contains a right value.
  ///
  /// Similar to [fold] but for void operations.
  void when(void Function(L) onLeft, void Function(R) onRight) {
    final leftVal = this.left;
    if (leftVal != null) {
      onLeft(leftVal);
      return;
    }

    final rightVal = this.right;
    if (rightVal != null) {
      onRight(rightVal);
      return;
    }

    throw StateError(
      'Either is in an invalid state - both left and right are null',
    );
  }

  /// Maps the right value using [transform] if present, otherwise returns the left value unchanged.
  ///
  /// This is useful for chaining operations on success values while preserving errors.
  Either<L, T> map<T>(T Function(R) transform) {
    final rightVal = this.right;
    if (rightVal != null) return right<L, T>(transform(rightVal));

    final leftVal = this.left;
    if (leftVal != null) return left<L, T>(leftVal);

    throw StateError(
      'Either is in an invalid state - both left and right are null',
    );
  }

  /// Maps the left value using [transform] if present, otherwise returns the right value unchanged.
  ///
  /// This is useful for transforming error values while preserving success values.
  Either<T, R> mapLeft<T>(T Function(L) transform) {
    final leftVal = this.left;
    if (leftVal != null) return left<T, R>(transform(leftVal));

    final rightVal = this.right;
    if (rightVal != null) return right<T, R>(rightVal);

    throw StateError(
      'Either is in an invalid state - both left and right are null',
    );
  }

  /// Flat maps the right value using [transform] if present, otherwise returns the left value unchanged.
  ///
  /// This is useful for chaining Either-returning operations.
  Either<L, T> flatMap<T>(Either<L, T> Function(R) transform) {
    final rightVal = this.right;
    if (rightVal != null) return transform(rightVal);

    final leftVal = this.left;
    if (leftVal != null) return left<L, T>(leftVal);

    throw StateError(
      'Either is in an invalid state - both left and right are null',
    );
  }

  /// Returns the right value if present, otherwise returns [defaultValue].
  R getOrElse(R defaultValue) {
    final rightVal = this.right;
    return rightVal ?? defaultValue;
  }

  /// Returns the right value if present, otherwise computes and returns the result of [defaultValue].
  R getOrElseGet(R Function() defaultValue) {
    final rightVal = this.right;
    return rightVal ?? defaultValue();
  }

  /// Swaps left and right values.
  ///
  /// A left value becomes a right value and vice versa.
  Either<R, L> swap() {
    final leftVal = this.left;
    if (leftVal != null) return right<R, L>(leftVal);

    final rightVal = this.right;
    if (rightVal != null) return left<R, L>(rightVal);

    throw StateError(
      'Either is in an invalid state - both left and right are null',
    );
  }

  /// Converts this Either to a List containing either the left or right value.
  ///
  /// Returns an empty list if neither value is present (invalid state).
  List<dynamic> toList() {
    final leftVal = this.left;
    if (leftVal != null) return [leftVal];

    final rightVal = this.right;
    if (rightVal != null) return [rightVal];

    return [];
  }

  /// Returns a string representation of this Either.
  String toStringValue() {
    final leftVal = this.left;
    if (leftVal != null) return 'Left($leftVal)';

    final rightVal = this.right;
    if (rightVal != null) return 'Right($rightVal)';

    return 'Either(invalid state)';
  }

  /// Checks if this Either is equal to [other].
  bool isEqualTo(Object other) {
    if (identical(this, other)) return true;
    if (other is! Either<L, R>) return false;

    return this.left == other.left && this.right == other.right;
  }

  /// Returns a hash code for this Either.
  int get hashValue => Object.hash(this.left, this.right);
}

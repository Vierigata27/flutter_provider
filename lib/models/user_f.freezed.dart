// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_f.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Person {

 String get firstName; String get lastName; int get age;
/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonCopyWith<Person> get copyWith => _$PersonCopyWithImpl<Person>(this as Person, _$identity);

  /// Serializes this Person to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Person&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.age, age) || other.age == age));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,age);

@override
String toString() {
  return 'Person(firstName: $firstName, lastName: $lastName, age: $age)';
}


}

/// @nodoc
abstract mixin class $PersonCopyWith<$Res>  {
  factory $PersonCopyWith(Person value, $Res Function(Person) _then) = _$PersonCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, int age
});




}
/// @nodoc
class _$PersonCopyWithImpl<$Res>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._self, this._then);

  final Person _self;
  final $Res Function(Person) _then;

/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? age = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Person].
extension PersonPatterns on Person {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Person value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Person() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Person value)  $default,){
final _that = this;
switch (_that) {
case _Person():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Person value)?  $default,){
final _that = this;
switch (_that) {
case _Person() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  int age)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Person() when $default != null:
return $default(_that.firstName,_that.lastName,_that.age);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  int age)  $default,) {final _that = this;
switch (_that) {
case _Person():
return $default(_that.firstName,_that.lastName,_that.age);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  int age)?  $default,) {final _that = this;
switch (_that) {
case _Person() when $default != null:
return $default(_that.firstName,_that.lastName,_that.age);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Person implements Person {
  const _Person({required this.firstName, required this.lastName, required this.age});
  factory _Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  int age;

/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonCopyWith<_Person> get copyWith => __$PersonCopyWithImpl<_Person>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Person&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.age, age) || other.age == age));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,age);

@override
String toString() {
  return 'Person(firstName: $firstName, lastName: $lastName, age: $age)';
}


}

/// @nodoc
abstract mixin class _$PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$PersonCopyWith(_Person value, $Res Function(_Person) _then) = __$PersonCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, int age
});




}
/// @nodoc
class __$PersonCopyWithImpl<$Res>
    implements _$PersonCopyWith<$Res> {
  __$PersonCopyWithImpl(this._self, this._then);

  final _Person _self;
  final $Res Function(_Person) _then;

/// Create a copy of Person
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? age = null,}) {
  return _then(_Person(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Settings {
  final String? mode;

  final double? slide;
  final int? radioSelected;
  final bool? switchSelected;
  Settings({
    this.mode,
    this.slide,
    this.radioSelected,
    this.switchSelected,
  });

  Settings copyWith({
    String? mode,
    double? slide,
    int? radioSelected,
    bool? switchSelected,
  }) {
    return Settings(
      mode: mode ?? this.mode,
      slide: slide ?? this.slide,
      radioSelected: radioSelected ?? this.radioSelected,
      switchSelected: switchSelected ?? this.switchSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mode': mode,
      'slide': slide,
      'radioSelected': radioSelected,
      'switchSelected': switchSelected,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      mode: map['mode'] != null ? map['mode'] as String : null,
      slide: map['slide'] != null ? map['slide'] as double : null,
      radioSelected: map['radioSelected'] != null ? map['radioSelected'] as int : null,
      switchSelected: map['switchSelected'] != null ? map['switchSelected'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) => Settings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Settings(mode: $mode, slide: $slide, radioSelected: $radioSelected, switchSelected: $switchSelected)';
  }

  @override
  bool operator ==(covariant Settings other) {
    if (identical(this, other)) return true;

    return other.mode == mode && other.slide == slide && other.radioSelected == radioSelected && other.switchSelected == switchSelected;
  }

  @override
  int get hashCode {
    return mode.hashCode ^ slide.hashCode ^ radioSelected.hashCode ^ switchSelected.hashCode;
  }
}

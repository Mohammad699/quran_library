import 'dart:convert' show jsonDecode, jsonEncode;
import 'dart:developer' show log;
import 'dart:io' show File, Platform, Directory;
import 'dart:math' as math show max;

import 'package:archive/archive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '/quran_library.dart';

part 'core/extensions/convert_arabic_to_english_numbers_extension.dart';
part 'core/extensions/convert_number_extension.dart';
part 'core/extensions/extensions.dart';
part 'core/extensions/fonts_download_widget.dart';
part 'core/extensions/fonts_extension.dart';
part 'core/extensions/sajda_extension.dart';
part 'core/extensions/string_extensions.dart';
part 'core/extensions/surah_info_extension.dart';
part 'core/extensions/text_span_extension.dart';
part 'core/utils/assets_path.dart';
part 'core/utils/storage_constants.dart';
part 'core/utils/toast_utils.dart';
part 'data/models/ayah.dart';
part 'data/models/quran_constants.dart';
part 'data/models/quran_fonts_models/ayah_model.dart';
part 'data/models/quran_fonts_models/download_fonts_dialog_style.dart';
part 'data/models/quran_fonts_models/sajda_model.dart';
part 'data/models/quran_fonts_models/surahs_model.dart';
part 'data/models/quran_page.dart';
part 'data/models/styles_models/banner_style.dart';
part 'data/models/styles_models/basmala_style.dart';
part 'data/models/styles_models/bookmark.dart';
part 'data/models/styles_models/surah_info_style.dart';
part 'data/models/styles_models/surah_name_style.dart';
part 'data/models/styles_models/surah_names_model.dart';
part 'data/models/surah.dart';
part 'data/repositories/quran_repository.dart';
part 'flutter_quran_utils.dart';
part 'presentation/controllers/bookmark/bookmarks_ctrl.dart';
part 'presentation/controllers/quran/quran_ctrl.dart';
part 'presentation/controllers/quran/quran_getters.dart';
part 'presentation/controllers/quran/quran_state.dart';
part 'presentation/pages/quran_library_screen.dart';
part 'presentation/widgets/all_quran_widget.dart';
part 'presentation/widgets/ayah_long_click_dialog.dart';
part 'presentation/widgets/bsmallah_widget.dart';
part 'presentation/widgets/custom_span.dart';
part 'presentation/widgets/default_drawer.dart';
part 'presentation/widgets/fonts_download_dialog.dart';
part 'presentation/widgets/quran_fonts_page.dart';
part 'presentation/widgets/quran_library_search_screen.dart';
part 'presentation/widgets/quran_line.dart';
part 'presentation/widgets/quran_line_page.dart';
part 'presentation/widgets/quran_text_scale.dart';
part 'presentation/widgets/surah_header_widget.dart';

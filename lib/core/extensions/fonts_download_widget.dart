part of '../../quran.dart';

extension FontsDownloadWidgetExtension on QuranCtrl {
  Widget fontsDownloadWidget(BuildContext context,
      {DownloadFontsDialogStyle? downloadFontsDialogStyle,
      String? languageCode,
      bool? isDark = false}) {
    final quranCtrl = QuranCtrl.instance;

    List<String> titleList = [
      downloadFontsDialogStyle?.defaultFontText ?? 'الخط الأساسية',
      downloadFontsDialogStyle?.downloadedFontsText ?? 'خط المصحف مع التجويد',
    ];
    // List<String> tajweedList = [
    //   downloadFontsDialogStyle?.withTajweedText ?? 'مع التجويد',
    //   downloadFontsDialogStyle?.withoutTajweedText ?? 'بدون تجويد',
    // ];
    return Container(
      height: 390,
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            downloadFontsDialogStyle?.title ?? 'الخطوط',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'kufi',
              color: downloadFontsDialogStyle?.titleColor ?? Colors.black,
              package: 'quran_library',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          context.horizontalDivider(
              width: MediaQuery.sizeOf(context).width * .5, color: Colors.blue),
          SizedBox(height: 8.0),
          Text(
            downloadFontsDialogStyle?.notes ??
                'لجعل مظهر المصحف مشابه لمصحف المدينة يمكنك تحميل خطوط المصحف',
            style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'naskh',
                color: downloadFontsDialogStyle?.notesColor ?? Colors.black,
                package: 'quran_library'),
          ),
          Spacer(),
          Column(
            children: List.generate(
              titleList.length,
              (i) => Container(
                margin: EdgeInsets.symmetric(vertical: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: downloadFontsDialogStyle
                            ?.downloadButtonBackgroundColor!
                            .withValues(alpha: .2) ??
                        Colors.blue.withValues(alpha: .2),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:
                    // Obx(() => AnimatedCrossFade(
                    //       duration: const Duration(milliseconds: 350),
                    //       crossFadeState:
                    //           (quranCtrl.state.fontsSelected2.value == 0)
                    //               ? CrossFadeState.showFirst
                    //               : CrossFadeState.showSecond,
                    //       firstChild:
                    Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  color: quranCtrl.state.fontsSelected2.value == i
                      ? downloadFontsDialogStyle?.linearProgressColor!
                              .withValues(alpha: .05) ??
                          Colors.blue.withValues(alpha: .05)
                      : null,
                  child: CheckboxListTile(
                      value: (quranCtrl.state.fontsSelected2.value == i)
                          ? true
                          : false,
                      activeColor:
                          downloadFontsDialogStyle?.linearProgressColor ??
                              Colors.blue,
                      secondary: i == 0
                          ? SizedBox.shrink()
                          : IconButton(
                              onPressed: () async {
                                quranCtrl.state.fontsDownloadedList.contains(i)
                                    ? await quranCtrl.deleteFonts(i)
                                    : await quranCtrl
                                        .downloadAllFontsZipFile(i);
                                log('fontIndex: $i');
                              },
                              icon: Icon(
                                quranCtrl.state.fontsDownloadedList.contains(i)
                                    ? Icons.delete_forever
                                    : Icons.downloading_outlined,
                                color: Colors.blue,
                              )),
                      title: Text(
                        titleList[i],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'naskh',
                          color: downloadFontsDialogStyle?.titleColor ??
                              Colors.black,
                          package: 'quran_library',
                        ),
                      ),
                      onChanged: !quranCtrl.state.isDownloadedV2Fonts.value
                          ? null
                          : (value) {
                              quranCtrl.state.fontsSelected2.value = i;
                              GetStorage()
                                  .write(StorageConstants().fontsSelected, i);
                              log('fontsSelected: $i');
                              Get.forceAppUpdate();
                            }),
                ),
                //   secondChild: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Container(
                //         height: 50,
                //         margin: EdgeInsets.symmetric(vertical: 4.0),
                //         color: quranCtrl.state.fontsSelected2.value == i
                //             ? downloadFontsDialogStyle?.linearProgressColor!
                //                     .withValues(alpha: .05) ??
                //                 Colors.blue.withValues(alpha: .05)
                //             : null,
                //         child: CheckboxListTile(
                //             value:
                //                 (quranCtrl.state.fontsSelected2.value == i)
                //                     ? true
                //                     : false,
                //             activeColor: downloadFontsDialogStyle
                //                     ?.linearProgressColor ??
                //                 Colors.blue,
                //             secondary: i == 0
                //                 ? SizedBox.shrink()
                //                 : IconButton(
                //                     onPressed: () async {
                //                       quranCtrl.state.fontsDownloadedList
                //                               .contains(i)
                //                           ? await quranCtrl.deleteFonts(i)
                //                           : await quranCtrl
                //                               .downloadAllFontsZipFile(i);
                //                       log('fontIndex: $i');
                //                     },
                //                     icon: Icon(
                //                       quranCtrl.state.fontsDownloadedList
                //                               .contains(i)
                //                           ? Icons.delete_forever
                //                           : Icons.downloading_outlined,
                //                       color: Colors.blue,
                //                     )),
                //             title: Text(
                //               titleList[i],
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontFamily: 'naskh',
                //                 color:
                //                     downloadFontsDialogStyle?.titleColor ??
                //                         Colors.black,
                //                 package: 'quran_library',
                //               ),
                //             ),
                //             onChanged: !quranCtrl
                //                     .state.isDownloadedV2Fonts.value
                //                 ? null
                //                 : (value) {
                //                     quranCtrl.state.fontsSelected2.value =
                //                         i;
                //                     GetStorage().write(
                //                         StorageConstants().fontsSelected,
                //                         i);
                //                     log('fontsSelected: $i');
                //                     Get.forceAppUpdate();
                //                   }),
                //       ),
                //       i == 1
                //           ? Obx(() => Padding(
                //                 padding:
                //                     EdgeInsets.symmetric(horizontal: 8.0),
                //                 child: Column(
                //                     children: List.generate(
                //                   tajweedList.length,
                //                   (ti) => Container(
                //                     height: 50,
                //                     margin: EdgeInsets.symmetric(
                //                         vertical: 4.0, horizontal: 8.0),
                //                     color: quranCtrl
                //                                 .state.isTajweed.value ==
                //                             ti
                //                         ? downloadFontsDialogStyle
                //                                 ?.linearProgressColor!
                //                                 .withValues(alpha: .05) ??
                //                             Colors.blue
                //                                 .withValues(alpha: .05)
                //                         : null,
                //                     child: CheckboxListTile(
                //                         value: (quranCtrl.state.isTajweed
                //                                     .value ==
                //                                 ti)
                //                             ? true
                //                             : false,
                //                         activeColor:
                //                             downloadFontsDialogStyle
                //                                     ?.linearProgressColor ??
                //                                 Colors.blue,
                //                         title: Text(
                //                           tajweedList[ti],
                //                           style: TextStyle(
                //                             fontSize: 14,
                //                             fontFamily: 'naskh',
                //                             color: downloadFontsDialogStyle
                //                                     ?.titleColor ??
                //                                 Colors.black,
                //                             package: 'quran_library',
                //                           ),
                //                         ),
                //                         onChanged: isDark!
                //                             ? null
                //                             : (v) {
                //                                 quranCtrl.state.isTajweed
                //                                     .value = ti;
                //                                 GetStorage().write(
                //                                     StorageConstants()
                //                                         .isTajweed,
                //                                     ti);
                //                               }),
                //                   ),
                //                 )),
                //               ))
                //           : const SizedBox.shrink(),
                //     ],
                //   ),
                // )),
              ),
            ),
          ),
          Obx(() => quranCtrl.state.fontsDownloadProgress.value != 0.0 &&
                  quranCtrl.state.isDownloadingFonts.value
              ? Text(
                  '${downloadFontsDialogStyle?.downloadingText} ${quranCtrl.state.fontsDownloadProgress.value.toStringAsFixed(1)}%'
                      .convertNumbersAccordingToLang(
                          languageCode: languageCode ?? 'ar'),
                  style: TextStyle(
                    color: downloadFontsDialogStyle?.notesColor ?? Colors.black,
                    fontSize: 16,
                    fontFamily: 'naskh',
                    package: 'quran_library',
                  ),
                )
              : const SizedBox.shrink()),
          Obx(() => quranCtrl.state.isDownloadedV2Fonts.value
              ? const SizedBox.shrink()
              : LinearProgressIndicator(
                  backgroundColor:
                      downloadFontsDialogStyle?.linearProgressBackgroundColor ??
                          Colors.blue.shade100,
                  value: (quranCtrl.state.fontsDownloadProgress.value / 100),
                  color: downloadFontsDialogStyle?.linearProgressColor ??
                      Colors.blue,
                )),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';

class CommonSearchField<T> extends StatefulWidget {
  final FocusNode? focusNode;
  final List<SearchFieldListItem<T>> suggestions;
  final Function(SearchFieldListItem<T>)? onSuggestionTap;
  final List<SearchFieldListItem<T>>? Function(String)? onSearchTextChanged;
  final bool? enabled;
  final bool readOnly;
  final Function(String)? onSubmit;
  final String? hint;
  final String? label;
  final TextInputAction? textInputAction;
  final SearchFieldListItem<T>? initialValue;
  final TextStyle? searchStyle;
  final TextStyle? suggestionStyle;
  final InputDecoration? searchInputDecoration;
  final Suggestion suggestionState;
  final SuggestionAction? suggestionAction;
  final SuggestionDecoration? suggestionsDecoration;
  final BoxDecoration? suggestionItemDecoration;
  final double itemHeight;
  final Color? marginColor;
  final int maxSuggestionsInViewPort;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final bool scrollbarAlwaysVisible;
  final Offset? offset;
  final Widget emptyWidget;
  final bool Function(String inputText, String suggestionKey)? comparator;
  final bool autoCorrect;
  final List<TextInputFormatter>? inputFormatters;
  final SuggestionDirection suggestionDirection;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? icon;
  final TextStyle? hintStyle;
  final Color? iconColor;
  CommonSearchField(
      {Key? key,
      required this.suggestions,
      this.autoCorrect = true,
      this.controller,
      this.emptyWidget = const SizedBox.shrink(),
      this.focusNode,
      this.hint,
      this.label,
      this.initialValue,
      this.inputFormatters,
      this.inputType,
      this.itemHeight = 50.0,
      this.marginColor,
      this.maxSuggestionsInViewPort = 5,
      this.enabled,
      this.readOnly = false,
      this.onSearchTextChanged,
      this.onSubmit,
      this.offset,
      this.onSuggestionTap,
      this.searchInputDecoration,
      this.searchStyle,
      this.scrollbarAlwaysVisible = false,
      this.suggestionStyle,
      this.suggestionsDecoration,
      this.suggestionDirection = SuggestionDirection.down,
      this.suggestionState = Suggestion.expand,
      this.suggestionItemDecoration,
      this.suggestionAction,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction,
      this.validator,
      this.contentPadding,
      this.icon,
      this.iconColor,
      this.hintStyle,
      @Deprecated('use onSearchTextChanged instead.') this.comparator})
      : assert(
            (initialValue != null &&
                    suggestions.containsObject(initialValue)) ||
                initialValue == null,
            'Initial value should either be null or should be present in suggestions list.'),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommonSearchFieldState<T> createState() => _CommonSearchFieldState();
}

class _CommonSearchFieldState<T> extends State<CommonSearchField<T>> {
  final StreamController<List<SearchFieldListItem<T>?>?> suggestionStream =
      StreamController<List<SearchFieldListItem<T>?>?>.broadcast();
  FocusNode? _focus;
  bool isSuggestionExpanded = false;
  TextEditingController? searchController;

  @override
  void dispose() {
    suggestionStream.close();
    _scrollController.dispose();
    if (widget.controller == null) {
      searchController!.dispose();
    }
    if (widget.focusNode == null) {
      _focus!.dispose();
    }
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry?.remove();
    }
    super.dispose();
  }

  void initialize() {
    if (widget.focusNode != null) {
      _focus = widget.focusNode;
    } else {
      _focus = FocusNode();
    }
    _focus!.addListener(() {
      if (mounted) {
        setState(() {
          isSuggestionExpanded = _focus!.hasFocus;
        });
      }
      if (isSuggestionExpanded) {
        if (widget.initialValue == null) {
          if (widget.suggestionState == Suggestion.expand) {
            Future.delayed(const Duration(milliseconds: 100), () {
              suggestionStream.sink.add(widget.suggestions);
            });
          }
        }
        Overlay.of(context).insert(_overlayEntry!);
      } else {
        if (_overlayEntry != null && _overlayEntry!.mounted) {
          _overlayEntry?.remove();
        }
      }
    });
  }

  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    super.initState();
    searchController = widget.controller ?? TextEditingController();
    initialize();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _overlayEntry = _createOverlay();
        if (widget.initialValue == null ||
            widget.initialValue!.searchKey.isEmpty) {
          suggestionStream.sink.add(null);
        } else {
          searchController!.text = widget.initialValue!.searchKey;
          suggestionStream.sink.add([widget.initialValue]);
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    if (key.currentContext != null) {
      if (_overlayEntry != null && _overlayEntry!.mounted) {
        _overlayEntry?.remove();
      }
      _overlayEntry = _createOverlay();
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CommonSearchField<T> oldWidget) {
    if (oldWidget.controller != widget.controller) {
      searchController = widget.controller ?? TextEditingController();
    }
    if (oldWidget.suggestions != widget.suggestions) {
      suggestionStream.sink.add(widget.suggestions);
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget _suggestionsBuilder() {
    return StreamBuilder<List<SearchFieldListItem<T>?>?>(
      stream: suggestionStream.stream,
      builder: (BuildContext context,
          AsyncSnapshot<List<SearchFieldListItem<T>?>?> snapshot) {
        if (snapshot.data == null || !isSuggestionExpanded) {
          return const SizedBox();
        } else if (snapshot.data!.isEmpty) {
          return widget.emptyWidget;
        } else {
          if (snapshot.data!.length > widget.maxSuggestionsInViewPort) {
            _totalHeight = widget.itemHeight * widget.maxSuggestionsInViewPort;
          } else if (snapshot.data!.length == 1) {
            _totalHeight = widget.itemHeight;
          } else {
            _totalHeight = snapshot.data!.length * widget.itemHeight;
          }

          final Widget listView = ListView.builder(
            reverse: widget.suggestionDirection == SuggestionDirection.up,
            padding: EdgeInsets.zero,
            controller: _scrollController,
            itemCount: snapshot.data!.length,
            physics: snapshot.data!.length == 1
                ? const NeverScrollableScrollPhysics()
                : const ScrollPhysics(),
            itemBuilder: (context, index) => TextFieldTapRegion(
                child: InkWell(
              hoverColor: Colors.transparent,
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              highlightColor: Colors.transparent,
              onTap: () {
                searchController!.text = snapshot.data![index]!.searchKey;
                searchController!.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: searchController!.text.length,
                  ),
                );

                // suggestion action to switch focus to next focus node
                if (widget.suggestionAction != null) {
                  if (widget.suggestionAction == SuggestionAction.next) {
                    _focus!.nextFocus();
                  } else if (widget.suggestionAction ==
                      SuggestionAction.unfocus) {
                    _focus!.unfocus();
                  }
                }

                // hide the suggestions
                suggestionStream.sink.add(null);
                if (widget.onSuggestionTap != null) {
                  widget.onSuggestionTap!(snapshot.data![index]!);
                }
              },
              child: Container(
                height: widget.itemHeight,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: widget.suggestionItemDecoration?.copyWith(
                      border: widget.suggestionItemDecoration?.border ??
                          Border(
                            bottom: BorderSide(
                              color: widget.marginColor ?? Colors.transparent,
                            ),
                          ),
                    ) ??
                    BoxDecoration(
                      border: index == snapshot.data!.length - 1
                          ? null
                          : Border(
                              bottom: BorderSide(
                                color: widget.marginColor ?? Colors.transparent,
                              ),
                            ),
                    ),
                child: snapshot.data![index]!.child ??
                    Text(
                      snapshot.data![index]!.searchKey,
                      style: widget.suggestionStyle,
                    ),
              ),
            )),
          );

          return AnimatedContainer(
            duration: widget.suggestionDirection == SuggestionDirection.up
                ? Duration.zero
                : const Duration(milliseconds: 300),
            height: _totalHeight,
            alignment: Alignment.centerLeft,
            decoration: widget.suggestionsDecoration ??
                BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                        offset: Offset(
                          2.0,
                          5.0,
                        )),
                  ],
                ),
            child: RawScrollbar(
                thumbVisibility: widget.scrollbarAlwaysVisible,
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: listView),
          );
        }
      },
    );
  }

  Offset? getYOffset(
      Offset textFieldOffset, Size textFieldSize, int suggestionsCount) {
    if (mounted) {
      final size = MediaQuery.of(context).size;
      final isSpaceAvailable = size.height >
          textFieldOffset.dy + textFieldSize.height + _totalHeight;
      if (widget.suggestionDirection == SuggestionDirection.down) {
        return Offset(0, textFieldSize.height);
      } else if (widget.suggestionDirection == SuggestionDirection.up) {
        if (suggestionsCount > widget.maxSuggestionsInViewPort) {
          return Offset(
              0, -(widget.itemHeight * widget.maxSuggestionsInViewPort));
        } else {
          return Offset(0, -(widget.itemHeight * suggestionsCount));
        }
      } else {
        if (!_isDirectionCalculated) {
          _isDirectionCalculated = true;
          if (isSpaceAvailable) {
            _offset = Offset(0, textFieldSize.height);
            return _offset;
          } else {
            if (suggestionsCount > widget.maxSuggestionsInViewPort) {
              _offset = Offset(
                  0, -(widget.itemHeight * widget.maxSuggestionsInViewPort));
              return _offset;
            } else {
              _offset = Offset(0, -(widget.itemHeight * suggestionsCount));
              return _offset;
            }
          }
        } else {
          return _offset;
        }
      }
    }
    return null;
  }

  OverlayEntry _createOverlay() {
    final textFieldRenderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final textFieldsize = textFieldRenderBox.size;
    final offset = textFieldRenderBox.localToGlobal(Offset.zero);
    var yOffset = Offset.zero;
    return OverlayEntry(
        builder: (context) => StreamBuilder<List<SearchFieldListItem?>?>(
            stream: suggestionStream.stream,
            builder: (BuildContext context,
                AsyncSnapshot<List<SearchFieldListItem?>?> snapshot) {
              late var count = widget.maxSuggestionsInViewPort;
              if (snapshot.data != null) {
                count = snapshot.data!.length;
              }
              yOffset = getYOffset(offset, textFieldsize, count) ?? Offset.zero;
              return Positioned(
                left: offset.dx,
                width: textFieldsize.width,
                child: CompositedTransformFollower(
                    offset: widget.offset ?? yOffset,
                    link: _layerLink,
                    child: Material(child: _suggestionsBuilder())),
              );
            }));
  }

  final LayerLink _layerLink = LayerLink();
  late double _totalHeight;
  GlobalKey key = GlobalKey();
  bool _isDirectionCalculated = false;
  Offset _offset = Offset.zero;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (widget.suggestions.length > widget.maxSuggestionsInViewPort) {
      _totalHeight = widget.itemHeight * widget.maxSuggestionsInViewPort;
    } else {
      _totalHeight = widget.suggestions.length * widget.itemHeight;
    }
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        key: key,
        enabled: widget.enabled,
        autocorrect: widget.autoCorrect,
        readOnly: widget.readOnly,
        onFieldSubmitted: (x) {
          if (widget.onSubmit != null) widget.onSubmit!(x);
        },
        onTap: () {
          if (!isSuggestionExpanded &&
              widget.suggestionState == Suggestion.expand) {
            suggestionStream.sink.add(widget.suggestions);
            if (mounted) {
              setState(() {
                isSuggestionExpanded = true;
              });
            }
          }
        },
        inputFormatters: widget.inputFormatters,
        controller: widget.controller ?? searchController,
        focusNode: _focus,
        validator: widget.validator,
        style: widget.searchStyle,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle:
              TextStyle(fontFamily: Constants.fontMulish, fontSize: 12.sp),
          label: Text(widget.label!),
          labelStyle:
              TextStyle(fontFamily: Constants.fontMulish, fontSize: 12.sp),
          suffixIcon: Icon(
            widget.icon ?? Icons.arrow_drop_down_rounded,
            color: widget.iconColor ?? Constants.mainColor,
            size: 24,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        // InputDecoration(
        //   hintText: widget.hint,

        //   disabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       width: 1,
        //       color: Constants.mainColor,
        //     ), //<-- SEE HERE
        //     borderRadius: BorderRadius.circular(4),
        //   ),
        //   errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Constants.mainColor,
        //     ),
        //     borderRadius: const BorderRadius.all(
        //       Radius.circular(4),
        //     ),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       width: 1,
        //       color: Constants.mainColor,
        //     ), //<-- SEE HERE
        //     borderRadius: BorderRadius.circular(4),
        //   ),
        //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        //   focusedErrorBorder: const OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Color(0xffA8200D),
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(4),
        //     ),
        //   ),
        //   focusColor: Colors.transparent,
        //   hoverColor: Colors.transparent,
        //   fillColor: Constants.mainColor.withOpacity(0.05),
        //   contentPadding: widget.contentPadding ??
        //       const EdgeInsets.fromLTRB(12, 18, 18, 18),
        //   hintStyle: widget.hintStyle ??
        //       TextStyle(fontFamily: Constants.fontMulish, fontSize: 12.sp),
        //   labelStyle:
        //       TextStyle(fontFamily: Constants.fontMulish, fontSize: 12.sp),
        //   // suffix: suffix,

        //   suffixIcon: Icon(
        //     widget.icon ?? Icons.arrow_drop_down_rounded,
        //     color: widget.iconColor ?? Constants.mainColor,
        //     size: 24,
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Constants.mainColor,
        //     ),
        //     borderRadius: const BorderRadius.all(
        //       Radius.circular(4),
        //     ),
        //   ),
        // ),
        onChanged: (query) {
          var searchResult = <SearchFieldListItem<T>>[];
          if (widget.onSearchTextChanged != null) {
            searchResult = widget.onSearchTextChanged!(query) ?? [];
          } else {
            if (query.isEmpty) {
              _createOverlay();
              suggestionStream.sink.add(widget.suggestions);
              return;
            }
            for (final suggestion in widget.suggestions) {
              if (widget.comparator != null) {
                if (widget.comparator!(query, suggestion.searchKey)) {
                  searchResult.add(suggestion);
                }
              } else if (suggestion.searchKey
                  .toLowerCase()
                  .contains(query.toLowerCase())) {
                searchResult.add(suggestion);
              }
            }
          }
          suggestionStream.sink.add(searchResult);
        },
      ),
    );
  }
}

enum Suggestion {
  expand,
  hidden,
}

enum SuggestionAction {
  next,
  unfocus,
}

enum SuggestionDirection {
  down,
  up,
}

class SearchFieldListItem<T> {
  Key? key;
  final String searchKey;
  final String value;
  final T? item;
  final Widget? child;
  SearchFieldListItem(
    this.searchKey,
    this.value, {
    this.child,
    this.item,
    this.key,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchFieldListItem &&
            runtimeType == other.runtimeType &&
            searchKey == other.searchKey;
  }

  @override
  int get hashCode => searchKey.hashCode;
}

extension ListContainsObject<T> on List {
  bool containsObject(T object) {
    for (var item in this) {
      if (object == item) {
        return true;
      }
    }
    return false;
  }
}

class SuggestionDecoration extends BoxDecoration {
  /// padding around the suggestion list
  @override
  final EdgeInsetsGeometry padding;

  const SuggestionDecoration({
    this.padding = EdgeInsets.zero,
    Color? color,
    Border? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BoxShape shape = BoxShape.rectangle,
  }) : super(
            color: Constants.whitColor,
            border: border,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            gradient: gradient,
            shape: shape);
}

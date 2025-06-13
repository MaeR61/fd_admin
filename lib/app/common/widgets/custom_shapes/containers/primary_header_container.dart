import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaeRPrimaryHeaderContainer extends StatelessWidget {
  const MaeRPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaeRCurvedEdgesWidget(
      child: Container(
        color: ColorConstants.colorPrimary,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: context.watch<HomeIndexCubit>().state.currentIndex == 1
              ? context.dynamicHeight(0.425)
              : context.dynamicHeight(0.175),
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -200,
                child: MaeRCircularContainer(
                  width: context.dynamicWidth(0.8),
                  height: context.dynamicWidth(0.8),
                  padding: EdgeInsets.all(0),
                  backgroundColor: ColorConstants.colorWhite.withValues(
                    alpha: 0.1,
                  ),
                ),
              ),
              Positioned(
                top: 75,
                right: -250,
                child: MaeRCircularContainer(
                  width: context.dynamicWidth(0.8),
                  height: context.dynamicWidth(0.8),
                  padding: EdgeInsets.all(0),
                  backgroundColor: ColorConstants.colorWhite.withValues(
                    alpha: 0.1,
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:visit_card/visit_card/domain/job.dart';
import 'package:visit_card/visit_card/utils/date_utils.dart';
import 'package:visit_card/visit_card/widgets/space.dart';

class WorkExpirienceItem extends StatelessWidget {
  WorkExpirienceItem({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: job.companyLogo != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(job.companyLogo!),
                    )
                  : null,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black45, width: 2),
            ),
          ),
          const HorizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.companyName,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                if (job.activityKind != null) Text(job.activityKind!,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      job.startDate?.formatToMonthWithYear() ?? '',
                      style: TextStyle(color: Colors.black45),
                    ),
                    Text(
                      ' - ',
                      style: TextStyle(color: Colors.black45),
                    ),
                    Text(
                      job.endDate?.formatToMonthWithYear() ?? 'nowadays',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cervivorbd/Utils/Exports/screens.dart';
import 'package:cervivorbd/Utils/Exports/packages.dart';
import 'package:cervivorbd/Utils/Exports/firebase.dart';

class TopDoctorsList extends StatelessWidget {
  const TopDoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Doctors')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doctor = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/doctor_details',
                            arguments: Doctor(
                              fullname: doctor['fullname'],
                              doctorDescription:
                                  doctor['doctorDescription'],
                              doctorHospital: doctor['doctorHospital'],
                              doctorIsOpen: doctor['doctorIsOpen'],
                              doctorPicture: 'nazia.png',
                              doctorSpeciality: doctor['doctorSpeciality'],
                              doctorYearOfExperience:
                                  doctor['doctorYearOfExperience'],
                              doctorStartWorkingHour:
                                  doctor['doctorStartWorkingHour'],
                              doctorEndWorkingHour:
                                  doctor['doctorEndWorkingHour'],
                            ),
                          );
                        },
                        child: Cards(
                          doctor: Doctor(
                            fullname: doctor['fullname'],
                            doctorPicture: 'nazia.png',
                            doctorDescription: doctor['doctorDescription'],
                            doctorHospital: doctor['doctorHospital'],
                            doctorIsOpen: doctor['doctorIsOpen'],
                            doctorSpeciality: doctor['doctorSpeciality'],
                            doctorYearOfExperience:
                                doctor['doctorYearOfExperience'],
                            doctorStartWorkingHour:
                                doctor['doctorStartWorkingHour'],
                            doctorEndWorkingHour:
                                doctor['doctorEndWorkingHour'],
                          ),
                        ),
                      );
                    },
                  ));
            }));
  }
}

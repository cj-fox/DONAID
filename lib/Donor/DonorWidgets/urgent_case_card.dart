import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donaid/Donor/DonorAlertDialog/DonorAlertDialogs.dart';
import 'package:donaid/Models/Organization.dart';
import 'package:donaid/Models/UrgentCase.dart';
import 'package:flutter/material.dart';

import '../urgent_case_donate_screen.dart';

class UrgentCaseCard extends StatefulWidget {
  final UrgentCase urgentCase;

  const UrgentCaseCard( this.urgentCase, {Key? key}) : super(key: key);

  @override
  State<UrgentCaseCard> createState() => _UrgentCaseCardState();
}

class _UrgentCaseCardState extends State<UrgentCaseCard> {
  final _firestore = FirebaseFirestore.instance;
  Organization? organization;

  @override
  void initState() {
    super.initState();
    _getUrgentCaseOrganization();
  }

  _getUrgentCaseOrganization() async{

    var ret = await _firestore.collection('OrganizationUsers')
        .where('uid', isEqualTo: widget.urgentCase.organizationID)
        .get();

    for(var element in ret.docs){
      organization = Organization(
        organizationName: element.data()['organizationName'],
        uid: element.data()['uid'],
        organizationDescription: element.data()['organizationDescription'],
        country: element.data()['country'],
        gatewayLink: element.data()['gatewayLink'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 275.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.grey.shade300, width: 2.0)),

          child: Column(children: [
              const Icon(Icons.assistant, color: Colors.blue, size: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.urgentCase.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
            SizedBox(
                height: 75.0,
                child: Text(
                  widget.urgentCase.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('\$${(widget.urgentCase.amountRaised.toStringAsFixed(2))}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.black, fontSize: 15)),
              Text(
                '\$${widget.urgentCase.goalAmount.toStringAsFixed(2)}',
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ]),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
              value: (widget.urgentCase.amountRaised/widget.urgentCase.goalAmount),
              minHeight: 10,
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        if(organization?.country =='United States'){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return (UrgentCaseDonateScreen(widget.urgentCase));
                          })).then((value){
                            setState(() {

                            });
                          });
                        }
                        else{
                          DonorAlertDialogs.paymentLinkPopUp(context, organization!);
                        }
                      },
                      child: Row(children: [
                        const Icon(Icons.favorite,
                              color: Colors.white, size: 20),
                        Container(
                          margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                          child: const Text('Donate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        )
                      ]),
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ))
          ]),
        ));
  }
}

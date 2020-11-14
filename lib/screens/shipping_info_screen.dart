import 'package:flutter/material.dart';
import 'package:odyssey_challenge_app/entities/shipping_info.dart';

class ShippingInfoScreen extends StatelessWidget {
  const ShippingInfoScreen({Key key}) : super(key: key);

  final shippingInfo = const ShippingInfo(
    didAddress: 'DID#shipment-kgh23f5kg2',
    type: ShipmentType.transportation,
    status: 'On route',
    hawb: 'i1SD23gGu1GBBadKJfgsj9kloOKI',
    pickupAddress: 'Amsterdam',
    deliveryAddress: 'Barcelona',
    delivery: 'drivers.europe@dhl',
  );

  @override
  Widget build(BuildContext context) {
    final boldTextStyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontWeight: FontWeight.bold);
    final italicTextStyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontStyle: FontStyle.italic, fontSize: 18);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(shippingInfo.didAddress, style: boldTextStyle),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Type: '),
                  TextSpan(
                    text: shippingInfo.type.stringified,
                    style: boldTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Status: '),
                  TextSpan(text: shippingInfo.status, style: boldTextStyle),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'HAWB#: '),
                  TextSpan(text: shippingInfo.hawb, style: boldTextStyle),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Pickup address [city]: '),
                  TextSpan(
                    text: shippingInfo.pickupAddress,
                    style: boldTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Delivery address [city]: '),
                  TextSpan(
                    text: shippingInfo.deliveryAddress,
                    style: boldTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Delivery: '),
                Text(shippingInfo.delivery, style: italicTextStyle),
              ],
            ),
            const SizedBox(height: 60),
            ShippingStatusWidget(shippingInfo: shippingInfo),
          ],
        ),
      ),
    );
  }
}

class ShippingStatusWidget extends StatelessWidget {
  const ShippingStatusWidget({
    @required this.shippingInfo,
    Key key,
  })  : assert(shippingInfo != null),
        super(key: key);

  final ShippingInfo shippingInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).primaryColorLight,
      child: Column(
        children: [
          ShippingInfoRow(
            title: const Text('Start'),
            content: Text(ShipmentType.readyForTransport.stringified),
            shippingInfo: shippingInfo,
            rowIndex: 0,
          ),
          const SizedBox(
            height: 35,
            child: Icon(Icons.arrow_downward),
          ),
          ShippingInfoRow(
            title: const Text('Process'),
            content: Text(ShipmentType.transportation.stringified),
            shippingInfo: shippingInfo,
            rowIndex: 1,
          ),
          const SizedBox(
            height: 35,
            child: Icon(Icons.arrow_downward),
          ),
          ShippingInfoRow(
            title: const Text('Complete'),
            content: Text(ShipmentType.delivered.stringified),
            shippingInfo: shippingInfo,
            rowIndex: 2,
          ),
        ],
      ),
    );
  }
}

class ShippingInfoRow extends StatelessWidget {
  const ShippingInfoRow({
    @required this.title,
    @required this.content,
    @required this.shippingInfo,
    @required this.rowIndex,
    Key key,
  })  : assert(shippingInfo != null),
        assert(content != null),
        assert(shippingInfo != null),
        assert(rowIndex != null),
        super(key: key);

  final Widget title;
  final Widget content;
  final ShippingInfo shippingInfo;
  final int rowIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        content,
        ShippingCheckboxTile(
          shippingInfo: shippingInfo,
          rowIndex: rowIndex,
        ),
      ],
    );
  }
}

class ShippingCheckboxTile extends StatelessWidget {
  const ShippingCheckboxTile({
    @required this.shippingInfo,
    @required this.rowIndex,
    Key key,
  })  : assert(shippingInfo != null),
        super(key: key);

  final ShippingInfo shippingInfo;
  final int rowIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Done'),
        Checkbox(
          value: _isEnabled(rowIndex),
          onChanged: _isEnabled(rowIndex) ? null : (_) {},
        )
      ],
    );
  }

  bool _isEnabled(int index) => index <= shippingInfo.type.index;
}

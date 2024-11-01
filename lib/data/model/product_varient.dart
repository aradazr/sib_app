import 'package:sib_app/data/model/varient.dart';
import 'package:sib_app/data/model/varient_type.dart';

class ProductVariant {
  VariantType variantType;
  List<Variant> variantList;

  ProductVariant(
    this.variantType,
    this.variantList,
  );
}

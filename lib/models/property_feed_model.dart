// To parse this JSON data, do
//
//     final propertyFeedModel = propertyFeedModelFromJson(jsonString);

import 'dart:convert';

PropertyFeedModel propertyFeedModelFromJson(String str) => PropertyFeedModel.fromJson(json.decode(str));

String propertyFeedModelToJson(PropertyFeedModel data) => json.encode(data.toJson());

class PropertyFeedModel {
  PropertyFeedModel({
    required this.accountStatus,
    required this.emailNotConfirmed,
    required this.validationFailed,
    required this.validationReport,
    required this.website,
    required this.metadata,
    required this.objects,
    required this.paging,
    required this.totaalAantalObjecten,
  });

  int accountStatus;
  bool emailNotConfirmed;
  bool validationFailed;
  dynamic validationReport;
  int website;
  Metadata metadata;
  List<Object> objects;
  Paging paging;
  int totaalAantalObjecten;

  factory PropertyFeedModel.fromJson(Map<String, dynamic> json) => PropertyFeedModel(
        accountStatus: json["AccountStatus"],
        emailNotConfirmed: json["EmailNotConfirmed"],
        validationFailed: json["ValidationFailed"],
        validationReport: json["ValidationReport"],
        website: json["Website"],
        metadata: Metadata.fromJson(json["Metadata"]),
        objects: List<Object>.from(json["Objects"].map((x) => Object.fromJson(x))),
        paging: Paging.fromJson(json["Paging"]),
        totaalAantalObjecten: json["TotaalAantalObjecten"],
      );

  Map<String, dynamic> toJson() => {
        "AccountStatus": accountStatus,
        "EmailNotConfirmed": emailNotConfirmed,
        "ValidationFailed": validationFailed,
        "ValidationReport": validationReport,
        "Website": website,
        "Metadata": metadata.toJson(),
        "Objects": List<dynamic>.from(objects.map((x) => x.toJson())),
        "Paging": paging.toJson(),
        "TotaalAantalObjecten": totaalAantalObjecten,
      };
}

class Metadata {
  Metadata({
    required this.objectType,
    required this.omschrijving,
    required this.titel,
  });

  String objectType;
  String omschrijving;
  String titel;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        objectType: json["ObjectType"],
        omschrijving: json["Omschrijving"],
        titel: json["Titel"],
      );

  Map<String, dynamic> toJson() => {
        "ObjectType": objectType,
        "Omschrijving": omschrijving,
        "Titel": titel,
      };
}

class Object {
  Object({
    required this.aangebodenSindsTekst,
    required this.aanmeldDatum,
    required this.aantalBeschikbaar,
    required this.aantalKamers,
    required this.aantalKavels,
    required this.aanvaarding,
    required this.adres,
    required this.afstand,
    required this.bronCode,
    required this.childrenObjects,
    required this.datumAanvaarding,
    required this.datumOndertekeningAkte,
    required this.foto,
    required this.fotoLarge,
    required this.fotoLargest,
    required this.fotoMedium,
    required this.fotoSecure,
    required this.gewijzigdDatum,
    required this.globalId,
    required this.groupByObjectType,
    required this.heeft360GradenFoto,
    required this.heeftBrochure,
    required this.heeftOpenhuizenTopper,
    required this.heeftOverbruggingsgrarantie,
    required this.heeftPlattegrond,
    required this.heeftTophuis,
    required this.heeftVeiling,
    required this.heeftVideo,
    required this.huurPrijsTot,
    required this.huurprijs,
    required this.huurprijsFormaat,
    required this.id,
    required this.inUnitsVanaf,
    required this.indProjectObjectType,
    required this.indTransactieMakelaarTonen,
    required this.isSearchable,
    required this.isVerhuurd,
    required this.isVerkocht,
    required this.isVerkochtOfVerhuurd,
    required this.koopprijs,
    required this.koopprijsFormaat,
    required this.koopprijsTot,
    required this.land,
    required this.makelaarId,
    required this.makelaarNaam,
    required this.mobileUrl,
    required this.note,
    required this.openHuis,
    required this.oppervlakte,
    required this.perceeloppervlakte,
    required this.postcode,
    required this.prijs,
    required this.prijsGeformatteerdHtml,
    required this.prijsGeformatteerdTextHuur,
    required this.prijsGeformatteerdTextKoop,
    required this.producten,
    required this.project,
    required this.projectNaam,
    required this.promoLabel,
    required this.publicatieDatum,
    required this.publicatieStatus,
    required this.savedDate,
    required this.soortAanbod,
    required this.objectSoortAanbod,
    required this.startOplevering,
    required this.timeAgoText,
    required this.transactieAfmeldDatum,
    required this.transactieMakelaarId,
    required this.transactieMakelaarNaam,
    required this.typeProject,
    required this.url,
    required this.verkoopStatus,
    required this.wgs84X,
    required this.wgs84Y,
    required this.woonOppervlakteTot,
    required this.woonoppervlakte,
    required this.woonplaats,
    required this.zoekType,
  });

  String aangebodenSindsTekst;
  String aanmeldDatum;
  dynamic aantalBeschikbaar;
  int aantalKamers;
  dynamic aantalKavels;
  String aanvaarding;
  String adres;
  int afstand;
  String bronCode;
  List<dynamic> childrenObjects;
  dynamic datumAanvaarding;
  dynamic datumOndertekeningAkte;
  String foto;
  String fotoLarge;
  String fotoLargest;
  String fotoMedium;
  String fotoSecure;
  dynamic gewijzigdDatum;
  int globalId;
  String groupByObjectType;
  bool heeft360GradenFoto;
  bool heeftBrochure;
  bool heeftOpenhuizenTopper;
  bool heeftOverbruggingsgrarantie;
  bool heeftPlattegrond;
  bool heeftTophuis;
  bool heeftVeiling;
  bool heeftVideo;
  dynamic huurPrijsTot;
  dynamic huurprijs;
  dynamic huurprijsFormaat;
  String id;
  dynamic inUnitsVanaf;
  bool indProjectObjectType;
  dynamic indTransactieMakelaarTonen;
  bool isSearchable;
  bool isVerhuurd;
  bool isVerkocht;
  bool isVerkochtOfVerhuurd;
  int koopprijs;
  String koopprijsFormaat;
  int koopprijsTot;
  String land;
  int makelaarId;
  String makelaarNaam;
  String mobileUrl;
  dynamic note;
  List<dynamic> openHuis;
  int oppervlakte;
  int perceeloppervlakte;
  String postcode;
  Prijs prijs;
  String prijsGeformatteerdHtml;
  String prijsGeformatteerdTextHuur;
  String prijsGeformatteerdTextKoop;
  List<String> producten;
  Project project;
  dynamic projectNaam;
  PromoLabel promoLabel;
  DateTime publicatieDatum;
  int publicatieStatus;
  dynamic savedDate;
  String soortAanbod;
  int objectSoortAanbod;
  dynamic startOplevering;
  dynamic timeAgoText;
  dynamic transactieAfmeldDatum;
  dynamic transactieMakelaarId;
  dynamic transactieMakelaarNaam;
  int typeProject;
  String url;
  String verkoopStatus;
  double wgs84X;
  double wgs84Y;
  int woonOppervlakteTot;
  int woonoppervlakte;
  String woonplaats;
  List<int> zoekType;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        aangebodenSindsTekst: json["AangebodenSindsTekst"],
        aanmeldDatum: json["AanmeldDatum"],
        aantalBeschikbaar: json["AantalBeschikbaar"],
        aantalKamers: json["AantalKamers"],
        aantalKavels: json["AantalKavels"],
        aanvaarding: json["Aanvaarding"],
        adres: json["Adres"],
        afstand: json["Afstand"],
        bronCode: json["BronCode"],
        childrenObjects: List<dynamic>.from(json["ChildrenObjects"].map((x) => x)),
        datumAanvaarding: json["DatumAanvaarding"],
        datumOndertekeningAkte: json["DatumOndertekeningAkte"],
        foto: json["Foto"],
        fotoLarge: json["FotoLarge"],
        fotoLargest: json["FotoLargest"],
        fotoMedium: json["FotoMedium"],
        fotoSecure: json["FotoSecure"],
        gewijzigdDatum: json["GewijzigdDatum"],
        globalId: json["GlobalId"],
        groupByObjectType: json["GroupByObjectType"],
        heeft360GradenFoto: json["Heeft360GradenFoto"],
        heeftBrochure: json["HeeftBrochure"],
        heeftOpenhuizenTopper: json["HeeftOpenhuizenTopper"],
        heeftOverbruggingsgrarantie: json["HeeftOverbruggingsgrarantie"],
        heeftPlattegrond: json["HeeftPlattegrond"],
        heeftTophuis: json["HeeftTophuis"],
        heeftVeiling: json["HeeftVeiling"],
        heeftVideo: json["HeeftVideo"],
        huurPrijsTot: json["HuurPrijsTot"],
        huurprijs: json["Huurprijs"],
        huurprijsFormaat: json["HuurprijsFormaat"],
        id: json["Id"],
        inUnitsVanaf: json["InUnitsVanaf"],
        indProjectObjectType: json["IndProjectObjectType"],
        indTransactieMakelaarTonen: json["IndTransactieMakelaarTonen"],
        isSearchable: json["IsSearchable"],
        isVerhuurd: json["IsVerhuurd"],
        isVerkocht: json["IsVerkocht"],
        isVerkochtOfVerhuurd: json["IsVerkochtOfVerhuurd"],
        koopprijs: json["Koopprijs"],
        koopprijsFormaat: json["KoopprijsFormaat"],
        koopprijsTot: json["KoopprijsTot"],
        land: json["Land"] == null ? '' : json["Land"],
        makelaarId: json["MakelaarId"],
        makelaarNaam: json["MakelaarNaam"],
        mobileUrl: json["MobileURL"],
        note: json["Note"],
        openHuis: List<dynamic>.from(json["OpenHuis"].map((x) => x)),
        oppervlakte: json["Oppervlakte"],
        perceeloppervlakte: json["Perceeloppervlakte"] == null ? 0 : json["Perceeloppervlakte"],
        postcode: json["Postcode"],
        prijs: Prijs.fromJson(json["Prijs"]),
        prijsGeformatteerdHtml: json["PrijsGeformatteerdHtml"],
        prijsGeformatteerdTextHuur: json["PrijsGeformatteerdTextHuur"],
        prijsGeformatteerdTextKoop: json["PrijsGeformatteerdTextKoop"],
        producten: List<String>.from(json["Producten"].map((x) => x)),
        project: Project.fromJson(json["Project"]),
        projectNaam: json["ProjectNaam"],
        promoLabel: PromoLabel.fromJson(json["PromoLabel"]),
        publicatieDatum: DateTime.fromMicrosecondsSinceEpoch(int.parse(json["PublicatieDatum"].toString().substring(6, 18))),
        publicatieStatus: json["PublicatieStatus"],
        savedDate: json["SavedDate"],
        soortAanbod: json["Soort-aanbod"],
        objectSoortAanbod: json["SoortAanbod"],
        startOplevering: json["StartOplevering"],
        timeAgoText: json["TimeAgoText"],
        transactieAfmeldDatum: json["TransactieAfmeldDatum"],
        transactieMakelaarId: json["TransactieMakelaarId"],
        transactieMakelaarNaam: json["TransactieMakelaarNaam"],
        typeProject: json["TypeProject"],
        url: json["URL"],
        verkoopStatus: json["VerkoopStatus"],
        wgs84X: json["WGS84_X"].toDouble(),
        wgs84Y: json["WGS84_Y"].toDouble(),
        woonOppervlakteTot: json["WoonOppervlakteTot"],
        woonoppervlakte: json["Woonoppervlakte"],
        woonplaats: json["Woonplaats"],
        zoekType: List<int>.from(json["ZoekType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "AangebodenSindsTekst": aangebodenSindsTekst,
        "AanmeldDatum": aanmeldDatum,
        "AantalBeschikbaar": aantalBeschikbaar,
        "AantalKamers": aantalKamers,
        "AantalKavels": aantalKavels,
        "Aanvaarding": aanvaarding,
        "Adres": adres,
        "Afstand": afstand,
        "BronCode": bronCode,
        "ChildrenObjects": List<dynamic>.from(childrenObjects.map((x) => x)),
        "DatumAanvaarding": datumAanvaarding,
        "DatumOndertekeningAkte": datumOndertekeningAkte,
        "Foto": foto,
        "FotoLarge": fotoLarge,
        "FotoLargest": fotoLargest,
        "FotoMedium": fotoMedium,
        "FotoSecure": fotoSecure,
        "GewijzigdDatum": gewijzigdDatum,
        "GlobalId": globalId,
        "GroupByObjectType": groupByObjectType,
        "Heeft360GradenFoto": heeft360GradenFoto,
        "HeeftBrochure": heeftBrochure,
        "HeeftOpenhuizenTopper": heeftOpenhuizenTopper,
        "HeeftOverbruggingsgrarantie": heeftOverbruggingsgrarantie,
        "HeeftPlattegrond": heeftPlattegrond,
        "HeeftTophuis": heeftTophuis,
        "HeeftVeiling": heeftVeiling,
        "HeeftVideo": heeftVideo,
        "HuurPrijsTot": huurPrijsTot,
        "Huurprijs": huurprijs,
        "HuurprijsFormaat": huurprijsFormaat,
        "Id": id,
        "InUnitsVanaf": inUnitsVanaf,
        "IndProjectObjectType": indProjectObjectType,
        "IndTransactieMakelaarTonen": indTransactieMakelaarTonen,
        "IsSearchable": isSearchable,
        "IsVerhuurd": isVerhuurd,
        "IsVerkocht": isVerkocht,
        "IsVerkochtOfVerhuurd": isVerkochtOfVerhuurd,
        "Koopprijs": koopprijs,
        "KoopprijsFormaat": koopprijsFormaat,
        "KoopprijsTot": koopprijsTot,
        "Land": land == null ? '' : land,
        "MakelaarId": makelaarId,
        "MakelaarNaam": makelaarNaam,
        "MobileURL": mobileUrl,
        "Note": note,
        "OpenHuis": List<dynamic>.from(openHuis.map((x) => x)),
        "Oppervlakte": oppervlakte,
        "Perceeloppervlakte": perceeloppervlakte == null ? '' : perceeloppervlakte,
        "Postcode": postcode,
        "Prijs": prijs.toJson(),
        "PrijsGeformatteerdHtml": prijsGeformatteerdHtml,
        "PrijsGeformatteerdTextHuur": prijsGeformatteerdTextHuur,
        "PrijsGeformatteerdTextKoop": prijsGeformatteerdTextKoop,
        "Producten": List<dynamic>.from(producten.map((x) => x)),
        "Project": project.toJson(),
        "ProjectNaam": projectNaam,
        "PromoLabel": promoLabel.toJson(),
        "PublicatieDatum": publicatieDatum,
        "PublicatieStatus": publicatieStatus,
        "SavedDate": savedDate,
        "Soort-aanbod": soortAanbod,
        "SoortAanbod": objectSoortAanbod,
        "StartOplevering": startOplevering,
        "TimeAgoText": timeAgoText,
        "TransactieAfmeldDatum": transactieAfmeldDatum,
        "TransactieMakelaarId": transactieMakelaarId,
        "TransactieMakelaarNaam": transactieMakelaarNaam,
        "TypeProject": typeProject,
        "URL": url,
        "VerkoopStatus": verkoopStatus,
        "WGS84_X": wgs84X,
        "WGS84_Y": wgs84Y,
        "WoonOppervlakteTot": woonOppervlakteTot,
        "Woonoppervlakte": woonoppervlakte,
        "Woonplaats": woonplaats,
        "ZoekType": List<dynamic>.from(zoekType.map((x) => x)),
      };
}

class Prijs {
  Prijs({
    required this.geenExtraKosten,
    required this.huurAbbreviation,
    required this.huurprijs,
    required this.huurprijsOpAanvraag,
    required this.huurprijsTot,
    required this.koopAbbreviation,
    required this.koopprijs,
    required this.koopprijsOpAanvraag,
    required this.koopprijsTot,
    required this.originelePrijs,
    required this.veilingText,
  });

  bool geenExtraKosten;
  String huurAbbreviation;
  dynamic huurprijs;
  String huurprijsOpAanvraag;
  dynamic huurprijsTot;
  String koopAbbreviation;
  int koopprijs;
  String koopprijsOpAanvraag;
  int koopprijsTot;
  dynamic originelePrijs;
  String veilingText;

  factory Prijs.fromJson(Map<String, dynamic> json) => Prijs(
        geenExtraKosten: json["GeenExtraKosten"],
        huurAbbreviation: json["HuurAbbreviation"],
        huurprijs: json["Huurprijs"],
        huurprijsOpAanvraag: json["HuurprijsOpAanvraag"],
        huurprijsTot: json["HuurprijsTot"],
        koopAbbreviation: json["KoopAbbreviation"],
        koopprijs: json["Koopprijs"],
        koopprijsOpAanvraag: json["KoopprijsOpAanvraag"],
        koopprijsTot: json["KoopprijsTot"],
        originelePrijs: json["OriginelePrijs"],
        veilingText: json["VeilingText"],
      );

  Map<String, dynamic> toJson() => {
        "GeenExtraKosten": geenExtraKosten,
        "HuurAbbreviation": huurAbbreviation,
        "Huurprijs": huurprijs,
        "HuurprijsOpAanvraag": huurprijsOpAanvraag,
        "HuurprijsTot": huurprijsTot,
        "KoopAbbreviation": koopAbbreviation,
        "Koopprijs": koopprijs,
        "KoopprijsOpAanvraag": koopprijsOpAanvraag,
        "KoopprijsTot": koopprijsTot,
        "OriginelePrijs": originelePrijs,
        "VeilingText": veilingText,
      };
}

class Project {
  Project({
    required this.aantalKamersTotEnMet,
    required this.aantalKamersVan,
    required this.aantalKavels,
    required this.adres,
    required this.friendlyUrl,
    required this.gewijzigdDatum,
    required this.globalId,
    required this.hoofdFoto,
    required this.indIpix,
    required this.indPdf,
    required this.indPlattegrond,
    required this.indTop,
    required this.indVideo,
    required this.internalId,
    required this.maxWoonoppervlakte,
    required this.minWoonoppervlakte,
    required this.naam,
    required this.omschrijving,
    required this.openHuizen,
    required this.plaats,
    required this.prijs,
    required this.prijsGeformatteerd,
    required this.publicatieDatum,
    required this.type,
    required this.woningtypen,
  });

  dynamic aantalKamersTotEnMet;
  dynamic aantalKamersVan;
  dynamic aantalKavels;
  dynamic adres;
  dynamic friendlyUrl;
  dynamic gewijzigdDatum;
  dynamic globalId;
  String hoofdFoto;
  bool indIpix;
  bool indPdf;
  bool indPlattegrond;
  bool indTop;
  bool indVideo;
  String internalId;
  dynamic maxWoonoppervlakte;
  dynamic minWoonoppervlakte;
  dynamic naam;
  dynamic omschrijving;
  List<dynamic> openHuizen;
  dynamic plaats;
  dynamic prijs;
  dynamic prijsGeformatteerd;
  dynamic publicatieDatum;
  int type;
  dynamic woningtypen;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        aantalKamersTotEnMet: json["AantalKamersTotEnMet"],
        aantalKamersVan: json["AantalKamersVan"],
        aantalKavels: json["AantalKavels"],
        adres: json["Adres"],
        friendlyUrl: json["FriendlyUrl"],
        gewijzigdDatum: json["GewijzigdDatum"],
        globalId: json["GlobalId"],
        hoofdFoto: json["HoofdFoto"],
        indIpix: json["IndIpix"],
        indPdf: json["IndPDF"],
        indPlattegrond: json["IndPlattegrond"],
        indTop: json["IndTop"],
        indVideo: json["IndVideo"],
        internalId: json["InternalId"],
        maxWoonoppervlakte: json["MaxWoonoppervlakte"],
        minWoonoppervlakte: json["MinWoonoppervlakte"],
        naam: json["Naam"],
        omschrijving: json["Omschrijving"],
        openHuizen: List<dynamic>.from(json["OpenHuizen"].map((x) => x)),
        plaats: json["Plaats"],
        prijs: json["Prijs"],
        prijsGeformatteerd: json["PrijsGeformatteerd"],
        publicatieDatum: json["PublicatieDatum"],
        type: json["Type"],
        woningtypen: json["Woningtypen"],
      );

  Map<String, dynamic> toJson() => {
        "AantalKamersTotEnMet": aantalKamersTotEnMet,
        "AantalKamersVan": aantalKamersVan,
        "AantalKavels": aantalKavels,
        "Adres": adres,
        "FriendlyUrl": friendlyUrl,
        "GewijzigdDatum": gewijzigdDatum,
        "GlobalId": globalId,
        "HoofdFoto": hoofdFoto,
        "IndIpix": indIpix,
        "IndPDF": indPdf,
        "IndPlattegrond": indPlattegrond,
        "IndTop": indTop,
        "IndVideo": indVideo,
        "InternalId": internalId,
        "MaxWoonoppervlakte": maxWoonoppervlakte,
        "MinWoonoppervlakte": minWoonoppervlakte,
        "Naam": naam,
        "Omschrijving": omschrijving,
        "OpenHuizen": List<dynamic>.from(openHuizen.map((x) => x)),
        "Plaats": plaats,
        "Prijs": prijs,
        "PrijsGeformatteerd": prijsGeformatteerd,
        "PublicatieDatum": publicatieDatum,
        "Type": type,
        "Woningtypen": woningtypen,
      };
}

class PromoLabel {
  PromoLabel({
    required this.hasPromotionLabel,
    required this.promotionPhotos,
    required this.promotionType,
    required this.ribbonColor,
    required this.ribbonText,
    required this.tagline,
  });

  bool hasPromotionLabel;
  List<String> promotionPhotos;
  int promotionType;
  int ribbonColor;
  dynamic ribbonText;
  String tagline;

  factory PromoLabel.fromJson(Map<String, dynamic> json) => PromoLabel(
        hasPromotionLabel: json["HasPromotionLabel"],
        promotionPhotos: List<String>.from(json["PromotionPhotos"].map((x) => x)),
        promotionType: json["PromotionType"],
        ribbonColor: json["RibbonColor"],
        ribbonText: json["RibbonText"],
        tagline: json["Tagline"] == null ? '' : json["Tagline"],
      );

  Map<String, dynamic> toJson() => {
        "HasPromotionLabel": hasPromotionLabel,
        "PromotionPhotos": List<dynamic>.from(promotionPhotos.map((x) => x)),
        "PromotionType": promotionType,
        "RibbonColor": ribbonColor,
        "RibbonText": ribbonText,
        "Tagline": tagline == null ? '' : tagline,
      };
}

class Paging {
  Paging({
    required this.aantalPaginas,
    required this.huidigePagina,
    required this.volgendeUrl,
    required this.vorigeUrl,
  });

  int aantalPaginas;
  int huidigePagina;
  String volgendeUrl;
  dynamic vorigeUrl;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        aantalPaginas: json["AantalPaginas"],
        huidigePagina: json["HuidigePagina"],
        volgendeUrl: json["VolgendeUrl"],
        vorigeUrl: json["VorigeUrl"],
      );

  Map<String, dynamic> toJson() => {
        "AantalPaginas": aantalPaginas,
        "HuidigePagina": huidigePagina,
        "VolgendeUrl": volgendeUrl,
        "VorigeUrl": vorigeUrl,
      };
}

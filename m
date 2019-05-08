Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF88A17628
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 12:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbfEHKoN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 06:44:13 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:33832 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfEHKoN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 06:44:13 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,445,1549954800"; 
   d="scan'208";a="32090823"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 08 May 2019 03:44:11 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 8 May 2019 03:44:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfOb26TbhgGql5FsXaaPTc49yJP9Jx+iv88sMFkkUi8=;
 b=DJ322HsSEhrn7C/udTfWTNNeKjKEYumptHi83MbmRNbqDPWOwMryDbi69pWRfFJRpmkMSijvhg7OCBchJk9yOKcGuwylTijD4OujLMPGorp+o+J/B8L5ryklt8wsSD8ZK1w5UmDJU07YIi4t4lGS3Y6668VD3dGlNtPGRdB3z3Q=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3858.namprd11.prod.outlook.com (10.255.130.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 8 May 2019 10:44:06 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 10:44:06 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <jonas@norrbonn.se>, <linux-renesas-soc@vger.kernel.org>,
        <marek.vasut+renesas@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gA==
Date:   Wed, 8 May 2019 10:44:06 +0000
Message-ID: <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::33) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd67a406-48ee-40dc-8845-08d6d3a217b1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN6PR11MB3858;
x-ms-traffictypediagnostic: BN6PR11MB3858:
x-microsoft-antispam-prvs: <BN6PR11MB3858282DEF6901B42BE5D43FF0320@BN6PR11MB3858.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(136003)(346002)(39860400002)(199004)(189003)(64756008)(6116002)(66946007)(66476007)(66556008)(73956011)(3846002)(305945005)(31696002)(6486002)(7736002)(86362001)(476003)(11346002)(446003)(186003)(2906002)(6506007)(5660300002)(102836004)(99286004)(68736007)(26005)(2616005)(76176011)(66446008)(31686004)(71200400001)(71190400001)(52116002)(386003)(66066001)(14444005)(256004)(81156014)(36756003)(6436002)(25786009)(8676002)(81166006)(229853002)(54906003)(6916009)(6512007)(53936002)(316002)(8936002)(486006)(72206003)(478600001)(14454004)(4326008)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB3858;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3ykGE+yDkFv1TG3YryF2QLNNVva6JzW/Fz1r6INiyFulbhxCjP4Gr9cWpLJ5diVVSmYGxLV+zqNyyQVEIzwgfyVEOCFhThgY/LdETO24kW0qLZfKZ+Oll1uhy3OAT9Gks96XRG8Y7wfY886UVXh2hLuDsSLRXhDzGd+Iek8krkhYmBKCovF73heN9SX8lly0j+rytk0Dpze8XTHI49smwhaM9mGhSghJOZotGORbkTO1rcAMlh4vaWYI4gZ8/AqBMf7q/0OLiLlDcy1Dpu23J299ye3dCo96AwX5nckKz6W4ZLKwEwjIsX8lqxINRPlYHkuVq047a6uF70N6P+0AD5FA8NQrzZ6of7cYyXnG12o7zvwcwc91JpvYcMruGiGfuHJiofoMgk6gJZQ6PZRzWZsoX+e/1ZkMgcJk4WelQ4c=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5065A531C2656647BDE933922641A6F2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dd67a406-48ee-40dc-8845-08d6d3a217b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 10:44:06.1562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3858
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R2VlcnQsDQoNCldvdWxkIHlvdSBydW4gdGhpcyBkZWJ1ZyBwYXRjaCBvbiB0b3Agb2YgbXRkL25l
eHQ/IEkgZHVtcGVkIHRoZSBTUiBhbmQgQ1IgYmVmb3JlDQphbmQgYWZ0ZXIgdGhlIG9wZXJhdGlv
bnMgaW4gY2F1c2UuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3Iu
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQppbmRleCA3MzE3MmQ3ZjUxMmIuLjIw
ZDBmZGIxZGM5MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQor
KysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KQEAgLTIyLDYgKzIyLDggQEANCiAj
aW5jbHVkZSA8bGludXgvc3BpL2ZsYXNoLmg+DQogI2luY2x1ZGUgPGxpbnV4L210ZC9zcGktbm9y
Lmg+DQoNCisjZGVmaW5lIERFQlVHDQorDQogLyogRGVmaW5lIG1heCB0aW1lcyB0byBjaGVjayBz
dGF0dXMgcmVnaXN0ZXIgYmVmb3JlIHdlIGdpdmUgdXAuICovDQoNCiAvKg0KQEAgLTIwMCw3ICsy
MDIsNyBAQCBzdHJ1Y3Qgc2ZkcF9oZWFkZXIgew0KICAqICAgICAgICAgcmVnaXN0ZXIgZG9lcyBu
b3QgbW9kaWZ5IHN0YXR1cyByZWdpc3RlciAyLg0KICAqIC0gMTAxYjogUUUgaXMgYml0IDEgb2Yg
c3RhdHVzIHJlZ2lzdGVyIDIuIFN0YXR1cyByZWdpc3RlciAxIGlzIHJlYWQgdXNpbmcNCiAgKiAg
ICAgICAgIFJlYWQgU3RhdHVzIGluc3RydWN0aW9uIDA1aC4gU3RhdHVzIHJlZ2lzdGVyMiBpcyBy
ZWFkIHVzaW5nDQotICogICAgICAgICBpbnN0cnVjdGlvbiAzNWguIFFFIGlzIHNldCB2aWEgV3Jp
dCBTdGF0dXMgaW5zdHJ1Y3Rpb24gMDFoIHdpdGgNCisgKiAgICAgICAgIGluc3RydWN0aW9uIDM1
aC4gUUUgaXMgc2V0IHZpYSBXcml0ZSBTdGF0dXMgaW5zdHJ1Y3Rpb24gMDFoIHdpdGgNCiAgKiAg
ICAgICAgIHR3byBkYXRhIGJ5dGVzIHdoZXJlIGJpdCAxIG9mIHRoZSBzZWNvbmQgYnl0ZSBpcyBv
bmUuDQogICogICAgICAgICBbLi4uXQ0KICAqLw0KQEAgLTI3OTUsOCArMjc5NywxMSBAQCBzdGF0
aWMgaW50IHNwaV9ub3JfcGFyc2VfYmZwdChzdHJ1Y3Qgc3BpX25vciAqbm9yLA0KIAkJcmV0dXJu
IGVycjsNCg0KIAkvKiBGaXggZW5kaWFubmVzcyBvZiB0aGUgQkZQVCBEV09SRHMuICovDQotCWZv
ciAoaSA9IDA7IGkgPCBCRlBUX0RXT1JEX01BWDsgaSsrKQ0KKwlmb3IgKGkgPSAwOyBpIDwgQkZQ
VF9EV09SRF9NQVg7IGkrKykgew0KIAkJYmZwdC5kd29yZHNbaV0gPSBsZTMyX3RvX2NwdShiZnB0
LmR3b3Jkc1tpXSk7DQorCQlkZXZfZGJnKG5vci0+ZGV2LCAiYmZwdC5kd29yZHNbJWRdID0gJTA4
eFxuIiwgaSArIDEsDQorCQkJYmZwdC5kd29yZHNbaV0pOw0KKwl9DQoNCiAJLyogTnVtYmVyIG9m
IGFkZHJlc3MgYnl0ZXMuICovDQogCXN3aXRjaCAoYmZwdC5kd29yZHNbQkZQVF9EV09SRCgxKV0g
JiBCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTX01BU0spIHsNCkBAIC0zNTMyLDggKzM1MzcsMTAg
QEAgc3RhdGljIGludCBzcGlfbm9yX3BhcnNlX3NmZHAoc3RydWN0IHNwaV9ub3IgKm5vciwNCiAJ
fQ0KDQogCWVyciA9IHNwaV9ub3JfcGFyc2VfYmZwdChub3IsIGJmcHRfaGVhZGVyLCBwYXJhbXMp
Ow0KLQlpZiAoZXJyKQ0KKwlpZiAoZXJyKSB7DQorCQlkZXZfZGJnKGRldiwgImZhaWxlZCB0byBw
YXJzZSBCRlBUOiBlcnIgPSAlZFxuIiwgZXJyKTsNCiAJCWdvdG8gZXhpdDsNCisJfQ0KDQogCS8q
IFBhcnNlIG9wdGlvbmFsIHBhcmFtZXRlciB0YWJsZXMuICovDQogCWZvciAoaSA9IDA7IGkgPCBo
ZWFkZXIubnBoOyBpKyspIHsNCkBAIC0zNTc2LDYgKzM1ODMsNyBAQCBzdGF0aWMgaW50IHNwaV9u
b3JfaW5pdF9wYXJhbXMoc3RydWN0IHNwaV9ub3IgKm5vciwNCiAJc3RydWN0IHNwaV9ub3JfZXJh
c2VfbWFwICptYXAgPSAmbm9yLT5lcmFzZV9tYXA7DQogCWNvbnN0IHN0cnVjdCBmbGFzaF9pbmZv
ICppbmZvID0gbm9yLT5pbmZvOw0KIAl1OCBpLCBlcmFzZV9tYXNrOw0KKwlpbnQgcmV0Ow0KDQog
CS8qIFNldCBsZWdhY3kgZmxhc2ggcGFyYW1ldGVycyBhcyBkZWZhdWx0LiAqLw0KIAltZW1zZXQo
cGFyYW1zLCAwLCBzaXplb2YoKnBhcmFtcykpOw0KQEAgLTM2ODEsMTIgKzM2ODksMTUgQEAgc3Rh
dGljIGludCBzcGlfbm9yX2luaXRfcGFyYW1zKHN0cnVjdCBzcGlfbm9yICpub3IsDQogCQltZW1j
cHkoJnNmZHBfcGFyYW1zLCBwYXJhbXMsIHNpemVvZihzZmRwX3BhcmFtcykpOw0KIAkJbWVtY3B5
KCZwcmV2X21hcCwgJm5vci0+ZXJhc2VfbWFwLCBzaXplb2YocHJldl9tYXApKTsNCg0KLQkJaWYg
KHNwaV9ub3JfcGFyc2Vfc2ZkcChub3IsICZzZmRwX3BhcmFtcykpIHsNCisJCXJldCA9IHNwaV9u
b3JfcGFyc2Vfc2ZkcChub3IsICZzZmRwX3BhcmFtcyk7DQorCQlpZiAocmV0KSB7DQogCQkJbm9y
LT5hZGRyX3dpZHRoID0gMDsNCiAJCQlub3ItPmZsYWdzICY9IH5TTk9SX0ZfNEJfT1BDT0RFUzsN
CiAJCQkvKiByZXN0b3JlIHByZXZpb3VzIGVyYXNlIG1hcCAqLw0KIAkJCW1lbWNweSgmbm9yLT5l
cmFzZV9tYXAsICZwcmV2X21hcCwNCiAJCQkgICAgICAgc2l6ZW9mKG5vci0+ZXJhc2VfbWFwKSk7
DQorCQkJZGV2X2RiZyhub3ItPmRldiwgIiVzIHNmZHAgcGFyc2UgZmFpbGVkLCByZXQgPSVkXG4i
LA0KKwkJCQlfX0ZVTkNUSU9OX18sIHJldCk7DQogCQl9IGVsc2Ugew0KIAkJCW1lbWNweShwYXJh
bXMsICZzZmRwX3BhcmFtcywgc2l6ZW9mKCpwYXJhbXMpKTsNCiAJCX0NCkBAIC0zOTA4LDkgKzM5
MTksNjcgQEAgc3RhdGljIGludCBzcGlfbm9yX3NldHVwKHN0cnVjdCBzcGlfbm9yICpub3IsDQog
CXJldHVybiAwOw0KIH0NCg0KK3N0YXRpYyBpbnQgc3BpX25vcl9kdW1wX3NyX2NyKHN0cnVjdCBz
cGlfbm9yICpub3IpDQorew0KKwlpbnQgcmV0ID0gcmVhZF9zcihub3IpOw0KKw0KKwlkZXZfZGJn
KG5vci0+ZGV2LCAiU1IgPSAlMDh4XG4iLCByZXQpOw0KKyAgICAgICAgaWYgKHJldCA8IDApIHsN
CisgICAgICAgICAgICAgICAgZGV2X2Vycihub3ItPmRldiwgImVycm9yIHdoaWxlIHJlYWRpbmcg
c3RhdHVzIHJlZ2lzdGVyXG4iKTsNCisgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisgICAg
ICAgIH0NCisNCisJcmV0ID0gcmVhZF9jcihub3IpOw0KKwlkZXZfZGJnKG5vci0+ZGV2LCAiQ1Ig
PSAlMDh4XG4iLCByZXQpOw0KKyAgICAgICAgaWYgKHJldCA8IDApIHsNCisgICAgICAgICAgICAg
ICAgZGV2X2Vycihub3ItPmRldiwgImVycm9yIHdoaWxlIHJlYWRpbmcgY29uZmlndXJhdGlvbiBy
ZWdpc3RlclxuIik7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCXJldHVybiAwOw0KK30NCisN
CitzdGF0aWMgaW50IHNwaV9ub3JfY2xlYXJfYmxvY2tfcHJvdGVjdGlvbihzdHJ1Y3Qgc3BpX25v
ciAqbm9yKQ0KK3sNCisJaW50IHJldDsNCisJdTggdmFsLCBtYXNrID0gU1JfQlAyIHwgU1JfQlAx
IHwgU1JfQlAwOw0KKw0KKwlyZXQgPSBzcGlfbm9yX2R1bXBfc3JfY3Iobm9yKTsNCisJaWYgKHJl
dCkNCisJCXJldHVybiByZXQ7DQorDQorCS8qIGNsZWFyIGp1c3QgdGhlIEJQIGJpdHMgKi8NCisJ
cmV0ID0gcmVhZF9zcihub3IpOw0KKyAgICAgICAgaWYgKHJldCA8IDApIHsNCisgICAgICAgICAg
ICAgICAgZGV2X2Vycihub3ItPmRldiwgImVycm9yIHdoaWxlIHJlYWRpbmcgc3RhdHVzIHJlZ2lz
dGVyXG4iKTsNCisgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisgICAgICAgIH0NCisJdmFs
ID0gcmV0Ow0KKw0KKwlyZXQgPSB3cml0ZV9lbmFibGUobm9yKTsNCisgICAgICAgIGlmIChyZXQg
PCAwKSB7DQorICAgICAgICAgICAgICAgIGRldl9lcnIobm9yLT5kZXYsICJlcnJvciBvbiB3cml0
ZSBlbmFibGUsIGVyciA9ICVkXG4iLCByZXQpOw0KKyAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Ow0KKwl9DQorDQorCXJldCA9IHdyaXRlX3NyKG5vciwgdmFsICYgfm1hc2spOw0KKyAgICAgICAg
aWYgKHJldCA8IDApIHsNCisgICAgICAgICAgICAgICAgZGV2X2Vycihub3ItPmRldiwgImVycm9y
IG9uIHdyaXRlX3NyLCBlcnIgPSAlZFxuIiwgcmV0KTsNCisgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsNCisJfQ0KKw0KKwlyZXQgPSBzcGlfbm9yX3dhaXRfdGlsbF9yZWFkeShub3IpOw0KKyAg
ICAgICAgaWYgKHJldCkgew0KKyAgICAgICAgICAgICAgICBkZXZfZXJyKG5vci0+ZGV2LCAidGlt
ZW91dCB3aGlsZSB3cml0aW5nIFNSLCByZXQgPSAlZFxuIiwgcmV0KTsNCisJCXJldHVybiBzcGlf
bm9yX2R1bXBfc3JfY3Iobm9yKTsNCisgICAgICAgIH0NCisNCisJcmV0dXJuIDA7DQorfQ0KKw0K
IHN0YXRpYyBpbnQgc3BpX25vcl9pbml0KHN0cnVjdCBzcGlfbm9yICpub3IpDQogew0KLQlpbnQg
ZXJyOw0KKwlpbnQgZXJyID0gMCwgcXVhZF9lcnI7DQoNCiAJLyoNCiAJICogQXRtZWwsIFNTVCwg
SW50ZWwvTnVtb255eCwgYW5kIG90aGVycyBzZXJpYWwgTk9SIHRlbmQgdG8gcG93ZXIgdXANCkBA
IC0zOTE5LDE4ICszOTg4LDM4IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9pbml0KHN0cnVjdCBzcGlf
bm9yICpub3IpDQogCWlmIChKRURFQ19NRlIobm9yLT5pbmZvKSA9PSBTTk9SX01GUl9BVE1FTCB8
fA0KIAkgICAgSkVERUNfTUZSKG5vci0+aW5mbykgPT0gU05PUl9NRlJfSU5URUwgfHwNCiAJICAg
IEpFREVDX01GUihub3ItPmluZm8pID09IFNOT1JfTUZSX1NTVCB8fA0KLQkgICAgbm9yLT5pbmZv
LT5mbGFncyAmIFNQSV9OT1JfSEFTX0xPQ0spIHsNCi0JCXdyaXRlX2VuYWJsZShub3IpOw0KLQkJ
d3JpdGVfc3Iobm9yLCAwKTsNCi0JCXNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5KG5vcik7DQorCSAg
ICBub3ItPmluZm8tPmZsYWdzICYgU1BJX05PUl9IQVNfTE9DSykNCisJCS8qDQorCQkgKiB0aGlz
IHNob3VsZCBiZSBkb25lIG9ubHkgb24gZGVtYW5kLCBub3QgZm9yIGV2ZXJ5IGZsYXNoIHRoYXQN
CisJCSAqIGhhcyBTUElfTk9SX0hBU19MT0NLIHNldA0KKwkJICovDQorCQllcnIgPSBzcGlfbm9y
X2NsZWFyX2Jsb2NrX3Byb3RlY3Rpb24obm9yKTsNCisJaWYgKGVycikgew0KKwkJZGV2X2Vycihu
b3ItPmRldiwgImNsZWFyaW5nIEJQIGJpdHMgZmFpbGVkLCBlcnIgPSAlZFxuIiwgZXJyKTsNCisJ
CXJldHVybiBlcnI7DQogCX0NCg0KIAlpZiAobm9yLT5xdWFkX2VuYWJsZSkgew0KLQkJZXJyID0g
bm9yLT5xdWFkX2VuYWJsZShub3IpOw0KKwkJZGV2X2RiZyhub3ItPmRldiwgIlNSIGFuZCBDUiBi
ZWZvcmUgcXVhZF9lbmFibGU6XG4iKTsNCisNCisJCWVyciA9IHNwaV9ub3JfZHVtcF9zcl9jcihu
b3IpOw0KIAkJaWYgKGVycikgew0KLQkJCWRldl9lcnIobm9yLT5kZXYsICJxdWFkIG1vZGUgbm90
IHN1cHBvcnRlZFxuIik7DQorCQkJZGV2X2Vycihub3ItPmRldiwgImR1bXBfc3JfY3IgYmVmb3Jl
IHF1YWQgZW5hYmxlIGZhaWwsIGVyciA9ICVkXG4iLCBlcnIpOw0KIAkJCXJldHVybiBlcnI7DQog
CQl9DQorDQorCQlxdWFkX2VyciA9IG5vci0+cXVhZF9lbmFibGUobm9yKTsNCisJCWRldl9kYmco
bm9yLT5kZXYsICJTUiBhbmQgQ1IgYWZ0ZXIgcXVhZF9lbmFibGU6XG4iKTsNCisJCWVyciA9IHNw
aV9ub3JfZHVtcF9zcl9jcihub3IpOw0KKwkJaWYgKGVycikgew0KKwkJCWRldl9lcnIobm9yLT5k
ZXYsICJkdW1wX3NyX2NyIGFmdGVyIHF1YWQgZW5hYmxlIGZhaWwsIGVyciA9ICVkXG4iLCBlcnIp
Ow0KKwkJCXJldHVybiBlcnI7DQorCQl9DQorDQorCQlpZiAocXVhZF9lcnIpIHsNCisJCQlkZXZf
ZXJyKG5vci0+ZGV2LCAicXVhZCBtb2RlIG5vdCBzdXBwb3J0ZWQsIGVyciA9ICVkXG4iLCBxdWFk
X2Vycik7DQorCQkJcmV0dXJuIHF1YWRfZXJyOw0KKwkJfQ0KIAl9DQoNCiAJaWYgKG5vci0+YWRk
cl93aWR0aCA9PSA0ICYmICEobm9yLT5mbGFncyAmIFNOT1JfRl80Ql9PUENPREVTKSkgew0KDQo=

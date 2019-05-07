Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F248516486
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 15:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfEGNZN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 09:25:13 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:12918 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfEGNZM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 09:25:12 -0400
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
X-IronPort-AV: E=Sophos;i="5.60,441,1549954800"; 
   d="scan'208";a="31935244"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 07 May 2019 06:25:11 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 7 May 2019 06:25:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTiBAx9Kl0NEi+vkfRCZ67wLxnIYIRye69hMkZrCfgY=;
 b=g7m+cTaBF5gYs+/v+6dtJqAqcBLvZ0zCZZGFThm3edmaHv+BYh4mnyrQKZycpvnLiYHDuefsbpFNm4R3/adXqfoHZtcdN04M1R20Vd+mNFofanlDMC7ZRUfyczZJKlecCzZ0tpXyvAvCeliic5PbPhDt10Yk51BmiYGGtoLNhvU=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1780.namprd11.prod.outlook.com (10.175.99.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 13:25:08 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 13:25:08 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>, <jonas@norrbonn.se>
CC:     <linux-renesas-soc@vger.kernel.org>,
        <marek.vasut+renesas@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsA
Date:   Tue, 7 May 2019 13:25:07 +0000
Message-ID: <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
In-Reply-To: <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::31) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb8a9eb0-8bf9-4783-d9b0-08d6d2ef6c53
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN6PR11MB1780;
x-ms-traffictypediagnostic: BN6PR11MB1780:
x-microsoft-antispam-prvs: <BN6PR11MB1780442E3250099F206B1C7CF0310@BN6PR11MB1780.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:285;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(189003)(72206003)(305945005)(5660300002)(256004)(68736007)(31686004)(386003)(14444005)(14454004)(99286004)(7736002)(446003)(8936002)(486006)(54906003)(316002)(6436002)(110136005)(6486002)(66066001)(478600001)(11346002)(25786009)(52116002)(2616005)(6246003)(476003)(6512007)(76176011)(86362001)(31696002)(53546011)(36756003)(6506007)(66446008)(64756008)(66476007)(66556008)(66946007)(73956011)(102836004)(71200400001)(26005)(4326008)(186003)(229853002)(53936002)(2906002)(8676002)(71190400001)(6116002)(81166006)(3846002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1780;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lkypMP0+pdeunK6RylhmINqK70DsMI/k+/Q+i9IV/CNzQpNPXWq4vBOy+7Y8sVfKwoON6zhg7iAGPB5CdPeI5S/wj6FBNVxth1VTrrk+aqEcQLrrVuodcu9lEFN9yt4LfJM5hyXkUrfGRGv5NWidLp/Rhiy1awemEx+TXIBqT3ss6ZdTYvFoU3V7XJijjoduxoFLvraFCk++4ILcEXrSr2Z6wNwBKgN6NRv0h5bB92it/q1yrlcEDJDunuCHYUZZs4cB5MCcZFBcISwLfxJ/jvZUzCDZ98NhG1JNtFO0L+NwqgMhhq0inqZdGepEY1fPMrjIRwiND1Fffs3S8KdG8DIRNtQcgAq+tgaSF0kkBpkmSooMRUx44Wppg3KHbfhQITsYrEnUNJWcaezO/GAPjeVlly9g0SfE9x2rR27SFTw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A545F38E3C029943B0595DC32EB720C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8a9eb0-8bf9-4783-d9b0-08d6d2ef6c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 13:25:07.9958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCk9uIDA1LzA3LzIwMTkgMDQ6MTUgUE0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc3BpLW5vci5jDQo+IGluZGV4IDczMTcyZDdmNTEyYi4uYjk0YTZlYWFhY2E1IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiArKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBAQCAtMTU1MSw2ICsxNTUxLDcgQEAgc3RhdGljIGludCBz
cGFuc2lvbl9yZWFkX2NyX3F1YWRfZW5hYmxlKHN0cnVjdCBzcGlfbm9yICpub3IpDQo+ICAgICAg
ICAgdTggc3JfY3JbMl07DQo+ICAgICAgICAgaW50IHJldDsNCj4gIA0KPiArICAgICAgIGRldl9l
cnIoZGV2LCAiJXNcbiIsIF9fRlVOQ1RJT05fXyk7DQo+ICAgICAgICAgLyogQ2hlY2sgY3VycmVu
dCBRdWFkIEVuYWJsZSBiaXQgdmFsdWUuICovDQo+ICAgICAgICAgcmV0ID0gcmVhZF9jcihub3Ip
Ow0KPiAgICAgICAgIGlmIChyZXQgPCAwKSB7DQo+IEBAIC0zOTExLDYgKzM5MTIsMTIgQEAgc3Rh
dGljIGludCBzcGlfbm9yX3NldHVwKHN0cnVjdCBzcGlfbm9yICpub3IsDQo+ICBzdGF0aWMgaW50
IHNwaV9ub3JfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPiAgew0KPiAgICAgICAgIGludCBl
cnI7DQo+ICsgICAgICAgdTggdmFsOw0KPiArICAgICAgIHU4IG1hc2sgPSBTUl9CUDIgfCBTUl9C
UDEgfCBTUl9CUDA7DQo+ICsNCj4gKyAgICAgICAvKiBDaGVjayBjdXJyZW50IFF1YWQgRW5hYmxl
IGJpdCB2YWx1ZS4gKi8NCj4gKyAgICAgICB2YWwgPSByZWFkX2NyKG5vcik7DQp0aGlzIHNob3Vs
ZCBoYXZlIGJlZW46DQoJdmFsID0gcmVhZF9zcihub3IpOw0Kc29ycnkuDQoNCj4gKyAgICAgICBk
ZXZfZXJyKG5vci0+ZGV2LCAiJXMgdmFsID0gJTAyeFxuIiwgdmFsKTsNCmFuZCBoZXJlIA0KCWRl
dl9lcnIobm9yLT5kZXYsICIlcyB2YWwgPSAlMDJ4XG4iLCBfX0ZVTkNUSU9OX18sIHZhbCk7DQo+
ICANCj4gICAgICAgICAvKg0KPiAgICAgICAgICAqIEF0bWVsLCBTU1QsIEludGVsL051bW9ueXgs
IGFuZCBvdGhlcnMgc2VyaWFsIE5PUiB0ZW5kIHRvIHBvd2VyIHVwDQo+IEBAIC0zOTIxLDcgKzM5
MjgsNyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPiAg
ICAgICAgICAgICBKRURFQ19NRlIobm9yLT5pbmZvKSA9PSBTTk9SX01GUl9TU1QgfHwNCj4gICAg
ICAgICAgICAgbm9yLT5pbmZvLT5mbGFncyAmIFNQSV9OT1JfSEFTX0xPQ0spIHsNCj4gICAgICAg
ICAgICAgICAgIHdyaXRlX2VuYWJsZShub3IpOw0KPiAtICAgICAgICAgICAgICAgd3JpdGVfc3Io
bm9yLCAwKTsNCj4gKyAgICAgICAgICAgICAgIHdyaXRlX3NyKG5vciwgdmFsICYgfm1hc2spOw0K
PiAgICAgICAgICAgICAgICAgc3BpX25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsNCj4gICAgICAg
ICB9DQo+ICANCg==

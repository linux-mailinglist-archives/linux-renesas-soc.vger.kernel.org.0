Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A5916459
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 15:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfEGNQH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 09:16:07 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:60559 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfEGNQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 09:16:06 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,441,1549954800"; 
   d="scan'208";a="33582227"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES128-SHA; 07 May 2019 06:16:05 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 7 May 2019 06:15:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ac8ElAttisGMeLb2R8Y/+Reh2PaLBMW0m3G2vPrRU=;
 b=FNU+PnpR6/OQwO4A9/uXBXW82YANnYAjY8rWrYT7a7oxffcsFMXW3P4bIq4aV3xAejdIEuStbPCr31h5e5tnlLx9kkvQRcVtN9JVBhKzdxd6BDGseLnsTtjjzfozICsOe4MsQTKeqtXd8Ugz2hjWpNRRH+H7XiObPeQ9vWYPYpo=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1714.namprd11.prod.outlook.com (10.173.31.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 13:15:50 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 13:15:50 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>, <jonas@norrbonn.se>
CC:     <linux-renesas-soc@vger.kernel.org>,
        <marek.vasut+renesas@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgA==
Date:   Tue, 7 May 2019 13:15:49 +0000
Message-ID: <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR02CA0048.eurprd02.prod.outlook.com
 (2603:10a6:802:14::19) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df65111a-f9a7-46ce-4f74-08d6d2ee1f39
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN6PR11MB1714;
x-ms-traffictypediagnostic: BN6PR11MB1714:
x-microsoft-antispam-prvs: <BN6PR11MB1714AD2AD49C4EA0838B08C5F0310@BN6PR11MB1714.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:117;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(366004)(346002)(136003)(396003)(189003)(199004)(14454004)(11346002)(2616005)(476003)(316002)(86362001)(68736007)(14444005)(4326008)(72206003)(478600001)(305945005)(8936002)(25786009)(446003)(31696002)(102836004)(6246003)(2906002)(66446008)(66476007)(73956011)(66556008)(64756008)(66946007)(6486002)(229853002)(71200400001)(71190400001)(81156014)(81166006)(36756003)(66066001)(8676002)(53936002)(6506007)(386003)(53546011)(54906003)(76176011)(5660300002)(3846002)(99286004)(52116002)(6116002)(256004)(31686004)(110136005)(6436002)(7736002)(486006)(186003)(26005)(6512007)(505234006);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1714;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PGjAWdhyVH1+tFhXd8dh/kQvOWKxMdHi5qdExd2O91jozaybOQtwNhSiRPuDBxPAzQ80ecAheSVjEy+c6YdGfwOcijx/swMimw9EC5zYMcgQJxukx2kVaS9ANXOW5ezp5Z14KAbr9keAGutuQ658OCgh06IBcKPNXhp9QUn0hH30auURFb01oNndKLs8lQBhdg6lsU0jH6ltn7mfcyyA1whpR170ZcUMIZ8hse8vtu0flhfTAo9TmRhb8bM/gspWdSShJVTG5WmqvwQniD5DdDLRK9n+g9boDr0FDIgMufi5vx4GqHG4oLXwxvJOT8gr3Hwb9i1dYD3xybehikA0BlgnDSFgJ9U55sJgYqQpYRROtzVDRWjCusHUZrLxhluL2ztt2xS56M8dWX6/aKqPfjQktRcOwHeXrH9mBL9m1Po=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F4DD20E7097314BAE155374BD4BCBE7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: df65111a-f9a7-46ce-4f74-08d6d2ee1f39
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 13:15:49.8452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1714
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R2VlcnQsDQoNCk9uIDA1LzA3LzIwMTkgMDM6NTIgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToNCj4gRXh0ZXJuYWwgRS1NYWlsDQo+IA0KPiANCj4gSGkgSm9uYXMsDQo+IA0KPiBPbiBUdWUs
IE1heSA3LCAyMDE5IGF0IDE6MTQgUE0gSm9uYXMgQm9ubiA8am9uYXNAbm9ycmJvbm4uc2U+IHdy
b3RlOg0KPj4gT24gMDcvMDUvMjAxOSAxMjo1MCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
Pj4+IE9uIFR1ZSwgTWF5IDcsIDIwMTkgYXQgMTI6NDIgUE0gPFR1ZG9yLkFtYmFydXNAbWljcm9j
aGlwLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDA1LzA3LzIwMTkgMTI6NTMgUE0sIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToNCj4+Pj4+IE9uIFdlZCwgTWFyIDIwLCAyMDE5IGF0IDg6MTYgQU0gSm9u
YXMgQm9ubiA8am9uYXNAbm9ycmJvbm4uc2U+IHdyb3RlOg0KPj4+Pj4+IEJvdGggdGhlIEJQWzAt
Ml0gYml0cyBhbmQgdGhlIFRCUFJPVCBiaXQgYXJlIHN1cHBvcnRlZCBvbiB0aGlzIGNoaXAuDQo+
Pj4+Pj4gVGVzdGVkIGFuZCB2ZXJpZmllZCBvbiBhIEN5cHJlc3MgczI1Zmw1MTJzLg0KPj4+Pj4+
DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgQm9ubiA8am9uYXNAbm9ycmJvbm4uc2U+DQo+
Pj4+Pg0KPj4+Pj4gVGhpcyBpcyBub3cgY29tbWl0IGRjYjRiMjJlZWFmNDRmOTEgKCJzcGktbm9y
OiBzMjVmbDUxMnMgc3VwcG9ydHMgcmVnaW9uDQo+Pj4+PiBsb2NraW5nIikgaW4gbXRkL25leHQu
DQo+Pj4+Pg0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+Pj4+
Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4+Pj4+PiBAQCAtMTg5OCw3
ICsxODk4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHNwaV9ub3JfaWRzW10g
PSB7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIFNQSV9OT1JfRFVBTF9SRUFEIHwg
U1BJX05PUl9RVUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwNCj4+Pj4+PiAgICAgICAgICB7ICJzMjVm
bDI1NnMwIiwgSU5GTygweDAxMDIxOSwgMHg0ZDAwLCAyNTYgKiAxMDI0LCAxMjgsIFVTRV9DTFNS
KSB9LA0KPj4+Pj4+ICAgICAgICAgIHsgInMyNWZsMjU2czEiLCBJTkZPKDB4MDEwMjE5LCAweDRk
MDEsICA2NCAqIDEwMjQsIDUxMiwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVB
RCB8IFVTRV9DTFNSKSB9LA0KPj4+Pj4+IC0gICAgICAgeyAiczI1Zmw1MTJzIiwgIElORk82KDB4
MDEwMjIwLCAweDRkMDA4MCwgMjU2ICogMTAyNCwgMjU2LCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQ
SV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sDQo+Pj4+Pj4gKyAgICAgICB7ICJzMjVmbDUx
MnMiLCAgSU5GTzYoMHgwMTAyMjAsIDB4NGQwMDgwLCAyNTYgKiAxMDI0LCAyNTYsDQo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURf
UkVBRCB8DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgU1BJX05PUl9IQVNfTE9DSyB8
IFNQSV9OT1JfSEFTX1RCIHwgVVNFX0NMU1IpIH0sDQo+Pj4+Pg0KPj4+Pj4gU2V0dGluZyBTUElf
Tk9SX0hBU19MT0NLIGNhdXNlcyB0aGUgUVNQSSBGTEFTSCBvbiByOGE3NzkxL2tvZWxzY2ggdG8g
ZmFpbA0KPj4+Pj4gcHJvYmluZy4NCj4+Pj4+DQo+Pj4+PiBCZWZvcmUvYWZ0ZXI6DQo+Pj4+Pg0K
Pj4+Pj4gICAgICAtbTI1cDgwIHNwaTAuMDogczI1Zmw1MTJzICg2NTUzNiBLYnl0ZXMpDQo+Pj4+
PiAgICAgIC0zIGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNl
IHNwaTAuMA0KPj4+Pj4gICAgICAtQ3JlYXRpbmcgMyBNVEQgcGFydGl0aW9ucyBvbiAic3BpMC4w
IjoNCj4+Pj4+ICAgICAgLTB4MDAwMDAwMDAwMDAwLTB4MDAwMDAwMDgwMDAwIDogImxvYWRlciIN
Cj4+Pj4+ICAgICAgLTB4MDAwMDAwMDgwMDAwLTB4MDAwMDAwNjAwMDAwIDogInVzZXIiDQo+Pj4+
PiAgICAgIC0weDAwMDAwMDYwMDAwMC0weDAwMDAwNDAwMDAwMCA6ICJmbGFzaCINCj4+Pj4+ICAg
ICAgK20yNXA4MCBzcGkwLjA6IEVyYXNlIEVycm9yIG9jY3VycmVkDQo+Pj4+PiAgICAgICttMjVw
ODAgc3BpMC4wOiBFcmFzZSBFcnJvciBvY2N1cnJlZA0KPj4+Pj4gICAgICArbTI1cDgwIHNwaTAu
MDogdGltZW91dCB3aGlsZSB3cml0aW5nIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXINCj4+Pj4+ICAg
ICAgK20yNXA4MCBzcGkwLjA6IHF1YWQgbW9kZSBub3Qgc3VwcG9ydGVkDQo+Pj4+PiAgICAgICtt
MjVwODA6IHByb2JlIG9mIHNwaTAuMCBmYWlsZWQgd2l0aCBlcnJvciAtNQ0KPj4+Pj4NCj4+DQo+
PiBJbiBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB5b3UgaGF2ZToNCj4+DQo+PiBzdGF0
aWMgaW50IHNwaV9ub3JfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPj4gew0KPj4gICAgICAg
ICAgaW50IGVycjsNCj4+DQo+PiAgICAgICAgICAvKg0KPj4gICAgICAgICAgICogQXRtZWwsIFNT
VCwgSW50ZWwvTnVtb255eCwgYW5kIG90aGVycyBzZXJpYWwgTk9SIHRlbmQgdG8gcG93ZXIgdXAN
Cj4+ICAgICAgICAgICAqIHdpdGggdGhlIHNvZnR3YXJlIHByb3RlY3Rpb24gYml0cyBzZXQNCj4+
ICAgICAgICAgICAqLw0KPj4gICAgICAgICAgaWYgKEpFREVDX01GUihub3ItPmluZm8pID09IFNO
T1JfTUZSX0FUTUVMIHx8DQo+PiAgICAgICAgICAgICAgSkVERUNfTUZSKG5vci0+aW5mbykgPT0g
U05PUl9NRlJfSU5URUwgfHwNCj4+ICAgICAgICAgICAgICBKRURFQ19NRlIobm9yLT5pbmZvKSA9
PSBTTk9SX01GUl9TU1QgfHwNCj4+ICAgICAgICAgICAgICBub3ItPmluZm8tPmZsYWdzICYgU1BJ
X05PUl9IQVNfTE9DSykgew0KPj4gICAgICAgICAgICAgICAgICB3cml0ZV9lbmFibGUobm9yKTsN
Cj4gDQo+IFdpdGggbW9yZSBkZWJ1ZyBwcmludHM6DQo+IA0KPiAgICAgbTI1cDgwIHNwaTAuMDog
c3BpX25vcl9pbml0OjM5MjU6IHdyaXRlX2VuYWJsZSgpIHJldHVybmVkIDANCj4gDQo+PiAgICAg
ICAgICAgICAgICAgIHdyaXRlX3NyKG5vciwgMCk7DQo+IA0KPiAgICAgbTI1cDgwIHNwaTAuMDog
c3BpX25vcl9pbml0OjM5Mjc6IHdyaXRlX3NyKCkgcmV0dXJuZWQgMA0KPiANCj4+ICAgICAgICAg
ICAgICAgICAgc3BpX25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsNCj4gDQo+ICAgICBtMjVwODAg
c3BpMC4wOiBzcGlfbm9yX3NyX3JlYWR5OjUzMzogc3IgPSAweDMNCj4gICAgIG0yNXA4MCBzcGkw
LjA6IHNwaV9ub3Jfc3JfcmVhZHk6NTMzOiBzciA9IDB4Mw0KPiAgICAgbTI1cDgwIHNwaTAuMDog
c3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0gMHgzDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAuLi4NCj4gICAgIG0yNXA4MCBzcGkwLjA6IHNwaV9ub3Jfc3JfcmVhZHk6
NTMzOiBzciA9IDB4ZmYNCj4gICAgIG0yNXA4MCBzcGkwLjA6IEVyYXNlIEVycm9yIG9jY3VycmVk
DQo+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlfbm9yX2luaXQ6MzkyOTogc3BpX25vcl93YWl0X3Rp
bGxfcmVhZHkoKSByZXR1cm5lZCAtNQ0KPiANCj4+ICAgICAgICAgIH0NCj4+DQo+PiAgICAgICAg
ICBpZiAobm9yLT5xdWFkX2VuYWJsZSkgew0KPj4gICAgICAgICAgICAgICAgICBlcnIgPSBub3It
PnF1YWRfZW5hYmxlKG5vcik7DQo+IA0KPiAgICAgbTI1cDgwIHNwaTAuMDogc3BpX25vcl9zcl9y
ZWFkeTo1MzM6IHNyID0gMHhmZg0KPiAgICAgbTI1cDgwIHNwaTAuMDogRXJhc2UgRXJyb3Igb2Nj
dXJyZWQNCj4gICAgIG0yNXA4MCBzcGkwLjA6IHRpbWVvdXQgd2hpbGUgd3JpdGluZyBjb25maWd1
cmF0aW9uIHJlZ2lzdGVyDQo+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlfbm9yX2luaXQ6MzkzNzog
c3BhbnNpb25fcXVhZF9lbmFibGUoKSByZXR1cm5lZCAtNQ0KPiANCj4+ICAgICAgICAgICAgICAg
ICAgaWYgKGVycikgew0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIobm9yLT5k
ZXYsICJxdWFkIG1vZGUgbm90IHN1cHBvcnRlZFxuIik7DQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGVycjsNCj4+ICAgICAgICAgICAgICAgICAgfQ0KPj4gICAgICAgICAgfQ0K
Pj4NCj4+IFRoaXMgaXMgdGhlIG9ubHkgbWVhbmluZ2Z1bCB0aGluZyB0aGF0IEkgY2FuIHNlZSBt
YXkgaGF2ZSBjaGFuZ2VkIHdpdGgNCj4+IHRoaXMgZmxhZy4gIFdlIG5vdyBoYXZlIGFuIGFkZGl0
aW9uYWwgd3JpdGVfZW5hYmxlIGJlZm9yZSBxdWFkX2VuYWJsZS4NCj4+IFdoYXQgaGFwcGVucyBp
ZiB5b3Ugc3dhcCB0aG9zZSB0d28gYmxvY2tzIGFib3ZlIHNvIHRoYXQgcXVhZF9lbmFibGUgaXMN
Cj4+IGNhbGxlZCBmaXJzdD8NCj4gDQo+IFdpdGggdGhlIHR3byBibG9ja3Mgc3dhcHBlZDoNCj4g
DQo+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlfbm9yX3NyX3JlYWR5OjUzMzogc3IgPSAweDANCj4g
ICAgIG0yNXA4MCBzcGkwLjA6IHNwaV9ub3JfaW5pdDozOTE5OiBzcGFuc2lvbl9xdWFkX2VuYWJs
ZSgpIHJldHVybmVkIDANCj4gICAgIG0yNXA4MCBzcGkwLjA6IHNwaV9ub3JfaW5pdDozOTM3OiB3
cml0ZV9lbmFibGUoKSByZXR1cm5lZCAwDQo+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlfbm9yX2lu
aXQ6MzkzOTogd3JpdGVfc3IoKSByZXR1cm5lZCAwDQo+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlf
bm9yX3NyX3JlYWR5OjUzMzogc3IgPSAweDMNCj4gICAgIG0yNXA4MCBzcGkwLjA6IHNwaV9ub3Jf
c3JfcmVhZHk6NTMzOiBzciA9IDB4Mw0KPiAgICAgbTI1cDgwIHNwaTAuMDogc3BpX25vcl9zcl9y
ZWFkeTo1MzM6IHNyID0gMHgzDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLg0KPiAgICAgbTI1cDgwIHNwaTAuMDog
c3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0gMHhmZg0KPiAgICAgbTI1cDgwIHNwaTAuMDogRXJh
c2UgRXJyb3Igb2NjdXJyZWQNCj4gICAgIG0yNXA4MCBzcGkwLjA6IHNwaV9ub3JfaW5pdDozOTQx
OiBzcGlfbm9yX3dhaXRfdGlsbF9yZWFkeSgpIHJldHVybmVkIC01DQo+ICAgICBtMjVwODAgc3Bp
MC4wOiBzMjVmbDUxMnMgKDY1NTM2IEtieXRlcykNCj4gICAgIDMgZml4ZWQtcGFydGl0aW9ucyBw
YXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2Ugc3BpMC4wDQo+ICAgICBDcmVhdGluZyAzIE1U
RCBwYXJ0aXRpb25zIG9uICJzcGkwLjAiOg0KPiAgICAgMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAw
ODAwMDAgOiAibG9hZGVyIg0KPiAgICAgMHgwMDAwMDAwODAwMDAtMHgwMDAwMDA2MDAwMDAgOiAi
dXNlciINCj4gICAgIDB4MDAwMDAwNjAwMDAwLTB4MDAwMDA0MDAwMDAwIDogImZsYXNoIg0KPiAN
Cj4gTm90ZSB0aGF0IHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5KCkgc3RpbGwgZmFpbHMuDQo+IA0K
PiBXaGlsZSB0aGUgZGV2aWNlICh3aGljaCBjb250YWlucyB0aGUgYm9vdCBsb2FkZXIpIG5vdyBh
cHBlYXJzIHRvIGJlDQo+IGRldGVjdGVkIGZpbmUsIHJlYWRpbmcgcmV0dXJucyBib2d1cyByZXBl
dGl0aXZlIGRhdGEsIGZvciBhbGwgcGFydGl0aW9uczoNCj4gDQo+ICAgICAjIGhkIC9kZXYvbXRk
MCB8IGhlYWQNCj4gICAgIDAwMDAwMDAwICAzMyAzMyAzMyAzMyAzMyAzMyAzMyAzMyAgMzMgMzMg
M2IgYmIgZmYgZmYgZmYgZmYNCj4gfDMzMzMzMzMzMzM7Li4uLi58DQo+ICAgICAwMDAwMDAxMCAg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmDQo+IHwuLi4u
Li4uLi4uLi4uLi4ufA0KPiAgICAgKg0KPiAgICAgMDAwMDEwMDAgIDMzIDMzIDMzIDMzIDMzIDMz
IDMzIDMzICAzMyAzMyAzYiBiYiBmZiBmZiBmZiBmZg0KPiB8MzMzMzMzMzMzMzsuLi4uLnwNCj4g
ICAgIDAwMDAxMDEwICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYNCj4gfC4uLi4uLi4uLi4uLi4uLi58DQo+ICAgICAqDQo+IA0KPiBJZiBJIHJlbW92ZSB0
aGUgY2FsbCB0byAid3JpdGVfc3Iobm9yLCAwKSIsIGV2ZXJ5dGhpbmcgd29ya3MgYXMNCj4gYmVm
b3JlLCByZWdhcmRsZXNzDQo+IG9mIHN3YXBwaW5nIHRoZSBibG9ja3MuDQo+IA0KDQpDYW4geW91
IHRyeSB0aGlzIG9uZT8NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5v
ci5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCmluZGV4IDczMTcyZDdmNTEyYi4u
Yjk0YTZlYWFhY2E1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMN
CisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQpAQCAtMTU1MSw2ICsxNTUxLDcg
QEAgc3RhdGljIGludCBzcGFuc2lvbl9yZWFkX2NyX3F1YWRfZW5hYmxlKHN0cnVjdCBzcGlfbm9y
ICpub3IpDQogICAgICAgIHU4IHNyX2NyWzJdOw0KICAgICAgICBpbnQgcmV0Ow0KIA0KKyAgICAg
ICBkZXZfZXJyKGRldiwgIiVzXG4iLCBfX0ZVTkNUSU9OX18pOw0KICAgICAgICAvKiBDaGVjayBj
dXJyZW50IFF1YWQgRW5hYmxlIGJpdCB2YWx1ZS4gKi8NCiAgICAgICAgcmV0ID0gcmVhZF9jcihu
b3IpOw0KICAgICAgICBpZiAocmV0IDwgMCkgew0KQEAgLTM5MTEsNiArMzkxMiwxMiBAQCBzdGF0
aWMgaW50IHNwaV9ub3Jfc2V0dXAoc3RydWN0IHNwaV9ub3IgKm5vciwNCiBzdGF0aWMgaW50IHNw
aV9ub3JfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KIHsNCiAgICAgICAgaW50IGVycjsNCisg
ICAgICAgdTggdmFsOw0KKyAgICAgICB1OCBtYXNrID0gU1JfQlAyIHwgU1JfQlAxIHwgU1JfQlAw
Ow0KKw0KKyAgICAgICAvKiBDaGVjayBjdXJyZW50IFF1YWQgRW5hYmxlIGJpdCB2YWx1ZS4gKi8N
CisgICAgICAgdmFsID0gcmVhZF9jcihub3IpOw0KKyAgICAgICBkZXZfZXJyKG5vci0+ZGV2LCAi
JXMgdmFsID0gJTAyeFxuIiwgdmFsKTsNCiANCiAgICAgICAgLyoNCiAgICAgICAgICogQXRtZWws
IFNTVCwgSW50ZWwvTnVtb255eCwgYW5kIG90aGVycyBzZXJpYWwgTk9SIHRlbmQgdG8gcG93ZXIg
dXANCkBAIC0zOTIxLDcgKzM5MjgsNyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfaW5pdChzdHJ1Y3Qg
c3BpX25vciAqbm9yKQ0KICAgICAgICAgICAgSkVERUNfTUZSKG5vci0+aW5mbykgPT0gU05PUl9N
RlJfU1NUIHx8DQogICAgICAgICAgICBub3ItPmluZm8tPmZsYWdzICYgU1BJX05PUl9IQVNfTE9D
Sykgew0KICAgICAgICAgICAgICAgIHdyaXRlX2VuYWJsZShub3IpOw0KLSAgICAgICAgICAgICAg
IHdyaXRlX3NyKG5vciwgMCk7DQorICAgICAgICAgICAgICAgd3JpdGVfc3Iobm9yLCB2YWwgJiB+
bWFzayk7DQogICAgICAgICAgICAgICAgc3BpX25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsNCiAg
ICAgICAgfQ0KIA0KDQo=

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A71C81646E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 15:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfEGNSV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 09:18:21 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:60736 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfEGNSU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 09:18:20 -0400
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
   d="scan'208";a="33583058"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES128-SHA; 07 May 2019 06:18:19 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 7 May 2019 06:18:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAG/p4ma7OSJVqVpDcW7Xm3FcQn6WgUzNpfhDr2bKXw=;
 b=bs7r0vUHMEZlitSmaTM/mgdlYig9lck/g16rBdzZGauWqBZk2Wzq6wS4v5Mqg4W74k+4axeAjRkVOmjYpGaaIt5kAhQfFhmD9rc8kSWDCwoFSggzzheSGLCuoAVC0hVgWJdggB5kMsIlVxzIsNVwMQAXPPSyzk6p8Le30xg6uIA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3873.namprd11.prod.outlook.com (10.255.128.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 13:18:08 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 13:18:08 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>, <jonas@norrbonn.se>
CC:     <linux-renesas-soc@vger.kernel.org>,
        <marek.vasut+renesas@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAAKYA
Date:   Tue, 7 May 2019 13:18:08 +0000
Message-ID: <eda4c8b2-2e10-6651-6c8e-e481c90fd1af@microchip.com>
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
x-clientproxiedby: VI1PR0801CA0076.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::20) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c51d425f-877b-4cb9-c81d-08d6d2ee7213
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN6PR11MB3873;
x-ms-traffictypediagnostic: BN6PR11MB3873:
x-microsoft-antispam-prvs: <BN6PR11MB3873E0A009289159A1D6664BF0310@BN6PR11MB3873.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:117;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(366004)(396003)(136003)(189003)(199004)(8676002)(52116002)(6246003)(305945005)(7736002)(86362001)(99286004)(316002)(31696002)(71200400001)(71190400001)(6486002)(6436002)(81166006)(81156014)(229853002)(110136005)(6116002)(31686004)(3846002)(54906003)(8936002)(66476007)(68736007)(66446008)(14454004)(64756008)(73956011)(66556008)(66946007)(53546011)(6512007)(446003)(26005)(11346002)(4326008)(25786009)(5660300002)(186003)(36756003)(386003)(53936002)(6506007)(486006)(478600001)(2906002)(476003)(72206003)(14444005)(66066001)(76176011)(2616005)(102836004)(256004)(505234006);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB3873;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6cyMjVkDgKkBx2pvIYklc1KWO4ayQkEk2thyQnJnAfUzOcZ8M/w9uNgjhAlBumSFUHEmSUpvRh6rXyp8fUkEtgFhVTvucxkcUq8MUdCY0mr6xYhs5PZpyyVREL4JMnum038XBJ8Hg11/1OedWwrdeGqrLC4moR/HCM6SZ+br9S2xFuJ/fLyL4VHDa3egdKXEO0WR0UdYRaILLZqRNvRIXJ5IBajzCK9U9P/AEgP+wokX4PLKzHMxof0zEXX9WjgmkEmsOgMxDKHTT5TDq9O+pAFP2MiS1DcUiy/JcqfueR/0U/WG+bPv1xyGhqkTV5A2qEULwRM0aK50duAkn70pBiLOhIAGXO7/TSDQifkgPWcD1mpkIQJEqLY9KEzCsgnHBfHBlhNsVIU4wW7NK+z+bdpwI9ui2T6wKmv95K6p3Ig=
Content-Type: text/plain; charset="utf-8"
Content-ID: <363764A45E4FFD45AB7AE65B490F8F81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c51d425f-877b-4cb9-c81d-08d6d2ee7213
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 13:18:08.2016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3873
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCk9uIDA1LzA3LzIwMTkgMDQ6MTUgUE0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6DQo+IEdlZXJ0
LA0KPiANCj4gT24gMDUvMDcvMjAxOSAwMzo1MiBQTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Og0KPj4gRXh0ZXJuYWwgRS1NYWlsDQo+Pg0KPj4NCj4+IEhpIEpvbmFzLA0KPj4NCj4+IE9uIFR1
ZSwgTWF5IDcsIDIwMTkgYXQgMToxNCBQTSBKb25hcyBCb25uIDxqb25hc0Bub3JyYm9ubi5zZT4g
d3JvdGU6DQo+Pj4gT24gMDcvMDUvMjAxOSAxMjo1MCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Og0KPj4+PiBPbiBUdWUsIE1heSA3LCAyMDE5IGF0IDEyOjQyIFBNIDxUdWRvci5BbWJhcnVzQG1p
Y3JvY2hpcC5jb20+IHdyb3RlOg0KPj4+Pj4gT24gMDUvMDcvMjAxOSAxMjo1MyBQTSwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOg0KPj4+Pj4+IE9uIFdlZCwgTWFyIDIwLCAyMDE5IGF0IDg6MTYg
QU0gSm9uYXMgQm9ubiA8am9uYXNAbm9ycmJvbm4uc2U+IHdyb3RlOg0KPj4+Pj4+PiBCb3RoIHRo
ZSBCUFswLTJdIGJpdHMgYW5kIHRoZSBUQlBST1QgYml0IGFyZSBzdXBwb3J0ZWQgb24gdGhpcyBj
aGlwLg0KPj4+Pj4+PiBUZXN0ZWQgYW5kIHZlcmlmaWVkIG9uIGEgQ3lwcmVzcyBzMjVmbDUxMnMu
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEJvbm4gPGpvbmFzQG5vcnJi
b25uLnNlPg0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyBpcyBub3cgY29tbWl0IGRjYjRiMjJlZWFmNDRm
OTEgKCJzcGktbm9yOiBzMjVmbDUxMnMgc3VwcG9ydHMgcmVnaW9uDQo+Pj4+Pj4gbG9ja2luZyIp
IGluIG10ZC9uZXh0Lg0KPj4+Pj4+DQo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c3BpLW5vci5jDQo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+
Pj4+Pj4+IEBAIC0xODk4LDcgKzE4OTgsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2lu
Zm8gc3BpX25vcl9pZHNbXSA9IHsNCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIFNQ
SV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwNCj4+Pj4+
Pj4gICAgICAgICAgeyAiczI1ZmwyNTZzMCIsIElORk8oMHgwMTAyMTksIDB4NGQwMCwgMjU2ICog
MTAyNCwgMTI4LCBVU0VfQ0xTUikgfSwNCj4+Pj4+Pj4gICAgICAgICAgeyAiczI1ZmwyNTZzMSIs
IElORk8oMHgwMTAyMTksIDB4NGQwMSwgIDY0ICogMTAyNCwgNTEyLCBTUElfTk9SX0RVQUxfUkVB
RCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sDQo+Pj4+Pj4+IC0gICAgICAgeyAi
czI1Zmw1MTJzIiwgIElORk82KDB4MDEwMjIwLCAweDRkMDA4MCwgMjU2ICogMTAyNCwgMjU2LCBT
UElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sDQo+Pj4+
Pj4+ICsgICAgICAgeyAiczI1Zmw1MTJzIiwgIElORk82KDB4MDEwMjIwLCAweDRkMDA4MCwgMjU2
ICogMTAyNCwgMjU2LA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBTUElfTk9SX0RV
QUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwgVVNFX0NMU1IpIH0sDQo+
Pj4+Pj4NCj4+Pj4+PiBTZXR0aW5nIFNQSV9OT1JfSEFTX0xPQ0sgY2F1c2VzIHRoZSBRU1BJIEZM
QVNIIG9uIHI4YTc3OTEva29lbHNjaCB0byBmYWlsDQo+Pj4+Pj4gcHJvYmluZy4NCj4+Pj4+Pg0K
Pj4+Pj4+IEJlZm9yZS9hZnRlcjoNCj4+Pj4+Pg0KPj4+Pj4+ICAgICAgLW0yNXA4MCBzcGkwLjA6
IHMyNWZsNTEycyAoNjU1MzYgS2J5dGVzKQ0KPj4+Pj4+ICAgICAgLTMgZml4ZWQtcGFydGl0aW9u
cyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2Ugc3BpMC4wDQo+Pj4+Pj4gICAgICAtQ3Jl
YXRpbmcgMyBNVEQgcGFydGl0aW9ucyBvbiAic3BpMC4wIjoNCj4+Pj4+PiAgICAgIC0weDAwMDAw
MDAwMDAwMC0weDAwMDAwMDA4MDAwMCA6ICJsb2FkZXIiDQo+Pj4+Pj4gICAgICAtMHgwMDAwMDAw
ODAwMDAtMHgwMDAwMDA2MDAwMDAgOiAidXNlciINCj4+Pj4+PiAgICAgIC0weDAwMDAwMDYwMDAw
MC0weDAwMDAwNDAwMDAwMCA6ICJmbGFzaCINCj4+Pj4+PiAgICAgICttMjVwODAgc3BpMC4wOiBF
cmFzZSBFcnJvciBvY2N1cnJlZA0KPj4+Pj4+ICAgICAgK20yNXA4MCBzcGkwLjA6IEVyYXNlIEVy
cm9yIG9jY3VycmVkDQo+Pj4+Pj4gICAgICArbTI1cDgwIHNwaTAuMDogdGltZW91dCB3aGlsZSB3
cml0aW5nIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXINCj4+Pj4+PiAgICAgICttMjVwODAgc3BpMC4w
OiBxdWFkIG1vZGUgbm90IHN1cHBvcnRlZA0KPj4+Pj4+ICAgICAgK20yNXA4MDogcHJvYmUgb2Yg
c3BpMC4wIGZhaWxlZCB3aXRoIGVycm9yIC01DQo+Pj4+Pj4NCj4+Pg0KPj4+IEluIGRyaXZlcnMv
bXRkL3NwaS1ub3Ivc3BpLW5vci5jIHlvdSBoYXZlOg0KPj4+DQo+Pj4gc3RhdGljIGludCBzcGlf
bm9yX2luaXQoc3RydWN0IHNwaV9ub3IgKm5vcikNCj4+PiB7DQo+Pj4gICAgICAgICAgaW50IGVy
cjsNCj4+Pg0KPj4+ICAgICAgICAgIC8qDQo+Pj4gICAgICAgICAgICogQXRtZWwsIFNTVCwgSW50
ZWwvTnVtb255eCwgYW5kIG90aGVycyBzZXJpYWwgTk9SIHRlbmQgdG8gcG93ZXIgdXANCj4+PiAg
ICAgICAgICAgKiB3aXRoIHRoZSBzb2Z0d2FyZSBwcm90ZWN0aW9uIGJpdHMgc2V0DQo+Pj4gICAg
ICAgICAgICovDQo+Pj4gICAgICAgICAgaWYgKEpFREVDX01GUihub3ItPmluZm8pID09IFNOT1Jf
TUZSX0FUTUVMIHx8DQo+Pj4gICAgICAgICAgICAgIEpFREVDX01GUihub3ItPmluZm8pID09IFNO
T1JfTUZSX0lOVEVMIHx8DQo+Pj4gICAgICAgICAgICAgIEpFREVDX01GUihub3ItPmluZm8pID09
IFNOT1JfTUZSX1NTVCB8fA0KPj4+ICAgICAgICAgICAgICBub3ItPmluZm8tPmZsYWdzICYgU1BJ
X05PUl9IQVNfTE9DSykgew0KPj4+ICAgICAgICAgICAgICAgICAgd3JpdGVfZW5hYmxlKG5vcik7
DQo+Pg0KPj4gV2l0aCBtb3JlIGRlYnVnIHByaW50czoNCj4+DQo+PiAgICAgbTI1cDgwIHNwaTAu
MDogc3BpX25vcl9pbml0OjM5MjU6IHdyaXRlX2VuYWJsZSgpIHJldHVybmVkIDANCj4+DQo+Pj4g
ICAgICAgICAgICAgICAgICB3cml0ZV9zcihub3IsIDApOw0KPj4NCj4+ICAgICBtMjVwODAgc3Bp
MC4wOiBzcGlfbm9yX2luaXQ6MzkyNzogd3JpdGVfc3IoKSByZXR1cm5lZCAwDQo+Pg0KPj4+ICAg
ICAgICAgICAgICAgICAgc3BpX25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsNCj4+DQo+PiAgICAg
bTI1cDgwIHNwaTAuMDogc3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0gMHgzDQo+PiAgICAgbTI1
cDgwIHNwaTAuMDogc3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0gMHgzDQo+PiAgICAgbTI1cDgw
IHNwaTAuMDogc3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0gMHgzDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLi4uDQo+PiAgICAgbTI1cDgwIHNwaTAuMDogc3BpX25v
cl9zcl9yZWFkeTo1MzM6IHNyID0gMHhmZg0KPj4gICAgIG0yNXA4MCBzcGkwLjA6IEVyYXNlIEVy
cm9yIG9jY3VycmVkDQo+PiAgICAgbTI1cDgwIHNwaTAuMDogc3BpX25vcl9pbml0OjM5Mjk6IHNw
aV9ub3Jfd2FpdF90aWxsX3JlYWR5KCkgcmV0dXJuZWQgLTUNCj4+DQo+Pj4gICAgICAgICAgfQ0K
Pj4+DQo+Pj4gICAgICAgICAgaWYgKG5vci0+cXVhZF9lbmFibGUpIHsNCj4+PiAgICAgICAgICAg
ICAgICAgIGVyciA9IG5vci0+cXVhZF9lbmFibGUobm9yKTsNCj4+DQo+PiAgICAgbTI1cDgwIHNw
aTAuMDogc3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0gMHhmZg0KPj4gICAgIG0yNXA4MCBzcGkw
LjA6IEVyYXNlIEVycm9yIG9jY3VycmVkDQo+PiAgICAgbTI1cDgwIHNwaTAuMDogdGltZW91dCB3
aGlsZSB3cml0aW5nIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXINCj4+ICAgICBtMjVwODAgc3BpMC4w
OiBzcGlfbm9yX2luaXQ6MzkzNzogc3BhbnNpb25fcXVhZF9lbmFibGUoKSByZXR1cm5lZCAtNQ0K
Pj4NCj4+PiAgICAgICAgICAgICAgICAgIGlmIChlcnIpIHsNCj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgZGV2X2Vycihub3ItPmRldiwgInF1YWQgbW9kZSBub3Qgc3VwcG9ydGVkXG4iKTsN
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4+PiAgICAgICAgICAg
ICAgICAgIH0NCj4+PiAgICAgICAgICB9DQo+Pj4NCj4+PiBUaGlzIGlzIHRoZSBvbmx5IG1lYW5p
bmdmdWwgdGhpbmcgdGhhdCBJIGNhbiBzZWUgbWF5IGhhdmUgY2hhbmdlZCB3aXRoDQo+Pj4gdGhp
cyBmbGFnLiAgV2Ugbm93IGhhdmUgYW4gYWRkaXRpb25hbCB3cml0ZV9lbmFibGUgYmVmb3JlIHF1
YWRfZW5hYmxlLg0KPj4+IFdoYXQgaGFwcGVucyBpZiB5b3Ugc3dhcCB0aG9zZSB0d28gYmxvY2tz
IGFib3ZlIHNvIHRoYXQgcXVhZF9lbmFibGUgaXMNCj4+PiBjYWxsZWQgZmlyc3Q/DQo+Pg0KPj4g
V2l0aCB0aGUgdHdvIGJsb2NrcyBzd2FwcGVkOg0KPj4NCj4+ICAgICBtMjVwODAgc3BpMC4wOiBz
cGlfbm9yX3NyX3JlYWR5OjUzMzogc3IgPSAweDANCj4+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlf
bm9yX2luaXQ6MzkxOTogc3BhbnNpb25fcXVhZF9lbmFibGUoKSByZXR1cm5lZCAwDQo+PiAgICAg
bTI1cDgwIHNwaTAuMDogc3BpX25vcl9pbml0OjM5Mzc6IHdyaXRlX2VuYWJsZSgpIHJldHVybmVk
IDANCj4+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlfbm9yX2luaXQ6MzkzOTogd3JpdGVfc3IoKSBy
ZXR1cm5lZCAwDQo+PiAgICAgbTI1cDgwIHNwaTAuMDogc3BpX25vcl9zcl9yZWFkeTo1MzM6IHNy
ID0gMHgzDQo+PiAgICAgbTI1cDgwIHNwaTAuMDogc3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0g
MHgzDQo+PiAgICAgbTI1cDgwIHNwaTAuMDogc3BpX25vcl9zcl9yZWFkeTo1MzM6IHNyID0gMHgz
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAuLi4NCj4+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlfbm9yX3NyX3JlYWR5
OjUzMzogc3IgPSAweGZmDQo+PiAgICAgbTI1cDgwIHNwaTAuMDogRXJhc2UgRXJyb3Igb2NjdXJy
ZWQNCj4+ICAgICBtMjVwODAgc3BpMC4wOiBzcGlfbm9yX2luaXQ6Mzk0MTogc3BpX25vcl93YWl0
X3RpbGxfcmVhZHkoKSByZXR1cm5lZCAtNQ0KPj4gICAgIG0yNXA4MCBzcGkwLjA6IHMyNWZsNTEy
cyAoNjU1MzYgS2J5dGVzKQ0KPj4gICAgIDMgZml4ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZv
dW5kIG9uIE1URCBkZXZpY2Ugc3BpMC4wDQo+PiAgICAgQ3JlYXRpbmcgMyBNVEQgcGFydGl0aW9u
cyBvbiAic3BpMC4wIjoNCj4+ICAgICAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDA4MDAwMCA6ICJs
b2FkZXIiDQo+PiAgICAgMHgwMDAwMDAwODAwMDAtMHgwMDAwMDA2MDAwMDAgOiAidXNlciINCj4+
ICAgICAweDAwMDAwMDYwMDAwMC0weDAwMDAwNDAwMDAwMCA6ICJmbGFzaCINCj4+DQo+PiBOb3Rl
IHRoYXQgc3BpX25vcl93YWl0X3RpbGxfcmVhZHkoKSBzdGlsbCBmYWlscy4NCj4+DQo+PiBXaGls
ZSB0aGUgZGV2aWNlICh3aGljaCBjb250YWlucyB0aGUgYm9vdCBsb2FkZXIpIG5vdyBhcHBlYXJz
IHRvIGJlDQo+PiBkZXRlY3RlZCBmaW5lLCByZWFkaW5nIHJldHVybnMgYm9ndXMgcmVwZXRpdGl2
ZSBkYXRhLCBmb3IgYWxsIHBhcnRpdGlvbnM6DQo+Pg0KPj4gICAgICMgaGQgL2Rldi9tdGQwIHwg
aGVhZA0KPj4gICAgIDAwMDAwMDAwICAzMyAzMyAzMyAzMyAzMyAzMyAzMyAzMyAgMzMgMzMgM2Ig
YmIgZmYgZmYgZmYgZmYNCj4+IHwzMzMzMzMzMzMzOy4uLi4ufA0KPj4gICAgIDAwMDAwMDEwICBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYNCj4+IHwuLi4u
Li4uLi4uLi4uLi4ufA0KPj4gICAgICoNCj4+ICAgICAwMDAwMTAwMCAgMzMgMzMgMzMgMzMgMzMg
MzMgMzMgMzMgIDMzIDMzIDNiIGJiIGZmIGZmIGZmIGZmDQo+PiB8MzMzMzMzMzMzMzsuLi4uLnwN
Cj4+ICAgICAwMDAwMTAxMCAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmDQo+PiB8Li4uLi4uLi4uLi4uLi4uLnwNCj4+ICAgICAqDQo+Pg0KPj4gSWYgSSBy
ZW1vdmUgdGhlIGNhbGwgdG8gIndyaXRlX3NyKG5vciwgMCkiLCBldmVyeXRoaW5nIHdvcmtzIGFz
DQo+PiBiZWZvcmUsIHJlZ2FyZGxlc3MNCj4+IG9mIHN3YXBwaW5nIHRoZSBibG9ja3MuDQo+Pg0K
PiANCj4gQ2FuIHlvdSB0cnkgdGhpcyBvbmU/DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBp
bmRleCA3MzE3MmQ3ZjUxMmIuLmI5NGE2ZWFhYWNhNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9y
LmMNCj4gQEAgLTE1NTEsNiArMTU1MSw3IEBAIHN0YXRpYyBpbnQgc3BhbnNpb25fcmVhZF9jcl9x
dWFkX2VuYWJsZShzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPiAgICAgICAgIHU4IHNyX2NyWzJdOw0K
PiAgICAgICAgIGludCByZXQ7DQo+ICANCj4gKyAgICAgICBkZXZfZXJyKGRldiwgIiVzXG4iLCBf
X0ZVTkNUSU9OX18pOw0KPiAgICAgICAgIC8qIENoZWNrIGN1cnJlbnQgUXVhZCBFbmFibGUgYml0
IHZhbHVlLiAqLw0KPiAgICAgICAgIHJldCA9IHJlYWRfY3Iobm9yKTsNCj4gICAgICAgICBpZiAo
cmV0IDwgMCkgew0KPiBAQCAtMzkxMSw2ICszOTEyLDEyIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9z
ZXR1cChzdHJ1Y3Qgc3BpX25vciAqbm9yLA0KPiAgc3RhdGljIGludCBzcGlfbm9yX2luaXQoc3Ry
dWN0IHNwaV9ub3IgKm5vcikNCj4gIHsNCj4gICAgICAgICBpbnQgZXJyOw0KPiArICAgICAgIHU4
IHZhbDsNCj4gKyAgICAgICB1OCBtYXNrID0gU1JfQlAyIHwgU1JfQlAxIHwgU1JfQlAwOw0KPiAr
DQo+ICsgICAgICAgLyogQ2hlY2sgY3VycmVudCBRdWFkIEVuYWJsZSBiaXQgdmFsdWUuICovDQo+
ICsgICAgICAgdmFsID0gcmVhZF9jcihub3IpOw0KPiArICAgICAgIGRldl9lcnIobm9yLT5kZXYs
ICIlcyB2YWwgPSAlMDJ4XG4iLCB2YWwpOw0KDQogICAgICAgIGRldl9lcnIobm9yLT5kZXYsICIl
cyB2YWwgPSAlMDJ4XG4iLCBfX0ZVTkNUSU9OX18sIHZhbCk7DQoNCj4gIA0KPiAgICAgICAgIC8q
DQo+ICAgICAgICAgICogQXRtZWwsIFNTVCwgSW50ZWwvTnVtb255eCwgYW5kIG90aGVycyBzZXJp
YWwgTk9SIHRlbmQgdG8gcG93ZXIgdXANCj4gQEAgLTM5MjEsNyArMzkyOCw3IEBAIHN0YXRpYyBp
bnQgc3BpX25vcl9pbml0KHN0cnVjdCBzcGlfbm9yICpub3IpDQo+ICAgICAgICAgICAgIEpFREVD
X01GUihub3ItPmluZm8pID09IFNOT1JfTUZSX1NTVCB8fA0KPiAgICAgICAgICAgICBub3ItPmlu
Zm8tPmZsYWdzICYgU1BJX05PUl9IQVNfTE9DSykgew0KPiAgICAgICAgICAgICAgICAgd3JpdGVf
ZW5hYmxlKG5vcik7DQo+IC0gICAgICAgICAgICAgICB3cml0ZV9zcihub3IsIDApOw0KPiArICAg
ICAgICAgICAgICAgd3JpdGVfc3Iobm9yLCB2YWwgJiB+bWFzayk7DQo+ICAgICAgICAgICAgICAg
ICBzcGlfbm9yX3dhaXRfdGlsbF9yZWFkeShub3IpOw0KPiAgICAgICAgIH0NCj4gIA0KPiANCg==

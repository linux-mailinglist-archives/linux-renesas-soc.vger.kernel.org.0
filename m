Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDA91F863
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 18:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfEOQVA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 12:21:00 -0400
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:22848
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726212AbfEOQU7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 12:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2icqXe3cv8WFRbvp8GOGKnHNXmxAAvE24DOLej3JmCk=;
 b=Iu2i2uh7YhHsIpO/iiTHGbaZ+T4Uu98AfH2TCZXFvyllgYXk9nffdETCzrurbXWiMct85gpevmrEkwHabYag1StTTUUUa3WU6Ra308TM9jR5lvx7ShBsgnyY7GgucEqufwLkQEibgx2z4cMrFQdgD1X7smJwmmXExwoD3cUa2SI=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1756.jpnprd01.prod.outlook.com (52.133.164.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 16:20:51 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901%2]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 16:20:51 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH 2/2] dt-bindings: arm: renesas: Add HopeRun RZ/G2[M]
 boards
Thread-Topic: [PATCH 2/2] dt-bindings: arm: renesas: Add HopeRun RZ/G2[M]
 boards
Thread-Index: AQHVCxOwuYt9Wb4pAkWyz0w1BKilraZsMd8AgAArkjA=
Date:   Wed, 15 May 2019 16:20:51 +0000
Message-ID: <TY1PR01MB17709902D813EB99E16FE6D2C0090@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1557920697-18057-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1557920697-18057-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqLB+7-x8i=MDpZuW0ebg5BBLJ+Y3gruf40zFSNv8_42Xg@mail.gmail.com>
In-Reply-To: <CAL_JsqLB+7-x8i=MDpZuW0ebg5BBLJ+Y3gruf40zFSNv8_42Xg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc953df1-1a6b-42e3-633e-08d6d9514c77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1756;
x-ms-traffictypediagnostic: TY1PR01MB1756:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <TY1PR01MB1756555FC5F0C710E5D70DF7C0090@TY1PR01MB1756.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(366004)(346002)(376002)(396003)(136003)(189003)(199004)(6306002)(86362001)(6436002)(7736002)(52536014)(186003)(68736007)(4326008)(73956011)(66946007)(66556008)(64756008)(66446008)(66476007)(7416002)(55016002)(33656002)(476003)(11346002)(9686003)(305945005)(71190400001)(5660300002)(71200400001)(54906003)(66066001)(25786009)(478600001)(14454004)(81166006)(229853002)(81156014)(26005)(316002)(76116006)(8936002)(6116002)(256004)(3846002)(8676002)(53376002)(53546011)(6506007)(446003)(102836004)(486006)(966005)(2906002)(99286004)(6246003)(74316002)(7696005)(76176011)(53936002)(44832011)(12575105005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1756;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S1FgdMxGTiSUNgu6gXw/lqgGcMlG8CK/I3f7KjMK8GmolVlbSdxoyZavT3AnfaOweqWxUkIEkYuE48TqiI1we+NGHjUBVSI4Cd+WZLW4xcU4LOophQ68f06Ct6pZ5YkDr+a97HXklCdVmfqFwgL3CwfxuCQ44IqaqGeHQzILLNwSxm2N2OACDok+Amy46DAWV8E/tPnw/BBVEtejkagrOC+xcT8LcHc4Sr22nyjfV0S0EJ69qtJLkn4mt662FbLEMQrjLI2PWi3J3UnqN3r9KA7KiK8IjuiHK+IsAzQA/672x2A1zqya45kjE//IQu5slCWkV2fNkabdShGYa1iA/WFlcsobHtRNZ8ITytktAbXyah1r/4QyLsYGCo7I3KTzmLdAiIlN4DSgMnPaPxzEnNdZGJFi28F29yMmlbLHt1E=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc953df1-1a6b-42e3-633e-08d6d9514c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 16:20:51.6323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1756
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gUm9iLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gRnJvbTogUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gU2VudDogMTUgTWF5IDIwMTkgMTQ6NDIN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGR0LWJpbmRpbmdzOiBhcm06IHJlbmVzYXM6IEFk
ZCBIb3BlUnVuIFJaL0cyW01dIGJvYXJkcw0KPiANCj4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQg
Njo0NSBBTSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGFkZHMgYm9hcmQgSGlIb3BlIFJaL0cyTSAo
dGhlIG1haW4gYm9hcmQsIHBvd2VyZWQgYnkNCj4gPiB0aGUgUjhBNzc0QTEpIGFuZCBib2FyZCBI
aUhvcGUgUlovRzIgRVggKHRoZSBleHBhbnNpb24gYm9hcmQNCj4gPiB0aGF0IHNpdHMgb24gdG9w
IG9mIHRoZSBIaUhvcGUgUlovRzJNKS4gQm90aCBib2FyZHMgYXJlIG1hZGUNCj4gPiBieSBKaWFu
Z3N1IEhvcGVSdW4gU29mdHdhcmUgQ28uLCBMdGQuIChhLmsuYS4gSG9wZVJ1bikuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5l
c2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQ2hyaXMgUGF0ZXJzb24gPENocmlzLlBhdGVyc29u
MkByZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IFVzZWZ1bCBsaW5rczoNCj4gPiBodHRw
Oi8vaGlob3BlLm9yZy9wcm9kdWN0L2RldGFpbC9yemcyDQo+ID4gaHR0cHM6Ly9pdGVtLnRhb2Jh
by5jb20vaXRlbS5odG0/c3BtPWEyb3EwLjEyNTc1MjgxLjAuMC42YmNmMWRlYlFwemtSUyZmdD10
JmlkPTU5MjE3NzQ5ODQ3Mg0KPiA+IGh0dHA6Ly93d3cuaG9wZXJ1bi5jb20vQ24vbmV3cy9pZC8z
NzkNCj4gPg0KPiA+IFdlIGFscmVhZHkga25vdyB0aGF0IHRoZSBIaUhvcGUgUlovRzIgRVggd2ls
bCBhbHNvIHNpdCBvbiB0aGUNCj4gPiBIaUhvcGUgUlovRzJOLCBldmVuIHRob3VnaCB0aGUgSGlI
b3BlIFJaL0cyTiBkb2Vzbid0IGV4aXN0IGp1c3QNCj4gPiB5ZXQuDQo+IA0KPiBTZWVtcyBsaWtl
IHVzZWZ1bCBpbnRvIHRvIHB1dCBpbiB0aGUgY29tbWl0IG1zZy4NCg0KT2ssIHdpbGwgbW92ZSB0
aGUgbm90ZXMgdG8gdGhlIGNvbW1pdCBtc2cgdGhlbiBmb3IgdjIuDQoNCj4gDQo+ID4gLS0tDQo+
ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcmVuZXNhcy55YW1sIHwg
OCArKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5l
c2FzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3JlbmVzYXMu
eWFtbA0KPiA+IGluZGV4IDE5ZjM3OTguLjk1MzAyYjkgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5lc2FzLnlhbWwNCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3JlbmVzYXMueWFtbA0KPiA+IEBA
IC0xMDYsNiArMTA2LDE0IEBAIHByb3BlcnRpZXM6DQo+ID4NCj4gPiAgICAgICAgLSBkZXNjcmlw
dGlvbjogUlovRzJNIChSOEE3NzRBMSkNCj4gPiAgICAgICAgICBpdGVtczoNCj4gPiArICAgICAg
ICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIGhvcGVydW4saGlob3BlLXJ6ZzJtICMg
SG9wZVJ1biBIaUhvcGUgUlovRzJNIHBsYXRmb3JtDQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBy
ZW5lc2FzLHI4YTc3NGExDQo+ID4gKw0KPiA+ICsgICAgICAgIGl0ZW1zOg0KPiANCj4gRGlkIHlv
dSBydW4gdGhpcyB0aHJ1IHRoZSBjaGVja3MgYmVjYXVzZSB0aGlzIGlzbid0IHZhbGlkIGpzb24t
c2NoZW1hLg0KPiBZb3UgY2FuJ3QgaGF2ZSBzYW1lIGtleXdvcmQgdHdpY2UuIFRoaXMgJ2l0ZW1z
JyBuZWVkcyB0byBiZSBhbm90aGVyDQo+IGxpc3QgZW50cnkgKGkuZS4gYWRkIGEgJy0nKS4NCg0K
T29wcywgc29ycnkgYWJvdXQgdGhhdC4gV2lsbCBmaXggaW4gdjIuDQoNClRoYW5rcywNCkZhYg0K
DQo+IA0KPiA+ICsgICAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gaG9wZXJ1
bixoaWhvcGUtcnpnMi1leCAjIEhvcGVSdW4gZXhwYW5zaW9uIGJvYXJkIGZvciBIaUhvcGUgUlov
RzIgcGxhdGZvcm1zDQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBob3BlcnVuLGhpaG9wZS1yemcy
bQ0KPiA+ICAgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyOGE3NzRhMQ0KPiA+DQo+ID4gICAg
ICAgIC0gZGVzY3JpcHRpb246IFJaL0cyRSAoUjhBNzc0QzApDQo+ID4gLS0NCj4gPiAyLjcuNA0K
PiA+DQo=

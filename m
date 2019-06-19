Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BC24BC0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 16:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfFSOve (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 10:51:34 -0400
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:30240
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725899AbfFSOve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 10:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI3YAr+x1hkf/Q2AFABw+/W+LDlZ6fLxfhniqlAjQfs=;
 b=kv3Cxq18uM29hE9yuhnBrK4Mf113IXb0cdYV1nh+9yQ33f5UIe8p0YRuzNQ5PA4IBLbAhsA+4bb2lc7J23ECQzFCwIpWKGcsG9ETWTh1KKVuCYw5r6SzxF+lUaKnjrFmo0KgY7TTBky7i3Vpdjs0eGSLpJvnB52bLgGvqEYN+Vw=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1820.jpnprd01.prod.outlook.com (52.133.164.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 14:51:27 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 14:51:27 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Thread-Index: AQHVJek7vUy9P93/fEWDP1bpe4SW26ai7NGAgAAAbxCAAB+ZAIAAA3qw
Date:   Wed, 19 Jun 2019 14:51:27 +0000
Message-ID: <TY1PR01MB1770C52BCFB2ED9F162399A1C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190619124131.GB21753@pendragon.ideasonboard.com>
 <TY1PR01MB1770B099456BD96D352DF526C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190619143610.GH21753@pendragon.ideasonboard.com>
In-Reply-To: <20190619143610.GH21753@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb14e7f7-24b2-4034-10bf-08d6f4c59ba8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1820;
x-ms-traffictypediagnostic: TY1PR01MB1820:
x-microsoft-antispam-prvs: <TY1PR01MB1820274308B19EBB979D0CC3C0E50@TY1PR01MB1820.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(396003)(366004)(376002)(39860400002)(189003)(199004)(71190400001)(26005)(446003)(4326008)(64756008)(66476007)(7736002)(73956011)(66446008)(55016002)(9686003)(478600001)(25786009)(66946007)(305945005)(76116006)(229853002)(66556008)(186003)(554214002)(53546011)(14454004)(476003)(102836004)(86362001)(486006)(53936002)(14444005)(256004)(68736007)(6506007)(6916009)(76176011)(7696005)(316002)(66066001)(33656002)(3846002)(54906003)(2906002)(71200400001)(74316002)(6246003)(11346002)(99286004)(44832011)(81156014)(81166006)(8936002)(6436002)(8676002)(52536014)(6116002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1820;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3Q6seK6eUeViZsKBvzAVzAVstRsAeqYwo4vyWwKcYUDXUV9rRoFilxr1gIhJFJFXLO4efvylGFHhuuY7i6um/JkcDOp9R8mJQDHyZOGeHoRNWMWmlBhHM0/xGcJBZgntGSR2UF8xWRjovybwckKU6P0TqGCjW0jdFYZfC7XzxqP+3hp8UoOIscVe2bdI2kdglPx1yJlvciACJ1h/HWpIAWK1YMpwjxSywh92XyyTGfFbf8zZTiyKjKuURUhKhKZbOjSzVLT5q/MS4cOMXrOkjw+WJoyXhsSshKbTUWvqUnUAHRkeDmgzd+XUnVpDSFR5qEBnSjmkk96xSbPFZVbJXPfxn+L/Zh/pc4yak1QPwbvZ63lxmoCmqh5i8l22XIwAQGT86s3+mudbzOk2OENqsQOxS+235XGdcW77+NiuhbY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb14e7f7-24b2-4034-10bf-08d6f4c59ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 14:51:27.6051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1820
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4g
U2VudDogMTkgSnVuZSAyMDE5IDE1OjM2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSBhcm02
NDogZHRzOiByZW5lc2FzOiBoaWhvcGUtY29tbW9uOiBBZGQgSERNSSBzdXBwb3J0DQo+IA0KPiBI
aSBGYWJyaXppbywNCj4gDQo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDEyOjQ4OjE3UE0gKzAw
MDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiBPbiBTZW50OiAxOSBKdW5lIDIwMTkgMTM6
NDIgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0
IDA0OjE4OjM5UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiA+PiBBZGQgSERN
SSBzdXBwb3J0IHRvIHRoZSBIaUhvcGUgUlovRzJbTU5dIG1vdGhlciBib2FyZCBjb21tb24NCj4g
PiA+PiBkdHNpLg0KPiA+ID4+DQo+ID4gPj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJv
IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gPj4NCj4gPiA+PiAtLS0NCj4g
PiA+PiBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgcGF0Y2ggd2FzIHRlc3RlZCB3aXRoIGEgNEsgbW9u
aXRvciBhbmQgY21hPTk2TQ0KPiA+ID4+DQo+ID4gPj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4+DQo+ID4gPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLWNvbW1vbi5kdHNpDQo+ID4g
Pj4gaW5kZXggNjI1YzNhYS4uZTc1NjhlMSAxMDA2NDQNCj4gPiA+PiAtLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLWNvbW1vbi5kdHNpDQo+ID4gPj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1jb21tb24uZHRzaQ0KPiA+ID4+IEBAIC0xNyw2
ICsxNywxOCBAQA0KPiA+ID4+ICAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOw0K
PiA+ID4+ICAJfTsNCj4gPiA+Pg0KPiA+ID4+ICsJaGRtaTAtb3V0IHsNCj4gPiA+PiArCQljb21w
YXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsNCj4gPiA+PiArCQlsYWJlbCA9ICJIRE1JMCBPVVQi
Ow0KPiA+ID4NCj4gPiA+IElzIHRoZSBsYWJlbCBwaHlzaWNhbGx5IHByZXNlbnQgb24gdGhlIGRl
dmljZSAocHJpbnRlZCBvbiB0aGUgYm9hcmQgb3INCj4gPiA+IHRoZSBjYXNlKSA/DQo+ID4NCj4g
PiBJIGFtIGFmcmFpZCBpdCdzIG5vdC4gU2hhbGwgSSBzZW5kIGEgdjI/IE9yIHBlcmhhcHMgU2lt
b24gY291bGQgdGFrZSBpdCBvdXQgd2hpbGUgYXBwbHlpbmc/DQo+ID4NCj4gPiA+IEFwYXJ0IGZy
b20gdGhhdCwgd2l0aG91dCBhY2Nlc3MgdG8gdGhlIHNjaGVtYXRpY3MgSSBjYW4ndCByZWFsbHkg
dGVsbCBpZg0KPiA+ID4gdGhlIERUIGlzIGNvcnJlY3QsIGJ1dCBub3RoaW5nIHN0cmlrZXMgbWUg
YXMgcmVhbGx5IHdyb25nLCBzbw0KPiA+DQo+ID4gSSBkaWRuJ3Qga25vdyB5b3UgaGFkIG5vIGFj
Y2VzcyB0byB0aGUgc2NoZW1hdGljcywgb24gdGhlaXIgd2F5Li4uDQo+IA0KPiBUaGFuayB5b3Uu
IEkgY29uZmlybSB0aGUgRFQgbG9va3MgZ29vZC4NCg0KVGhhbmsgeW91IQ0KDQo+IA0KPiBPbiBh
IHNpZGUgbm90ZSwgdGhlcmUncyBhbiBFU0QgcHJvdGVjdGlvbiBhbmQgbGV2ZWwgc2hpZnRlciBj
aGlwIGJldHdlZW4NCj4gdGhlIEhETUkgb3V0cHV0IGFuZCB0aGUgSERNSSBjb25uZWN0b3IuIE9u
IHRoaXMgYm9hcmQgYWxsIGl0cyBjb250cm9sDQo+IHBpbnMgYXJlIGhhcmR3aXJlZCB0byBmaXhl
ZCBsZXZlbHMsIHNvIGl0J3MgY29tcGxldGVseSB0cmFuc3BhcmVudCwgYnV0DQo+IGluIG90aGVy
IGNhc2VzIGl0IHNob3VsZCBiZSBtb2RlbGxlZCBpbiBEVC4gSSdtIHdvcmtpbmcgb24gYSBkcml2
ZXIgZm9yDQo+IHRoZSBUUEQxMlMwMTUgd2hpY2ggc2hvdWxkIGJlIHF1aXRlIHNpbWlsYXIsIEkg
d2lsbCBwb3N0IGl0IHNvb24uDQoNCkdvb2QgdG8ga25vdywgSSBhbSBsb29raW5nIGZvcndhcmQg
dG8gc2VlIGl0Lg0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gPiA+IEFja2VkLWJ5OiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPg0KPiA+
ID4+ICsJCXR5cGUgPSAiYSI7DQo+ID4gPj4gKw0KPiA+ID4+ICsJCXBvcnQgew0KPiA+ID4+ICsJ
CQloZG1pMF9jb246IGVuZHBvaW50IHsNCj4gPiA+PiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
cmNhcl9kd19oZG1pMF9vdXQ+Ow0KPiA+ID4+ICsJCQl9Ow0KPiA+ID4+ICsJCX07DQo+ID4gPj4g
Kwl9Ow0KPiA+ID4+ICsNCj4gPiA+PiAgCWxlZHMgew0KPiA+ID4+ICAJCWNvbXBhdGlibGUgPSAi
Z3Bpby1sZWRzIjsNCj4gPiA+Pg0KPiA+ID4+IEBAIC04Miw2ICs5NCwzMCBAQA0KPiA+ID4+ICAJ
CXN0YXRlcyA9IDwzMzAwMDAwIDENCj4gPiA+PiAgCQkJICAxODAwMDAwIDA+Ow0KPiA+ID4+ICAJ
fTsNCj4gPiA+PiArDQo+ID4gPj4gKwl4MzAyX2NsazogeDMwMi1jbG9jayB7DQo+ID4gPj4gKwkJ
Y29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gPj4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+
Ow0KPiA+ID4+ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwzMzAwMDAwMD47DQo+ID4gPj4gKwl9Ow0K
PiA+ID4+ICsNCj4gPiA+PiArCXgzMDRfY2xrOiB4MzA0LWNsb2NrIHsNCj4gPiA+PiArCQljb21w
YXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiA+PiArCQkjY2xvY2stY2VsbHMgPSA8MD47DQo+
ID4gPj4gKwkJY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsNCj4gPiA+PiArCX07DQo+ID4g
Pj4gK307DQo+ID4gPj4gKw0KPiA+ID4+ICsmZHUgew0KPiA+ID4+ICsJY2xvY2tzID0gPCZjcGcg
Q1BHX01PRCA3MjQ+LA0KPiA+ID4+ICsJCSA8JmNwZyBDUEdfTU9EIDcyMz4sDQo+ID4gPj4gKwkJ
IDwmY3BnIENQR19NT0QgNzIyPiwNCj4gPiA+PiArCQkgPCZ2ZXJzYWNsb2NrNSAxPiwNCj4gPiA+
PiArCQkgPCZ4MzAyX2Nsaz4sDQo+ID4gPj4gKwkJIDwmdmVyc2FjbG9jazUgMj47DQo+ID4gPj4g
KwljbG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEiLCAiZHUuMiIsDQo+ID4gPj4gKwkJICAgICAg
ImRjbGtpbi4wIiwgImRjbGtpbi4xIiwgImRjbGtpbi4yIjsNCj4gPiA+PiArCXN0YXR1cyA9ICJv
a2F5IjsNCj4gPiA+PiAgfTsNCj4gPiA+Pg0KPiA+ID4+ICAmZWhjaTAgew0KPiA+ID4+IEBAIC0x
MDksMTEgKzE0NSwzNyBAQA0KPiA+ID4+ICAJfTsNCj4gPiA+PiAgfTsNCj4gPiA+Pg0KPiA+ID4+
ICsmaGRtaTAgew0KPiA+ID4+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiA+ID4+ICsNCj4gPiA+PiAr
CXBvcnRzIHsNCj4gPiA+PiArCQlwb3J0QDEgew0KPiA+ID4+ICsJCQlyZWcgPSA8MT47DQo+ID4g
Pj4gKwkJCXJjYXJfZHdfaGRtaTBfb3V0OiBlbmRwb2ludCB7DQo+ID4gPj4gKwkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmhkbWkwX2Nvbj47DQo+ID4gPj4gKwkJCX07DQo+ID4gPj4gKwkJfTsNCj4g
PiA+PiArCX07DQo+ID4gPj4gK307DQo+ID4gPj4gKw0KPiA+ID4+ICAmaHN1c2Igew0KPiA+ID4+
ICAJZHJfbW9kZSA9ICJvdGciOw0KPiA+ID4+ICAJc3RhdHVzID0gIm9rYXkiOw0KPiA+ID4+ICB9
Ow0KPiA+ID4+DQo+ID4gPj4gKyZpMmM0IHsNCj4gPiA+PiArCWNsb2NrLWZyZXF1ZW5jeSA9IDw0
MDAwMDA+Ow0KPiA+ID4+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiA+ID4+ICsNCj4gPiA+PiArCXZl
cnNhY2xvY2s1OiBjbG9jay1nZW5lcmF0b3JANmEgew0KPiA+ID4+ICsJCWNvbXBhdGlibGUgPSAi
aWR0LDVwNDl2NTkyMyI7DQo+ID4gPj4gKwkJcmVnID0gPDB4NmE+Ow0KPiA+ID4+ICsJCSNjbG9j
ay1jZWxscyA9IDwxPjsNCj4gPiA+PiArCQljbG9ja3MgPSA8JngzMDRfY2xrPjsNCj4gPiA+PiAr
CQljbG9jay1uYW1lcyA9ICJ4aW4iOw0KPiA+ID4+ICsJfTsNCj4gPiA+PiArfTsNCj4gPiA+PiAr
DQo+ID4gPj4gICZvaGNpMCB7DQo+ID4gPj4gIAlzdGF0dXMgPSAib2theSI7DQo+ID4gPj4gIH07
DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

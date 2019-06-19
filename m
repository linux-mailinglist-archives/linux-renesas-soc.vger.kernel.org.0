Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44944B8E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfFSMmb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:42:31 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:10944
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727244AbfFSMmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjuqUNtokCcSW3hzjARAi9kFBScs5YwkovKPKDDDPKA=;
 b=QYhBmhE7pFNdaFRX0hnVdyC8abO8k2effXyibFHQK9Dgijiog1mtzxnZUDgsH6Jn1tti+MusP1dt2jYOEv4e4GJWq+GjBu3SawlWNJwPbnMi/IoBGZ5yEIK3FLntVsGLqtbxxD1W0yC96lpqt+gTdzCc3uYnU5QtmZ6Ez9ut26c=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1769.jpnprd01.prod.outlook.com (52.133.160.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 12:42:25 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 12:42:24 +0000
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
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add HDMI encoder
 instance
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add HDMI encoder
 instance
Thread-Index: AQHVJek5UYO6sykYrkSo/mAXP9qhTqai7BgAgAAARMA=
Date:   Wed, 19 Jun 2019 12:42:24 +0000
Message-ID: <TY1PR01MB177067A85CA3535257A38C2FC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190619123856.GA21753@pendragon.ideasonboard.com>
In-Reply-To: <20190619123856.GA21753@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e92cc480-9146-412c-67a3-08d6f4b394a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1769;
x-ms-traffictypediagnostic: TY1PR01MB1769:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB1769A5837A8B81B4738A0BEEC0E50@TY1PR01MB1769.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(39860400002)(396003)(376002)(366004)(199004)(189003)(81156014)(102836004)(11346002)(6436002)(74316002)(6506007)(8936002)(966005)(55016002)(6306002)(9686003)(229853002)(76176011)(7696005)(53546011)(64756008)(66476007)(5660300002)(6116002)(73956011)(26005)(76116006)(66556008)(33656002)(66446008)(3846002)(52536014)(2906002)(316002)(66066001)(54906003)(7736002)(305945005)(6916009)(68736007)(107886003)(66946007)(25786009)(478600001)(8676002)(53936002)(71190400001)(71200400001)(6246003)(4326008)(256004)(14444005)(14454004)(86362001)(44832011)(446003)(486006)(186003)(81166006)(476003)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1769;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N+82cw6AeRf5QBnt4IFukZENjQi4+gA6fv1PtqUap4fjHmSvwvXPM+d4b7XfjY0PgGWlS9ee36u/esZ2hViXwpmWdE6PlIcPYIjctOJniU28hYA2mwNaL/vuT4ja8IQ/L93jX4nyTpvSVP1GXXlcdVhstyRTsXqtHpczx3ram6h0JvHkW0cHHpmWrD8Izb5mn4S+nm0oidbqguYWkQeAgA2d0LbjorjqCv+dYOaVdwXLmNws6tQuuZP3cCcHBg5oGB87bdnm6XkyzWHvlIoYJg9SO0bv+bkAUb4b1/DHQv6km4cX1P1+LjKLlyCR535cjKXh5sDzCBLjwDsO/q7vy+zI29Q9/NQnrjsvC5nWEgxhz45enLW5awRnyOkN3gOKRXM/8XJszzeqAo7JGRut1C7grNdX5CwAAV4i2sTHho4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92cc480-9146-412c-67a3-08d6f4b394a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 12:42:24.8360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1769
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLg0KDQo+IEZyb206
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4g
U2VudDogMTkgSnVuZSAyMDE5IDEzOjM5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBhcm02
NDogZHRzOiByZW5lc2FzOiByOGE3NzRhMTogQWRkIEhETUkgZW5jb2RlciBpbnN0YW5jZQ0KPiAN
Cj4gSGkgRmFicml6aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDA0OjE4OjM4UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3
cm90ZToNCj4gPiBBZGQgdGhlIEhETUkgZW5jb2RlciB0byB0aGUgUjhBNzc0QTEgRFQgaW4gZGlz
YWJsZWQgc3RhdGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZh
YnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IFRoaXMgcGF0
Y2ggZGVwZW5kcyBvbjoNCj4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEw
OTk1MTQ5Lw0KPiANCj4gSXMgdGhhdCB0aGUgY29ycmVjdCBvbmUgPyBJIGRvbid0IHNlZSBob3cg
Q0FOIHN1cHBvcnQgaXMgcmVsYXRlZC4NCg0KSXQncyBvbmx5IHRvIHBsZWFzZSBnaXQgOy0pDQoN
ClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIHRoaXMuDQoNCkZhYg0KDQo+IA0KPiBJbiBhbnkgY2Fz
ZSwNCj4gDQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjhhNzc0YTEuZHRzaSB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+ID4gaW5kZXggZDZkZDRiNi4uYTg0OWNhNyAx
MDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRz
aQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+
ID4gQEAgLTIzOTcsNiArMjM5NywzNyBAQA0KPiA+ICAJCQl9Ow0KPiA+ICAJCX07DQo+ID4NCj4g
PiArCQloZG1pMDogaGRtaUBmZWFkMDAwMCB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAicmVuZXNh
cyxyOGE3NzRhMS1oZG1pIiwNCj4gPiArCQkJCSAgICAgInJlbmVzYXMscmNhci1nZW4zLWhkbWki
Ow0KPiA+ICsJCQlyZWcgPSA8MCAweGZlYWQwMDAwIDAgMHgxMDAwMD47DQo+ID4gKwkJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSAzODkgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKwkJCWNsb2Nr
cyA9IDwmY3BnIENQR19NT0QgNzI5PiwNCj4gPiArCQkJCSA8JmNwZyBDUEdfQ09SRSBSOEE3NzRB
MV9DTEtfSERNST47DQo+ID4gKwkJCWNsb2NrLW5hbWVzID0gImlhaGIiLCAiaXNmciI7DQo+ID4g
KwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc0QTFfUERfQUxXQVlTX09OPjsNCj4gPiAr
CQkJcmVzZXRzID0gPCZjcGcgNzI5PjsNCj4gPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4g
PiArDQo+ID4gKwkJCXBvcnRzIHsNCj4gPiArCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+
ICsJCQkJI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKwkJCQlwb3J0QDAgew0KPiA+ICsJCQkJCXJl
ZyA9IDwwPjsNCj4gPiArCQkJCQlkd19oZG1pMF9pbjogZW5kcG9pbnQgew0KPiA+ICsJCQkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmR1X291dF9oZG1pMD47DQo+ID4gKwkJCQkJfTsNCj4gPiArCQkJ
CX07DQo+ID4gKwkJCQlwb3J0QDEgew0KPiA+ICsJCQkJCXJlZyA9IDwxPjsNCj4gPiArCQkJCX07
DQo+ID4gKwkJCQlwb3J0QDIgew0KPiA+ICsJCQkJCS8qIEhETUkgc291bmQgKi8NCj4gPiArCQkJ
CQlyZWcgPSA8Mj47DQo+ID4gKwkJCQl9Ow0KPiA+ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKw0K
PiA+ICAJCWR1OiBkaXNwbGF5QGZlYjAwMDAwIHsNCj4gPiAgCQkJY29tcGF0aWJsZSA9ICJyZW5l
c2FzLGR1LXI4YTc3NGExIjsNCj4gPiAgCQkJcmVnID0gPDAgMHhmZWIwMDAwMCAwIDB4NzAwMDA+
Ow0KPiA+IEBAIC0yNDIzLDYgKzI0NTQsNyBAQA0KPiA+ICAJCQkJcG9ydEAxIHsNCj4gPiAgCQkJ
CQlyZWcgPSA8MT47DQo+ID4gIAkJCQkJZHVfb3V0X2hkbWkwOiBlbmRwb2ludCB7DQo+ID4gKwkJ
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHdfaGRtaTBfaW4+Ow0KPiA+ICAJCQkJCX07DQo+ID4g
IAkJCQl9Ow0KPiA+ICAJCQkJcG9ydEAyIHsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBM
YXVyZW50IFBpbmNoYXJ0DQo=

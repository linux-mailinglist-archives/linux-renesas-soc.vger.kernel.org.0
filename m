Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5258159D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 11:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfHEJhg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 05:37:36 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:15264
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726880AbfHEJhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 05:37:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdkhUeNxgioifOSdZrgk5aNd1nJrUdXQcUvwplOJtVzWRcLlxlI++aNN8jw70ZMJcc0h2jL1h9GruZgyll4MKNb+9UgkoGXShSUJ7VOPNmEMVsNgot7mxeKHg4+hcGwAKA56lPMxUHXm7Q7G0H5IpPWOmlUf3CO3ezp4zwYI4sfdCdy4ND3td1t68pCE2gavLGaiVj8CIOvMn2PClQ618U9TpDRu1SEGu4yKhYHknsYVIMZmFZYd7cK8Z7Zs9TKHNtFZ13k4VXnozAi2fGzopvCJU7TD8+zVzSq6plhCFzBRDPwq25daVfzChGO/LMIWArRvTYOPV68r/kbfVRPvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXC2awzpm1YjM6orx3j5hepM8lVLz1lhvMaqCNQ53Kw=;
 b=OkcHEEWvmuLiqygxO3/7nVO/JMTtlhyey61HzWZFidQp192t/5l4Eg3JHda1zJWQMbOjP2tula7O9fAAAAfWWQNdreV42E6uXzR2PiyoNP60Mk1gX0nVm9oHaGvRFrkxEqF//BouoMZuZ6GTPFS6Ham/Ak7eFJbTpJ7RVM6Vrcye0hY7PsBzr9qCNBIYwcsW0m0xV/UVorNh7pos82QnwukvHhEWD+DUzp4o1g6WT4c3ki0zhckPTR71xOhs+uSPGPJPyDtA5oL21Rl0OFvE5iWWOU8EamK13wigbOOJYWeS2oWVYcBdmvHiYwd2CYdNCIQHb1WDFDrRMUpcm4rMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXC2awzpm1YjM6orx3j5hepM8lVLz1lhvMaqCNQ53Kw=;
 b=lb7hBkajWkbsrKzMVyLin96skp8Y/ongpRDGF2rgck0jcZcbvC0yeFvpakD0WN3V+py6rSMg3gsg4rJWLrSnLBvNsule07W4YYY9cs3wdkkzboEMq7kKBZdVTavkG9XH0aFXKXjwsgG2gHkEWb5kR9i5FaUix2BRZrNhyQWrza4=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1737.jpnprd01.prod.outlook.com (52.133.163.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Mon, 5 Aug 2019 09:37:31 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:37:31 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH/RFC 12/12] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Thread-Topic: [PATCH/RFC 12/12] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Thread-Index: AQHVSQTeO7aqmQdlekuuD/lMa5esK6bniCMAgATHhDA=
Date:   Mon, 5 Aug 2019 09:37:29 +0000
Message-ID: <TY1PR01MB177040DF4ADCF460CDA0D8AEC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-13-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802083424.GM5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802083424.GM5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6b473a6-3751-4241-93fe-08d7198889b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1737;
x-ms-traffictypediagnostic: TY1PR01MB1737:
x-microsoft-antispam-prvs: <TY1PR01MB17379A91B4AF40CC3CF8C203C0DA0@TY1PR01MB1737.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(478600001)(186003)(305945005)(76176011)(52536014)(7696005)(81166006)(81156014)(102836004)(99286004)(26005)(71190400001)(71200400001)(53936002)(14454004)(6506007)(53546011)(7736002)(5660300002)(86362001)(6246003)(3846002)(64756008)(9686003)(66556008)(66476007)(55016002)(6116002)(6436002)(74316002)(8676002)(8936002)(66446008)(476003)(316002)(229853002)(54906003)(76116006)(6916009)(66946007)(446003)(11346002)(7416002)(14444005)(486006)(256004)(66066001)(44832011)(4326008)(33656002)(2906002)(68736007)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1737;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NbkpKhugeWukxnPJvKeuRyu0PEHDD4emJJLZT+JO2ng6nah+Efb8gJqttkLHIhD6zNo5PoRcuKvEPNkv+SZB3KHDgs0QwkBDRNfIyfOGmRm9k3q+Wrmr1GbqS1WbGGgEMJyYx+5XuEBZMNXeBup+/oG5oBAghsthX9z1Q6t0YfjHrG+QkJSHb6i3h8apCKCyMn4Ej5Tx/FaogR8vm6m9c/5hI+PoktlSsReSDY1FC5g2QLgUlq8xZEEEzhxeDFVNwCHWQpNETaTwl7O1cz4KkWou8oqiQZl81YmbNIORWsNI5c5A1eeKjXu21kutaFo7/c1h7wIFb8zCxNwDc+dr31afFffdOmeKHAJr144BoaGkVErVzbtKfVH1YdEOp2V5B+yAcFhQb2smBLsMpGeimWjT7uVcYAydfbidADfjqVQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b473a6-3751-4241-93fe-08d7198889b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:37:31.0947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1737
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IDAyIEF1Z3VzdCAyMDE5IDA5OjM0DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0gvUkZDIDEyLzEyXSBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgRUs4NzQg
Ym9hcmQgd2l0aCBpZGstMjEyMXdyIGRpc3BsYXkgc3VwcG9ydA0KPiANCj4gSGkgRmFicml6aW8s
DQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjM0OjA5QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiBUaGUg
RUs4NzQgaXMgYWR2ZXJ0aXNlZCBhcyBjb21wYXRpYmxlIHdpdGggcGFuZWwgSURLLTIxMjFXUiBm
cm9tDQo+ID4gQWR2YW50ZWNoLCBob3dldmVyIHRoZSBwYW5lbCBpc24ndCBzb2xkIGFsb25nc2lk
ZSB0aGUgYm9hcmQuDQo+ID4gQSBuZXcgZHRzLCBhZGRpbmcgZXZlcnl0aGluZyB0aGF0J3MgcmVx
dWlyZWQgdG8gZ2V0IHRoZSBwYW5lbCB0bw0KPiA+IHRvIHdvcmsgd2l0aCB0aGUgRUs4NzQsIGlz
IHRoZSBtb3N0IGNvbnZlbmllbnQgd2F5IHRvIHN1cHBvcnQgdGhlDQo+ID4gRUs4NzQgd2hlbiBp
dCdzIGNvbm5lY3RlZCB0byB0aGUgSURLLTIxMjFXUi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0t
LQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUgICAgICAgICAgICAg
ICB8ICAgMyArLQ0KPiA+ICAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC1lazg3NC1pZGst
MjEyMXdyLmR0cyB8IDExMiArKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLWVrODc0LWlkay0yMTIx
d3IuZHRzDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlDQo+ID4gaW5k
ZXggNDJiNzRjMi4uY2U0ODQ3OCAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvTWFrZWZpbGUNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
TWFrZWZpbGUNCj4gPiBAQCAtMSw3ICsxLDggQEANCj4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMA0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9SOEE3NzRBMSkgKz0gcjhhNzc0
YTEtaGlob3BlLXJ6ZzJtLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9SOEE3NzRBMSkgKz0g
cjhhNzc0YTEtaGlob3BlLXJ6ZzJtLWV4LmR0Yg0KPiA+IC1kdGItJChDT05GSUdfQVJDSF9SOEE3
NzRDMCkgKz0gcjhhNzc0YzAtY2F0ODc0LmR0YiByOGE3NzRjMC1lazg3NC5kdGINCj4gPiArZHRi
LSQoQ09ORklHX0FSQ0hfUjhBNzc0QzApICs9IHI4YTc3NGMwLWNhdDg3NC5kdGIgcjhhNzc0YzAt
ZWs4NzQuZHRiIFwNCj4gPiArCQkJICAgICAgIHI4YTc3NGMwLWVrODc0LWlkay0yMTIxd3IuZHRi
DQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX1I4QTc3OTUpICs9IHI4YTc3OTUtc2FsdmF0b3IteC5k
dGIgcjhhNzc5NS1oM3VsY2IuZHRiDQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX1I4QTc3OTUpICs9
IHI4YTc3OTUtaDN1bGNiLWtmLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9SOEE3Nzk1KSAr
PSByOGE3Nzk1LXNhbHZhdG9yLXhzLmR0Yg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAtZWs4NzQtaWRrLTIxMjF3ci5kdHMgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAtZWs4NzQtaWRrLQ0KPiAyMTIxd3IuZHRzDQo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi5kOTg5OTk4DQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRj
MC1lazg3NC1pZGstMjEyMXdyLmR0cw0KPiA+IEBAIC0wLDAgKzEsMTEyIEBADQo+ID4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIERldmljZSBU
cmVlIFNvdXJjZSBmb3IgdGhlIFNpbGljb24gTGludXggUlovRzJFIGV2YWx1YXRpb24ga2l0IChF
Szg3NCksDQo+ID4gKyAqIGNvbm5lY3RlZCB0byBhbiBBZHZhbnRlY2ggSURLLTIxMjFXUiAyMS41
IiBMVkRTIHBhbmVsDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxOSBSZW5lc2Fz
IEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgInI4YTc3
NGMwLWVrODc0LmR0cyINCj4gPiArDQo+ID4gKy8gew0KPiA+ICsJYmFja2xpZ2h0OiBiYWNrbGln
aHQgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7DQo+ID4gKwkJcHdtcyA9
IDwmcHdtNSAwIDUwMDAwPjsNCj4gPiArDQo+ID4gKwkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA0
IDggMTYgMzIgNjQgMTI4IDI1NT47DQo+ID4gKwkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0g
PDY+Ow0KPiA+ICsNCj4gPiArCQlwb3dlci1zdXBwbHkgPSA8JnJlZ18xMnAwdj47DQo+ID4gKwkJ
ZW5hYmxlLWdwaW9zID0gPCZncGlvNiAxMiBHUElPX0FDVElWRV9ISUdIPjsNCj4gPiArCX07DQo+
ID4gKw0KPiA+ICsJcGFuZWwtbHZkcyB7DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJhZHZhbnRlY2gs
aWRrLTIxMjF3ciIsICJwYW5lbC1sdmRzIjsNCj4gPiArDQo+ID4gKwkJd2lkdGgtbW0gPSA8NDc2
PjsNCj4gPiArCQloZWlnaHQtbW0gPSA8MjY4PjsNCj4gPiArDQo+ID4gKwkJZGF0YS1tYXBwaW5n
ID0gInZlc2EtMjQiOw0KPiA+ICsNCj4gPiArCQlwYW5lbC10aW1pbmcgew0KPiA+ICsJCQljbG9j
ay1mcmVxdWVuY3kgPSA8MTQ4NTAwMDAwPjsNCj4gPiArCQkJaGFjdGl2ZSA9IDwxOTIwPjsNCj4g
PiArCQkJdmFjdGl2ZSA9IDwxMDgwPjsNCj4gPiArCQkJaHN5bmMtbGVuID0gPDQ0PjsNCj4gPiAr
CQkJaGZyb250LXBvcmNoID0gPDg4PjsNCj4gPiArCQkJaGJhY2stcG9yY2ggPSA8MTQ4PjsNCj4g
PiArCQkJdmZyb250LXBvcmNoID0gPDQ+Ow0KPiA+ICsJCQl2YmFjay1wb3JjaCA9IDwzNj47DQo+
ID4gKwkJCXZzeW5jLWxlbiA9IDw1PjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiArCQlwb3J0cyB7
DQo+ID4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsJCQkjc2l6ZS1jZWxscyA9IDww
PjsNCj4gPiArDQo+ID4gKwkJCXBvcnRAMCB7DQo+ID4gKwkJCQlyZWcgPSA8MD47DQo+ID4gKwkJ
CQlsdmRzMF9wYW5lbF9pbjogZW5kcG9pbnQgew0KPiA+ICsJCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmbHZkczBfb3V0PjsNCj4gPiArCQkJCX07DQo+ID4gKwkJCX07DQo+ID4gKw0KPiA+ICsJCQlw
b3J0QDEgew0KPiA+ICsJCQkJcmVnID0gPDE+Ow0KPiA+ICsJCQkJbHZkczFfcGFuZWxfaW46IGVu
ZHBvaW50IHsNCj4gPiArCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMxX291dD47DQo+ID4g
KwkJCQl9Ow0KPiA+ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiArJmdwaW8wIHsNCj4gPiArCWx2ZHMtY29ubmVjdG9yLWVuLWdwaW97DQo+ID4gKwkJZ3Bp
by1ob2c7DQo+ID4gKwkJZ3Bpb3MgPSA8MTcgR1BJT19BQ1RJVkVfSElHSD47DQo+ID4gKwkJb3V0
cHV0LWxvdzsNCj4gPiArCQlsaW5lLW5hbWUgPSAibHZkcy1jb25uZWN0b3ItZW4tZ3BpbyI7DQo+
ID4gKwl9Ow0KPiANCj4gQW55IGNoYW5jZSB0byBzcGVjaWZ5IHRoaXMgYXMgdGhlIHBhbmVsJ3Mg
ZW5hYmxlIHNpZ25hbCBpbiB0aGUgcGFuZWwgRFQNCj4gbm9kZSA/DQoNCkkgYW0gbm90IHRvbyBz
dXJlLCBhcyB0aGlzIGlzIG5vdCBleGFjdGx5IGFuIGVuYWJsZSBzaWduYWwuIFdoZW4gR1AwXzE3
IGlzIGxvdw0KdGhlbiBMVkRTWzAxXSBhcmUgY29ubmVjdGVkIHRvIHRoZSBMVkRTIGNvbm5lY3Rv
ciwgd2hlbiBHUDBfMTcgaXMgaGlnaA0KdGhlbiBMVkRTWzAxXSBhcmUgY29ubmVjdGVkIHRvIHRo
ZSBMVDg5MThMLg0KUGVyaGFwcyB3ZSBzaG91bGQgbGVhdmUgdGhpcyBmaXhlZCB0byBsb3cgdG8g
YXZvaWQgY29uZnVzaW9uPw0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gPiArfTsNCj4gPiArDQo+
ID4gKyZsdmRzMCB7DQo+ID4gKwlyZW5lc2FzLHN3YXAtZGF0YTsNCj4gDQo+IExldCdzIGRpc2N1
c3MgdGhpcyBwcm9wZXJ0eSBpbiByZXBseSB0byB0aGUgRFQgYmluZGluZ3MgcGF0Y2guDQo+IA0K
PiA+ICsNCj4gPiArCXBvcnRzIHsNCj4gPiArCQlwb3J0QDEgew0KPiA+ICsJCQlsdmRzMF9vdXQ6
IGVuZHBvaW50IHsNCj4gPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczBfcGFuZWxfaW4+
Ow0KPiA+ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAr
Jmx2ZHMxIHsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKwljbG9ja3MgPSA8
JmNwZyBDUEdfTU9EIDcyNz4sIDwmeDEzX2Nsaz4sIDwmZXh0YWxfY2xrPjsNCj4gPiArCWNsb2Nr
LW5hbWVzID0gImZjayIsICJkY2xraW4uMCIsICJleHRhbCI7DQo+ID4gKw0KPiA+ICsJcG9ydHMg
ew0KPiA+ICsJCXBvcnRAMSB7DQo+ID4gKwkJCWx2ZHMxX291dDogZW5kcG9pbnQgew0KPiA+ICsJ
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9wYW5lbF9pbj47DQo+ID4gKwkJCX07DQo+ID4g
KwkJfTsNCj4gPiArCX07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmcGZjIHsNCj4gPiArCXB3bTVf
cGluczogcHdtNSB7DQo+ID4gKwkJZ3JvdXBzID0gInB3bTVfYSI7DQo+ID4gKwkJZnVuY3Rpb24g
PSAicHdtNSI7DQo+ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnB3bTUgew0KPiA+ICsJ
cGluY3RybC0wID0gPCZwd201X3BpbnM+Ow0KPiA+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsNCj4gPiArDQo+ID4gKwlzdGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+IA0KPiBJIGhhdmVu
J3QgcmV2aWV3ZWQgcGlub3V0cyBpbiBkZXRhaWwsIGJ1dCB0aGUgcGF0Y2ggb3RoZXJ3aXNlIGxv
b2tzIHNhbmUNCj4gdG8gbWUuIEFub3RoZXIgY2FuZGlkYXRlIGZvciBEVCBvdmVybGF5cyB0aG91
Z2ggOy0pDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D198C05D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 14:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfI0M45 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 08:56:57 -0400
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:22280
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727088AbfI0M45 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 08:56:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUmOf+gQXNdIHcEid4QLAZ23tB5Us4GJaWpq+0IQZyXv7BHM2OCOc3JYCLrLPCDKzFcJXtK/vxJokqL03sa0vqvtkg7M2KwLBnem/hD/y3ZTrKXwPxSCzck03Hr99C/lkHhqF+uGDIkNXiX6pYlSu8ezr97kkHwehw+W8LhqFfQ4WO83JY+st7mvV81hfJRl005UQi7P11jkjONCqFXPNitFD2IC2CaROp71deE/9sHFd3C8/VxXMGp3z3tUOEmLObX+oe8KVi6wP9gsKJyCG8J9KYg4K25sA5F0sHIEioWaWQgGGm5AcTZLFCN5G0hybQwQoDCpeMYhoNDoyJzEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRyEMdlXe6XLd02zpt6ZonGSObzedc+bJs2lI053QQo=;
 b=BffPwQ1qJGJCrGwA5aYrSfGfcd81kcyPumTdzF/HwCi3JtUmWEyg5aKVz4QbwfpAeLerLTmbyy623u+W7KfSFXDAPYOK69/ZxXdm7OZsMZFlMrawfAZNecEfsCq5UX4hFsMBcqfsjDjkkuJfwRwgDwQ+y/sJ+ri/drIqkytq+OtW9SZQNif7txbzxSrTJyR0hauy9WnSd4K34xy2o4rHyPli066eNU4YNaDOvFaVcWdO0jlTtLaNWM+/PZO+9QNbV6tbYnC7oLoBw11fLnIJQDHG5cXWFVbWSKKsJJpyUvLk7d6RChrW16MECiocf8JaVKLzQMf71ms0CrSIhyMgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRyEMdlXe6XLd02zpt6ZonGSObzedc+bJs2lI053QQo=;
 b=NqTGZdmFC88pXNBtiHvUnR0RLcCGFmSSg6rIDVGF4nzMrlZHx7AE5c7BDJsMN4vEE6AcgnwfnTXzVciyq7S/U1siTjEZoCGbFEOiXs0W5heJTVgNo0ltOw5TtYAP458uC8d2zX3I5my3T5lTsOA1GCxfld0KC1MNlHW58WyolwQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1638.jpnprd01.prod.outlook.com (52.134.227.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 12:56:52 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 12:56:51 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: Add HiHope RZ/G2N main board
 support
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: Add HiHope RZ/G2N main board
 support
Thread-Index: AQHVbVmTZ578zSElD0iku3MglQkAb6c/hh2AgAABtAA=
Date:   Fri, 27 Sep 2019 12:56:51 +0000
Message-ID: <OSBPR01MB2103CA9A60AE9366BC593944B8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com>
 <1568725530-55241-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVNfurC1MATNePq8Veefyxgc_HPz4wYA++h_+7145UPHA@mail.gmail.com>
In-Reply-To: <CAMuHMdVNfurC1MATNePq8Veefyxgc_HPz4wYA++h_+7145UPHA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7c97501-e190-4f12-8efd-08d7434a2ab9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB1638:|OSBPR01MB1638:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1638FA8D5901FA68C4306B94B8810@OSBPR01MB1638.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(51914003)(199004)(189003)(6246003)(229853002)(4326008)(107886003)(2906002)(6436002)(256004)(55016002)(9686003)(66066001)(316002)(6116002)(3846002)(54906003)(81166006)(8936002)(81156014)(8676002)(66476007)(6916009)(5660300002)(66556008)(66446008)(25786009)(64756008)(478600001)(14454004)(86362001)(66946007)(99286004)(305945005)(486006)(44832011)(7736002)(476003)(33656002)(446003)(74316002)(11346002)(76176011)(52536014)(76116006)(7696005)(102836004)(71190400001)(26005)(53546011)(186003)(6506007)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1638;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kH+/yBfuCpziX8mky0D9IV4gGDoqt+1Tq/1vH9Su5X7xCufk43ks+hdcA1phazqwfiaMF0lZRCfO/QD04hOkGK+3DGEiejilqImqBo9GkIxGJnFUow10WJDu2IGPfp7b9O8sJQ6eBTnjdUW0mCWW11uhRHHwS+MPCKVntpEHL8hlwfFB+l0kNURZ5DSboT7aig7eGjATEW/7S3dpZf0bcpXWe6fqHwgmZcdYDMChnPM5CiyB7yCuCsE4eyQLb5ZqQRyQ7v2qBoHEX1Xn50IPnfGRp6SR521XixnC4Tft1QTKbRXWjns3qJUbpnqiZfgVge2fWeIYowh8Vnutne3uiP1yLX5T9Ddmqhg1wwp2vuZTc9jO38xoo3tKJeojh2hXNftvqeY/zpQ3dQzJ196driJ1HNvhXJAvv0rRiMm4Lyg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c97501-e190-4f12-8efd-08d7434a2ab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 12:56:51.7880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOeErKMDhYflV7dBZf8B/FlZpUvGv+dJeojaCRUWhCjl+5OYFmhcfN/1WEA1tr48T8DrBsrGXqq4oqiXo3juSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1638
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNC80XSBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgSGlIb3BlIFJaL0cyTiBtYWluDQo+
IGJvYXJkIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIFNlcCAxNywgMjAx
OSBhdCAzOjEyIFBNIEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gQmFzaWMgc3VwcG9ydCBmb3IgdGhlIEhpSG9wZSBSWi9HMk4gbWFpbiBib2FyZDoNCj4gPiAg
IC0gTWVtb3J5LA0KPiA+ICAgLSBNYWluIGNyeXN0YWwsDQo+ID4gICAtIFNlcmlhbCBjb25zb2xl
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5j
b20+DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4NCj4gDQo+IE9uZSBxdWVzdGlvbiBiZWxvdy4uLg0KPiANCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGIxLWhp
aG9wZS1yemcybi5kdHMNCj4gPiBAQCAtMCwwICsxLDI2IEBADQo+ID4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIERldmljZSBUcmVlIFNvdXJj
ZSBmb3IgdGhlIEhpSG9wZSBSWi9HMk4gbWFpbiBib2FyZA0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMTkgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiAr
DQo+ID4gKy9kdHMtdjEvOw0KPiA+ICsjaW5jbHVkZSAicjhhNzc0YjEuZHRzaSINCj4gPiArI2lu
Y2x1ZGUgImhpaG9wZS1jb21tb24uZHRzaSINCj4gPiArDQo+ID4gKy8gew0KPiA+ICsgICAgICAg
bW9kZWwgPSAiSG9wZVJ1biBIaUhvcGUgUlovRzJOIG1haW4gYm9hcmQgYmFzZWQgb24gcjhhNzc0
YjEiOw0KPiA+ICsgICAgICAgY29tcGF0aWJsZSA9ICJob3BlcnVuLGhpaG9wZS1yemcybiIsICJy
ZW5lc2FzLHI4YTc3NGIxIjsNCj4gPiArDQo+ID4gKyAgICAgICBtZW1vcnlANDgwMDAwMDAgew0K
PiA+ICsgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KPiA+ICsgICAgICAg
ICAgICAgICAvKiBmaXJzdCAxMjhNQiBpcyByZXNlcnZlZCBmb3Igc2VjdXJlIGFyZWEuICovDQo+
ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0ODAwMDAwMCAweDAgMHg3ODAwMDAwMD47
DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIG1lbW9yeUA0ODAwMDAwMDAgew0K
PiA+ICsgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KPiA+ICsgICAgICAg
ICAgICAgICByZWcgPSA8MHg0IDB4ODAwMDAwMDAgMHgwIDB4ODAwMDAwMDA+Ow0KPiA+ICsgICAg
ICAgfTsNCj4gPiArfTsNCj4gDQo+IFNvIGJvdGggdGhlIEhpSG9wZSBSWi9HMk0gYW5kIFJaL0cy
TiBib2FyZHMgaGF2ZSA0IEdpQiBvZiBSQU0sIHdoaWxlDQo+IHRoZSBsYXR0ZXIgaGFzIGEgbmFy
cm93ZXIgbWVtb3J5IGJ1cywgc28gaXQgbXVzdCBiZSB3aXJlZCBkaWZmZXJlbnRseT8NCg0KUlov
RzJNIGlzIExQRERSNC0zMjAwIHdpdGggMzIgYml0cyDDlyAyIGNoYW5uZWxzLCAgd2hlcmUgYXMg
UlovRzJOIGlzIExQRERSNC0zMjAwIHdpdGggMzIgYml0cyDDlyAxIGNoYW5uZWwuDQpSWi9HMk0g
Y2FuIGhhdmUgc3BsaXQgbWFwcGluZyB3aGVyZSBhcyBSWi9HMk4gY2FuIGhhdmUgb25seSBsaW5l
YXIgbWFwcGluZy4NCg0KUmVnYXJkcywNCkJpanUNCg==

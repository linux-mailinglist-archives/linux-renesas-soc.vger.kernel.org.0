Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F2F296AB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 09:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896914AbgJWH6M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 03:58:12 -0400
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:13680
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S367982AbgJWH6L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:58:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFZkhxfyevxadf5fgA71KQ0Q4UhySKV0L9Rixda1Whqss98ymlbbBiTW2B3rMYH0Q+EP9bBvAZ5yzswun/pRP4OJtpSPO6mkQi8/u2Riq6v/cfbS8Nocso5hQVvBHdUHkA8MWO1BFO0rd6pRw/YFgDyqRlmL1au6fTTevRMJlT97h0638NbSbzHlqL97YKlmBwMpMRnVUb+Zzc0fE2iHZYEWJjfxq3B2qBxjpIwW9l7icJEzA/G8R/E7bFyPpEsqVog5nZEVrIV7B4Vgaq7G6iDpCZUjXR7CQbfzd++u/svxqxIyDXtKIQfbMnpBfuut6S5xHZK2ZMC+2Htl/LpWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGRvNggem383bbF4PSF/nfRrjubhMMn67d0MpPNdQII=;
 b=n7MdHSJtKhvZf2YXgXN585qVOU6SrefIdQL2feGle6H82IbR4bYgIqELVeGJKn48KOt96az0vKAorleHl6BrYlZETucXaS2oaEmtCR1XHJ/k+t8ZrUgvN8Hzd+DToIWW/QOgonerQvf8Uf+Zz7mWnVCCDgtRq3NSnIJteI0Z+28qA6+ziXPlzeY5Swdun/jg0o/6/LvwArkHMuvVOE5GBSr3IuPuWfqN63k0DZHzVpYjKtMyrJsQ8ohu2UJ4ULA/MaMFdyMKgHdPMDn+rdWjO8AJQF+LgbN11TK2d8BMwQX5KvQVqcFxvOExikuuPsbRj8w2Fpm9rNDHqS0J7/vfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGRvNggem383bbF4PSF/nfRrjubhMMn67d0MpPNdQII=;
 b=kltplIPlP3TjzxC9MHti/4OY4kJiW1Fk9baaKveYbe1cg+EEC4myB2QqTjeyJ6JhFn9B2HlIhXZOiNTYTiWUieDp3vm5cT5y1DFv3MVm2p/N0dX3XaD8g9IYGkOu8+SVKR/3UJwYnslbjU+N6Yq+cpZRmovqcj0GOJSyeqnpDNs=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSBPR01MB3301.jpnprd01.prod.outlook.com (2603:1096:604:2e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 07:58:07 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 07:58:07 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 3/4] arm64: dts: renesas: Add support for MIPI Adapter
 V2.1 connected to HiHope RZ/G2M
Thread-Topic: [PATCH v2 3/4] arm64: dts: renesas: Add support for MIPI Adapter
 V2.1 connected to HiHope RZ/G2M
Thread-Index: AQHWpt/XTFXnBu9Pt06n8coEfTtv/6mk1HuAgAAB/yA=
Date:   Fri, 23 Oct 2020 07:58:06 +0000
Message-ID: <OSBPR01MB50486CFE2841AF24F648008DAA1A0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201020125134.22625-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201020125134.22625-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWM8uh3Rm4ghn94ZwkTE6rjOmHAThYCL_oh3=Fg+OpHgA@mail.gmail.com>
In-Reply-To: <CAMuHMdWM8uh3Rm4ghn94ZwkTE6rjOmHAThYCL_oh3=Fg+OpHgA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97a139c8-d48e-46d5-5508-08d877296092
x-ms-traffictypediagnostic: OSBPR01MB3301:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB330165793835655C58006A7AAA1A0@OSBPR01MB3301.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dpw5zOjcrl01kRxm32uTB1klhTXsMWWyMT/dPdMWFW4QvEkkMwCRTYy8+TRPtxvm/1m8BZvpN472eKQ2TelvVlKr2+2vJ5T2661lZqRB73faR10lPw6aLVtYXYmIpeY6YLDyp6iEwWUx1gOgF6PUXPbcJU0jOHWXHZfEjTM0fLa9aJbawfwJgS9XKaxpIEFC2PU06XG74Caf2mBvG1C01Wkx+APXcSyeaGghD8x4vZe4S//QbSGGnN34Lwk9MA2OGA+UIFkT7V/8xAAelpw9uxp+1DXMbSHJg/K44S3ZI8ATPZ4MoRDrvJ9URPkLO/XAfyYYGg84J2J9PpVhYhelWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(4326008)(83380400001)(55016002)(52536014)(6916009)(107886003)(5660300002)(7696005)(71200400001)(9686003)(86362001)(66446008)(6506007)(53546011)(76116006)(66476007)(64756008)(66556008)(33656002)(2906002)(186003)(8936002)(26005)(54906003)(8676002)(478600001)(316002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: blKdBBJG5yCfjV0wUOgqsscQO5L/gXclWfaR7W5YbElta3JwFrWuA0R2Pf9TrOLwkEcNb5D41j4fsN5P1MuOAd/M3JC5fW+hlgUz+Owui5hpSousUOBSoA+jk8gdzN5lhE64pm/af4gdJvSplr8qsX/wmZOocWchMvMIrrd9Zxb05SoRwtNSS4Cn4JI1oBU4CzVcOKoDD5Lj110PL/eNu801TM/2p3VQJiL0zEMLNs+H1bFwXXo1YAdMboIZ8kyl/Ai8RFYUuWHPQbarZgRQtNvjcrolVDYs3p9nTpuLe/JcooiLbQMXQ3Mh7FXMzlcSwo/uxZknWTihETIzaPnhcXnXnAeIscKh9vg4F7tnu+YvBfrJMxJFnoUm6ynGzhYKC5D8mcLofo61+GUN450jqPNlCDmHqlGffAb0zGKjzPZ4DVIYFGoBwJj63ZC2x9TpTqMmBWFBYASrIvjkFgi9LzZQH+vU8xjk5Hd5lFLZlOGNbYCl74GtvPod4sFnxyOnVoCs79M0jcFxUIEgdlN4mjfapIYZwSqVgyUIlFx8QHx3wEIDfLQ2wPMX+X3q7jx6mmfLR+A5GVrSCTbRprJpNgnWelHd1I+7SlM7ZkAG5MGN85GBvPsK9r8CdBD9fkp3eB8G67N/UjxZpBxpXmWSvg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a139c8-d48e-46d5-5508-08d877296092
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 07:58:06.9782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsWwyCaCUwEHYs3Fjru+Dcx5300cQvSYri/TL4Gu0LIl0VQStESTqRjlZ0xoXhchaR+N/PI0FSpBr3935tjvTPlvucwB6bbtR4i4QmT9fmgs2vp9cKCP7ic+RqbZndix
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3301
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiBTZW50OiAyMyBPY3RvYmVyIDIwMjAgMDg6NTANCj4gVG86IFByYWJoYWthciBN
YWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiBD
YzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1hZ251cyBE
YW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwu
b3JnPjsNCj4gTGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3Jn
Pjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5E
SU5HUw0KPiA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGlu
ZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgUHJhYmhha2FyIDxwcmFiaGFr
YXIuY3NlbmdnQGdtYWlsLmNvbT47IEJpanUNCj4gRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IEFkZCBzdXBwb3J0IGZvciBNSVBJIEFkYXB0ZXIgVjIuMSBjb25uZWN0ZWQgdG8gSGlIb3BlIFJa
L0cyTQ0KPiANCj4gSGkgUHJhYmhha2FyLA0KPiANCj4gT24gVHVlLCBPY3QgMjAsIDIwMjAgYXQg
Mjo1MiBQTSBMYWQgUHJhYmhha2FyDQo+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBBSVNUQVJWSVNJT04gTUlQSSBB
ZGFwdGVyIFYyLjEgYm9hcmQgY29ubmVjdGVkIHRvIEhpSG9wZQ0KPiA+IFJaL0cyTSBib2FyZC4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiAN
Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4gPiBAQCAtNiw2ICs2LDcg
QEAgZHRiLSQoQ09ORklHX0FSQ0hfUjhBNzc0QTEpICs9IHI4YTc3NGExLWhpaG9wZS1yemcybS1l
eC1pZGstMTExMHdyLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9SOEE3NzRBMSkgKz0gcjhh
Nzc0YTEtaGlob3BlLXJ6ZzJtLXJldjIuZHRiDQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX1I4QTc3
NEExKSArPSByOGE3NzRhMS1oaWhvcGUtcnpnMm0tcmV2Mi1leC5kdGINCj4gPiAgZHRiLSQoQ09O
RklHX0FSQ0hfUjhBNzc0QTEpICs9IHI4YTc3NGExLWhpaG9wZS1yemcybS1yZXYyLWV4LWlkay0x
MTEwd3IuZHRiDQo+ID4gK2R0Yi0kKENPTkZJR19BUkNIX1I4QTc3NEExKSArPSByOGE3NzRhMS1o
aWhvcGUtcnpnMm0tZXgtbWlwaS0yLjEuZHRiDQo+IA0KPiBJJ2xsIGZpeCBzb3J0IG9yZGVyIHdo
aWxlIGFwcGx5aW5nLi4uDQo+IA0KT29wcyBJIG1pc3NlZCB0aGF0LCB0aGFuayB5b3UgZm9yIHRh
a2luZyBjYXJlIG9mIGl0Lg0KDQpDaGVlcnMsDQpQcmFiaGFrYXINCg0KPiBSZXZpZXdlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gaS5lLiB3aWxs
IHF1ZXVlIGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjExLg0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gDQo+IC0tDQo+
IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzDQo=

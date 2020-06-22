Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018CC203140
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 10:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgFVIA3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 04:00:29 -0400
Received: from mail-eopbgr1310101.outbound.protection.outlook.com ([40.107.131.101]:60864
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725897AbgFVIA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 04:00:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwnI119078lCXGiSbhmMamwGjjux27/rmQ+/Pic8Dkn4E6/HjcplL+aJk3hK/REfAtx8VwcXCeUEr90FPF/CIPFnHotS//KS+xwusDu5a86xux0xtjmElUayg+kgD0HmnQZcdqMQSpVcrs/7lNdTaxqYyfJGwHS/j4YhU26wlvrYceJ8SjVG/Ru9i0DEt0p+W/CyrPX5NFI3GOqLZ0PhmfYxth/9LDN07791qVo1hz8mw6JQw3DWkVvEGh//nni7u6Evy+VnwvSiA0u7rI7nhftmq+9ZgK9+DOgbE+E2fD7kCEF4AoX+Vus1aIOyzxbm6/BLKWFSU8MqGBEofoZNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2uL8as/0Cd+K2T0QTP2+KrgCnxlkzApSvaG80Zh074=;
 b=LTKROlTyeEnu6cF5RmZKNJdDkU034/VWivSQJyOovN3fq28qLD2PjL0nRpf8ZvaLF5ca8+ERuryyQBlUxb+upTWIdY3SdR7tJrknORUXVcnUxBktOj1Ewfh0b5R5DXaltscohhDlJuewxF6S8/kYTf0KG46nsmmiMk6vrnuhdCbMmispU80oI9yREJJolWGXDFEVz8Umkh2acJHP7gH8fOC3OZtvFXzq67DuSta6p2TiD/7qNmGshMTuuUU+mV7Idyk3Phd8hyu2zFuGfOJmbWM13jamMj2Kd/VEoOqwlSY5IT8wS3loc9SOxlX7r9RfN7QS+3BAK0lQ4/IYYQsHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2uL8as/0Cd+K2T0QTP2+KrgCnxlkzApSvaG80Zh074=;
 b=eX3H6EWG3AhmmXntv+NWSH/6Mv+flwx19bF6iVoxRBv952QSJOPijo5dV24gqYUHgy9zT0NSiPoBI7qZZenzGw29EcPJxL2xTzcWH6Jbf53g86GeL7jDP+7qa2vqUQDrOCDnSkHcUSqot5CZezkc/TiutQj0PrL0xhCzoDvJV8o=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5018.jpnprd01.prod.outlook.com (2603:1096:404:118::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 08:00:22 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 08:00:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: usb: renesas,usb-xhci: convert to YAML
Thread-Topic: [PATCH] dt-bindings: usb: renesas,usb-xhci: convert to YAML
Thread-Index: AQHWQwbqafU6kcCmak6Q/RlGSBV2bqjeBLQAgAYZrNCAACLCgIAADqTQ
Date:   Mon, 22 Jun 2020 08:00:22 +0000
Message-ID: <TY2PR01MB36928A972E7D1F515302E7D1D8970@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1592219989-28631-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWd_nRhYZoHGdC+OJuB3edNUZ=pcNERDRkOwr+n=43Yeg@mail.gmail.com>
 <TY2PR01MB369258B26BD909D9E0E3615ED8970@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU03451pdTyAFTXcjadZUbF_1An6smqkB12WvvY1tzezA@mail.gmail.com>
In-Reply-To: <CAMuHMdU03451pdTyAFTXcjadZUbF_1An6smqkB12WvvY1tzezA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b9f780c0-36a2-4064-4b00-08d816825072
x-ms-traffictypediagnostic: TY2PR01MB5018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB5018F9C8860A4B97263B3D61D8970@TY2PR01MB5018.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O9m7Z2mxgUu6eatcH8WZVZDcZNW9GTpFiulziK4a+JCEj0Dl5h0lsKLVgzLJ1P02swz0cej/Dqxdr5bHxjJpTrosk3jnaYs6rkmNdk/2GBZJ6VaC1LXiMmj+bV8b+dH0ZzuyGYJwCwKopmdlgN6khhMJzmMXe4+zZ2W3okmeUcvHvp+c2vOhICJSi75EEfhyb8USLfxlffdd+Uqs88A6HymXQKw5FxPPHXdpKREiFLXXAG3Bp0tYQZMEPuIiKW1ucv16CcZOOC/k7dvo5lnkh8RExqP1q8SupEbWxusZZrlh4C0ECWayVcnZZpRrfQyqgeefd5X0pTV12SJCGs9eRt38Gf4cta8T/aw7ZFMUnPdV/cLdTQ0rjAZq6t6kOpzN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(8936002)(33656002)(54906003)(64756008)(7696005)(66476007)(66946007)(55016002)(66446008)(66556008)(4326008)(316002)(71200400001)(478600001)(2906002)(186003)(86362001)(52536014)(5660300002)(6916009)(53546011)(6506007)(8676002)(26005)(76116006)(55236004)(9686003)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: sPUN8d15kdA9ZhwdyU4lTATaZL2eCWbA5fG300cV9zpSP6TYSanlaxScL0oFHtQ5uVTe+kL05zMPhn5V/ApDdSwUXIkE7YTqJ2EOG5GsmiEdeBk8/+PBx8wO4DcafwO5EYgdjnlD2Kndu9FPN3ujJi74+4VEnCP2tWR9gabyRXYZaTr7UAdMW+2C+qso5sOBU0yyep3MP2SfdaLoLimb6DxLWI0iU/ZmqanGtiOo0i2YeaDFdlqZFFHp0vluur5a1rC3VYW2FKqNubWbmEd3MD/eSziHbxtrhoW5OchIx8G1JUsOJH6zhUaUAzoARhacKRT2rHl1ye9Sdsn7b1lNj6SzY2JY65QwJWLsU3on9grvKC2sYvP+9GPylHDSpWRwlOdlbEa++ISFEtE8/40KVRSaLkIJ+rRZz4+y5ynZf46+bllrCaP2//X/xvRIv9Fj0IyKaS3bx80lSXyi33yhLmXm3H4/j0GH4pJpZ+KN5TN3vWuen+t8sMasezVtgAGv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f780c0-36a2-4064-4b00-08d816825072
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 08:00:22.2763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXVMHxSQX/I++yz0vLIQVChWhCUdU+kPx80dwxmMH6nhttYO31CMZtV7hD+nqfhskZ9WKdFGBRQwCNqoPe2CCnlxfcxgGZDHFWA+NLj2hoDRXqeUVJ0Zxb1+vMObEJmn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5018
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBKdW5lIDIyLCAyMDIwIDQ6MDYgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24g
TW9uLCBKdW4gMjIsIDIwMjAgYXQgNzoyMSBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuLCBTZW50OiBUaHVyc2RheSwgSnVuZSAxOCwgMjAyMCA0OjUyIFBNDQo+ID4gPiBP
biBNb24sIEp1biAxNSwgMjAyMCBhdCAxOjIxIFBNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBDb252ZXJ0
IHJlbmVzYXMgcmVsYXRlZCBwYXJ0IG9mIHVzYi14aGNpIHRvIFlBTUwuDQo+ID4gPiA+DQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiBTbyB5b3UncmUganVzdCBleHRyYWN0aW5nIHRoZSBS
ZW5lc2FzIHBhcnRzLi4uDQo+ID4gPg0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcmVuZXNhcyx1c2IteGhj
aS55YW1sDQo+ID4gPg0KPiA+ID4gLi4uIGFuZCBwdXR0aW5nIHRoZW0gaW4gYSBzZXBhcmF0ZSBm
aWxlLg0KPiA+DQo+ID4gWWVzLg0KPiA+DQo+ID4gPiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGtl
ZXAgdGhlbSBjb21iaW5lZCBpbiBhIHNpbmdsZSBkb2N1bWVudD8NCj4gPiA+IE9yIGFyZSB0aGVy
ZSB0b28gbWFueSBkaWZmZXJlbmNlcz8NCj4gPg0KPiA+IEkgdGhvdWdodCB0aGVyZSB3ZXJlIHRv
byBtYW55IGRpZmZlcmVuY2VzLiBBdCBmaXJzdCwgSSBoYWQgY29udmVydGVkIGFsbCB0bw0KPiA+
IGEgc2luZ2xlIGRvY3VtZW50IFsxXS4gQnV0LCBJIHdhcyB0aGlua2luZyB0aGVyZSB3YXMgYSBu
b3QgZ29vZCB3YXkgaW4gdmFsaWRhdGlvbg0KPiA+IHBvaW50IG9mIHZpZXcgYmVjYXVzZSBzb21l
IHByb3BlcnRpZXMgbmVlZGVkIHRvIGFkanVzdCBmb3IgYWxsIHBsYXRmb3Jtcy4NCj4gPiBBbHNv
LCB1bmZvcnR1bmF0ZWx5LCBzb21lIGNvbXBhdGlibGVzIGFuZCBzcGVjaWZpYyBwcm9wZXJ0aWVz
DQo+ID4gYXJlIG5vdCBkb2N1bWVudGVkLi4uIFNvLCBJIGhhZCBleHRyYWN0ZWQgdGhlIFJlbmVz
YXMgcGFydHMgb25seS4NCj4gPg0KPiA+IFsxXQ0KPiA+IFBsZWFzZSByZWZlciB0byB0aGUgZW5k
IG9mIHRoaXMgZW1haWwuDQo+IA0KPiBPSy4gTWFrZXMgc2Vuc2UsIGFzIHRoZSBSZW5lc2FzIHBh
cnRzIGFyZSBub3QgY29tcGF0aWJsZSB3aXRoIGdlbmVyaWMteGhjaS4NCg0KWWVzLiBTbywgSSds
bCBhZGQgc3VjaCBpbmZvcm1hdGlvbiBpbnRvIHRoZSBjb21taXQgZGVzY3JpcHRpb24gb24gdjIu
DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg==

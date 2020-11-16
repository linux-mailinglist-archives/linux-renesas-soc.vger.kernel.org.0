Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF392B407B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 11:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbgKPKJG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 05:09:06 -0500
Received: from mail-eopbgr1410130.outbound.protection.outlook.com ([40.107.141.130]:26153
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726603AbgKPKJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 05:09:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhhzlTd29+AqfUJUeTOxrbIc9Bm0rVYyRa8JV6D0jKWzAuu70UgHJs4ZCdNs60U2Xu0K9a6B8eYSUIg4bCoWqvtaguyuoeontSRnh9XzmRMVrr3TXM7jP+Qykj4xYsih5Hb2acwSzKrj33usg48kPF+WW38gA7VZ9PQQvIl0tuYBcR1NeAmrd4C16Q0/y3kwsAi9CTlI4Nm2ZQrlCjwL8rtjcJl3DjOqk9fmIs7CpKa/QCeY2UF/rwVapLEljeelFPfMT+5aWh3QofvFmdS3oj0sXiEu3pMB9wP44UATl0Q0O4vSp5OO7W/pxHZgessX7ZChUZZUVpjlKXXrot93Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQr4FNswbWMepkiKF1STkH9sqxniPs12xnXM2CEPfUQ=;
 b=JlZAqrro8zsOjrjr2IZSxfpOhh/YR4TgoKHAVB60rgitcbmVvUDtlp2XozzJ2K1TRnqdLN2UnVsIPRdOREfY8Vu9+FSMI9gG+ybOGU2P6/VVE9YC2xxeQBVqtIEQ9wzXDpR8Rm44VqQ+VV1mgt0a0ajLbvUVQcW83aSyxmYozZ1PuP/vsUmzfDI6RGRbs0XW4GJhq4q8+jZn9v8cWjWVNn6QG1iFwseuMAMPoTIyRbOi49tmvPuOu+WAo5/KMmgNqtQ1AACpFBQ5Gyp/Y8cd7xbVPjcb5Lfpzvh9CtdcSc45R6DghZz+hqsk+jX/sKgOLDZwd3kjWsnWUKmTcwaf8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQr4FNswbWMepkiKF1STkH9sqxniPs12xnXM2CEPfUQ=;
 b=TkTyP1IHPxl2BMsZIl63FGjFOCuhUajZMRMghLr3jNitFlmlb34h5L08RenAXV6g3gUq7CBomOxigJpGSgMV6FNqcx6LpN+2utwfKJ2wAU3BQqJVQzlUHm5IS4WyYBc0iLHr53GQYk6M9RYvMGkoHk4Z4bs41yPdyW6uSCzTa7w=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB5323.jpnprd01.prod.outlook.com
 (2603:1096:404:8039::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 10:09:02 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 10:09:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
Thread-Topic: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
Thread-Index: AQHWt2DiQMDgJXOywkKPxRA3EPixuqnKd7OAgAAE/+CAAA1xAIAAB1nw
Date:   Mon, 16 Nov 2020 10:09:02 +0000
Message-ID: <TYBPR01MB53091403169FC6819BFED02186E30@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201110125609.30246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUky4OEvCLnDYr3C-PB+PKdSx3U5+dCfhiftDhf3RKmAQ@mail.gmail.com>
 <TYBPR01MB53099FFA01431B1E5188B8C686E30@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAMuHMdX+RdE0kgqWNatNBBy_GPiihxcC3exAYi76a50qSHvDMA@mail.gmail.com>
In-Reply-To: <CAMuHMdX+RdE0kgqWNatNBBy_GPiihxcC3exAYi76a50qSHvDMA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [109.154.85.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 87a65d10-cae5-4e26-d2c1-08d88a17a495
x-ms-traffictypediagnostic: TYAPR01MB5323:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB53235BDD3D96248086E4C14F86E30@TYAPR01MB5323.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e1QAmU60tgQXa7mTFqdjnE9s2JUAoZMsq74aJROeNGZTgtbdLIzI5LR+pRUmL7tsA5wAEMA8xKcfl/ksScEp5mdy/yoxQtu0oj3rCTKkerhtlV9nd92Zvioyq3yuBkXN2EROyd4fnb96z5g1JwDBIbiIZ0aR0icg52z3qraPa7XYsX7XVAlIi/lefwbQjK26qghYvAMnU+/st+y3RbgMlHt/eEFJHxcGB/GkoIX2+6WnFB2z+vzD8lafVtoLR6ZJpmrOKjtu8IdsFjQQO31/VB1SL3k1tfW2A199zeArOZit7RUBBIwJ2SmOrPYgYoTg7zTm7HO/HPS6K3Q49FSYZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(33656002)(26005)(83380400001)(55016002)(53546011)(186003)(9686003)(66446008)(52536014)(5660300002)(2906002)(76116006)(86362001)(66476007)(66556008)(64756008)(66946007)(4326008)(71200400001)(478600001)(6506007)(316002)(7696005)(8676002)(8936002)(54906003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: jBW5jRQ86oXG7fM5N5M0Y/OI5WEgwScyriW+pD7lPt+5cdv3BIs8gU4v8uxQwKByP//mNfnBfrwbpvTh6ica9HQk5F92gDOK5jn8bzS5GLEUUNJPV+qF8ac6GcD76p4/mQNuMDJ4HXe0rILWeJNrzI/+BdW7QxcP4vrd3SGvpgFJY4Nn9PGZfJIRGSjqvuYfXyc2f/1c+XetWurhAXdyBUMbpWWFCOTeiAw0/B9+e5ITQy/T9XRBQJ+N14aC0Pmw4sWFfFLV6LtZHgrZ9Nl/g1fe9fL1TphiNMltrRdercNnqtC8+AD3/iMS6m2G98Dar6FM2Z3xs7B6U2cf+G0LArk4culIazZgw37I4VKGsGQGxzqVJrPyorU4MYTQa06n4aOaxtSGqUjCXCu3AlNLwL3XX/Kuede0dxf/VoLKtwcubkn3ISa4xZEXbjXmNqoZvaiG3RJsjvc3SoxL94v2tXqUZJFL4YrlxsoGOc2O3p0SqgPlzT9b7KF6yDxMCeUB/d3gQj/pJL1bqEw266yfhRmHLZdR5egd5Xg45DNdbQCljXoqVmMd9XTiV+kL4TJIYhpUvBwLE4qduPWREmYoAWGk5gSkA9flc9WlhVuvoqJYQDEekHm9x08nDj34O1g6wlUIdW4NH/z5bvzYySE/kbCBBU/riXekKL34id6vroWW6bYwG1wBIbd+wCdTfzr5lKCL8yrqDSiZPDb9aaE2g35zoogdtSOolFucIIsIrlqPVWux/4amP1SOHhSe3tEV5PbC7Hl2ZVHwGRRalGXOEM4pkjviaNdn+76laHHCcmEeAiHnXcpgqKrPM36GQ9JtzPDk02jQvl27PVpdDRoRRIRWrpCYPrD72bnvdLkCijQqhiNuylD9qRXvGIoyryHJQYQzZ2qjfARicvYlRDUdDg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a65d10-cae5-4e26-d2c1-08d88a17a495
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 10:09:02.1893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8bbEdEDUXMxNtgfvgbTKcu+WV4YEzN9hCateykGFrSi93SgZ4r1F+saHPuxBT6OnnwRn73vjJxBvWIhPjS8ghlP02vX0aG7CP5TvIxrIY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5323
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQoNCj4ga2VybmVsQHZnZXIu
a2VybmVsLm9yZz47IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIGNsazogcmVuZXNhczogcjhhNzc0YzA6IEFkZCBSUEMgY2xv
Y2tzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTA6MDMg
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIGNsazogcmVuZXNhczogcjhhNzc0YzA6IEFkZCBSUEMg
Y2xvY2tzIE9uDQo+ID4gPiBUdWUsIE5vdiAxMCwgMjAyMCBhdCAxOjU2IFBNIExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LQ0KPiA+ID4gbGFkLnJqQGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiA+ID4gRGVzY3JpYmUgdGhlIFJQQ1NSQyBpbnRlcm5hbCBjbG9jayBhbmQgdGhlIFJQ
Q1tEMl0gY2xvY2tzIGRlcml2ZWQNCj4gPiA+ID4gZnJvbSBpdCwgYXMgd2VsbCBhcyB0aGUgUlBD
LUlGIG1vZHVsZSBjbG9jaywgaW4gdGhlIFJaL0cyRQ0KPiA+ID4gPiAoUjhBNzc0QzApIENQRy9N
U1NSIGRyaXZlci4NCj4gPiA+ID4NCj4gPiA+ID4gQWRkIG5ldyBjbGsgdHlwZSBDTEtfVFlQRV9H
RU4zRTNfUlBDU1JDIHRvIHJlZ2lzdGVyIHJwY3NyYyBhcyBhDQo+ID4gPiA+IGZpeGVkIGNsb2Nr
IG9uIFItQ2FyIEdlbjMgRTMgKGFuZCBhbHNvIFJaL0cyRSB3aGljaCBpcyBpZGVudGljYWwNCj4g
PiA+ID4gdG8gRTMgU29DKSwgcGFyZW50IGFuZCB0aGUgZGl2aWRlciBpcyBzZXQgYmFzZWQgb24g
dGhlIHJlZ2lzdGVyDQo+ID4gPiA+IHZhbHVlIENQR19SUENDS0NSWzQ6M10gKHBhcmVudCBpcyBj
cm9zcyB2ZXJpZmllZCBhZ2FpbnN0IE1EWzQ6MV0NCj4gPiA+ID4gcGlucykgd2hpY2ggaGFzIGJl
ZW4gc2V0IHByaW9yIHRvIGJvb3RpbmcgdGhlIGtlcm5lbC4NCj4gPiA+ID4NCj4gPiA+ID4gTURb
NF0gTURbM10gTURbMl0gTURbMV0NCj4gPiA+ID4gICAwICAgICAwICAgICAwICAgIDEgICAgIC0+
IFJQQ1NSQyBDTEsgc291cmNlIGlzIFBMTDENCj4gPiA+ID4gICAwICAgICAwICAgICAxICAgIDEg
ICAgIC0+IFJQQ1NSQyBDTEsgc291cmNlIGlzIFBMTDENCj4gPiA+ID4gICAwICAgICAxICAgICAw
ICAgIDAgICAgIC0+IFJQQ1NSQyBDTEsgc291cmNlIGlzIFBMTDENCj4gPiA+ID4gICAxICAgICAw
ICAgICAxICAgIDEgICAgIC0+IFJQQ1NSQyBDTEsgc291cmNlIGlzIFBMTDENCj4gPiA+ID4gICB4
ICAgICB4ICAgICB4ICAgIHggICAgIC0+IEZvciBhbnkgb3RoZXIgdmFsdWVzIFJQQ1NSQyBDTEsg
c291cmNlDQo+IGlzDQo+ID4gPiBQTEwwDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0K
PiA+ID4gPiAtLS0NCj4gPiA+ID4gdjItPnYzDQo+ID4gPiA+ICogSW1wbGVtZW50ZWQgYXMgYSBm
aXhlZCBjbG9jaw0KPiA+ID4NCj4gPiA+IFNvdW5kcyBmaW5lIHRvIG1lLiAgSWYgd2UgZXZlciBu
ZWVkIHRvIGNvbmZpZ3VyZSB0aGlzIGNsb2NrIGZyb20NCj4gPiA+IExpbnV4LCB0aGUgZHJpdmVy
IGNhbiBiZSBjaGFuZ2VkLg0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNh
cy9yY2FyLWdlbjMtY3BnLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yY2Fy
LWdlbjMtY3BnLmMNCj4gDQo+ID4gPiA+IEBAIC02OTYsNiArNzA5LDQyIEBAIHN0cnVjdCBjbGsg
KiBfX2luaXQNCj4gPiA+IHJjYXJfZ2VuM19jcGdfY2xrX3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2Ug
KmRldiwNCj4gPiA+ID4NCj4gY3BnX3JwY3NyY19kaXZfdGFibGUsDQo+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNwZ19sb2NrKTsNCj4g
PiA+ID4NCj4gPiA+ID4gKyAgICAgICBjYXNlIENMS19UWVBFX0dFTjNFM19SUENTUkM6DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAvKg0KPiA+ID4gPiArICAgICAgICAgICAgICAgICogUmVnaXN0
ZXIgUlBDU1JDIGFzIGZpeGVkIGZhY3RvciBjbG9jayBiYXNlZCBvbg0KPiB0aGUNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAqIE1EWzQ6MV0gcGlucyBhbmQgQ1BHX1JQQ0NLQ1JbNDozXSByZWdp
c3RlciB2YWx1ZQ0KPiBmb3INCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAqIHdoaWNoIGhhcyBi
ZWVuIHNldCBwcmlvciB0byBib290aW5nIHRoZSBrZXJuZWwuDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgKi8NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgdmFsdWUgPSAocmVh
ZGwoYmFzZSArIENQR19SUENDS0NSKSAmIEdFTk1BU0soNCwNCj4gPiA+ID4gKyAzKSkgPj4NCj4g
PiA+IDM7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoY3BnX3JwY3NyY19lM19wYXJlbnRf
aXNfcGxsMChjcGdfbW9kZSkpIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KHZhbHVlICE9IDIpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICB9IGVsc2Ugew0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAodmFsdWUgPT0gMikNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiA+DQo+ID4gPiBJTUhPIHRoaXMgY3Jvc3Mt
dmVyaWZpY2F0aW9uIGlzIG5vdCBuZWVkZWQsIGFuZCBoYXJtZnVsOiBpdCBwcmV2ZW50cw0KPiA+
ID4gdGhlIGJvb3QgbG9hZGVyIGZyb20gY2hhbmdpbmcgdGhlIGNvbmZpZ3VyYXRpb24sIHdoaWNo
IEkgdGhpbmsgaXMgYQ0KPiA+ID4gdmFsaWQgdXNlIGNhc2UuDQo+ID4NCj4gPiBCdXQgdGhpcyBj
aGVjayB2YWxpZGF0ZXMsIHdoZXRoZXIgYm9vdGxvYWRlciBkb25lIHdyb25nIGNvbmZpZ3VyYXRp
b24gb3INCj4gbm90Pw0KPiA+IEZvciBlZzotIFBMTDEgYW5kIHNldHRpbmcgd3JvbmcgZGl2aWRl
ciB2YWx1ZSBpbiBSUENDS0NSLg0KPiA+DQo+ID4gSXQgYWxsb3dzIGJvb3Rsb2FkZXIgZm9yIGNo
YW5naW5nIHJpZ2h0IGNvbmZpZ3VyYXRpb25zLiBJIG1heSBiZSB3cm9uZy4NCj4gUGxlYXNlIGNv
cnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4NCj4gDQo+IFdoYXQgaXMgYSB3cm9uZyBjb25maWd1cmF0
aW9uPyBBY2NvcmRpbmcgdG8gdGhlIFJQQ1NSQyBkb2NzLCBESVZbNDozXQ0KPiBzZWxlY3QgYm90
aCB0aGUgcGFyZW50IGNsb2NrIGFuZCB0aGUgZGl2aWRlci4NCj4gQWxsIGZvdXIgcG9zc2libGUg
dmFsdWVzIGFyZSB2YWxpZC4NCg0KT0suIEl0IGlzIGNsZWFyIG5vdy4NCg0KUmVnYXJkcywNCkJp
anUNCg0KPiBNRFs0OjFdIHNlbGVjdCB0aGUgYm9vdCBkZXZpY2UsIGFuZCBkZXRlcm1pbmUgdGhl
IF9pbml0aWFsIHZhbHVlc18gb2YgdGhlDQo+IERJVls0OjBdIGJpdHMuICBOb3RoaW5nIGluIHRo
ZSBkb2N1bWVudGF0aW9uIHNheXMgdGhleSBjYW5ub3QgYmUgY2hhbmdlZA0KPiBsYXRlciwgYWZ0
ZXIgd2hpY2ggdGhlIERJVls0OjNdIGJpdHMgbm8gbG9uZ2VyIG1hdGNoIE1EWzQ6MV0uDQo+IA0K
PiBJZiB5b3Ugd2FudCB0byBiZSByZWFsbHkgc3VyZSwgeW91IGNhbiBjaGFuZ2UgdGhlIGJpdHMs
IGFuZCBtZWFzdXJlIHRoZQ0KPiBpbXBhY3Qgb24gdGhlIFJQQyBjbG9jayBzaWduYWwuDQo+IA0K
PiBBIGxvbmcgdGltZSBhZ28sIEkgZGlkIGEgc2ltaWxhciB0aGluZyBmb3IgUExMMENSLkNLU0VM
IG9uIFItQ2FyIEQzLCBhbmQNCj4gbG9va2VkIGF0IHRoZSBpbXBhY3Qgb24gdGhlIHNlcmlhbCBj
b25zb2xlIChhbGJlaXQgd2l0aCByZW1vdGUgYWNjZXNzLA0KPiBpLmUuIG5vIGNvbnNvbGUgb3V0
cHV0IGlmIGtlcm5lbCBhbmQgaGFyZHdhcmUgZGlkbid0IGFncmVlIDstKQ0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0K
PiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0540D2A46
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 15:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387710AbfJJNEU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Oct 2019 09:04:20 -0400
Received: from mail-eopbgr1400132.outbound.protection.outlook.com ([40.107.140.132]:9664
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733300AbfJJNET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 09:04:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggNe7uIjvZUtYn3sqQHy6Ztq3BJB360FCuejT10c3X56FxCP4feYdZ/XV36/lI64q+ge0TT3nYlWFszrKZ4TW7yrrlH6Qo1RsT+Lrn8b/sUrGno2jTpUxBdyLsi51bdYjgIJ91htAeADwGieiRFfp0yBdYA46Sem+bPxd0Gfwl5QzTDSjYP4v5qsrSWkINbL2RZVJupuzndeYc+eF9IedXd40pbbpLv4qGQrKlqOFlHvHLSNh9vsWLazHHPOjP2PLCMfe+dJAeFVTDldvaomtZxDhv5Jt7UbdIL1Q2z3xSfPk6Vz/2McYI3nvmcZ2+W20oMxGTrww7H8KNxDOAjQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNhUSbx7iYWPrVnhj1gW8wPZQNlCFTpWjvYl2LsE+B8=;
 b=h22bDvfbNrfHTqc6gmZ2uLDzkuO+HjzE1qIwHAnszAxv92eKpdkrUokKK0soVfuUZ1895YEzSZTtY+r1c4pXxAN4rdP25VkOeV/55eiNiVaV7an7bC/ElQZl+EOcIKls/MScLS+oF1+es8228mfG7nPuehc4HEzmFN/Zij/o+ITu4QlPPfWpJbR7CQ225kwa8b6wR/Y6JlN+dYvwaVsTbPsEzsIVnySSD/Gk2RKT0oEd6VIXQ4/5IwrayG7COJtfUNvRbio7V9uRcxLyktxjrv6SN1VvUzmSILS3iLuL0BxGQU9n08djzPPdri2/hU6Vm0kWWU8/aKRpoMmp4kqADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNhUSbx7iYWPrVnhj1gW8wPZQNlCFTpWjvYl2LsE+B8=;
 b=Sm43Rjg7fx+t98FMfhTPP+LCBfUSlRKycAHCVQsnxAmHapK+gWxIrFkX5J9VDFtmtiFUJUlyK2YcbLyZ796Kd9vD7/tvdgbqWZjQbBUn3ESK5caIgi5/5Tub3RDWAVvnno1jIay66RXYiwYcPgr+ZoMtFtRg6mMELtjEvG5KZIg=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1478.jpnprd01.prod.outlook.com (52.134.224.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 10 Oct 2019 13:04:15 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 13:04:15 +0000
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
Subject: RE: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio port
 node
Thread-Topic: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio port
 node
Thread-Index: AQHVesNxH5cE4MOPUUurULrZE7LHeKdQwSKAgAAFRMCAAxh3AIAAAPQw
Date:   Thu, 10 Oct 2019 13:04:14 +0000
Message-ID: <OSBPR01MB2103921B22CD1A794B8FCB4FB8940@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWCu14DOci-EUuSZ_JTeZaoq90qr035WFsLY2c3UqgkeA@mail.gmail.com>
 <TYAPR01MB21111CD187E5EF5CB6FB01BAB89A0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
 <CAMuHMdXYSK3U3wr7by0wBd+yQ7HkjDf5s5XMV7BmXyh7j5B9vQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXYSK3U3wr7by0wBd+yQ7HkjDf5s5XMV7BmXyh7j5B9vQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f569868-e6ec-46c5-7491-08d74d825a5f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB1478:|OSBPR01MB1478:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1478E986EDE4BA156836717FB8940@OSBPR01MB1478.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(51914003)(189003)(199004)(102836004)(5660300002)(26005)(476003)(25786009)(44832011)(478600001)(446003)(486006)(11346002)(54906003)(52536014)(2906002)(81166006)(86362001)(81156014)(7696005)(76176011)(8676002)(6506007)(53546011)(966005)(66066001)(186003)(8936002)(99286004)(6116002)(6246003)(66946007)(107886003)(76116006)(6916009)(55016002)(64756008)(66556008)(66476007)(3846002)(305945005)(74316002)(14444005)(66446008)(14454004)(316002)(7736002)(71190400001)(33656002)(71200400001)(6306002)(9686003)(229853002)(6436002)(4326008)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1478;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z6OgTVC/oh6FWLwGQpkn/o9s+EQ6JownuHuDfsMuBlOsDMVM6kGf4MET2/Oh/236d/TXuOHf9TL0Xey/fhm92leEEsDXapy4W4cCOPR5Mjv+C5WZXS+EwM1RPBn0SunCyPeFPjcEEtlm1+TN3tTe+Bnyr93L2iByNK76f40mTwzA5ofSjBPilYY0NXrt2sQ+JGZqW1m0KoJkgpEOQ6QF7Pk3AolBVkO5odzClhu2A9MOHxU0eN9l8LN/haxQ76REVFE489wLHAwmHzysQpZm+7H1UNtUAPabyjx/5D9GZBzMUbM/u9iau++/BHnpkfTSGKZanvJMKo+H2w3cujsHs5s7FGwoIKUGrOsKTek/SciUu4QQlXg8chLyq0yPcI+tLPaMgL27JYLiFUq+TZmjsEYwO3jCaB9MiqEfVBydey7zcVhu+e6/+dbaSU9iR63Yxz1B623ZG51OM0gY1r96fQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f569868-e6ec-46c5-7491-08d74d825a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 13:04:15.2067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2o09q+TGj9zw/fVoQVrBGiC5cK14qoxy8miQCavvlfXSDWnQT4URLFujGjuAQJSAmgw6S1jJlllNajh54AyeTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1478
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRhMTogUmVtb3ZlIGF1ZGlv
DQo+IHBvcnQgbm9kZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgT2N0IDgsIDIwMTkg
YXQgMzo0MyBQTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3
NGExOiBSZW1vdmUNCj4gPiA+IGF1ZGlvIHBvcnQgbm9kZSBPbiBGcmksIE9jdCA0LCAyMDE5IGF0
IDQ6NTMgUE0gQmlqdSBEYXMNCj4gPiA+IDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4gPiA+IFRoaXMgcGF0Y2ggcmVtb3ZlcyBhdWRpbyBwb3J0IG5vZGUgZnJvbSBTb0MgZGV2
aWNlIHRyZWUuDQo+ID4gPg0KPiA+ID4gU3RhbmRhcmQgcmV2aWV3IGNvbW1lbnQ6ICJXaHk/Ig0K
PiANCj4gQmNhdXNlIGl0IGZpeGVzIGEgZHRiIHdhcm5pbmc/DQo+IA0KPiAgICBXYXJuaW5nICh1
bml0X2FkZHJlc3NfdnNfcmVnKTogL3NvYy9zb3VuZEBlYzUwMDAwMC9wb3J0cy9wb3J0QDA6DQo+
IG5vZGUgaGFzDQo+ICAgIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIHByb3BlcnR5DQoNCkkgYWxz
byBub3RpY2VkIHRoaXMgd2FybmluZy4NCg0KV2Ugd2lsbCBnZXQgdGhpcyB3YXJuaW5nLCBpZiB3
ZSAgYXBwbHkgdGhlIHBhdGNoICAiW3YzLDIvMl0gYXJtNjQ6IGR0czogcmVuZXNhczogcjhhNzc0
YjE6IEFkZCBTb3VuZCBhbmQgQXVkaW8gRE1BQw0KIGRldmljZSBub2RlcyIgZmlyc3QgYW5kIHRo
ZW4gdGhpcyBvbmUuDQoNCklmIGl0IGlzIG90aGVyIHdheSBhcm91bmQsIHRoZW4gdGhlcmUgd29u
J3QgYmUgYW55IHdhcm5pbmcuIFRoYXQgaXMgdGhlIHJlYXNvbiBJIGRpZG4ndCBtZW50aW9uIGl0
IGluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiA+ID4NCj4gPiA+
ID4gRml4ZXM6IGUyZjA0MjQ4ZmNkNCAoImFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3NGExOiBB
ZGQgYXVkaW8NCj4gPiA+ID4gc3VwcG9ydCIpDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IFYxLS0+
VjINCj4gPiA+ID4gICogTmV3IHBhdGNoLg0KPiA+ID4gPiBWMi0tPlYzDQo+ID4gPiA+ICAqIEZp
eGVkIHRoZSBjb21taXQgbWVzc2FnZS4gVGhhbmtzIHRvIEZhYnJpemlvLg0KPiA+ID4gPg0KPiA+
ID4gPiBUaGlzIHBhdGNoIGRlcGVuZCB1cG9uDQo+ID4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9saXN0Lz9zZXJpZQ0KPiA+ID4gPiBz
PTE4DQo+ID4gPiA+IDI1ODENCj4gPiA+DQo+ID4gPiBXaHkgdGhlIGRlcGVuZGVuY3k/DQo+ID4g
PiBUaGlzIGxvb2tzIGxpa2UgYSBmaXggZm9yIHI4YTc3NGExLCB0b28/DQo+ID4NCj4gPiBTb3Jy
eSwgdGhlIGFib3ZlIGRlcGVuZGVuY3kgaXMgZm9yIHRoZSBzZWNvbmQgcGF0Y2guDQo+ID4gIlt2
MywyLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3NGIxOiBBZGQgU291bmQgYW5kIEF1ZGlv
IERNQUMNCj4gZGV2aWNlIG5vZGVzIg0KPiANCj4gT0suDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==

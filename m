Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5ACD2BFF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 16:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfJJOCC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Oct 2019 10:02:02 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:60000
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726037AbfJJOCC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 10:02:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms9/wp99GOojzJmtIM+DBElAi6YC52v8bMBIznnwwrwy6j8/uCrIX05uIaNMBoC4y+EKE6J2mcYoxONTB+qFXQVwtqsZ6yq9QuenvJ0cIx7+q5UoY8BBGxV0/7g59zJAMjd/EEux8AV/hXzNTTgs4kLg/IQBaK6iSNz8rjlhSJaGsK6Iuxk/GWUVzc/uaVpuXWNXmpgTfIHLyRZR3fGC0LfpRX/gq52p7hRUGQ9R6CSsMftZdyzHc9hvwyGQ7UOUs/xmu7AEpjoB6hsWiQCaonJz6da27+C8zbvACBuWOKeHcR254h89o6B1OwbvQCpbsHiKyj2PKONVJ8kFbsEpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huvTr0Yxlv809QCM7ErCNgP5uXsLgJHufw4c94wM4uM=;
 b=goegB/YaHyo/pCgr91gFXnOubNL1KrVeI6B7bQWUuQxu31GFaIqCxyE26H+C7N4RgirnVwoPoifyEXT70Ztb0tlG1bDyT00n2Ag/iC7dvlBSinoGgDt6Ts06+G6UKmIJTBkzHNulyB6R+d16dEoBiouj6EZwJV6zDR0+MJOrtvaOQ71jIfNZnBGONlhrCZfb7mSnz1pYhqruXxswip7pmjKw5OzpZMMEi4rXMWL7weXkbFPvdvH4zbl0/h0IBh+KlzcGORDiIrSjC+9ORENVxPjEAjEEJe0rkSWAPESgT48tB6DnKFu1JEODXLooWAB8YvZRcSnt1xPg5AG8x5kEiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huvTr0Yxlv809QCM7ErCNgP5uXsLgJHufw4c94wM4uM=;
 b=RkuXfEF6F1zASt4GwX/cvfJJd/wx88ye1n8R7fCaruk74HDKCMYmafLtLyK/Hgsl+aaPt2annU5MTLmMA+Tr8NdLNzQFfhSpQo2iH44pJGc6RhYv9AYlgaOAWD3CbmHdwApzg0fhcGLhllh6ufgRT9d8rvrhGoA2SPC36wIV4BY=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3991.jpnprd01.prod.outlook.com (20.178.98.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Thu, 10 Oct 2019 14:01:57 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 14:01:57 +0000
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
Thread-Index: AQHVesNxH5cE4MOPUUurULrZE7LHeKdQwSKAgAAFRMCAAxh3AIAAAPQwgAAFNgCAAAc80A==
Date:   Thu, 10 Oct 2019 14:01:56 +0000
Message-ID: <OSBPR01MB2103F2AA4512B45A7B110163B8940@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWCu14DOci-EUuSZ_JTeZaoq90qr035WFsLY2c3UqgkeA@mail.gmail.com>
 <TYAPR01MB21111CD187E5EF5CB6FB01BAB89A0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
 <CAMuHMdXYSK3U3wr7by0wBd+yQ7HkjDf5s5XMV7BmXyh7j5B9vQ@mail.gmail.com>
 <OSBPR01MB2103921B22CD1A794B8FCB4FB8940@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdVx6XNaBZ4itZeu5P23bq0VMGsfYssNJGfAdMyf6KKphA@mail.gmail.com>
In-Reply-To: <CAMuHMdVx6XNaBZ4itZeu5P23bq0VMGsfYssNJGfAdMyf6KKphA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a011ac2b-d940-4d90-da93-08d74d8a69f1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB3991:|OSBPR01MB3991:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB39918ACDCC1215D4D8C92D0BB8940@OSBPR01MB3991.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:120;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(51914003)(189003)(199004)(71200400001)(81156014)(81166006)(6916009)(6436002)(5660300002)(71190400001)(66946007)(478600001)(55016002)(52536014)(54906003)(8676002)(8936002)(7696005)(102836004)(316002)(6506007)(53546011)(6116002)(229853002)(33656002)(3846002)(186003)(74316002)(2906002)(14444005)(446003)(256004)(11346002)(486006)(44832011)(66556008)(64756008)(66476007)(66446008)(4326008)(66066001)(99286004)(6246003)(14454004)(9686003)(86362001)(7736002)(25786009)(305945005)(26005)(76116006)(76176011)(476003)(107886003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3991;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qzTofY/4+3yeddaBEJaLVEy2hbTRi0MckW33rbFszeZTIT1MT4crd+mdA5E4daPdvxjU7rBPD6+/A8U9jAn1AZ/Gmp2+sHpz/ga88vcoKPW8ZBq/3lYbikZq5eAtTcfBoM9KpzXY4kLhEprNoKb0IOyVlOKAhE++fP9Zei8TFk+fKI1dOxDPOyfV8kHxrCig6lc2jx29pM+UlqAvwyLUpKWdPqXl7ZbtBeARRJ8b3q7iHMs6jumGh5TifJdRqYhV8htsAHRkisi1hizelhmYFpgDIDxmg1IZ88S533vwTLTFDk600wgNHSga4RxwWzoQKZubd86b/hpYNDdX9Ep+4Rwpirj5PfO8GKdGpylIwMxNvGvbHAIPP7Zhwj/SSh+JnqkxMrOVS9e02hdLdGSIgAN43/69d9Nrvo+xfb4qIg4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a011ac2b-d940-4d90-da93-08d74d8a69f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 14:01:56.7901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMHwDrRUfBTRfFAWwkK1I3sO699GdYbFSUk1t48bNMmeeDkBujrVdxBW9yWy4d6G2UBx6yigi4FiQGgd5fn6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3991
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRhMTogUmVtb3ZlIGF1ZGlv
DQo+IHBvcnQgbm9kZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgT2N0IDEwLCAyMDE5
IGF0IDM6MDQgUE0gQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4g
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3
NzRhMTogUmVtb3ZlDQo+ID4gPiBhdWRpbyBwb3J0IG5vZGUNCj4gDQo+ID4gPiBPbiBUdWUsIE9j
dCA4LCAyMDE5IGF0IDM6NDMgUE0gQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvMl0gYXJtNjQ6IGR0
czogcmVuZXNhczogcjhhNzc0YTE6DQo+ID4gPiA+ID4gUmVtb3ZlIGF1ZGlvIHBvcnQgbm9kZSBP
biBGcmksIE9jdCA0LCAyMDE5IGF0IDQ6NTMgUE0gQmlqdSBEYXMNCj4gPiA+ID4gPiA8YmlqdS5k
YXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCByZW1vdmVz
IGF1ZGlvIHBvcnQgbm9kZSBmcm9tIFNvQyBkZXZpY2UgdHJlZS4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFN0YW5kYXJkIHJldmlldyBjb21tZW50OiAiV2h5PyINCj4gPiA+DQo+ID4gPiBCY2F1c2Ug
aXQgZml4ZXMgYSBkdGIgd2FybmluZz8NCj4gPiA+DQo+ID4gPiAgICBXYXJuaW5nICh1bml0X2Fk
ZHJlc3NfdnNfcmVnKTogL3NvYy9zb3VuZEBlYzUwMDAwMC9wb3J0cy9wb3J0QDA6DQo+ID4gPiBu
b2RlIGhhcw0KPiA+ID4gICAgYSB1bml0IG5hbWUsIGJ1dCBubyByZWcgcHJvcGVydHkNCj4gPg0K
PiA+IEkgYWxzbyBub3RpY2VkIHRoaXMgd2FybmluZy4NCj4gPg0KPiA+IFdlIHdpbGwgZ2V0IHRo
aXMgd2FybmluZywgaWYgd2UgIGFwcGx5IHRoZSBwYXRjaCAgIlt2MywyLzJdIGFybTY0Og0KPiA+
IGR0czogcmVuZXNhczogcjhhNzc0YjE6IEFkZCBTb3VuZCBhbmQgQXVkaW8gRE1BQyAgZGV2aWNl
IG5vZGVzIiBmaXJzdA0KPiBhbmQgdGhlbiB0aGlzIG9uZS4NCj4gPg0KPiA+IElmIGl0IGlzIG90
aGVyIHdheSBhcm91bmQsIHRoZW4gdGhlcmUgd29uJ3QgYmUgYW55IHdhcm5pbmcuIFRoYXQgaXMg
dGhlDQo+IHJlYXNvbiBJIGRpZG4ndCBtZW50aW9uIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4N
Cj4gDQo+IEkgZXZlbiBzZWUgdGhlIHdhcm5pbmcgd2l0aCBjdXJyZW50IHJlbmVzYXMtZGV2ZWwg
KCJtYWtlIGR0YnMgVz0xIiksIHdoaWNoDQo+IGRvZXMgbm90IGhhdmUgIlt2MywyLzJdIGFybTY0
OiBkdHM6IHJlbmVzYXM6IHI4YTc3NGIxOiBBZGQgU291bmQgYW5kIEF1ZGlvDQo+IERNQUMgZGV2
aWNlIG5vZGVzIiB5ZXQuDQo+IA0KPiBTbyBJJ2xsIGFwcGx5IHRoaXMgcGF0Y2ggd2l0aCB0aGUg
d2FybmluZyBtZXNzYWdlIGluIHRoZSBjb21taXQgbG9nLCB1bmxlc3MgSSdtDQo+IG1pc3Npbmcg
c29tZXRoaW5nPw0KDQpUaGFua3MgR2VlcnQuICBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiwgSSBz
ZWUgdGhlIHdhcm5pbmcgd2l0aCBjdXJyZW50IHJlbmVzYXMtZGV2ZWwgIGJyYW5jaCBmb3Igcjhh
Nzc0YjEgU29DLg0KDQpSZWdhcmRzLA0KQmlqdQ0K

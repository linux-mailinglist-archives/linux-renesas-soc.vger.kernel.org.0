Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90EE277264
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 15:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgIXNcB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 09:32:01 -0400
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:60447
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727685AbgIXNcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 09:32:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5lQ2J89qKsiGnnuBg7qiofH8zekilpitVs5b9h/35hRgQAhr9BpEb187j8g/eS0E2fnAr11gLUPT1uoFMV0q9SqM8XlydTGzT/Ubebje/rHgmzQnpmZDVq0N5npi3oHG2f2C86AjB63MesRmL/6Ia32KnfRhMefsRg9Wd+wiuqyn8JI7di1Rd3HLFVqFUXCPWfWlTwi38cUxJdzRRehAZAem9rzL/ZWq+tMgRLne+6ANM+9leLupk3qeajPFR2Nm+WWQufOMR0z2cWHmSbu0FZyJV5I//lIm+vqZILqMoSyEd71Hl0dM7gjDGsQ/lOaUDF7V2NuA9dm+Jl+u4axbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn0/jiNZa13bIoOLxAOmYP4B4zFjtdY+Dny41XucnIo=;
 b=hqPR58+iVph0X3lQ8tqMMCnHSUaNV5qNV+yDFP+5e5Hopsi95/4CwvpVzw2aaNkoCVKkQ2+iTwMX0/8ehnUvuCnV0J5oedugWwpoWAdi6nIiPXckjiJYCYrhDjtaQrDp4V5R2zLXq7jD4Qq/7dwZUohoL08Nukk84ChzsTRcjxCUEV71Gn4XGrsAf+Nnj4WScNpMPxsaq9BXHpZlhGFqp1u0Me7vfvkfB2Spjjnct2x32W3f1TJPQBfmwNeYgRESwaekk7cDf1kZb+xVQGHJDI6m7X9ICtum76KuMo1B8ccI2yFs6TOs8HKnDW/4svAU0syrSaOOmDB+gs7cxVSg1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn0/jiNZa13bIoOLxAOmYP4B4zFjtdY+Dny41XucnIo=;
 b=OJkpVTcH1hDkXRo4i4cuTmu9VEMj8SxiASe/lgUIfEdVqCKmOSqKX37+rCGA/SDMhBDUwtkGt41VXoXbR77A6s8m4wiDbAoY+WawqVcus/7Rq3z6v8B5fDyJEfR/foJ0CXAiiyxLJH61UPfa9hVo4f7k3Fu8Qeo85ZCLfpOen0Q=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB4461.jpnprd01.prod.outlook.com
 (2603:1096:404:120::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 13:31:57 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%3]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 13:31:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Thread-Topic: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Thread-Index: AQHWkkl/lcuagICdI0atS35JemmLzql3e3mAgAAAaACAABlGAIAAI7dw
Date:   Thu, 24 Sep 2020 13:31:57 +0000
Message-ID: <TYBPR01MB530994D326F3DE204061702F86390@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV5m3LH9QyX=Gau5UsDz3AZvqNOgCJiHb6Je+7qS0Ltvw@mail.gmail.com>
 <TYBPR01MB530919C0B122741BF8D25A8B86390@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAMuHMdVtmd8P=di-VSLMOE0zgL7vZw1N=znqhX3C0oPJ9GiwuA@mail.gmail.com>
In-Reply-To: <CAMuHMdVtmd8P=di-VSLMOE0zgL7vZw1N=znqhX3C0oPJ9GiwuA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [109.153.226.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 716f4ddc-fe6a-4c05-4d50-08d8608e35cc
x-ms-traffictypediagnostic: TYAPR01MB4461:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB4461F4008DEFE67CFA9AC55486390@TYAPR01MB4461.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E9bri+na6juGBS9k3U580ja34Uu5y0mO2v53qEARz4P/MRWtfccShdVnJfvSTNi/hwChGQggAaf1wvAdCViYKV3565TrZV2JGAQCUKSR7/EWCtw3QExUBhbioEfGcr5I8G1RQV6NyRmaBjtwrU1MjsUD/3wNjIuozjICHo9/ZtmiDvUxICTK8e+Ok/l7a5I8knmrsruDVDW50uI/ZkPl5HwnMVSXOLVd01xtup4hN81JiPeX9ohoOIuJVUfmN3ocH/GCxo41CV49j+CYMjgMSht+bXTuUGCJrsQwJ8hLvTTyzEgy2hHl9ubTOD0EPO8LcyubAg86FviO6L7+zCo01KKdZPs6N3D4I2jwmFHDKgBoxiH17+I6wmQCzsxcK7M3HbBuGC5IEc1UZJfMuxN0ezmEEUqMnVHS0bjGfBdjDRA9jLEwDZBXYGRy6MQ2pMOnmDyacMgDmZLbRkzryIP/Mw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(54906003)(64756008)(107886003)(33656002)(55016002)(71200400001)(9686003)(26005)(478600001)(86362001)(8676002)(966005)(52536014)(6506007)(66476007)(6916009)(7696005)(83380400001)(186003)(8936002)(66446008)(66946007)(2906002)(4326008)(76116006)(53546011)(316002)(5660300002)(66556008)(3714002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: zvqDhdUbhQJiM0xSD/ZF6PyA0fpRPfxheoWEsTqp9/sLV1SYV2kTe3zCISuibDg3yd7MptO7BpSQayqFhNdAY3Ey6jXtIe9YVgLVdglXXPs/lgLJDppytmBPcNHxEdJQX2jdcu0jCB2qZOIRwDTSt0uyZRsBTaS7zRvnJAQMTEHMUEsKNaAF+qBDHlf+Raj4IA6kvxaRCJyhz7d7J+tJ6xaS+yne/9Q6lLb2PzLGynYljUyXs4WCDx+5XIUz2H2iZVAyLVEH8TuIkjPhxI3dYWicItYLoARjUAbkXhhdeXtX2CXbULa2ZOe16XsNjcZL+3XolMvXrPbAQE38Iyl1YZg+S1INRv4/takHLwKqVASf/ZFTejDUCSaIMNjI8mvvOAT3whNSlAHze8re5xb5X4C6qq2ykJI6qdfasE8eI8o7EZbveFpqZQX7jImGgs2SDRKthKzuCblWWdpSVjhK4RdpQnO5nKx8HORP8QpwDw2XhLkEL/npc70tkki551vuBpugW1wBhb9zKg3LFy1GfNg1rXvhLvT0MCouyK3YkDtUvvCkZmJEZOl5yjwPq0jv4jgynB6+reoD0y2zYIRKVBPC7uo6oxZ48/izBl04fdwlQWVeOSgLnHgmk0G4/IaAlajX5LdNNzfWIEhZ55cKaw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716f4ddc-fe6a-4c05-4d50-08d8608e35cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 13:31:57.5456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2yjiaOHwrtbcOZ3lLvj7BhjXpkliIYRmUz+a2uFmvZD1zySI0ExvVeYiPp60eoR6KwooKZldPSlaMqSyAbhy+X7TXO955IKfZc+CzmSIEi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4461
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gQVJNOiBkdHM6IGl3ZzIwZC1xNy1j
b21tb246IEZpeCB0b3VjaCBjb250cm9sbGVyDQo+IHByb2JlIGZhaWx1cmUNCj4NCj4gSGkgQmlq
dSwNCj4NCj4gT24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMTE6NDAgQU0gQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIEFSTTogZHRzOiBpd2cyMGQtcTctY29tbW9uOiBGaXggdG91Y2gNCj4gPiA+IGNvbnRyb2xs
ZXIgcHJvYmUgZmFpbHVyZSBPbiBUaHUsIFNlcCAyNCwgMjAyMCBhdCAxMDowNSBBTSBCaWp1IERh
cw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4g
PiA+IEFzIHBlciB0aGUgaVdhdmUgUlovRzFNIHNjaGVtYXRpYywgdGhlIHNpZ25hbCBMVkRTX1BQ
RU4gY29udHJvbHMNCj4gPiA+ID4gc3VwcGx5IHZvbHRhZ2UgZm9yIHRvdWNoIHBhbmVsLCBMVkRT
IHJlY2VpdmVyIGFuZCBSR0IgTENEIHBhbmVsLg0KPiA+ID4gPiBBZGQgcmVndWxhdG9yIGZvciB0
aGVzZSBkZXZpY2Ugbm9kZXMgYW5kIHJlbW92ZSBwb3dlcmRvd24tZ3Bpb3MNCj4gPiA+ID4gcHJv
cGVydHkgZnJvbSBsdmRzLXJlY2VpdmVyIG5vZGUgYXMgaXQgcmVzdWx0cyBpbiB0b3VjaCBjb250
cm9sbGVyIGRyaXZlcg0KPiBwcm9iZSBmYWlsdXJlLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IFJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2NC0+djUgOiBSZXN0b3JlZCBMYXVyZW50J3Mg
UmIgdGFnLCBzaW5jZSBpdCBpcyBtaW5vciBjaGFuZ2UsDQo+ID4gPiA+IHY0LT5yZW5hbWluZyB2
Y2Mtc3VwcGx5IHRvIHBvd2VyLXN1cHBseQ0KPiA+ID4gPg0KPiA+ID4gPiB2My0+djQgOiBJbmNv
cnBvcmF0ZWQgTGF1cmVudCdzIHJldmlldw0KPiA+ID4gPiB2My0+Y29tbWVudHMoaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTcwNzg4Ny8pDQo+ID4gPiA+ICAgICAgICAgIEFk
ZGVkIExhdXJlbnQncyBSZXZpZXdlZC1ieSB0YWcNCj4gPiA+ID4gdjItPnYzIDogQWRkZWQgdGhl
IG1pc3NpbmcgcGFydCBmcm9tIHRoZSBwYXRjaC4gcmVtb3ZhbCBvZg0KPiA+ID4gPiB2Mi0+cG93
ZXJkb3duLQ0KPiA+ID4gZ3Bpb3MgcHJvcGVydHkuDQo+ID4gPiA+IHYxLT52MiA6IEFkZCByZWd1
bGF0b3IgaW4gdG91Y2ggcGFuZWwsIExWRFMgcmVjZWl2ZXIgYW5kIFJHQiBMQ0QNCj4gPiA+ID4g
djEtPnBhbmVsIGRldmljZSBub2Rlcw0KPiA+ID4gPiAgICAgICAgICAgIChSZWY6IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE3MDc1NTkvKQ0KPiA+ID4gPiB2MSA6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE3MDU4MTkvDQo+ID4gPg0KPiA+ID4gVGhh
bmtzIGZvciB0aGUgdXBkYXRlIQ0KPiA+ID4NCj4gPiA+IEFzIHRoZSBwcmVyZXF1aXNpdGVzIGFy
ZSBub3cgaW4gbmV4dCwgSSBjYW4gcXVldWUgdGhpcyBpbg0KPiA+ID4gcmVuZXNhcy1kZXZlbCBm
b3INCj4gPiA+IHY1LjExIGFmdGVyIHY1LjEwLXJjMSBoYXMgYmVlbiByZWxlYXNlZC4NCj4gPiA+
IE9yIGRvIHlvdSB0aGluayB0aGlzIHNob3VsZCBiZSBmYXN0LXRyYWNrZWQgYXMgYSBmaXggZm9y
IHY1LjEwIG9yIHY1Ljk/DQo+ID4NCj4gPiBJIHRoaW5rIGl0IHNob3VsZCBiZSBmYXN0IHRyYWNr
ZWQsIHNpbmNlIGl0IGlzIGEgcmVncmVzc2lvbi4gQWxzbyB3ZSBuZWVkIHRvIGZhc3QNCj4gdHJh
Y2sgIHRoZSBkZXBlbmRlbmN5IHBhdGNoZXMgYXMgd2VsbC4NCj4NCj4gT0suDQo+DQo+ID4gRml4
ZXM6IDZmODlkZDllOTMyNSAoIkFSTTogZHRzOiBpd2cyMGQtcTctY29tbW9uOiBBZGQgTENEIHN1
cHBvcnQiKQ0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY28NCj4gPiBtbWl0Lz9oPW5leHQtMjAy
MDA5MjMmaWQ9OTQ2YTYxYWIyZDc1OGNjNjQ1ZjZlNjNmMWE1ZTI3MzE2OTBjMzk0Mw0KPiA+IFsy
XQ0KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25l
eHQvbGludXgtbmV4dC5naXQvY28NCj4gPiBtbWl0Lz9oPW5leHQtMjAyMDA5MjMmaWQ9MmNkOWRm
MmJlNzU3NjY0NTJmZWY4N2MzN2VjMzdkOTFmNGNiYWY2Yg0KPg0KPiBEb2VzIGFueXRoaW5nIGJh
ZCAoZS5nLiBhbm90aGVyIHJlZ3Jlc3Npb24pIGhhcHBlbiBpZiB0aGlzIHBhdGNoIGlzIGFwcGxp
ZWQsDQo+IGJ1dCB0aGUgMiBwYXRjaGVzIGFib3ZlIGFyZSBub3Q/DQo+IElmIG5vdCwgSSB3aWxs
IHF1ZXVlIHRoaXMgYXMgYSBmaXggZm9yIHY1LjkuDQoNCkl0IHdvcmtzIHdpdGhvdXQgdGhhdCAy
IHBhdGNoZXMsICBJIGNvbmZpcm0gbm8gc2lkZSBlZmZlY3RzLg0KDQpyb290QGl3ZzIwbS1nMW06
fiMgZG1lc2cgfCBncmVwIGVkdA0Kcm9vdEBpd2cyMG0tZzFtOn4jIGRtZXNnIHwgZ3JlcCBpbnB1
dDANClsgICAgMi4zODYxNTZdIGlucHV0OiBFUDA3MDBNMDYgYXMgL2RldmljZXMvcGxhdGZvcm0v
c29jL2U2NTMwMDAwLmkyYy9pMmMtMC8wLTAwMzgvaW5wdXQvaW5wdXQwDQpyb290QGl3ZzIwbS1n
MW06fiMNCnJvb3RAaXdnMjBtLWcxbTp+IyB1bmFtZSAtYQ0KTGludXggaXdnMjBtLWcxbSA1Ljku
MC1yYzEtMDAwMDMtZzU4ZGJhNTM3ZjhjYiAjNjQgU01QIFRodSBTZXAgMjQgMTM6MDA6NDIgQlNU
IDIwMjAgYXJtdjdsIEdOVS9MaW51eA0KDQo+DQo+ID4gPiBJLmUuIGlzIHRoaXMgYW4gYWN0dWFs
IHJlZ3Jlc3Npb24sIG9yIGp1c3Qgc29tZXRoaW5nIHRoYXQgbmV2ZXIgd29ya2VkDQo+IGJlZm9y
ZT8NCj4gPiA+IE5vdGUgdGhhdCB2MSBoYWQgYSBGaXhlcyB0YWcsIHdoaWNoIHdhcyBsb3N0IGlu
IHN1YnNlcXVlbnQgdmVyc2lvbnMuDQo+ID4NCj4gPiBJIG1pc3NlZCB0byBhZGQgZml4ZXMgdGFn
IGluIHN1YnNlcXVlbnQgdmVyc2lvbnMuDQo+ID4gRml4ZXM6IDZmODlkZDllOTMyNSAoIkFSTTog
ZHRzOiBpd2cyMGQtcTctY29tbW9uOiBBZGQgTENEIHN1cHBvcnQiKQ0KPg0KPiBObyB3b3JyaWVz
LCBJIGNhbiBhZGQgdGhhdCB3aGlsZSBhcHBseWluZy4NCg0KVGhhbmsgeW91Lg0KDQpDaGVlcnMs
DQpCaWp1DQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1
ZWhyZXIvUHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVn
aXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVl
c3NlbGRvcmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBE
dWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERF
IDExOTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=

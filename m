Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A243A241A15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 13:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbgHKLDP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 07:03:15 -0400
Received: from mail-eopbgr1310099.outbound.protection.outlook.com ([40.107.131.99]:15082
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728510AbgHKLDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 07:03:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fp+MJA2Jud8j2Ah4jb53jvOYMLl8mdusm8wW+ofszzSDNjskfLY22r5P2pbokhAceQs4SAeerDzEZ/FImm6cpHntphCkvnl09OZ7IxJEDqxD38qcqoM5kXtAW+U2Qal/Xnc14CKJo9PbUAK7Qi9uaFZvZlUNtqIRLKkWZ55hvU8z9DLshR88Ht9i9fl5sGCARs+yULnPg1W7v62S5Lga9RK8Nf29VUWeMoFQwKjnCYPRqcUaKgY8ZUfEZz56R3otYPMdPq7Zv2Hr0OHJD57nvKG/qgvHquV/8AKi6wG9d0AjCfaobNY8WcaKH2XPmTLXnBLXN9xFFmZcfuoyBaLOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnDFtGaBbH87J/9C6YlxEKrbSagg3TyKC8mcAXxsnRo=;
 b=l062zOhKTdfYISgyUfDxjo22KV/5tJ7n7AwTrZ9EoVu/COpgPwAFNd2FcQ37qm4AussnKSqTn4we8wWcU6k3SRDrJxborVODbXoNedKXp1UIO8IZw2plKIc9npIc4zrA3KHRxpzK1NHysCm1cxODfVKjojYSdroZgWQuk3Srg0FJtPyzEiXNjF+8FqHEVSHxel2eEnx7o95pCwGx4T5Uvl5ynkrl9BuT7suCQikeqnfxXiqkiYRqWw4jPy3n3fwmyFRrkRt59pAmFuHGfK7QnR1UQLdCfleViS3crQF+XPsM7Oy8iFbk3xx7VbpGjZ3SHTeUVb3WWJ4xYLwPoK2Z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnDFtGaBbH87J/9C6YlxEKrbSagg3TyKC8mcAXxsnRo=;
 b=m+/SvfXbuM9VZsbZEq8DwQm7VaYeMnYBnrfYLrihUB+MWCYp2FMZjZ148Zz4QNbXhSBa3FcLVZ66Fi0xuPBPRCjoX27pWnMsIOidM7fOV0Ob1Y/ZauHUJwtFIktBq79X+hgXIi1m9KuwpFekn/LafUTarHythQsR6YkWE5bTEP8=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB3834.jpnprd01.prod.outlook.com
 (2603:1096:404:d8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Tue, 11 Aug
 2020 11:03:07 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 11:03:07 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for regulator
Thread-Topic: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for regulator
Thread-Index: AQHWbyoUe/wbIA6WqU+/YSDXc2CLDakyvsOAgAAAdpA=
Date:   Tue, 11 Aug 2020 11:03:07 +0000
Message-ID: <TYBPR01MB5309733E900B575CF1AF42DD86450@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-3-biju.das.jz@bp.renesas.com>
 <20200811105955.GE6054@pendragon.ideasonboard.com>
In-Reply-To: <20200811105955.GE6054@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 82e04512-1553-49ec-8c1a-08d83de62107
x-ms-traffictypediagnostic: TY2PR01MB3834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3834C401EF17D751DE14BF3686450@TY2PR01MB3834.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpRZg5eYOwQlwHP031bzv79sg8Ypp0oCrTyGZc7YqoipMh7QoD5x5MVVmSRe6vyrwfAWlbc3MnF/XxZdMl0ioTQNScaNPmydQseF77k+BRkNHTwyiSZyQS5YS0l76k31pqYcLsAFSunS/TEjzYI0C1i+TQW9Pm+/ifhnzRUSKB96JB3tTCUMRsdjjVbMHFEcJRl7jwDucotii7NxszR2fe6nDjhg0ojYREpLkVa5BCXK6lt49yuvYzBK3Ns06qPJwNLgVb+zvyawd/xtaRzPK2w3V43zY97+eTNniGbdZlb+TsXeoB+QD9iiktATJtXE9TOWd/Ij3v3uoAtR2K+B+thWUYkVzlqSfWobdEakYeKEPUJCjVEW9jxEhcO415IJCkS/lKTz3QcEW7NE4rvdDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(86362001)(9686003)(2906002)(7416002)(33656002)(7696005)(316002)(478600001)(66476007)(71200400001)(76116006)(66946007)(55016002)(66556008)(8936002)(54906003)(6916009)(186003)(6506007)(5660300002)(4326008)(66446008)(8676002)(64756008)(26005)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: dWzwyYXVVK5TconmAmD2pWDh82s/WgnZ5BD0Ou9atE5FjObRPIbTMzazNaucT7S72WJ12C9kuK0+1G+eat4XXJcAFcjrtgM8vjlbf7bep+8TTHh1Wc27n1PbyqNk/08jM17sGoNs7D33aVPNbXdTlF42l8kW6QoPaTkdqS05y1crmnkZnboAaiYKVAxLzS/NQecOIGs3zFc0K1WNGMSpcZ5TQUlTIh7N2hZ1xKcd9+uyKmJg3jpO0I3LN5NBcfQwEv/P+T6mpY+u3syfiUNvMhSvMASJ/WJOzzYvIbpT98FlqXl1sewUZ+uwJb633a3MnICvVB0yh9YG1lnY0ASq/nFgaZQ5LYDG1U5EclmN7SSl++eUMgBy8gKwbFBeAzxmGP4FuIWaIro+zmbMZhnlaBgNj6GpRzYNwqV8w7/fs+X0uk2felPbRb9d5FJ98PUzUwRXU8kO1IUWcUIJxZsqixjJYaNqRV9mmXTyRDMP5MBOm4Yj8XzY2HixNpmCJ6ZwBz7e+7dukTu3vmD0m1l6dN8JMgfccc4bqiUh7N+JslPupavTxL9CUkqon/XQrOH0Li/SrDlxBBqCX9lP7/quIX7OedEwwcQOL9McENzMl9oGAAD4mPyeiDKwi/3dYd2QigOYBqVco2vFmuAl8i7jpQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e04512-1553-49ec-8c1a-08d83de62107
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 11:03:07.7088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlDvka/6aTMSN47X6mj/ALSfSwrhPMDMxLEcTxcz4s0qFmp1AoIMhy4y9nbAH4w923Kxopwdf537V6RNRaHl3AMKWGFR3sGZ433PkLqisEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3834
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAyLzNdIGRybS9icmlkZ2U6IGx2ZHMtY29kZWM6IEFkZCBzdXBwb3J0IGZvcg0K
PiByZWd1bGF0b3INCj4NCj4gSGkgQmlqdSwNCj4NCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gu
DQo+DQo+IE9uIE1vbiwgQXVnIDEwLCAyMDIwIGF0IDA0OjIyOjE4UE0gKzAxMDAsIEJpanUgRGFz
IHdyb3RlOg0KPiA+IEFkZCB0aGUgc3VwcG9ydCBmb3IgZW5hYmxpbmcgb3B0aW9uYWwgcmVndWxh
dG9yIHRoYXQgbWF5IGJlIHVzZWQgYXMNCj4gPiBWQ0Mgc291cmNlLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0K
PiA+IE5ldyBQYXRjaCBSZWY6IFJlZjpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzExNzA1ODE5Lw0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29k
ZWMuYyB8IDI5DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9sdmRzLWNvZGVjLmMNCj4gPiBpbmRleCAyNGZiMWJlZmRmYTIuLjU4NThhMjlhYWZlNiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jDQo+ID4gQEAgLTEwLDEzICsx
MCwxNiBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC9vZl9ncmFwaC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4gPg0KPiA+
ICAjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fcGFu
ZWwuaD4NCj4gPg0KPiA+ICBzdHJ1Y3QgbHZkc19jb2RlYyB7DQo+ID4gK3N0cnVjdCBkZXZpY2Ug
KmRldjsNCj4gPiAgc3RydWN0IGRybV9icmlkZ2UgYnJpZGdlOw0KPiA+ICBzdHJ1Y3QgZHJtX2Jy
aWRnZSAqcGFuZWxfYnJpZGdlOw0KPiA+ICtzdHJ1Y3QgcmVndWxhdG9yICp2Y2M7DQo+ID4gIHN0
cnVjdCBncGlvX2Rlc2MgKnBvd2VyZG93bl9ncGlvOw0KPiA+ICB1MzIgY29ubmVjdG9yX3R5cGU7
DQo+ID4gIH07DQo+ID4gQEAgLTM4LDYgKzQxLDE0IEBAIHN0YXRpYyBpbnQgbHZkc19jb2RlY19h
dHRhY2goc3RydWN0IGRybV9icmlkZ2UNCj4gPiAqYnJpZGdlLCAgc3RhdGljIHZvaWQgbHZkc19j
b2RlY19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkgIHsNCj4gPiAgc3RydWN0IGx2
ZHNfY29kZWMgKmx2ZHNfY29kZWMgPSB0b19sdmRzX2NvZGVjKGJyaWRnZSk7DQo+ID4gK2ludCBy
ZXQ7DQo+ID4gKw0KPiA+ICtyZXQgPSByZWd1bGF0b3JfZW5hYmxlKGx2ZHNfY29kZWMtPnZjYyk7
DQo+ID4gK2lmIChyZXQpIHsNCj4gPiArZGV2X2VycihsdmRzX2NvZGVjLT5kZXYsDQo+ID4gKyJG
YWlsZWQgdG8gZW5hYmxlIHJlZ3VsYXRvciBcInZjY1wiOiAlZFxuIiwgcmV0KTsNCj4gPiArcmV0
dXJuOw0KPiA+ICt9DQo+ID4NCj4gPiAgaWYgKGx2ZHNfY29kZWMtPnBvd2VyZG93bl9ncGlvKQ0K
PiA+ICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAobHZkc19jb2RlYy0+cG93ZXJkb3duX2dwaW8s
DQo+IDApOyBAQCAtNDYsOQ0KPiA+ICs1NywxNSBAQCBzdGF0aWMgdm9pZCBsdmRzX2NvZGVjX2Vu
YWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPiA+IHN0YXRpYyB2b2lkIGx2ZHNfY29k
ZWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKSAgew0KPiA+ICBzdHJ1Y3QgbHZk
c19jb2RlYyAqbHZkc19jb2RlYyA9IHRvX2x2ZHNfY29kZWMoYnJpZGdlKTsNCj4gPiAraW50IHJl
dDsNCj4gPg0KPiA+ICBpZiAobHZkc19jb2RlYy0+cG93ZXJkb3duX2dwaW8pDQo+ID4gIGdwaW9k
X3NldF92YWx1ZV9jYW5zbGVlcChsdmRzX2NvZGVjLT5wb3dlcmRvd25fZ3BpbywNCj4gMSk7DQo+
ID4gKw0KPiA+ICtyZXQgPSByZWd1bGF0b3JfZGlzYWJsZShsdmRzX2NvZGVjLT52Y2MpOw0KPiA+
ICtpZiAocmV0KQ0KPiA+ICtkZXZfZXJyKGx2ZHNfY29kZWMtPmRldiwNCj4gPiArIkZhaWxlZCB0
byBkaXNhYmxlIHJlZ3VsYXRvciBcInZjY1wiOiAlZFxuIiwgcmV0KTsNCj4gPiAgfQ0KPiA+DQo+
ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBmdW5jcyA9IHsgQEAgLTYz
LDEyICs4MCwyNCBAQA0KPiA+IHN0YXRpYyBpbnQgbHZkc19jb2RlY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhbmVsX25vZGU7
DQo+ID4gIHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsOw0KPiA+ICBzdHJ1Y3QgbHZkc19jb2RlYyAq
bHZkc19jb2RlYzsNCj4gPiAraW50IGVycm9yOw0KPg0KPiBUaGUgZHJpdmVyIHRlbmRzIHRvIHVz
ZSAicmV0IiBmb3IgZXJyb3Igc3RhdHVzIHZhcmlhYmxlcy4gSWYgeW91J3JlIGZpbmUgd2l0aCB0
aGlzDQo+IGNoYW5nZSB0aGVyZSdzIG5vIG5lZWQgdG8gcmVzdWJtaXQgdGhlIHBhdGNoLCBJIGNh
biBmaXggd2hlbiBhcHBseWluZy4NCg0KWWVzLCBJIGFtIG9rIHdpdGggdGhhdC4NCg0KQ2hlZXJz
LA0KQmlqdQ0KDQoNCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4NCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9w
ZSBHbWJILCBHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHog
ZGVyIEdlc2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFz
dHJhc3NlIDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0Nv
bW1lcmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlk
ZW50aWZpY2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5v
LjogREUgMTQ5Nzg2NDcNCg==

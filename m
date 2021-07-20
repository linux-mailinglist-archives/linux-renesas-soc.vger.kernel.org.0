Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1ED3CF7D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 12:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbhGTJr0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 05:47:26 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:16928
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237141AbhGTJoD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 05:44:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBzuetuv+q9IVDeUZM/ItV9cNepP9uMP91DqdnGvmLS0KxKS4qRxT+pUYFLBxllSXd1NWunsqB2gQRiDyIo5eD4/pXk3L/wkjIOfp3gr095CggcDrR+GZUPTuyxP2XOkvQH5FbfuNkkq6FFMQn0YTeJ40oKnbSyOPtAALuA+4/5BgPvlfEc8uxlQoHZXjxvMZXeSCudrXBNbDeHB8aQvuiB5zI4M6nUVFoBRAlUR7xAopQ/+UaB04/YP5PVb1yWjJhRscRpNmrxpZ//JY/ugmYaESz6oD9uH6rKWA4L2lk38YETEWBvv1/PY0/YrVoDTHc53pngBILN2D/QhP59mvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37pg1bAFe3myXnlc1ArWJRjli2m81FwCzAK0yytwAxg=;
 b=IcJxHPzH8g9poL7XkjFRpZcACQSxjqe/8HSgbeICO/HBPvLHpUirHNvxPjbt/+fyVxovR46UnfQHr2cuQJqOZxRsFlBdmfi8qEk2db4EUhO+QaCsQSvXkEZUBvuNrKvhdm2tK2o0gvQ7LMPcQZUIT8Lh+Ck0SfRhH0lW8m3L66UF+jUGpW1aO6K+NOojWdhMW8QgRI0s+igNZc46Qyzy9h4a7f/9vOiAjCRk0B2hQiGb7UcM88bR07rLsJdcs2AUhfm5C+tQccDkTLshchPBVo9WepIEClEU/ee/ybIZPd0scC/ms79H4HfOoQyjWzduX3GM7V8qRQl/grQCvOZvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37pg1bAFe3myXnlc1ArWJRjli2m81FwCzAK0yytwAxg=;
 b=mHnD2em8shXddOzWdXvkSn4dexN3zd8XGx0ZouUSqbczG8MQSETi1PNZpViD7FrNM9smEo3rWsMyhkcV31aTquTJkBqhPplMRYbNK0zS/cm+pLYuJpSTjQmhmzVcrl0EkqXPUXd3t9OPP1RPLFuS0NZVJwjyF+otpt8HvNrI99c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3304.jpnprd01.prod.outlook.com (2603:1096:604:45::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 10:24:10 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 10:24:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/8] sound: soc: sh: Add RZ/G2L SSIF-2 driver
Thread-Topic: [PATCH v2 2/8] sound: soc: sh: Add RZ/G2L SSIF-2 driver
Thread-Index: AQHXfKO7cYRJ5u63zkC7PqL/HpWyVatLohGAgAAGJNA=
Date:   Tue, 20 Jul 2021 10:24:10 +0000
Message-ID: <OS0PR01MB5922F3847EBEE4824F55931586E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1f3TM3pKsftNkaOrFifAMdLkEcKdWs=wL54uFhEKoZg@mail.gmail.com>
In-Reply-To: <CAMuHMdV1f3TM3pKsftNkaOrFifAMdLkEcKdWs=wL54uFhEKoZg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1b2f295-37fe-4e20-74df-08d94b6883ac
x-ms-traffictypediagnostic: OSBPR01MB3304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3304CFE3792E7558EF3BCF9E86E29@OSBPR01MB3304.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: urE7BAfUJ1HRSb9RhVXF1IaKiJYBXGVHFnFzJgrT+88u80EjLid+6C/C6snDJa4FkcjcjjUVpZqOI4ODcxvbDNoGY603UUbyVvx/Yd3tvjLp8Owo22VUG8gqnC3wzzjaDlsoB6GXEYJmVPyhX4aGarymw4ngokabPRHATohQG0jHoJouNayivCgRK0vT1je8yL8A0k6TX3mqKYWr6YV9i70OcXUPJvbI7xXYOPt2Ou4yuzLXocaq7m0KgY2qWGSfLPya38beMRKalPphHUfUa5EakzrCdLEw/NymiblZ/5oeJe/NBjv4RryZxaBPQICTLIPyKOcPYi46GFDS0UZcGFZDQM+JNi9C/abBTn2/4MjnWFwMPNAUBikf68XIyOWUOJWdKiREQG+EYV1JD/lMH9OdrUg3ahROAky178CfRQIbLU9XNBmN5HfHuWz478zyquiy3u1mawAXIqT3+whITqZ2v+Cum957EBfhWxFlLcPrvf8D2NIrtc+4APwSLAszWAWqjeF4fyXl5uVlIXmp7e1A/nMWHjZbVyQPqHZXdzom5v3jdGQm9fWzKM5Zq9b+L2ev2P0FlE3eQ4PoGdNbXR0RiV/SyOOaUJHOwSBDz5Gj85jtcIiGzhqIQyBMNy/UaiHiLOwkOzKdo0luo7GQKqJRFfr5RC4fGia4g3WP1FQQ4l30FQEqMjUmcVwaSFvPXpQ1PpzVbIVHFGikKsoY7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(6506007)(83380400001)(9686003)(316002)(86362001)(54906003)(33656002)(26005)(38100700002)(8676002)(186003)(8936002)(122000001)(2906002)(53546011)(55016002)(76116006)(66476007)(66556008)(66446008)(7416002)(5660300002)(6916009)(64756008)(7696005)(71200400001)(478600001)(66946007)(4326008)(52536014)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHB6Slh6WDJZMTdVVEJQR3gyRGhDZzJ5cURBY2dBWjc1aGkzVHEyK1YxQVNJ?=
 =?utf-8?B?RXpNRW5zdnd5bTl4bGZyNGZiNDFVbERpbFU0MzNZVDJkSWR1czFpNUNCb29P?=
 =?utf-8?B?NzgwaXg1TUdiTTVia0VpN2VjTG82ZTJIMnVGTXRSbzVHRkZoUkdqVSt4Rjdz?=
 =?utf-8?B?dnE4Z3l1MDJ1ZWMrSmcwVmV2aTRlbXJ2NXZPdFd4Nm4zYnBxNnM5TkFZejV4?=
 =?utf-8?B?Z2JCTllJOW9OMXJFMExBY1FBKzZnWXlFWERDSnF5b0w5bm1jNG9ocVRPNnp1?=
 =?utf-8?B?ankxUUtrU01JVmtEaWJsUUM3V3NLbTBacGEzWU90NWVWT3BJbytIMCs3emtj?=
 =?utf-8?B?bUVYYVlBWTJXMy9pNmNyYTc3cVBDNXcyc1VLMFgrT296UUMzUnpWZ05rcVFa?=
 =?utf-8?B?NFhYaVpmNEFUMUxhSWVhQkQyVjVEUTUwbkExZEVoalJiazlwSVlOZDUvcGpq?=
 =?utf-8?B?azIrS1FZaXJMMHQ5KzhWOVhycG9zU3Ird2N1RVlXZHFIdGJxODlYbm9ZRU5v?=
 =?utf-8?B?WW81MGc0ZHZyc0xmSmg2aUN3OURKallTWGNmekwwOXFoYWY5S3d2ZWZpUGxi?=
 =?utf-8?B?VXVyTUxISXlzcERlRWdTYVBrK2srbHYxVGhnODRnbUZiTVlWME1LQjhGaEJH?=
 =?utf-8?B?alVKOTBRTXArUnJ1Z3o5ZG5aV2dxZUhNdFBucDE4OG1rRzk1LzFtdmdYcExZ?=
 =?utf-8?B?STlTb0xaUkNTZEdMaEtTdHovc0pOU3Z1aFhsREhwWGRRRUI5Q0hxTWRrMzA3?=
 =?utf-8?B?dndlditTV0FoTEZkM1BYNkNBYThQWWJTRkdXbE91U2YrMjhqQWVPdnlJai8z?=
 =?utf-8?B?S1JyTHlJZDBTeUcyS213eldmM2dXLytqaTlYcWJQMzRHTDFISVcwZFpDaXY4?=
 =?utf-8?B?NkNmRjBlVlM2aEVZS2Y5djVpaUhjMnhOTzVPZDR2RUhld3BVbWNRRWh0U0Er?=
 =?utf-8?B?NFI5cVk2b2J1RlBIb0grSlpZM1lXTWNabnMvVWoyZlZrM1N0ZmU0RjdxS01u?=
 =?utf-8?B?U05EUE1Vd2JaeGNyZGZkQWR5aTlPYkJSYWFaTHJwNGltSkNoVGpxM28wMHJ1?=
 =?utf-8?B?TmlvZFg0NGZSZlByM2xYUlJhQXRMaGt4RWlYbE96MFllcXB0c3pOME5aWWkv?=
 =?utf-8?B?VUNPK2dwOGZtaktCZkcvcHg1Mmd5MG85ZDZXRUJYYUNMR1RualpyMWpsNEdZ?=
 =?utf-8?B?czAwUm9HRC95NEMyaXQ0VGd5OVVrYTFTS1VoV0F3ZmQvY3cyNlZjZ1h6dnhT?=
 =?utf-8?B?d1F0M2xkTlpiaFl6NW1uc01ZdWk1cUtzeTR4NVZ6d3c5OTZrblprZEJwMlVM?=
 =?utf-8?B?MkJacVUyS1BjRnNDREV3by9NR1dLWS9BdDIvREtjbExpS2o1aVpncTVFbkkx?=
 =?utf-8?B?cXNxaDdWNEE5UTlOQVMrNVppZFdrL1B2eWJNSzZldjF4d0RtMTd4SlBEVzdK?=
 =?utf-8?B?YWRTK2Z6bmtqUjUxVXVSTnZiZDFsRkVLY0pXc0FJdWtjWWhEQmQyTm9VRHVM?=
 =?utf-8?B?VEwwWHRxTlRCbUd3a1Vsd01TSk9zTG9nSzgvK3Z0ckJ2U21uTUxmaTlwakdV?=
 =?utf-8?B?VnNodUlBdkxrd2NrS0xzZk02Z01wT01WQjk1YXUrNlgrYWd5MFhHMFhFWk55?=
 =?utf-8?B?eVhFYVdUOXJ1aHhpNG13OHJOMjBXTnloQjlTOHRpR09jZS9kK0MwYkpyWlFU?=
 =?utf-8?B?NXpSd2hOY2VEb0F2NmdTUGRtWmMzVGlFRVoyVnl5SzdCWk45d1RJdi9tTDdC?=
 =?utf-8?Q?m9dBDdBTTN+BcgHv4csVie27Hp7wqPvcg/SXHSR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b2f295-37fe-4e20-74df-08d94b6883ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 10:24:10.5344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paL4WTRzTg1/6xhePdJWPb2xv0Y2ziu14BykuGu8UkQxm8aDGogjZG1ON+aQfcY0VdYrzA8RVSJDFDEI6o8xlDK/Vc0gCYWq5inNLShCnq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3304
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAyLzhdIHNvdW5kOiBzb2M6IHNoOiBBZGQgUlovRzJMIFNTSUYtMiBkcml2ZXIN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEp1bCAxOSwgMjAyMSBhdCAzOjQwIFBNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRkIHNl
cmlhbCBzb3VuZCBpbnRlcmZhY2UoU1NJRi0yKSBkcml2ZXIgc3VwcG9ydCBmb3IgUlovRzJMIFNv
Qy4NCj4gPg0KPiA+IEJhc2VkIG9uIHRoZSB3b3JrIGRvbmUgYnkgQ2hyaXMgQnJhbmR0IGZvciBS
Wi9BIFNTSSBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvc291bmQvc29jL3NoL0tjb25maWcNCj4gPiArKysg
Yi9zb3VuZC9zb2Mvc2gvS2NvbmZpZw0KPiA+IEBAIC00NSw2ICs0NSwxNiBAQCBjb25maWcgU05E
X1NPQ19SQ0FSDQo+ID4gICAgICAgICBoZWxwDQo+ID4gICAgICAgICAgIFRoaXMgb3B0aW9uIGVu
YWJsZXMgUi1DYXIgU1JVL1NDVS9TU0lVL1NTSSBzb3VuZCBzdXBwb3J0DQo+ID4NCj4gPiArY29u
ZmlnIFNORF9TT0NfUloNCj4gPiArICAgICAgIHRyaXN0YXRlICJSWi9HMkwgc2VyaWVzIFNTSUYt
MiBzdXBwb3J0Ig0KPiA+ICsgICAgICAgZGVwZW5kcyBvbiBPRiB8fCBDT01QSUxFX1RFU1QNCj4g
DQo+IEFSQ0hfUjlBMDdHMDQ0IGltcGxpZXMgT0YNCj4gDQo+ID4gKyAgICAgICBkZXBlbmRzIG9u
IEFSQ0hfUjlBMDdHMDQ0DQo+IA0KPiBJcyB0aGVyZSBhbnkgaGFyZCBjb21waWxlLXRpbWUgZGVw
ZW5kZW5jeSBvbiBBUkNIX1I5QTA3RzA0ND8NCj4gDQo+IFBlcmhhcHMgeW91IG1lYW50DQo+IA0K
PiAgICAgZGVwZW5kcyBvbiBBUkNIX1I5QTA3RzA0NCB8fCBDT01QSUxFX1RFU1QNCg0KT0ssIFdp
bGwgdXBkYXRlIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KUmVnYXJkcywNCkJpanUNCg0K
PiANCj4gPw0KPiANCj4gPiArICAgICAgIHNlbGVjdCBTTkRfU0lNUExFX0NBUkQNCj4gPiArICAg
ICAgIGhlbHANCj4gPiArICAgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBBU29DIHNvdW5kIHN1
cHBvcnQgZm9yIHRoZSBSWi9HMkwgTVBVcy4NCj4gPiArICAgICAgICAgVGhlIHNpbXBsZS1hdWRp
by1jYXJkIGRyaXZlciBhbmQgdGhlIFJaL0cyTCBidWlsdC1pbiBzZXJpYWwNCj4gPiArICAgICAg
ICAgc291bmQgaW50ZXJmYWNlIChTU0lGLTIpIGRyaXZlciBhcmUgdXNlZC4NCj4gPiArDQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

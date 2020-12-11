Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663562D79E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 16:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393089AbgLKPvF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 10:51:05 -0500
Received: from mail-eopbgr1300094.outbound.protection.outlook.com ([40.107.130.94]:19424
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390685AbgLKPuq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 10:50:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4T/CBKJeEsNxCcV0tkQUB0YzQgDk7rLtfcecZTGsbCA7ams3Nf7c4W5oi4wyXQ/EX2DBsIydC98NWwCpEatkZAKSCRNkbDX+KZn0Qt9/jY1R5X9TxxTnplu/IVgWes77jlUkRm0R7yqbOjmHy+5XA+BMxFWXziHyibmeOc1PazgQGI4Rs34ujpdTJrETKYUJYa1S2ivjHVD9u3TMu3EiRdBJvFULxI7k+GmXRNZpqgGTwtrSt0l/t/XMxbpyXCLayjz0OduWwWb8IwcjWYDM06nAoGw+rnJ1+aHQX5PKSZ6ijif/zqrU4GVnMrHE6pCpkr6xd4bGpeWyzsMdwO6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlfZUa32iofoAbSIWc9d6n9STcjmunYLX694KREjdDs=;
 b=buJesEipd/jp3PdnWhBR1v0G6JcJ2aNRUwdsNnz1hxa1gZVajhGQbBNGTOh29SbBSSBauGvFeRr4Zar7bmabz7NRuU6cTKh7EIGpqOt8Te0fHQcvLAlsu2cI4rsUOZXQl5WYwNV2sGRkWoiMb+sARuB3ZWTzfRkvkl92h1PEI/rWnk2JSDzO5vJcbgH/fZTG3l7qyh7ftYWZERuB7c7r1nXh3005O1Qw9/L43oaqlTj2XFPgDyTJG5/3y/brQc0X4y1sEtVYTvwhbIsRERil+n5navu1kGsMxBsvFY37kIuQ86UjjWMiS7Ss5bA28naJQ11/Fs7HhjccoRwEgt1SIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlfZUa32iofoAbSIWc9d6n9STcjmunYLX694KREjdDs=;
 b=Sz6KsWzwUvCWaTjElYZU6JY/rPbbK1AvNQMittLE06tW6GlxjxK8P22fvVjMDi/KNAB3196UZkbPi/zKF2a2SFgADNnpFvYIvXr60JuAvbkfe6jk53ELeYaXhgT5hMKZEO6ETnEic0XxZUO+4zzcmde8c6hB4wTZWTqbXn22sEY=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB5162.jpnprd01.prod.outlook.com
 (2603:1096:404:11a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 15:49:12 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 15:49:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Julien Massot <julien.massot@iot.bzh>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] clk: renesas: Add MFIS clock
Thread-Topic: [PATCH 0/5] clk: renesas: Add MFIS clock
Thread-Index: AQHWzv/z4hXhL9QMDkafPTk9jsvyIqnwal5ggAAC/4CAAAq7wIABYbQAgAAx3TA=
Date:   Fri, 11 Dec 2020 15:49:11 +0000
Message-ID: <TYBPR01MB5309B90B607BC18FBCEBE42586CA0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201210142021.163182-1-julien.massot@iot.bzh>
 <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh>
 <TYBPR01MB53090FC98C72A3DA466C064786CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAMuHMdUZOv=Or5JJZmAVwn2fjA=fP_texF9ZttKaHVY-YLjRCg@mail.gmail.com>
In-Reply-To: <CAMuHMdUZOv=Or5JJZmAVwn2fjA=fP_texF9ZttKaHVY-YLjRCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [109.152.167.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32ed3d06-ae37-42a7-f780-08d89dec4e00
x-ms-traffictypediagnostic: TY2PR01MB5162:
x-microsoft-antispam-prvs: <TY2PR01MB5162DBF945CD8B98A507101586CA0@TY2PR01MB5162.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YjRA22c0W9Pa81ZnZeQvOLYBVVTRTbtGq0Ym6qZRcqRwWIh0QaGx47WGcznQegQVUEcwTt6G6uwt/NdNApOt2QegmFPYhrgmz7vd5XtWZiAtnH7JAQqLNtxNrtvJKv4wCmzMM18yMh6viAzy0uv87OPFwySVN7iNEX2YGU76D492swr0KwlAxfIDImZAm4y961IfHeIsYC6jwhuuAmXD4x+jEiGNRIXQvzAkzMLn+Skuzj1XIm+zMvzG7SVoHHLr/8/GM+Wz0qHW2O8iagrR9EdCCX2NNrgJofzSvKz35jAp7VK9zqkwDtFSPIw+tN5cztkxI9cT3B1KxFwgz/P9Ow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(6916009)(66446008)(7696005)(5660300002)(26005)(9686003)(55016002)(8936002)(64756008)(66556008)(52536014)(186003)(76116006)(66476007)(316002)(33656002)(66946007)(2906002)(83380400001)(4326008)(71200400001)(54906003)(86362001)(478600001)(53546011)(6506007)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NTJIQ0dIRjh1Y1dxT2tUV2cvRkFzSm15Wm1EbTFNOWdBcUFiVllvenVmYjRN?=
 =?utf-8?B?bE1lQUZiMXB5MGh3cDgyV3Vmd01nN1ZFSkV5ekx5RUdxaTRpYXBwRS95UkxW?=
 =?utf-8?B?cFYvNExaMDhva2JrZEhZQjY2V0s0akYwSjViQk5SOVNKVlpJc3M1SitYOG5G?=
 =?utf-8?B?N1ZvOXd1SGkwOS9CRW1mMDBxaTJ2SXFmNUVWaURQOEE3LzI5dk5jZS8zemg1?=
 =?utf-8?B?R3FMUHJielVDWmk4dUJkbGw4VktxY2xueW82WUhOeGVyRmpJSldGbXBBUlNI?=
 =?utf-8?B?OGZwM1MzMWNZWDRSWFJXYlJPUHVTcHJRZVJGb2Vualo3enprQ3FSNlA5cDdN?=
 =?utf-8?B?R2JERmZLYVNvNndWY3RvcHBuODRPNHBuNjMrN1paWThlVEs2ajk2OUlhTFdn?=
 =?utf-8?B?SXVFbWxkRnNkVnhFT0UzZTdkMkhtelNzaCt6WS83MFRJUEN3RmlZa1J3MEJx?=
 =?utf-8?B?QUh2ZE1Ua2w0bitsckZVQWQrcFVQNnRCb3Z5allhd1FmbHk5eWNQSG5aeU1G?=
 =?utf-8?B?d0VOZFJOV3dyNGtieFR6aTc2ckc2VmllNkl0cUxJL0FXYkRjT05RdFJRNXRO?=
 =?utf-8?B?M25xL0VGeHR0K1lFUlBZVXk2Yis5VVUwTjBwWUNaNnhHQ3ZEU080ZUpWRDRD?=
 =?utf-8?B?K3BFODJYZ1E1UGxEL0FhR1lsMHlLZk9MTWFFeC9Uc05DZktud3gxZm0yQXJj?=
 =?utf-8?B?OWgxbUtaeVBvN3RlYU4xYUdtY0NGRjBUZnVxampQY3NCeHVuZVVlRzlEY2Vs?=
 =?utf-8?B?UHI0VjI3WVdFL2xoNlAwSWozTjV5V084OXQ1L3MxbE1QOFdkNnFmUi9BWEFD?=
 =?utf-8?B?eFRSNGdNWitsZy9XN2UvY0NEYlRuSks3aXBPZVZZV3JSNlRrckptcXhzaHY2?=
 =?utf-8?B?K1ZjVDZ0TG9sU1IrT2VRZjlBcklldmxKd0pma2tsdmM2VFVuM2oxK2ltZGtZ?=
 =?utf-8?B?dVYxNWJxbGpjNHppVW9FZ0NmanA5bFJXS1RQa09uWkRvVG00UFBPaHpPWHdS?=
 =?utf-8?B?bW9UUU10bVhsZE9IanJqTmYrUHR1L010R3FIV3NtQWtNSytMOFhiMllyVUxI?=
 =?utf-8?B?N1NqVHZDODBObGlsdjRXVVVVdWh1anpUR2FRUXZyTFlQMHZ1TkpscGYvcnNv?=
 =?utf-8?B?TWg2K2FBYmJqNUdVMUIvMGZRMGlMei94M0QxWmZNczlZMDBFTkptRkxheFNU?=
 =?utf-8?B?WEZPblhrbWV6UE05dFg5dTM0aURqY0VFYnlTUHVkRTdSSGxMcVJFaGRUdkcx?=
 =?utf-8?B?dUMrdDJZTnM2Q0ZTcGxPcVdiWEV1S1ZOVFMwUzlOZjE1dVNZeFpJRi9ydkVj?=
 =?utf-8?Q?5kUFf4skb+HZA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ed3d06-ae37-42a7-f780-08d89dec4e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 15:49:11.8259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1elr8KZA6HvoCUKVRfUNHiGaVrYywvT0kuRwz4lHPPaeAIiKOaMbFiHpbuYi+LCxQYbTn/M8RYNgKMsvKDFw92iL1orYrcSTGcmYTB0o/AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5162
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzVdIGNsazogcmVuZXNhczogQWRk
IE1GSVMgY2xvY2sNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIERlYyAxMCwgMjAyMCBh
dCA0OjQ3IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNV0gY2xrOiByZW5lc2FzOiBBZGQgTUZJUyBj
bG9jayBPbiAxMi8xMC8yMA0KPiA+ID4gMzo1NyBQTSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+
PiBTdWJqZWN0OiBbUEFUQ0ggMC81XSBjbGs6IHJlbmVzYXM6IEFkZCBNRklTIGNsb2NrDQo+ID4g
PiA+Pg0KPiA+ID4gPj4gVGhpcyBzZXJpZXMgYWRkcyB0aGUgbWlzc2luZyBNRklTIGNsb2NrcyBm
b3IgbW9zdCBSZW5lYXMgUi1DYXINCj4gPiA+ID4+IEdlbjMNCj4gPiA+IFNvQ3MuDQo+ID4gPiA+
PiBJIGhhdmUgdGVzdGVkIHRoaXMgc2VyaWVzIG9uIEUzLCBNMywgYW5kIEgzIGJhc2VkIGJvYXJk
cywgSSBkb24ndA0KPiA+ID4gPj4gaGF2ZSBhY2Nlc3MgdG8gRDMgbm9yIFYzIGJvYXJkcy4NCj4g
PiA+ID4NCj4gPiA+ID4gSnVzdCBhIHF1ZXN0aW9uLCBDYW4geW91IGV4cGxhaW4gd2hhdCB0ZXN0
IGhhdmUgeW91IGRvbmUgd2l0aCBNRklTDQo+ID4gPiBtb2R1bGU/DQo+ID4gPiBBIGJhc2ljIHVz
YWdlIEkgZGlkIGlzIHRvIHN0b3JlIGFuZCByZWFkIGEgYnl0ZSBpbnRvIG9uZSBvZiB0aGUNCj4g
PiA+IGNvbW11bmljYXRpb24gcmVnaXN0ZXIgTUZJU0FSSUlDUiAvIE1GSVNBUkVNQlIsIGEgbW9y
ZSBjb21wbGV4IHVzYWdlDQo+ID4gPiBpcyB0byB0cmlnZ2VyIGludGVycnVwdHMgYmV0d2VlbiBM
aW51eCBhbmQgdGhlIHJlYWx0aW1lIHByb2Nlc3NvciwNCj4gPiA+IHVzaW5nIGEgbWFpbGJveCBk
cml2ZXIsIHRoYXQgSSBkaWRuJ3QgcG9zdCB5ZXQuDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBl
eHBsYW5hdGlvbi4NCj4gPg0KPiA+IEZZSSwgQXMgcGVyIFItQ2FyIEdlbjMgSFcgbWFudWFsIFJD
YXItRDMgZG9lc24ndCBoYXZlIFJUIENvcmUuDQo+IA0KPiBCdXQgUi1DYXIgRDMgc3RpbGwgaGFz
IChhIHN1YnNldCBvZikgdGhlIE1GSVMuDQoNClllcywgVHJ1ZS4gQnV0IGN1cnJlbnRseSBJIGRv
bid0IGtub3cgaXQncyB1c2FnZSBvbiBEMy4NCg0KVGhhbmtzIGFuZCByZWdhcmRzLA0KQmlqdQ0K

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC993D346F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 08:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233740AbhGWF1t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 01:27:49 -0400
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:32194
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233733AbhGWF1s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 01:27:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4WLkkuZzpwMhB3FCSxNW+ljA7TcrAiVnee9S8hhvE+5KRwMKkPFwhXzcv4EznYddYAk+xGvtUKAY7VZ9lB1vzkGgtTXLtusuqN9Q9+FVR5sUTnoAIlLIjZadHYjGDBh/iJJKT/r8h7XKvWUBMRS78CX3gDkQx4d61mlwBIE6n4WcPyLLMMR+mvvuI8CrUULlMG7k5d0ZOdXTFA2huxXWk+yfnTyiqmKaeYMplwYDhLVM0vdS0kF+9ZiJaWzlsL3UDK9AEpusSzYlS02UVkeUpjG22j3iu//IP14V0VfkN5Mj1X9LJaDZHOOJVAboUG9EQNM25eYXo29ZVkTMUzqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzmkLoiQ1u219bqJayxAA8QBbrI1OUQqfmbylwCPONU=;
 b=XtA5JUDwM7DJXMjH4Kt3qeJ/d6cAJmXn6UrEJxdw+Sw/olg60uepMdvcRGUjtaJHeTJ8ax2lBggq9CXwpUXnei0BkkFoMxDj+F7B2mJD90ti3pdr8RisY87o68LfTGXbR7qz8IpG1shpkoYZWqaJNEfqLWlmXk4DeR4llw/AjF6EkY/+y6H5lrR7oosTwtV2DWjaJOy/Ab3LUNLCCjA0p5taKezONngVz1K/At1ChJWlAQaMMRdnsKWgQ5568gkabmiyXWelDdmilku8eXzbA49gvPVkoMjz3S1TiJWYnX8K8iGtdnZydRwhmOBPKa9HG8Kr/lQyP5FbAGTA5jXD+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzmkLoiQ1u219bqJayxAA8QBbrI1OUQqfmbylwCPONU=;
 b=Xsb5DMKOZ9adwftrbpf8qndM6n7Sevr37psOgmjg2lba9eGwkYgITm1A77pYPo56mTT5zszkwCN3Sxa1VCJEkDuqJpTqPWxgrs3np+hRiqW/ZqAeaFqrStsNgsedoXH9WpRMC1rHH0uqRYO0bnTNmv2RDkyJGR/OlXwlx8bjkNs=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYYPR01MB6960.jpnprd01.prod.outlook.com (2603:1096:400:d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 06:08:18 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::1bb:3bd3:f308:a8c7]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::1bb:3bd3:f308:a8c7%5]) with mapi id 15.20.4352.026; Fri, 23 Jul 2021
 06:08:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Adam Ford <aford173@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next 05/18] ravb: Replace chip type with a structure
 for driver data
Thread-Topic: [PATCH net-next 05/18] ravb: Replace chip type with a structure
 for driver data
Thread-Index: AQHXfwPbK+pDoHTEqkOM9Wwv3adXIatPdhoAgACZ2CA=
Date:   Fri, 23 Jul 2021 06:08:17 +0000
Message-ID: <TYCPR01MB5933A2CA3DEE8620F5AFF16786E59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
 <20210722141351.13668-6-biju.das.jz@bp.renesas.com>
 <09e06a00-6b9e-c8b8-e5c3-67d82d900a74@gmail.com>
In-Reply-To: <09e06a00-6b9e-c8b8-e5c3-67d82d900a74@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e001ac54-0290-428b-28b8-08d94da043f5
x-ms-traffictypediagnostic: TYYPR01MB6960:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYYPR01MB696002320C9CB6A7772FF36E86E59@TYYPR01MB6960.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +AHqglfOBPTDfz0WXs5fFDFiyCjTlIQOI4X8kl+jAjo7PwK3uw2D5jKK7/kahZEEpl4oQE2bTdXejSgK7AwCBPm6WU6IFI4THZjHRtnsVbXYyn42Xj3gw5/tGaFgRw/39bFUxA7NoHdjntXZv7UgxNZzKZvZvQN6n21Blh2hzivYnkFj072ndDeCzDwCO2IClHwBv2L2AC2FzXi1mrMAjRm665glanSEOHL5ym8HU12cm7PUQ1xQTFwQU5ERjxfEALI/NzPHLsaOcszw1QEdAaGTX1xOp51311zEwDBJ3UTkifngJkoUdzCd52gWwMZJHLPXBcVqbW9fFbpyTPB9n4ms4PlDI2Jr+0mvKWyqeoN2A16IgwBli4WftiXz6aEgVeDCT/GLEW/FWd/CjnVEzkzgUTTX5AmsI3XRIMO/+g63XvMviARUlR/TFVVOOktvqQ95teDEOYUfTow78VTURq83Oh9ro/shJYk8P+Ll6qWtWLwJujTwCkiIF7XFg1q/GYEqEfI1lPPcoarBanomjb1TsYzNZ4stjbgT6/QNAP9lMJx3dhfWVuNBXuUmqnFJl0wLiiJ72uATBkuyOU5+lg8XWA8d48ZN5vl+zoF2n52FMYo9IHhKufg3BkAt/Vypz43dk0SYW1Ze4MNCStHA+wxBHTDl/c3dAZBVANj6jpsXI4lMVV+Xt/b75IfnaLMgmOnL5LJ8Kw5JneFWwBu2uSPzPGCEaGwXUPh9YTKB1lAFOSTRE5N1fhOm09Wcw2x1OEjDV5SzQq7QitRoYlTODMMIkpAufiwXSsvYfXRcaApfbriIv3NVTBUSz7cW+0pxlTOKAEbjZseLhoUo3+CgtQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(33656002)(7416002)(54906003)(9686003)(66946007)(2906002)(55016002)(66556008)(966005)(64756008)(6506007)(86362001)(66476007)(66446008)(110136005)(316002)(7696005)(53546011)(71200400001)(4326008)(52536014)(83380400001)(186003)(8936002)(122000001)(508600001)(38100700002)(8676002)(107886003)(26005)(5660300002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnlpR2NHYlR1MVVSVDVxZzh6YmRmeDcyOEhERUdmS05uaGxwWHplcUs3eFpR?=
 =?utf-8?B?RG9WN1pkekgwVy8ySjg1TDlZNHdTR3BWOXExVHU2Smc4a2VhaEg2VDNaMjhP?=
 =?utf-8?B?elpsblhmcWcxSkVXWUJhUlBodW00WGxZd1dXQzFaanJsNkJJcnZZREhaK1Vq?=
 =?utf-8?B?YUhzWXdvSHNENFFHSWdXR0hOYnZYcU9jVXpNeVRBejJ5aEkwQ3BtU0Foc2x6?=
 =?utf-8?B?dkd4REhlSE1iaVZVNlpJRTRqZGJXZWpNQlQzN2cvNTMrMmdNa0FsSmlWQm1w?=
 =?utf-8?B?WWFnY2l3SGhsZjB1a00vWUZlaTJSSnVEREN4d0dibUJGS0dlVnVybitRdFlO?=
 =?utf-8?B?ZFdJbUFVQlFoMFgrZnVFRVBXVEtqaWVESXFNMDVQQXhTUjNkNkxrOGdIeGFD?=
 =?utf-8?B?U0xxZ0o4c2hkSVVpYk5FeklpdXFMQlRlYjFNdE5NOTlxZDJTTnB0UUpPQk1S?=
 =?utf-8?B?RmptMU5ITzFxOEFNa0JKaWdSQ3BtMTUwOGl6ejBNMUFUYUEzRmpER1RMekl4?=
 =?utf-8?B?S0F2L0VsWGVuSCtpZFlFd3hBbXo4ejB0VzdsQWZxYk5CRzRVdlJYMXRwTUFC?=
 =?utf-8?B?ZmlmTXdsTUYremtUWnJXd3ByUEZMV3hFVDE0emFYRjNXa0UyS1EzK1V5b045?=
 =?utf-8?B?MUduVmJYUHB2VGNJVzMrc25QRGRzc1kyS3JFUXVlbGwxenVJZHR3OG45MFZx?=
 =?utf-8?B?NUFzYTZ5WSt0ZVRoam9KQXAzS0dvdUlLN0xuQkU2NVltR0ErN2NaL1dyRC90?=
 =?utf-8?B?Mlg5b0tYSG1lY253UVFVZ1RPdU5lWFI0b3lNdDdnOE1YM0g0bC82NzJ4VXBZ?=
 =?utf-8?B?SEVIajNjSzI3ZEJuUGxkSVdTTlVQamZLd0tlSkdCNi84RUlyV2VuR0hmQWxo?=
 =?utf-8?B?VFpsS1MxTkkveXVEQVJwa2x0bWdmKytpMXFjeDFzSHpkOGh0M2k3MmdtQlpo?=
 =?utf-8?B?bUtrVGNmNFg1TEVKR2F3S09mdFNCMjRTbGNFQyt6bUpuZVptZGI2eDBEbVNS?=
 =?utf-8?B?bzFnMy82UStuZHJVa0tRdHlJb21mYzJhaG5wdHVmakYrd3JMZ2RDRDV5eW5N?=
 =?utf-8?B?c2tpR1M4QWtuTkVLZStEZ21yNC92YmdjUkNWMGtKQkc0ZDBLUGhLZHNlL1ZT?=
 =?utf-8?B?YnZsOXFPWkhtUnlqVUtwdUpxS0Q4K2d1Wkxtck85V1JTR1FFVkZGOHJxZVdU?=
 =?utf-8?B?aXlXRVpUVWViWUxvOEhUd3JZeXYzVXBHelYzWXlyd0doRXJrbFhPTnZKdlFt?=
 =?utf-8?B?WElJVzhnVDNhSVdhN0RxTVcxZm9lMzZiZHZ4QmVsSUZlcmNVd1hOME0yaVJh?=
 =?utf-8?B?U3NMTFFzcmtWSlkvRjlwSjBSUW5JblkyN01hbityREEzQ24vOTNPT1N4cXQ0?=
 =?utf-8?B?MEo2NW1Ub0xQd2xtWWVnN1R2M2cxYWZRM0pYREY1dWszZWlqb2lkaU5BSXFW?=
 =?utf-8?B?NCs3MEx3TzNPd3pHWDN2K3ZRVUJxTExjbWZiL1NYZEd4di9qVlFENk44TkRs?=
 =?utf-8?B?SE5ZVW54c3Q2THBFaWljZkxFVWd0MURwblZTVXBmbk1kOGFza2c1RzEyU1Jh?=
 =?utf-8?B?c3pQQXp2V2M3VnlxazF5QWs1Q0M5QUs3SlB6b2JwdktLdGc3cmQrNnR3eFU3?=
 =?utf-8?B?Tkd6R3JEOThqNm1DbFJnVDlXTmVoZm1qRENicUxBLzZXSFl1eUQ1aXdRL0Jp?=
 =?utf-8?B?ME1LeFJIdFJwNEhYNXdKVmVTRHMzQzFjREw0SEhuN2JYQmVGM3hsbWFBN2h4?=
 =?utf-8?Q?HBzd+YnG/Qt3t8NDLETO2Z9a+3Z4AEMCBpqM4+t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e001ac54-0290-428b-28b8-08d94da043f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 06:08:17.5869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HPdBfe5QO9laAxWNIOXm7PFzleECdHbysgBjy4QK4477byNHa3PH53m0e9djvblZ+ZT+7v+xz5eiyXe7XCUci2ooIr/ltbZaIch2oRWmENk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6960
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBu
ZXQtbmV4dCAwNS8xOF0gcmF2YjogUmVwbGFjZSBjaGlwIHR5cGUgd2l0aCBhDQo+IHN0cnVjdHVy
ZSBmb3IgZHJpdmVyIGRhdGENCj4gDQo+IEhlbGxvIQ0KPiANCj4gT24gNy8yMi8yMSA1OjEzIFBN
LCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4gVGhlIERNQUMgYW5kIEVNQUMgYmxvY2tzIG9mIEdp
Z2FiaXQgRXRoZXJuZXQgSVAgaXMgYWxtb3N0IHNpbWlsYXIgdG8NCj4gPiBFdGhlcm5ldCBBVkIu
IFdpdGggZmV3IGNoYW5nZXMgaW4gZHJpdmVyIHdlIGNhbiBzdXBwb3J0IGJvdGggdGhlIElQLg0K
PiA+DQo+ID4gVGhpcyBwYXRjaCBpcyBpbiBwcmVwYXJhdGlvbiBmb3Igc3VwcG9ydGluZyB0aGUg
c2FtZSBieSByZXBsYWNpbmcgY2hpcA0KPiA+IHR5cGUgYnkgYSBzdHJ1Y3R1cmUgd2l0aCB2YWx1
ZXMsIGZlYXR1cmUgYml0cyBhbmQgZnVuY3Rpb24gcG9pbnRlcnMuDQo+ID4NCj4gPiBDdXJyZW50
bHkgb25seSB2YWx1ZXMgaXMgYWRkZWQgdG8gc3RydWN0dXJlIGFuZCBsYXRlciBwYXRjaGVzIHdp
bGwgYWRkDQo+ID4gZmVhdHVyZXMgYW5kIGZ1bmN0aW9uIHBvaW50ZXJzLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJl
dmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2
Yi5oICAgICAgfCAxNCArKysrKw0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jh
dmJfbWFpbi5jIHwgNzYNCj4gPiArKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmIuaA0KPiA+IGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiLmgNCj4gPiBpbmRleCA4MGU2MmNhMmUzZDMu
LjBlZDIxMjYyZjI2YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5l
c2FzL3JhdmIuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yi5o
DQo+ID4gQEAgLTk4OCw2ICs5ODgsMTggQEAgZW51bSByYXZiX2NoaXBfaWQgew0KPiA+ICAJUkNB
Ul9HRU4zLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0cnVjdCByYXZiX2Rydl9kYXRhIHsNCj4gDQo+
ICAgIEknZCByYXRoZXIgc3VnZ2VzdCAqc3RydWN0KiByYXZiX2h3X2luZm8uLi4gVGhpcyBpcyBo
YXJkbHkgYSBkcml2ZXINCj4gZGF0YSwgbW9yZSBsaWtlIGh3cmR3YXJlJ3Mgb25lLiA6LSkNCg0K
T0suDQoNCj4gDQo+ID4gKwluZXRkZXZfZmVhdHVyZXNfdCBuZXRfZmVhdHVyZXM7DQo+ID4gKwlu
ZXRkZXZfZmVhdHVyZXNfdCBuZXRfaHdfZmVhdHVyZXM7DQo+ID4gKwljb25zdCBjaGFyICgqZ3N0
cmluZ3Nfc3RhdHMpW0VUSF9HU1RSSU5HX0xFTl07DQo+ID4gKwlzaXplX3QgZ3N0cmluZ3Nfc2l6
ZTsNCj4gPiArCXNpemVfdCBzdGF0c19sZW47DQo+ID4gKwl1MzIgbnVtX2dzdGF0X3F1ZXVlOw0K
PiA+ICsJc2l6ZV90IHNrYl9zejsNCj4gPiArCXU4IG51bV90eF9kZXNjOw0KPiA+ICsJZW51bSBy
YXZiX2NoaXBfaWQgY2hpcF9pZDsNCj4gDQo+ICAgIE1obSwgSSdkIGV4cGVjdCB0aGF0IGNoaXBf
aWQgaXMgbm8gbG9uZ2VyIG5lZWRlZCB3aXRoIHRoZSBmZWF0dXJlDQo+IHN0cnVjdHMuLi4NCg0K
WWVzLElmIHlvdSBzZWUgdGhlIHN1YnNlcXVlbnQgMyBwYXRjaGVzLCBjaGlwX2lkIHVzYWdlIGlz
IGNvbXBsZXRlbHkgcmVtb3ZlZCBmcm9tDQpyYXZiX21haW4uYy4gYnV0IGl0IGlzIHN0aWxsIHJl
cXVpcmVkIGZvciByYXZiX3B0cC5jLiBQbGVhc2UgbGV0IG1lIGtub3cgZG8geW91IHdhbnQNCm1l
IHRha2Ugb3V0IGZyb20gdGhlcmUgYXMgd2VsbC4gVGhlbiBhcyBwYXJ0IG9mIFsxXSwgSSBjYW4g
dGFrZSBvdXQgY2hpcGlkIGNvbXBsZXRlbHkuDQoNClsxXQ0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJlbmVzYXMtc29jL3BhdGNoLzIwMjEwNzIyMTQxMzUxLjEz
NjY4LTctYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQoNCg0KPiANCj4gWy4uLl0NCj4gPiBA
QCAtMTA0MCw2ICsxMDUyLDggQEAgc3RydWN0IHJhdmJfcHJpdmF0ZSB7DQo+ID4gIAl1bnNpZ25l
ZCB0eGNpZG06MTsJCS8qIFRYIENsb2NrIEludGVybmFsIERlbGF5IE1vZGUgKi8NCj4gPiAgCXVu
c2lnbmVkIHJnbWlpX292ZXJyaWRlOjE7CS8qIERlcHJlY2F0ZWQgcmdtaWktKmlkIGJlaGF2aW9y
ICovDQo+ID4gIAlpbnQgbnVtX3R4X2Rlc2M7CQkvKiBUWCBkZXNjcmlwdG9ycyBwZXIgcGFja2V0
ICovDQo+ID4gKw0KPiA+ICsJY29uc3Qgc3RydWN0IHJhdmJfZHJ2X2RhdGEgKmluZm87DQo+IA0K
PiAgICBTbyBkYXRhIG9yIGluZm8/IDotKQ0KDQpBcyB3ZSBhcmUgZ29pbmcgdG8gdXNlIHJhdmJf
aHdfaW5mbywgaXQgd2lsbCBiZSBpbmZvLg0KDQo+IA0KPiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4gYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4gaW5kZXggODA1Mzk3MDg4ODUw
Li44NGViZDZmZWY3MTEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiX21haW4uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMv
cmF2Yl9tYWluLmMNCj4gWy4uLl0NCj4gPiBAQCAtMTE3Niw5ICsxMTc5LDEyIEBAIHN0YXRpYyB2
b2lkIHJhdmJfZ2V0X2V0aHRvb2xfc3RhdHMoc3RydWN0DQo+ID4gbmV0X2RldmljZSAqbmRldiwN
Cj4gPg0KPiA+ICBzdGF0aWMgdm9pZCByYXZiX2dldF9zdHJpbmdzKHN0cnVjdCBuZXRfZGV2aWNl
ICpuZGV2LCB1MzIgc3RyaW5nc2V0LA0KPiA+IHU4ICpkYXRhKSAgew0KPiA+ICsJc3RydWN0IHJh
dmJfcHJpdmF0ZSAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOw0KPiA+ICsJY29uc3Qgc3RydWN0
IHJhdmJfZHJ2X2RhdGEgKmluZm8gPSBwcml2LT5pbmZvOw0KPiA+ICsNCj4gPiAgCXN3aXRjaCAo
c3RyaW5nc2V0KSB7DQo+ID4gIAljYXNlIEVUSF9TU19TVEFUUzoNCj4gPiAtCQltZW1jcHkoZGF0
YSwgcmF2Yl9nc3RyaW5nc19zdGF0cywNCj4gc2l6ZW9mKHJhdmJfZ3N0cmluZ3Nfc3RhdHMpKTsN
Cj4gPiArCQltZW1jcHkoZGF0YSwgaW5mby0+Z3N0cmluZ3Nfc3RhdHMsIGluZm8tPmdzdHJpbmdz
X3NpemUpOw0KPiA+ICAJCWJyZWFrOw0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4gQEAgLTE5MjQsMTIg
KzE5MzAsMzYgQEAgc3RhdGljIGludCByYXZiX21kaW9fcmVsZWFzZShzdHJ1Y3QgcmF2Yl9wcml2
YXRlDQo+ICpwcml2KQ0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHJhdmJfZHJ2X2RhdGEgcmF2Yl9nZW4zX2RhdGEgPSB7DQo+ID4gKwkubmV0
X2ZlYXR1cmVzID0gTkVUSUZfRl9SWENTVU0sDQo+ID4gKwkubmV0X2h3X2ZlYXR1cmVzID0gTkVU
SUZfRl9SWENTVU0sDQo+ID4gKwkuZ3N0cmluZ3Nfc3RhdHMgPSByYXZiX2dzdHJpbmdzX3N0YXRz
LA0KPiA+ICsJLmdzdHJpbmdzX3NpemUgPSBzaXplb2YocmF2Yl9nc3RyaW5nc19zdGF0cyksDQo+
ID4gKwkuc3RhdHNfbGVuID0gQVJSQVlfU0laRShyYXZiX2dzdHJpbmdzX3N0YXRzKSwNCj4gPiAr
CS5udW1fZ3N0YXRfcXVldWUgPSBOVU1fUlhfUVVFVUUsDQo+ID4gKwkuc2tiX3N6ID0gUlhfQlVG
X1NaICsgUkFWQl9BTElHTiAtIDEsDQo+ID4gKwkubnVtX3R4X2Rlc2MgPSBOVU1fVFhfREVTQ19H
RU4zLA0KPiA+ICsJLmNoaXBfaWQgPSBSQ0FSX0dFTjMsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHJhdmJfZHJ2X2RhdGEgcmF2Yl9nZW4yX2RhdGEgPSB7DQo+ID4g
KwkubmV0X2ZlYXR1cmVzID0gTkVUSUZfRl9SWENTVU0sDQo+ID4gKwkubmV0X2h3X2ZlYXR1cmVz
ID0gTkVUSUZfRl9SWENTVU0sDQo+IA0KPiAgICBNaG0sIHdoeSBoYXZlIHRoZSBmaWVsZHMgdGhh
dCBkb24ndCBjaGFuZ2UgZnJvbSBTb0MgdG8gU29DIGFueXdheT8NCj4gSSBkbyB0aGluayB0aGV5
IHNob3VsZCBiZSBhZGRlZCB3aGVuIGEgbmV3IFNvQyBzdXBwb3J0IGlzIGFkZGVkLi4uDQoNClRo
aXMgaXMgYSBwcmVwYXJhdGlvbiBwYXRjaCBmb3Igc3VwcG9ydGluZyBSWi9HMkwgYW5kIHRoZXJl
IGlzIGEgZGlmZmVyZW5jZSB3LnIudG8gUlovRzJMDQpTZWUgWzJdLiBUaGF0IGlzIHRoZSByZWFz
b24gdG8gaXNvbGF0ZSB0aGUgbmV3IFNvQyBjaGFuZ2VzIHcuci50byBleGlzdGluZyBvbmUgaXQg
aXMgYWRkZWQNCkhlcmUuIEFuZHJldyBhbHNvIHN1Z2dlc3RlZCB0byBtYWtlIHNtYWxsZXIgY2hh
bmdlcy4NCg0KWzJdDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
cmVuZXNhcy1zb2MvcGF0Y2gvMjAyMTA3MjIxNDEzNTEuMTM2NjgtMTgtYmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20vDQoNCj4gDQo+ID4gKwkuZ3N0cmluZ3Nfc3RhdHMgPSByYXZiX2dzdHJpbmdz
X3N0YXRzLA0KPiA+ICsJLmdzdHJpbmdzX3NpemUgPSBzaXplb2YocmF2Yl9nc3RyaW5nc19zdGF0
cyksDQo+ID4gKwkuc3RhdHNfbGVuID0gQVJSQVlfU0laRShyYXZiX2dzdHJpbmdzX3N0YXRzKSwN
Cj4gDQo+ICAgIFNhbWUgcXVlc3Rpb24uLi4NCg0KU2FtZSBhcyBhYm92ZS4NCg0KPiA+ICsJLm51
bV9nc3RhdF9xdWV1ZSA9IE5VTV9SWF9RVUVVRSwNCj4gPiArCS5za2Jfc3ogPSBSWF9CVUZfU1og
KyBSQVZCX0FMSUdOIC0gMSwNCj4gDQo+ICAgIEFnYWluIHdoeT8NCg0KU2FtZSBhcyBhYm92ZS4N
Cg0KPiANCj4gPiArCS5udW1fdHhfZGVzYyA9IE5VTV9UWF9ERVNDX0dFTjIsDQo+ID4gKwkuY2hp
cF9pZCA9IFJDQVJfR0VOMiwNCj4gPiArfTsNCj4gPiArDQo+IFsuLi5dDQo+ID4gQEAgLTIwNTIs
MTUgKzIwODIsMTUgQEAgc3RhdGljIGludCByYXZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UNCj4gKnBkZXYpDQo+ID4gIAlpZiAoIW5kZXYpDQo+ID4gIAkJcmV0dXJuIC1FTk9NRU07DQo+
ID4NCj4gPiAtCW5kZXYtPmZlYXR1cmVzID0gTkVUSUZfRl9SWENTVU07DQo+ID4gLQluZGV2LT5o
d19mZWF0dXJlcyA9IE5FVElGX0ZfUlhDU1VNOw0KPiA+ICsJaW5mbyA9IG9mX2RldmljZV9nZXRf
bWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiArDQo+ID4gKwluZGV2LT5mZWF0dXJlcyA9IGlu
Zm8tPm5ldF9mZWF0dXJlczsNCj4gPiArCW5kZXYtPmh3X2ZlYXR1cmVzID0gaW5mby0+bmV0X2h3
X2ZlYXR1cmVzOw0KPiA+DQo+ID4gIAlwbV9ydW50aW1lX2VuYWJsZSgmcGRldi0+ZGV2KTsNCj4g
PiAgCXBtX3J1bnRpbWVfZ2V0X3N5bmMoJnBkZXYtPmRldik7DQo+ID4NCj4gPiAtCWNoaXBfaWQg
PSAoZW51bSByYXZiX2NoaXBfaWQpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYp
Ow0KPiA+IC0NCj4gPiAtCWlmIChjaGlwX2lkID09IFJDQVJfR0VOMykNCj4gPiArCWlmIChpbmZv
LT5jaGlwX2lkID09IFJDQVJfR0VOMykNCj4gDQo+ICAgIFVnaC4uLg0KVGhpcyBjaGlwIGlkIGlz
IHJlcGxhY2VkIGluIHN1YnNlcXVlbnQgcGF0Y2ggWzNdDQoNClszXQ0KaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJlbmVzYXMtc29jL3BhdGNoLzIwMjEwNzIyMTQx
MzUxLjEzNjY4LTgtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQoNCj4gDQo+ID4gIAkJaXJx
ID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgImNoMjIiKTsNCj4gPiAgCWVsc2UNCj4g
PiAgCQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiBbLi4uXQ0KPiA+IEBAIC0y
MDk5LDcgKzIxMzAsNyBAQCBzdGF0aWMgaW50IHJhdmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZQ0KPiAqcGRldikNCj4gPiAgCXByaXYtPmF2Yl9saW5rX2FjdGl2ZV9sb3cgPQ0KPiA+ICAJ
CW9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgInJlbmVzYXMsZXRoZXItbGluay1hY3RpdmUtbG93
Iik7DQo+ID4NCj4gPiAtCWlmIChjaGlwX2lkID09IFJDQVJfR0VOMykgew0KPiA+ICsJaWYgKGlu
Zm8tPmNoaXBfaWQgPT0gUkNBUl9HRU4zKSB7DQo+IA0KPiAgICBVZ2guLi4NClNhbWUgYXMgYWJv
dmUuDQoNCj4gDQo+ID4gIAkJaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgImNo
MjQiKTsNCj4gPiAgCQlpZiAoaXJxIDwgMCkgew0KPiA+ICAJCQllcnJvciA9IGlycTsNCj4gWy4u
Ll0NCj4gPiBAQCAtMjE4NCw3ICsyMjE0LDcgQEAgc3RhdGljIGludCByYXZiX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gIAlJTklUX0xJU1RfSEVBRCgmcHJpdi0+
dHNfc2tiX2xpc3QpOw0KPiA+DQo+ID4gIAkvKiBJbml0aWFsaXNlIFBUUCBDbG9jayBkcml2ZXIg
Ki8NCj4gPiAtCWlmIChjaGlwX2lkICE9IFJDQVJfR0VOMikNCj4gPiArCWlmIChpbmZvLT5jaGlw
X2lkICE9IFJDQVJfR0VOMikNCj4gPiAgCQlyYXZiX3B0cF9pbml0KG5kZXYsIHBkZXYpOw0KPiAN
Cj4gICAgVWdoLi4uDQpTYW1lIGFzIGFib3ZlLg0KPiANCj4gPg0KPiA+ICAJLyogRGVidWcgbWVz
c2FnZSBsZXZlbCAqLw0KPiA+IEBAIC0yMjMyLDcgKzIyNjIsNyBAQCBzdGF0aWMgaW50IHJhdmJf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgCQkJICBwcml2LT5k
ZXNjX2JhdF9kbWEpOw0KPiA+DQo+ID4gIAkvKiBTdG9wIFBUUCBDbG9jayBkcml2ZXIgKi8NCj4g
PiAtCWlmIChjaGlwX2lkICE9IFJDQVJfR0VOMikNCj4gPiArCWlmIChpbmZvLT5jaGlwX2lkICE9
IFJDQVJfR0VOMikNCj4gPiAgCQlyYXZiX3B0cF9zdG9wKG5kZXYpOw0KPiANCj4gICBVZ2guLi4N
Cg0KU2FtZSBhcyBhYm92ZS4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4gDQo+ID4gIG91dF9k
aXNhYmxlX3JlZmNsazoNCj4gPiAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5yZWZjbGsp
Ow0KPiANCj4gTUJSLCBTZXJnZWkNCg==

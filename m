Return-Path: <linux-renesas-soc+bounces-723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7C805586
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 14:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099D41C20DFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 13:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1C65C912;
	Tue,  5 Dec 2023 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fD/jxeuV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F044A197;
	Tue,  5 Dec 2023 05:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqIxBcRkk7M24oHd5NkrTDBLDbE341LHbVwWwXzSMSAICUUPBXTKKOnjIoFZA6aaI8eafJsbmJovNNljXK1HnLhM+YJ3NfsH4OadkCkmwZJ8pmzJ/InYxM6DBdYMaRCFZIfB3PzFxW/rJ1TTKpAfLU/jQHEACegbIp/bQUvXSl7JVl7Gia/Ch2EfxfHDpUC8l49cj9Q4GFXE5W8JMb7TX9TiwHSiq2PhWhUnJgx41/cdhJiaMhGhewHKffY5gg6eha/hn9Jut1iKp4V021vnezRWXiREhvA78z/vVLydZCG3oI0l8Fj3CiqycjH/G3To/hOGvZ4l4mEg//0Gp5/iBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1MTNzNA95yyfagHCciY1XTfPQX3luNoHDJ1oeUlHmc=;
 b=XBmTekEl7FSI2YE3HPU7IyjOz8BOZd5kETki8NU4pfoNWrKZlWmcQwT9XeJ+qhc020KTQahcZeJFCPL3qAWTHZysAAkw4G7dAYhktJxxuTztM5+OrQa9plOCPYTzBsuZH24R+1aH/blghbkWhma/eaZ+4NtUQ+SyMqNpl7FhK1TBJMawRcDoh8Z4tt4ENzRHeZEfrOBmHAaAdIFask5NrY3uxxqOr0is58Ls3qzE6JSd+Dr1pAMDh19t3S2rLxX96+9KciPF57LbwKotjfnBDOwF043an5oZlMnAkGCsAGbhGpNeb2Vzwyqa5gIUU1hTZzcaNCpNT56FNBMIywLePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1MTNzNA95yyfagHCciY1XTfPQX3luNoHDJ1oeUlHmc=;
 b=fD/jxeuVXO3wCkMoW38gcMJ+OUCwmB9vRwRYh2+IP4rIfPs0M4JVulEeSgH/xouS9hXcGxDQ2scVgxQt6YA0t2BklJ7/5V4xnDa+eujeNdu+i83G5yr3Fpz+zYFWXL4XcW+9bdObiDRVDOOSKWzjxD2U20PCf7Fso35R3iR+kmQ=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB11079.jpnprd01.prod.outlook.com
 (2603:1096:400:396::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:10:10 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 13:10:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v3.1 4/8] dt-bindings: mfd: dlg,da9063: Update watchdog
 property
Thread-Topic: [PATCH v3.1 4/8] dt-bindings: mfd: dlg,da9063: Update watchdog
 property
Thread-Index: AQHaJtbmWS3jOO0rck6OGGJj8hSBy7CaX6yAgABLOgA=
Date: Tue, 5 Dec 2023 13:10:10 +0000
Message-ID:
 <TYCPR01MB112692C09A4A9FF4FC592E2858685A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdVkyQK3AdRN6V9G_AWCYmUbfRF3q4Y-rBnGfqPbdcJB0A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVkyQK3AdRN6V9G_AWCYmUbfRF3q4Y-rBnGfqPbdcJB0A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB11079:EE_
x-ms-office365-filtering-correlation-id: b9c92fdf-5c26-4f30-69e7-08dbf59382d6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IPXW23sjwVdvCvhzvgCNV/i8yIazGUXcgUt7ounz+rKzXX4PLtRXO7n34JAP2NUQn26tDwMMHqMBg7JWM3yEbXm9qc1jjaoFix31NtzhbNyZtGWeo0vrFJWHCpSTMHVygZkvF4VUbKgA3caaFJF7s9vhcFJH4A1T2WIyUPBEMUaOjk9kwN8GUiDSHacinlqdOLXuZSE0SkglTLYrMJal3nJy3diOrnfId1BrN0uobZDiAb4ED7ScB4eCV+60cIk7/AY6BvJAl2Kcq1Itk86/2NBpcJRsPSUFGPNN8GImB+auVuratVW98euR+qpn0pE9U2DwGKKXV0OZV+4/S2Z73rwmOxlY+MmVOKJINIHRiaD/SSoTV52iSnjeShypWh6cGb2F0SSvF+Xvjizl5QYnJG3z7RZ6u9Z6HeCa2UsC46DYHwi7Uxe7W98gC3NQ4O7SWegFkBOBpd6246ENXpOqFVxAopNyW2eKcrlS+umLaQdriNS9OAIQil9FGlPOENpSaTl5tte65ZvYgF3QJ3wTDySwGqPrOejI3+KVwF/TEZbY+vb0HbFC6q8Egim6hQw0ktiA6NR5F+b+RuxtL9Dl1/mRLBS0SRt2m2ewtB44LTynK2ECKiIngN7lfGYQ1Rgm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6916009)(316002)(64756008)(54906003)(66446008)(66476007)(76116006)(66556008)(66946007)(478600001)(71200400001)(15650500001)(5660300002)(7416002)(38070700009)(41300700001)(2906002)(4744005)(33656002)(52536014)(4326008)(8676002)(8936002)(86362001)(55016003)(122000001)(83380400001)(26005)(38100700002)(7696005)(53546011)(6506007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDF4b2VaQU9DZ3pIRTV5Nk54dGxtYWIvN3VQUnZheTFjZ2lBd3F1dm9rNG9s?=
 =?utf-8?B?OEZLUkM2UElIODVzUHkyWEZsMHFpME5JbHpOSlF6dmJHaVJ2ZnczaWlJZUhK?=
 =?utf-8?B?Z1hxR1o0cHo0ekxNK0J2MWFRZGFMSW9JMUl2RDIyTGd2WW5FOVF1a2xib1p5?=
 =?utf-8?B?QTZBSmdST0VTMUNHNjFxZTJRNDlLVlJubXFrWUdqYjZ5aFQ3a2I3RWJ6a1Jv?=
 =?utf-8?B?OFpxbzhIYTdYRGo3QWJKQWFudkRnNnFwTFpqNHJNL0tHanZzTjl6RUVUUEQz?=
 =?utf-8?B?TXp0bVdmK0pHajU2SmVKaVpCQk1HRUhOQ3IzQi9wcGZBVVlzSnNFOHNaNmdF?=
 =?utf-8?B?dkdEOGtJL0VWMTAwM1NzY0RLc2dEMEhXeGdlbXFqYXNVcUlHcmROKzMwbTdt?=
 =?utf-8?B?SmYxeUFiaWw1N1V5L2Q3L1RrRC8wU1VUOGw3eXdEZ1BmZmdiV0RGM2c2aTBp?=
 =?utf-8?B?V2IxOXNmb2ptaFdsMXNuODFVMVVoemF0aDdRSlFubkN6M3l3blVVNUFubzJV?=
 =?utf-8?B?bThLWThpSUthZmpqSUcwZ2ZpeCtGK3IwK2dNOXIyZG1MTHNQclVzQks1Undu?=
 =?utf-8?B?S3IvcVQwUUVJdmNiOVZMUEhITC9yZ1dzd1FzRjBnOFJDbXZpNUlGbFRINnJ6?=
 =?utf-8?B?dzJVeWdoUHhOc09xRm44VjVnakRmalJCNnZSZWRkUzErUGdhZG5jY0RlL0wy?=
 =?utf-8?B?TUpac3crWTV3aFp2WkZaTFpZUDVwSHdILzVGZlcrZ2p5aVNNRlBjTThOeGpC?=
 =?utf-8?B?K002ejh3TmRQNzl6dkhxUXo0MXloQytHY1pxd2xGOVlndEp4cVB4SVhBSGNv?=
 =?utf-8?B?RzBuTjNWeSt2VW43aVB6emd2dHN6RUlacVNVekF4UzAya1hLWmVIWm0vS0FF?=
 =?utf-8?B?aEloR0ZGSW0zMEZkZmlNRWRMVThub04zWWxURDkwWDE4NUJrYmhicnVRNDFV?=
 =?utf-8?B?dlg2VmVSNDhYU3hVVjZhNTFicWZIWEMyaXA1QVRaYkpqNlhFb3h0N3VZQmY1?=
 =?utf-8?B?STR1RHVuZHZFekhRbmt4VlRNeEQyc09ob2hBTkNiUDNvdHhEbGU3enRHQlkr?=
 =?utf-8?B?TWNrZDdtTEhWU1lyTzhmcENZRkVCeTFlOEJHM3JPd0o1bFp0S1h4cERlWXRz?=
 =?utf-8?B?NDlyRjZjZVBLZU9MSXlLQU1nT1hMcTUyZGRZc2RDbDg3LzRPeVROZmdiODFk?=
 =?utf-8?B?NFV1QkpmMWVNaGY4Um1RaVZNVmtQa1NKOFlobWdPd1dLRTlhK1NvZ0F5ZENu?=
 =?utf-8?B?UGtWaU10SzM1ZDNLa0FNaEN6RlZFN3BmdVVTcHZHQTJBajlzZmpOdTN6ZGxU?=
 =?utf-8?B?RFY4TndDM2xjbGJNRDdPTGxjYXR3ZmZmckZtWGllTEN6bTcyMjcxcTN6Vmtx?=
 =?utf-8?B?SEQ2aytMckpPL0ZCR0k1UW1sRngxeFZKYThrcDlaMnZtTjM5TWh5OWxZQ2l4?=
 =?utf-8?B?WWJranI0VWtDdWVuU0RJSDdXK3pOVVlrUmRoVWFJN256ZUZNeWFIMTBTNTFB?=
 =?utf-8?B?ZG5Ka2RWZyszUWdxdU1uR0padDJWamVqSjlGZE44VnBRWGNUTTdMMjlUNnN0?=
 =?utf-8?B?OEhPSDEyalBKT1k4WG5TUTVSSnlaMTNuSEVvb2RLaFVUMVdvNFZNSjQ4WklB?=
 =?utf-8?B?ODArdFZLanQ4QVNKRDNnZFJvc3ZMTnU5SzNBbm5xTjJsUnlkdEdGTy9ZdEVH?=
 =?utf-8?B?dDRuMjQyWlVlNE1hWVpyTERuMmx2RXZrQ2FnVzJvN0UzdjZ6NXZ6VDBIanJi?=
 =?utf-8?B?d1prY1pEaHFUTDIrSU4xWDZuQVQ2YmVyKzJ2NExOMFFIVWpiVmo1cXJiK0o3?=
 =?utf-8?B?V0pXR1FGVXFnZkc1K1dTb1c4YlBlVzRMWDJBWHZnajVaRlVULzlveTdib0Ry?=
 =?utf-8?B?eEwvV2RobTdJMnNhVk9INit1Q081Tno2TDJvcWdsTFFETDFJeDVMS1B6anlM?=
 =?utf-8?B?RkhzMUozalhLZjhKQ0dBNTRyNUtZUWcrN0ljbEsrMmpsSFF3UjN1UW45T0Vq?=
 =?utf-8?B?Um5SSG05M01GWGJRZDJiVTRBczc2N1VCU1hvSFU2eTNzNU14bjZwRytTeEhv?=
 =?utf-8?B?NHZvWHJOajFYRnBwSHoxZ1JrV2VIR0NLS253RG9qbVJLQXYxKzZnL3hvajFh?=
 =?utf-8?B?ZmFKYVRhbS9saFFtRkhZb2ZHdDhaRWk0R245K2JwRDlqcFM0M2dSUG45aUo3?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c92fdf-5c26-4f30-69e7-08dbf59382d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 13:10:10.6955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7jr5fUM23U3WpxwKnTAASuJgMhXfjfpSiHnW7rhOZ1bYGBglUXOOMbebsGxZZ6NLXxvhnt+yqo+XYUZLih8UUX44wokqen29ZmWnJv288Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11079

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDUsIDIwMjMgODo0MCBBTQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzLjEgNC84XSBkdC1iaW5kaW5nczogbWZkOiBkbGcsZGE5MDYzOiBV
cGRhdGUNCj4gd2F0Y2hkb2cgcHJvcGVydHkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBPbiBNb24sIERlYyA0LCAyMDIzIGF0IDY6MjXigK9QTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFVwZGF0
ZSB3YXRjaGRvZyBwcm9wZXJ0eSBieSByZWZlcnJpbmcgdG8gZGxnLGRhOTA2Mi13YXRjaGRvZyBi
aW5kaW5nDQo+ID4gZmlsZQ0KPiANCj4gcy9wcm9wZXJ0eS9jaGlsZCBub2RlLz8NCg0KQWdyZWVk
LiBXaWxsIGZpeCB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gYW5kIGRyb3AgaXRz
IGRlZmluaXRpb24gZnJvbSB0aGlzIGZpbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gQWNrZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+ID4gLS0tDQo+ID4gdjMtPnYzLjE6
DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K


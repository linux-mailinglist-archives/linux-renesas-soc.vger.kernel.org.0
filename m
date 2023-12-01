Return-Path: <linux-renesas-soc+bounces-528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34806800DE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 16:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02BADB21340
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 15:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DFC125D7;
	Fri,  1 Dec 2023 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Pfp+cSJj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5653A193
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 07:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9OBVwtqBjZA0rWsO+y5d/bY+GyesUsypg+FWkUOjaA1tQ3rdhe0Tc+SEaN3Ity+Cl3cnrbNn9df23MzXTrMTlMxgm5mMifDqcbpoGyng+6zbgt+BY9yIo+mksSM3gp8tugJHAp5ncTdsTTqV8KS9mDh6x6rM7mkuNCvZKe+4EoC2CYUfd25iADXqIV7p64PGl2SU+3SafsL5uu87mZxs+WnZy08XBFs+h6PeJ84dDDxHMRw+hf9+ia5jVaHLFVm8b6UQcN/WmCMbhIXmSDlrcW+UVdG9tikLmSNIv/YYL4kIQoEPpRWRGyt0PhK9wMqsb6K+zOTCKdUTOqUMRbzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JIisUjmbpR2eGRd/AQD4Li0odglgn86eW2pNcw1rfA=;
 b=JOnCXwjqqtWoFlWEyowLEdQcen+es6qNGZ6vFOk8yWIau/gQbmLQun7eY70qlD+neZz7MIIKTMzXXRyhkQiGY5uCSGqzpmcrjSxHeeMzm4C5N9tizWeJQAfwqx/KKQKLRXghYglh174QmDClQxGqy3Z7QGwZPPYAfJXq12DqhmveUAdCZ9PPrWWimdrVVWOnY5oaHQxkGxsGtfgNcxu1NQKjixVmVgCS8RPo/DFNk3auQowb0lXJLXdvYKmUZT0UHFHMjGr+Jea8V75dmS89YzlbBaKCyUff5gsIGZTgO+m3cjy75mfQ5HJsT40Zsr4ARonVKhQlWDoS01FqcWTtXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JIisUjmbpR2eGRd/AQD4Li0odglgn86eW2pNcw1rfA=;
 b=Pfp+cSJjvI/zf1E6nbF1GP9pizXPLN2SsBnNCwsAAVbYLt3y4GoPb3HSSz3BLsn1IH95Pe1joicY3TTVvfySDQ2ez34SRSZTwyOenwqQwHeDO2RNPdaJ2S1T1oInwU4jt52fSNcAorMPaxObv+c1iB4Tq4gg1LQm3fz/F79chlI=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB7774.jpnprd01.prod.outlook.com
 (2603:1096:400:17b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Fri, 1 Dec
 2023 15:02:26 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 15:02:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann
	<arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
	<nfraprado@collabora.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Udit
 Kumar <u-kumar1@ti.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
Thread-Topic: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
Thread-Index: AQHaJEbR2tmw26FlxU+RAXf4dl1/ebCUb5gAgAAWQGA=
Date: Fri, 1 Dec 2023 15:02:24 +0000
Message-ID:
 <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB7774:EE_
x-ms-office365-filtering-correlation-id: c5eca482-4b4f-4df8-def5-08dbf27e86ca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 99O2f8uOu3l2BjILltiHqqr5uRMalNcmQk53sDtIn9eEw0uTHg+wByrEhNPDHvG4QbO2rr0qghPlXP0LkVW/gfwWWKoGFXpsjZccuKwt18KMuc0m7UtqP93sbA5PWvLJ1Cnep+xrw7KnXyA8+cldvOnHv9v30hY9O7Rc6qjzdVYi7VOvBuz7EnhJFRGspx/AA6FJ4SMNKhQKUfEr5j70cAFbesKkPyv+jL/6mCgh8A2tBAMV+byeavGz9BueQEvkytgJyL95lxoaaBEcRhrHp8CKFQFJ1MXZraEwfaChuDlC9gmB/V7AJVJcIyjhcMvgwCxxUkiE6H0qNpM/0tZ4QQkooSX3n6SsjSV0WUbogEf6wkwqwDDnkzcF3f8bMswEBr+ngcWtX0D3YpAlOe5d5xM+G3FJF4KAKdIex4pfYsJbg7iHhwe9vlTL64re9cWziczl3NglU9dyq0fle4x7iTPz7bMud5LmppD+rsAM9VXBNj6HoGFm1VaORuTeAQLnZA6sbrv9MSUYDo4BEf0f2cvUMyhLMBGFEjtRj3GQaeLmTWWaD7G6cKzGVrNTYlYm6ZAh5z17Zofm+OI5KTgwU5gKSJponGLU5g5dAU3wSF/+SJWoPzNmN8hZZ8xB0Pyc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7416002)(54906003)(64756008)(66446008)(66476007)(66556008)(122000001)(316002)(76116006)(9686003)(86362001)(66946007)(41300700001)(52536014)(2906002)(38070700009)(5660300002)(38100700002)(6916009)(55016003)(33656002)(83380400001)(26005)(478600001)(6506007)(53546011)(7696005)(8936002)(8676002)(4326008)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHJ5TkFySytQMHVyU2Z5eHUySzBZVDk1L3ZmdXV1MmlHWWhVSlNTQjlRdi9L?=
 =?utf-8?B?TFBOY09Va0g0U2J0aGVXNDJLcVFtc1hpa1JoU2dQOVhOQ3hVUjhaaXh4VTE4?=
 =?utf-8?B?MHAzd05WRUsyd0E0RnFLdGFmY1pOeUk0aXFHMElVZjNiOFIyajRnTHFVZDRH?=
 =?utf-8?B?RzcwcWdMNWVQM2dFb2lwS1AraEl3MExGY3JsUkgrK2JCdkxpMlVzbHFMdkZ2?=
 =?utf-8?B?S0RaUkFUR2M3UmprZEdZMnZTRWhod3BVbHlCQlU2endTWm5rdTFnaDBjNUh1?=
 =?utf-8?B?Q3U5SFpCdjlFRXkvUEdxOFgyb1VrQTY2aGdSaXNEVnk1TUVRQ1ZmOVdtdFhE?=
 =?utf-8?B?U3RkYXBvSVdBMWtOZWMwMWkrdnpmVjJvWmZLYlNiK1dWdTJ6SlBMNkNXcUFy?=
 =?utf-8?B?akVmakhPbjNvdW1TWHFINVd5U3Z3S0Uyc0JqdzAwbFdYb21aeDM2eHF6bmxE?=
 =?utf-8?B?UFh2RVZzOWdRNDhjT1QxOGE2ZVFleWluQTN5STlXV29IMWNJTTByS0VCajhJ?=
 =?utf-8?B?c3lMZWFHZ2NEby9EQXlKQUhULzV5cXpzRUdLdGxqeVVwWXdoYUZPS2k5TUl6?=
 =?utf-8?B?NWNzNmtlWjRzbzJraHZGckdTOEtFRGk2a2hkMzljV0FCaTBhWDR6d1hEK1ZQ?=
 =?utf-8?B?ZHBNRW1XM2R2QnBpVHFJN2FEdzRRd0NoUERod0FyYTZZWklkdFVUSlFjSVlX?=
 =?utf-8?B?YjExV3djakp0M3RuT0c4OVYweUVwdnJ3cXpXY3pPM05QOHYyMHd1dHcvcWhr?=
 =?utf-8?B?ZEpzeDNDbmZJM0FIZUlEMHpvRkM5QUtUaWo1dTRzR2hKeEZpQTBoTzBZMUJl?=
 =?utf-8?B?bnR1Yzh0WURRejNPanJvOW05VG0rWXdTcHhra0dpbExoZk1qR1NYZFhmOFhS?=
 =?utf-8?B?UTE0QWdyN3J2dzJSblZ3SXpwTE5uVnIvbis1aG5kaDdtK1VDelJXdUlGZzJU?=
 =?utf-8?B?ZXJ4RXBTRVcvWmxMZlFHZGprak9saG5xOW1YTTgzbDF0ZER2MGhpQTZMa011?=
 =?utf-8?B?aDZMbjFiQTNyeUFhQ1N6eWREVy9zUERoYllEbXgzb25qb3VwNERmMkN3MC9X?=
 =?utf-8?B?ajdZRHR0d3M5bUJ5cGoxdE1hYmFvWkNGeWdqVCtxdVdiOXlUSjZkM2JKczV0?=
 =?utf-8?B?MDdOQUJwMUdDeWdLdzFpMXBxYlJ2anlhL20vWGp3aTA1YjlMVG02enhpZUY1?=
 =?utf-8?B?OElBNWFsZWdzb21wUnZIdGtyMysxcG5YUnFQWUwzZnE3V0hXK3oxdU1xUGdX?=
 =?utf-8?B?TGNTalJYZjMxdlhzUEVKcER2WkFmN25wSE4yWDRya25KWGdPT1VIb1NBNnRH?=
 =?utf-8?B?SGlyK0VGaTZHT3hFS2lBbnBIQ2M5QTdvMXFIdGNBb2JGQXNkVjVhbFpjeWlw?=
 =?utf-8?B?YWNtRDY1TmRyQ2xVdlh4c0dIeXRMb3RNTVh1VjBJZmlVM3JxVlJBbm9LTGVQ?=
 =?utf-8?B?MkJYK1B0TytCcU5HcXh0UkNEdlBuWWxLVzFxbjE1Szh1SG1qNEJpbTc1aDdp?=
 =?utf-8?B?QUVwZzhPUXc5K1B5S3VmVGVrVjZTUHVuTTIxaHRHbVhKSGRyQm9RdHhSYkUr?=
 =?utf-8?B?VisvamxvaFMrSlN4cStUN3EwZnNMQVE4U0RiVnVNSUJPY29BNDZIeitHcEQz?=
 =?utf-8?B?MmRQVk1iakl2MWQydTFxVHVaR2pnWGo4dFpUa05UTUNrNncxTjRRUmxsTElr?=
 =?utf-8?B?TGtrLzIyUUZuYUdiR3ErWitsdzJYSlRHUUFHU3E1NUJxRVZIU2s0ZG15Y0Fw?=
 =?utf-8?B?OWpOODN0VFN3K1JNZ0FrM1h0ZVBZVUJJd045Zno4K2VpcE9wQkRVeXM2NjIy?=
 =?utf-8?B?L0svWDdUVWNQSGFnZ0xUcGIxSzVHOFNHZHJyaE5JS0VXQldSVTdwSjJoUUor?=
 =?utf-8?B?NFVYenhxd2RpN1VVcllNbmQxOGJvek9LaW1NMGpIR2xZa3kxYkZ6eFJrRnZZ?=
 =?utf-8?B?dWVoTEdMbTVET3Bza1Z0am9uTnFuSUJDTnFPam9LYTJCWEFqVGwvTXV4UVhK?=
 =?utf-8?B?OUZFQkV1SldrSTBVakw2Q20zWFNPSnQ5NXRia3VCelpSazF6bFlOR0RNalh0?=
 =?utf-8?B?MkhkK3FpWlh3L3VDUFNSUDJ3Qzd1SnEyeU8vZXRjM242WW1GTXJYeStYYUN1?=
 =?utf-8?B?WFBTOHVnRHduaW1ycDZzcUV2UmNQdGNYMkFRR29SUU5acGt1M2xpQ2hIbkxt?=
 =?utf-8?B?c0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eca482-4b4f-4df8-def5-08dbf27e86ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 15:02:24.4171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8J11luMm9GZLnoAOicb0hEZM8Ul2tAL2d5EXAN+cLnNx7ryvM1Vlaix9VFIcfVSd8yKJhquRnBA7vyDSMT/Mv+wwW1eLT9C+I0PoWT/FL9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7774

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMSwgMjAyMyAxOjQxIFBNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggNi82XSBhcm02NDogZGVmY29uZmlnOiBFbmFibGUgUmVuZXNhcyBEQTkw
NjIgZGVmY29uZmlnDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBEZWMgMSwgMjAyMyBh
dCAxMjowOeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gRW5hYmxlIHRoZSBjb25maWcgZm9yIHRoZSBSZW5lc2FzIERBOTA2MiBQTUlDIGFu
ZCBSVEMsIGFzIGl0IGlzDQo+ID4gcG9wdWxhdGVkIG9uIFJaL0cyVUwgU01BUkMgRVZLLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gTEdUTSwgYnV0IEkgd291bGQg
aGF2ZSBleHBlY3RlZCAoYXQgbGVhc3QpDQo+IA0KPiAgICAgQ09ORklHX0lOUFVUX0RBOTA2M19P
TktFWT1tDQo+IA0KPiB0b28sIGNmci4gbXkgY29tbWVudHMgb24gcGF0Y2ggNS82Lg0KDQpJIGhh
dmUgdGVzdGVkIHRoaXMsIGJ1dCBJIGdldCAiZGE5MDYzLW9ua2V5IGRhOTA2Mi1vbmtleTogZXJy
b3IgLUVOWElPOiBJUlEgT05LRVkgbm90IGZvdW5kIg0KU28sIEkgd29uJ3QgYmUgYWJsZSB0byB0
ZXN0IG9ua2V5IGV2ZW50cy4gU28gcGxhYW5pbmcgdG8gZGlzYWJsZSB0aGlzIG5vZGUuDQoNCkNo
ZWVycywNCkJpanUNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=


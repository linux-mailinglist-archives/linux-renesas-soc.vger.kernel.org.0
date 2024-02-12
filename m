Return-Path: <linux-renesas-soc+bounces-2648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB6851AE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 18:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EFD61F2A31B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7A23E46D;
	Mon, 12 Feb 2024 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SEgluqXv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2064.outbound.protection.outlook.com [40.107.113.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C523D984
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 17:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757597; cv=fail; b=Wki5p61mZRtx8NeKhBqADO7fauzpd6PL4oHLVe57zLCT5xbFp2f5vYQSCFZSuy956ePDfvDTh4yyfsLiIe7BhpW7lqRr6148dmXv1e1xU/JDibxdycqa9tP9irQ20SIuXQ8jfKWHWkGyW0C9lTpkaf24wyIBYzW7YKYlC0yKSTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757597; c=relaxed/simple;
	bh=yMpplJvgqAOhrcwYRJ2srx6wPcBOjtajY7eBs2cY9Do=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZFci2eogTeR7mDPgQDptkh8CD5EgHlxF/pCXt8ukq815xDSC2ihkxQa/q+VsIHfCyPjDYkyRpuZbaQnx64XB2cLOEFqmfb0hHiTrPoYZcVzbWz5Tn9nBB2jzL7lSOEuKJoHPFZ8xUPU4LqHauEXIpvBaayb4r+8lbVrQi0eFJ7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SEgluqXv; arc=fail smtp.client-ip=40.107.113.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEj67T0fjqh0ZEljf6nf0lhqDrq5XOqSZ+iIXd10pyG2Lq3KvU+EAPkQx3xv8tW7/hjN+eUV4cSdxUhwGAY3kXdSMo+Akm903xaPjrum9VleyqgCubOC0ZLQnoaP+j1kNu6tjaREJcMjlrrpTKbv6+Bv3JF1q9VTfQQD6hU+dLx8NsEIju8SUEYV+iAi+wmVGMLFiCOmCdi8OPi9fY1K5S1ioeMHeOpHeUf9tCMkM8zwF8o/WJEIXvjMfmKecMt53T8xHWHHc8BJpj/wCxbGyTGeGPc/u80mOofqnz233SlTZZy+4MOntpvJXL1z61+TaY9bD0h1eYlRoLlX0mOTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMpplJvgqAOhrcwYRJ2srx6wPcBOjtajY7eBs2cY9Do=;
 b=BZXaMUJv43zGdl/AZuwPg66A4rWLYZb4eY1n3jQ8cuVANrOjZgWmaPSpvDvI18P250e27S15H9PvPN1vtcjsljgSZFxNNCMyitgp5FO3MV3lm5PRykVIrfxMbmYNwNcDf2uVHYVaagEdl7epJkP1o0hRND4ri+f+I292CGbP2ENV5SH+M2Hm64ovTzMSfTJesz4p0u+tlqZRjDzTNcOSInYmw9e6sEkb+lzvqXtT2+wqIyZuxI2fwPTvUT2H+yB6imVWeaP65f/qERsfrBHY7qpaTZugGBWexIv1woBxIYXcicquBmnE6mqPoYyEsthfF22GsuRt07uGku16W7TPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMpplJvgqAOhrcwYRJ2srx6wPcBOjtajY7eBs2cY9Do=;
 b=SEgluqXvIZTwEDwqiL4EqnVJ43e8bNz2UXM43lbAeu1SyFhO9+OmkqxPbPdE/OXicxeed50zgmDuryTe90KnR3DAbeg5Dod6zPfOwL/tmmMRBbg2XZw7D/magNaw34mL8ZnoZh1yGauxFp45+cFYUiolppkHAWQtArMEa8E/V6U=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB9585.jpnprd01.prod.outlook.com
 (2603:1096:400:192::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 17:06:31 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 17:06:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/5] irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
Thread-Topic: [PATCH 2/5] irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
Thread-Index: AQHaXafZ1pY+WzOBgUurMpQ0B2JPLLEG6H0AgAAHkdA=
Date: Mon, 12 Feb 2024 17:06:30 +0000
Message-ID:
 <TYCPR01MB1126909E3F8414BB18EB1FAD286482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXZ0_O8-bjB9NyOKc3JKHjcE_w3wrhgQN3Ur7A8DvovKA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXZ0_O8-bjB9NyOKc3JKHjcE_w3wrhgQN3Ur7A8DvovKA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB9585:EE_
x-ms-office365-filtering-correlation-id: e1e39174-50e2-4dfa-d1f1-08dc2becf540
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SI5p75BiY1eYwMdcUGnsXsJ78Vi2/Vqpx4pNkEBpAJzr91pMgx5MhHEDY20PnQ/xTcZSMMDjHXDMw0JN87z6IDNOtGotqaVYWWwh9ktboor4eXIjNILbnlKvseVrZfVDgQqXOUZfcryGYaYxRXEP05QwjCdapkoygrwZM2v/hq2QTz1mWAR0aH71il7d3nAEID3ZJGp/C2VYp6mk3CoEXPyDoLgd/oqP0avEc6pvdPpPAMwuQVSg13b1xV83G9mV8JEN+LTWXbfoCZKXd2ZWH1NEHOPWvI8lN/sArQO/ZvAZZRXt22ucBDgfmhJ5LlyBeKF1hCKPq+tJ9ISBTGxhReRJMIQC6gedvRf9gmPQ/kWFwH/UlosO1ifTVCvt0xukF7uJjeg5I7S33VwcTAO4hKIHF5kvmexgkr9QQm7vIbRxFJEhdR75uY3Gu4z94NrnKHc4ayllMwA4FO1dWwA/9O2xJ/j1syLPhplc0X22zjFp77P7OePMYlXu4fzE64nDhsZGDG9ZRFJqQ4figPUIOLYoHXjnQcp3avjK8Pgmp6Rs9b55yYnsgC8mmH6dmaysoyWQp8fK+AalRMWl6YYGOY76hAVFVOf5T5DBkJjdb8LuqXFheHGcYRH4kHREiXfi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(5660300002)(55016003)(9686003)(41300700001)(26005)(122000001)(38100700002)(86362001)(71200400001)(53546011)(7696005)(66556008)(316002)(8936002)(8676002)(54906003)(6506007)(66476007)(66446008)(64756008)(52536014)(6916009)(76116006)(4326008)(66946007)(83380400001)(33656002)(478600001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SyswUEVNRG5SZWd0WHcxS3Ayb0YvNHIrTGJRVEx4eko5NXAvWGVKaGQ3aTVs?=
 =?utf-8?B?NllrczFrWTMvYnp6anJsQmprSU5pODVBa2NXd3YzRGhwNmJoc21YelpGRkxm?=
 =?utf-8?B?bkgydUZpNXB0YUVWMC83T3NRT3EvMG1sNGFHRW1SUnNmWE4xWmpPWU5lc3Rq?=
 =?utf-8?B?M0F5d2gvWENyTk9WTEdVKzdIN0M5MDRIaGdsVHkrRHJDT3FBVUoxc2dDdDl1?=
 =?utf-8?B?cFdXYXRTUmluanI3YXRuWjZpQ1c3T1NWaWJ3bThjelMwek50WURPUFVTaC9U?=
 =?utf-8?B?SG9qb1lQbUcrU0VRY2hFU1lwaS91TXpIMlFyeDV0RnJkQ2dKZlpxdHBYT0Uv?=
 =?utf-8?B?czRXcnBhSG1zcFV5V25SOEhIV0l2aU1McG4xTFhtREJ0bUJtTkdwaVMvVUVV?=
 =?utf-8?B?R0kzZy9pNm5TL3pYS1Q3bi91Qzc3Q3ZUWDFGV2VMUDRrb3JEZjN3SkVqSm4x?=
 =?utf-8?B?Vk1xSUUwOVg5YWR5a3lncjJwQk8zYTBYMFNKaFRiWjFHdG1hLzNXYXE5WWYz?=
 =?utf-8?B?aThXcG56aVRtY1QxSHdZSDh5bmx2a2tYUWt1N3BFdWUxOGhkUE1xL3NBcDhw?=
 =?utf-8?B?MHpJUzdCM2tBa25zc0M5RVFNRzNKa1FOWmZLekFQUjU2ckdwUk9hSitWZisx?=
 =?utf-8?B?SDd0YW5qL2xpaEdyWkdqWDJQY3l1aTZHdDVrc0o2Z3cxTFJ2VkJqdGl4bUNP?=
 =?utf-8?B?eC9oTkxZdGZiVUpmTE9IT0NkSjNPQkRmVVEwcGFWUHhFSFdqblBLZEFIWHdB?=
 =?utf-8?B?Vkw2ZkFzYXlneGp2bUpoUVRhdGNOSVdQNXg4ZG9TeFptTllWQ0d0OGN2UnFu?=
 =?utf-8?B?aXF4WEhuRzRMVzRsT1gwTERTRSt6N0pOcGpHRWFaSktycnFxVWJ5QkhqWEox?=
 =?utf-8?B?SGk5VEZsMVVOQ2pIWTFoUGJCbVlxL3M2cnNOR0J4dHhUcVcwaXV6S3FXdXF0?=
 =?utf-8?B?ZC9UakxJa3d2N3JaQVpjT3cyWm0wai95SStEUWMwN3NYOGxVMUV3djhqOVFQ?=
 =?utf-8?B?SU5lcnhHRzV0eTlmZ2hOMStNSGxUeEFJcDdEaXlkeUJLbEF5U04zUVlSQ0Jr?=
 =?utf-8?B?TWVma3dSMmY3QTQvSDR0bXR1TS9WQlN5NExWM1FncGplWjVWSVdKSE1MSStZ?=
 =?utf-8?B?U3RTaXJFOEgyRGpUNkN5SCs5d09MSjdDSVlVMTNGRWplZ3N6WGN1S0FMeWZl?=
 =?utf-8?B?R2x0ZDBtaEdMRk9SbEdYbEJlbDB5eHNvZVZJQkhCNkplYlRYaG9zVWgxeEdO?=
 =?utf-8?B?bTB2RkFJRjlTREhTbUMwd2xiZXpTMTFsbUMrWGYvNGhOVTRlUTl1dDdIWm5n?=
 =?utf-8?B?NnZPaURkV1ZiQlE2TjZNTlhTSmg2ZFp0cGlXV0ltYVhza2VUUyt1eHdOY0NM?=
 =?utf-8?B?dk5Fc0J2TVgzdFF0cjg3b2dMbkJMSkp4LzBSWmFDTXdDb1FmMkhHeDBxcngy?=
 =?utf-8?B?TVNHR3RHTUlER1JtR09sRnZPQU9UNnJ6Kzd0VUV6NWtTdUpOU2l4d2x3d0o5?=
 =?utf-8?B?UThlUFFtYmVpN2xQc1hzTFg3cmxaTUMrWE1nbFYyQzJQbHVRdjhvbEkrUWFz?=
 =?utf-8?B?SXFNWVhxYXNENVhkOCtPV1ZheU93ZDVMNy9GOTZGSXVia09jMGt4ejdtWExS?=
 =?utf-8?B?bENZZVpFWEM3TjRTbXZFdnVUT2hPSWFNblp0OHNaSnhaMERKaVI1S0R3ZGU3?=
 =?utf-8?B?TkNQR1U2Q2RaRHBGU2gySjhIdkZOTDBwNDBYRDNTSVZKNWl1MmIveW5vQzBF?=
 =?utf-8?B?cFhmQUdsVTcwR2RUb0lSaDA2OVdaaTNOSDQrNzkveEdyY2ZwZUFHdERsd2Er?=
 =?utf-8?B?Zm1DTVpJUm9yaGpDb3BLSElrUWRNaFNBNUZKM3BxK0hxM3pRYi9Qc1I4WWFh?=
 =?utf-8?B?VlZWR2FwQjNsNUFuU1lBeTEzbVRmQjN5ZURhOEQraVByem40b1ZLTDZ6QS9t?=
 =?utf-8?B?ZlU4YjY5ZTNkRndTZzFzSER1YTVhVy9SVEFYUTQ3WUNaYzNacXBJYXNTN0hZ?=
 =?utf-8?B?OWRPWjI4MEZPY2luYmh2Q1NhOWxDY0RLUEE5YUwzWVBsazR4SVhhSCtObmR3?=
 =?utf-8?B?NWEzVHQ4bEJNd2dpbEtkam9jWko1SEpZWmx4TmZLeVlwcytaZFpaTzR4alBR?=
 =?utf-8?B?djRGKzE5L2ZZKyszTkNWZzFPNjVOMnBzYlNpZnFVMk1UYVlNTnlHNUxsODl3?=
 =?utf-8?B?UFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e39174-50e2-4dfa-d1f1-08dc2becf540
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 17:06:30.6482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PdkBfbUJYAnLitXiCaps3Ut0Eu8HxK0wo0xnu5ExkPcB+13Z59ioZcL1B2JzVxPs5hI9H0LUGrH6ZUh2c6GDxE0DtgbaCokSBNCi64Aylk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9585

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTIsIDIwMjQgNDozOCBQTQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDIvNV0gaXJxY2hpcC9yZW5lc2FzLXJ6ZzJsOiBSZW5hbWUgcnpnMmxf
dGludF9lb2koKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgRmViIDEyLCAyMDI0IGF0
IDEyOjM34oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90
ZToNCj4gPiBSZW5hbWUgcnpnMmxfdGludF9lb2ktPnJ6ZzJsX2NsZWFyX3RpbnRfaW50IGFuZCBz
aW1wbGlmeSB0aGUgY29kZSBieQ0KPiA+IHJlbW92aW5nIHJlZHVuZGFudCBwcml2IGFuZCBod19p
cnEgbG9jYWwgdmFyaWFibGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmVuZXNhcy1yemcybC5jDQo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1yZW5lc2FzLXJ6ZzJsLmMNCj4gPiBAQCAtMTAzLDExICsxMDMsMTAgQEAgc3RhdGljIHZvaWQg
cnpnMmxfaXJxX2VvaShzdHJ1Y3QgaXJxX2RhdGEgKmQpDQo+ID4gICAgICAgICAgICAgICAgIHdy
aXRlbF9yZWxheGVkKGlzY3IgJiB+Yml0LCBwcml2LT5iYXNlICsgSVNDUik7ICB9DQo+ID4NCj4g
PiAtc3RhdGljIHZvaWQgcnpnMmxfdGludF9lb2koc3RydWN0IGlycV9kYXRhICpkKQ0KPiA+ICtz
dGF0aWMgdm9pZCByemcybF9jbGVhcl90aW50X2ludChzdHJ1Y3QgcnpnMmxfaXJxY19wcml2ICpw
cml2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBo
d2lycSkNCj4gPiAgew0KPiA+IC0gICAgICAgdW5zaWduZWQgaW50IGh3X2lycSA9IGlycWRfdG9f
aHdpcnEoZCkgLSBJUlFDX1RJTlRfU1RBUlQ7DQo+ID4gLSAgICAgICBzdHJ1Y3QgcnpnMmxfaXJx
Y19wcml2ICpwcml2ID0gaXJxX2RhdGFfdG9fcHJpdihkKTsNCj4gPiAtICAgICAgIHUzMiBiaXQg
PSBCSVQoaHdfaXJxKTsNCj4gPiArICAgICAgIHUzMiBiaXQgPSBCSVQoaHdpcnEgLSBJUlFDX1RJ
TlRfU1RBUlQpOw0KPiA+ICAgICAgICAgdTMyIHJlZzsNCj4gPg0KPiA+ICAgICAgICAgcmVnID0g
cmVhZGxfcmVsYXhlZChwcml2LT5iYXNlICsgVFNDUik7IEBAIC0xMjcsNyArMTI2LDcgQEANCj4g
PiBzdGF0aWMgdm9pZCByemcybF9pcnFjX2VvaShzdHJ1Y3QgaXJxX2RhdGEgKmQpDQo+ID4gICAg
ICAgICBpZiAoaHdfaXJxID49IElSUUNfSVJRX1NUQVJUICYmIGh3X2lycSA8PSBJUlFDX0lSUV9D
T1VOVCkNCj4gPiAgICAgICAgICAgICAgICAgcnpnMmxfaXJxX2VvaShkKTsNCj4gPiAgICAgICAg
IGVsc2UgaWYgKGh3X2lycSA+PSBJUlFDX1RJTlRfU1RBUlQgJiYgaHdfaXJxIDwgSVJRQ19OVU1f
SVJRKQ0KPiA+IC0gICAgICAgICAgICAgICByemcybF90aW50X2VvaShkKTsNCj4gPiArICAgICAg
ICAgICAgICAgcnpnMmxfY2xlYXJfdGludF9pbnQocHJpdiwgaHdfaXJxKTsNCj4gDQo+IFBlcmhh
cHMgcGFzcyB0aGUgdGludCBudW1iZXIgKGkuZS4gImh3X2lycSAtIElSUUNfVElOVF9TVEFSVCIp
IGluc3RlYWQ/DQoNCkFncmVlZC4NCg0KPiANCj4gPiAgICAgICAgIHJhd19zcGluX3VubG9jaygm
cHJpdi0+bG9jayk7DQo+ID4gICAgICAgICBpcnFfY2hpcF9lb2lfcGFyZW50KGQpOw0KPiANCj4g
SSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBtYWtlIGEgc2ltaWxhciBjaGFuZ2UgdG8gcnpnMmxf
aXJxX2VvaSgpLg0KDQpPSyB3aWxsIGRvIHNpbWlsYXIgY2hhbmdlLg0KDQpDaGVlcnMsDQpCaWp1
DQo=


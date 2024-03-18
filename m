Return-Path: <linux-renesas-soc+bounces-3842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC887E5DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 10:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 119102827D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFAF2C1AA;
	Mon, 18 Mar 2024 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="paZeWg0z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B632C19E;
	Mon, 18 Mar 2024 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710754418; cv=fail; b=bRFymt+ELu50UWdatjaix8p3Y2+phHeDbaswaKh21CNL4L6GpwqDgaL7k7Ln2MvGVW3k68GdDPRHJhj6wst127HPZfJkgJJAAKpEXuO7ByLQTPsuIdkNIk7auO5OOplUkugwTo+r+ajTbK9I2qHDmc4+64nv0QTbkcvvdhbuLBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710754418; c=relaxed/simple;
	bh=Iyf56RVLl/Mvd7hvsvKn8XhR5eVNC72ZhYgBhc50rMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lFPHjRLhW7mSTg9a7egEvDklCI09Q8CxXmfFQqWN2m2L5MJg0nZVaqW2DSwdb5s8u4eTSTO3gEASwNNtvz3hkfQgPPOWKD02Yo6j04RIEPHCEZLv2sxOphRlLapM0QyowtoSds6Hd2a2W3rAR8f8yDqNPZ81lKjZlYSa57pFzvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=paZeWg0z; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7c04OJtDHQjTK90nJ4k5BDJBV8lJ6TMq6bvqllMkrBA32JcJreojUVU/B2V5HzopxgS//pKPy97ws2czi+waUxsTvKfbMHBKcWT5iGUIo0032Wtv27Ikily72PkzdjJs97xViQpKsjR3GIWlcts0OrvOqP3yKKDJbhEg6sMj3RmZymfGh0e4J2T7QzpMevun0qSKNeiZ76HSLvsg4SQlSdYXkdnxDmK98veLpY6rz4eFydeq38Gza5sFFnhR0rvg4ZePac1V9rfELL4Zc4yZkIq9D6Mp3lwqxUVKBWuEAh51GADvVuUfm+JSZiOI9Ug2sGFF39qqagbvFjvTF8H4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyf56RVLl/Mvd7hvsvKn8XhR5eVNC72ZhYgBhc50rMk=;
 b=L9ICslC/d36jLL647VFACyMEcw59HHl9LW6SDOnAGqDMv9VQLN3YwMTYeffD9mXyVUaqCcoSerEbvQisal5HiGOXiH3qQtMoQICjO8SZRHjbBAa1yJjHVuUwizQr8Fol4K5GRm/PVg2IrhO3kqnD3lUr1TZm09CaZbvJ02DWv+zE0ImcnIRZM5DIUMQhr5Q/sdKIu8C9lYs0TC+8OQYHaRygjLD9W02IfYSXhN8SSNtdPy/aUOcCwdvNjeWzIDMaM/a2Qqq9fRghaFzSWIi4iuq8qGOHP6qB2Jy0fGmZh7U195wB1R9JUuXM6nrm9V3JGTwnZgHmnxFcjk8jEc5Kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyf56RVLl/Mvd7hvsvKn8XhR5eVNC72ZhYgBhc50rMk=;
 b=paZeWg0zE00mD9gwKAkf6bs8vETd4VWzyHImbGYhxha8pyuaL1Pk/zJ/JpniQRHaB4Pqw4KJrxfIbTVB0oWCnKY0noNSq5I8MiVzo9bKSQ5yu7qOFWMMUh4Yiu5Rks6na99d3X9U7ySg2+EibapHOixlqm6TNZITq75ee/Y+fDU=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYCPR01MB9368.jpnprd01.prod.outlook.com (2603:1096:400:191::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Mon, 18 Mar
 2024 09:33:31 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.023; Mon, 18 Mar 2024
 09:33:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@pengutronix.de>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 4/7] usb: renesas_usbhs: Drop has_new_pipe_configs from
 struct renesas_usbhs_driver_param
Thread-Topic: [PATCH v3 4/7] usb: renesas_usbhs: Drop has_new_pipe_configs
 from struct renesas_usbhs_driver_param
Thread-Index: AQHadwgnRoYny1XiqkmoU356RSnAnbE9PX8AgAABlMA=
Date: Mon, 18 Mar 2024 09:33:30 +0000
Message-ID:
 <OSAPR01MB1587FB542C8E622F4D7A425C862D2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
 <20240315183921.375751-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXzSCpPSwHYzJrU7L=Lqftw=d4uV6gHMfDPjWDVH2BPbQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXzSCpPSwHYzJrU7L=Lqftw=d4uV6gHMfDPjWDVH2BPbQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYCPR01MB9368:EE_
x-ms-office365-filtering-correlation-id: a2396cdf-c0cf-4627-effb-08dc472e793a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 c2qnO7E9+59LqamcTHA4lL00YPY21H6t5JzbKyOOiMhIxQC2YHK8JmNVeTZfScGPKFwcN0JM/KxdI97HNkZO2LCzj/Td+mNlacT/5bidQ/J0jkF4ErTqbNJ8oBHHYt28mPSqMaJRCzz/pofZfSIoylYFyRsgRI60OS8tpanUPBqPzVtIQEv+f5sYQV4L532LnWNYOa+VKi4KMZ67AeW/x8Dn+e3eIBoZWL17rahg/DQuVv0qTWNZyhhh1SXAM72RDkJCqo6yL+gVt9cxZ4mJC06HbElbQlsVBZeS+yWwBtUDIOHXcOxrSdpFWyHZ4MiClnJh0Yqdqc4K7iCpv7oZ2QADPxl6eO/hjrCzqdvcTVIDbSmrRqWcTPF99wNZ1NmORvLcl3s3WGTZo8ijfEVv3Ht6AfIsicRKBvvrgGa0o1twVRkSfYtvQzWumvYDsxyZKYl5puHtR4LZC2mTxbJ0+9p+XYtfMzqpj9t+djirjWlLOdMrLCz6c/aatKUINpWuSf8o8ZMybrW20vD5Vv6gOGRFH71/4DB7OtbjF8K1disxDX8oL56QXapgr7FjWhrTNWeKc5XNWwenJyak5kN5zloXG9rsMzCzqERzkTC71Q6VbtcshXfGNW2AQqUTMVzAnZdsIYASfU2OLtyfTfnpGHF+M7fnzNalhdF2x26EeYBAlop6jYreDzBmmW1avbB5LE+HavoGQBcFMKuKCpzbKRcSPd0zZ4hIjzphFJjfX4o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1FQWFk5OWxVSUxad3FkVWd1c2JVci9sQmNPVk1UazVhNWx0b201aEFSVFE1?=
 =?utf-8?B?L0M2RXkrbXVVM0U4R2tsOWVTWGxxWmVRRitMbU8yYUowUk5WRzhucHNOZzJj?=
 =?utf-8?B?U1RZaG5TdVFYRGVJYmNER29naTloZFhjdlNPN2FxdXFSNTg4RWpOSHFDQ0Rp?=
 =?utf-8?B?aXFOVGxtWUM3UTNPRzFMclVYTE9kZWZsdnpMbjlJdXZlSm9DTXpOVVlhSkg5?=
 =?utf-8?B?Q0VyOFVNeFhzNVdsdEdpZjR5TXlORndQYmZwWHFWMm91dlh2b0lydDJkb2lL?=
 =?utf-8?B?ZTZ6UGxaanlRUUtYY2RFbWRvSSs0cVFYaFFmTXhOV0kzNGxMSEh3MzZZVXdX?=
 =?utf-8?B?ckcrZEJjZTlBNWNyZGk4Nzd3M1Q1dC9DK01vdlRMZE83NVBjTVNIY3AyQk1i?=
 =?utf-8?B?eURETTU1QnFudWdjcGJKTUNvOUxzcjBaZVNRQTRERkNOaG5DdC8yK1NrZFFT?=
 =?utf-8?B?d1dLSWN6ejRkczBncTExcitIakgwdS83VjN4UlpTM3RrdzBtczJnNmtuL2xH?=
 =?utf-8?B?c2lzWk14amxlbDVNZ0JGUkRzbUJJMTRYV1hnRklqMWJsc2F4Ri84MkRmVy9o?=
 =?utf-8?B?bUQ5K2EyMXZMSHYzVG9KaHhHWC9GNmdjdm40c1dMUWI2Y0ViQzRxTnpHMjIy?=
 =?utf-8?B?dFJKZnlKNVJUMTFNcU1WMTBiVjVOSVZXcjFHOGxEaVM0VVpQY09KT0NrZzRW?=
 =?utf-8?B?NTNjVmxSd0xRRERpbzFtU1krSWdNTk41WDYrdnpYVThubi9MbENBSUhwRkw0?=
 =?utf-8?B?UG9Cd0JYMWhCb3Y1a2NzZ290Qy9EZDhPMVRsUkVMdFk4TVJLN2pwZHRLVncx?=
 =?utf-8?B?L2VSdEIvdEFqVmc5SXpvYTZSTnNSMTJuTU1zclBvR3FhM3I2ZU9rRnpwUGVu?=
 =?utf-8?B?Uzdzd0x0M2tORUtlbXViL2pSbVJFdTk0cUMyYnF1eEVha1p6aHpRR0MyU3R5?=
 =?utf-8?B?RkJGUkNFTVUzLzBEQUkrcTYvNG9zUU80eHdpUE14cGdxMVVFWDJuUUYrTjF4?=
 =?utf-8?B?NGxpTDEzcDJCaUFvajRjQmVCN08zZ0JrYi9ONjdnbEptWmEyRUwzaElieHhu?=
 =?utf-8?B?b243STRaYVlYMTRyK2pXQ094SkNFMVkxais4ZzM4ZHo4My9mdUNzUG45eDhS?=
 =?utf-8?B?ekR1U24yOGptV09TL3ovSmlwdUpuRzhLUjdnZkl1dUE5YlE1OG02NHBsS1JF?=
 =?utf-8?B?bEFpcCtBWUIxaWduem5semo5ZFk2SHJXV0UrWDVZQzUwQW5vVWQ1SHhjSEx6?=
 =?utf-8?B?UWVpQk5iTllvMURDNkFRaUQwOEpPYXdSTjhsdG1MUDA5OTlpWDgranR6MSt5?=
 =?utf-8?B?YzVWNUdJUU12b09xbWtjTGdjOFluSzRpMnJNYXpSTmhGejJRQTltbkg1YlQ5?=
 =?utf-8?B?NVRGanBUNDZLT2FDVkUzeHNnNURnSG9mendYWkw1MHArU0VCTkUvRHlyMXZk?=
 =?utf-8?B?Y0x3cmJuWGdVR2cxQkpwZjZ4V2R6RlBaMGhNZGJGckxpTkFsS214NlRFWFFP?=
 =?utf-8?B?T3dVOGVkQWxTdjlTQ2loWlFrZWt1OTZzQm83NUd5RWYrQXFybDd4NmNFWFJu?=
 =?utf-8?B?cTYvNlJlLysxY1BkZ1ZDcEozdmZFRXVtZDMrVUw0Qk5tV3NVS3JpZlRWN1dV?=
 =?utf-8?B?RnhuQ3gzM3hjdnJEb1pMSEFWMHZEaTNhTTdsWUVWSndibjdOR0ZmVWtWeldt?=
 =?utf-8?B?YTczSUFpdDZPeEpwa0xoTTg0MUtJZVNRaGN2TmtoUUpwemlwRVI2MDRoQ3Zp?=
 =?utf-8?B?YUpwLzNzcVdQY2hxejVCSERjbmFSTEdpWXZRbHpnb0RJTEpiaXd0RU9IYXlM?=
 =?utf-8?B?eC93Wkp0Wjh2aVFqdzNOYXZXd3AzM05PRHgrY0c1SnppL2ZTVEtMTnRuUmEz?=
 =?utf-8?B?blU5Y1pkUEprNVgyMHNQYzB3NEVFeWw0YmJKNTJFUnd0WXQya2hYWTJBMzdX?=
 =?utf-8?B?alJNYTJlOHdTdzhxTjNHVTVKdTczZEJDL3NjRkpWSVI4Q0xrY1FNaWs5RC9F?=
 =?utf-8?B?bUVycE5mcTE1SEdtbDJzTk5wekcvSTBRcjh6ZjhoY3UxN1QzbEFmN0NiU1Zl?=
 =?utf-8?B?eVZ4dUR1N01lT01tVGJnMC8vd05CYlQ0eXdjN2x5R3NhOVJybzJqN0E2eUh3?=
 =?utf-8?B?dG53YXFkRWtSK21Od0E5Q1ZwVnNiMnRsbWZDWXYrMEdkaDFTR3hLaDVVMjVH?=
 =?utf-8?B?NXc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2396cdf-c0cf-4627-effb-08dc472e793a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 09:33:30.7481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bzQkA2J8y4ONk3Bn7Nx0H2zkoRyxWWgZpU46T5zlGPTcIwRLrlpeJnQQUmuCBCJqETTjicDOyYxuWoPH4D1E+iD1XKpxfqcqDZD5rVxyDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9368

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTgsIDIwMjQgOToyMiBBTQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDQvN10gdXNiOiByZW5lc2FzX3VzYmhzOiBEcm9wIGhhc19uZXdfcGlw
ZV9jb25maWdzIGZyb20gc3RydWN0DQo+IHJlbmVzYXNfdXNiaHNfZHJpdmVyX3BhcmFtDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgNzozOeKAr1BNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gRHJvcCBoYXNfbmV3
X3BpcGVfY29uZmlncyB2YXJpYWJsZSBmcm9tIHN0cnVjdA0KPiA+IHJlbmVzYXNfdXNiaHNfZHJp
dmVyX3BhcmFtIGFuZCB1c2UgaW5mbyBmb3IgZ2V0dGluZyBkZXZpY2UgcGlwZQ0KPiA+IGNvbmZp
Z3VyYXRpb24gZGF0YSBieSByZW5hbWluZyB1c2Joc19uZXdfcGlwZVtdLT51c2Joc19yY2FyX3Bp
cGVbXSBhbmQNCj4gPiBjaGFuZ2luZyB0aGUgc3RhdGljIHF1YWxpZmllciB0byBnbG9iYWwgc28g
dGhhdCBzdHJ1Y3QNCj4gPiByZW5lc2FzX3VzYmhzX3BsYXRmb3JtX2luZm8gY2FuIGJlIGZpbGxl
ZCBieSByZXNwZWN0aXZlIGRldmljZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjM6DQo+ID4gICog
TmV3IHBhdGNoDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gNCj4gDQo+ID4gIGRyaXZlcnMv
dXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMgfCA5ICsrKystLS0tLQ0KPiA+IGRyaXZlcnMvdXNi
L3JlbmVzYXNfdXNiaHMvY29tbW9uLmggfCAyICsrDQo+ID4gZHJpdmVycy91c2IvcmVuZXNhc191
c2Jocy9yY2FyMi5jICB8IDMgKystDQo+ID4gZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9yY2Fy
My5jICB8IDYgKysrKy0tDQo+ID4gIGRyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvcnphLmMgICAg
fCAzICsrLQ0KPiA+ICBkcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL3J6YTIuYyAgIHwgMyArKy0N
Cj4gPiAgaW5jbHVkZS9saW51eC91c2IvcmVuZXNhc191c2Jocy5oICB8IDEgLQ0KPiA+ICA3IGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gRG8g
eW91IG5lZWQgdGhpcyBwYXRjaCwgbm93IFJaL1YySCBjYW4ganVzdCBzZXQgLmhhc19uZXdfcGlw
ZV9jb25maWdzIHRvIHplcm8/DQoNClJaL1YySCBoYXMgc2ltaWxhciBjb25maWdzIHdpdGggUlov
RzJMIGFuZCBPbGQgU0ggU29DJ3MuDQoNClNvLCB5b3UgbWVhbiBqdXN0IHNldCAuIGhhc19uZXdf
cGlwZV9jb25maWdzIHRvIHplcm8NCmZvciBkZXZpY2VzIHVzaW5nIHVzYmhzY19kZWZhdWx0X3Bp
cGVbXT8/DQoNCkNoZWVycywNCkJpanUNCg==


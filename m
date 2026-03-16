Return-Path: <linux-renesas-soc+bounces-29524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMVdGm5FuGmLbAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 19:01:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D941D29EB5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 19:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C9BF304A324
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 18:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE6B33B6F8;
	Mon, 16 Mar 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uBkrBZpu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E381830B520;
	Mon, 16 Mar 2026 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684030; cv=fail; b=R5QBL+3fo0utWdtl+ucclsikLF6Hl6PrblMJ5TCMUyK6svL0ye28Q8dnhs0PapsgtNwuxXdleZV8dD1qUH0KG3+ESxY5RiAv9yaDDlVKTZTHXy06s0Q9y8ovl6MHJe4sClCH+c9ufRrz7hHMbj4NyYPzlBu9AgWA3GQvukU49Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684030; c=relaxed/simple;
	bh=1aSPMCjTV3kuMO8msmo1Fp+zIQuCpvivXBKIaNxRrWU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rXiM1VnnYy6FYreG46mu5mPbXMUOFhd3U1BOim6HT4AtFTQAy5AyfIk8URKD6cZ7PaozGS7uOlhH1R97JNhnFAziVe2Zz7P2hLW1hNDX+Aqwfq79CdN7HpRiMnz47ZUSH74FK5yXUSOO4FmJ4F0091h3pxyEL2lmaTM4Q+cN/fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uBkrBZpu; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxofG2+d6OxDLBc5lL8H2CN5Zv3NLACd0OwfMigc26IFroXPB6bpjOuVmOWUgC1Yew1GfAYDYGGtf+cgtXkTQqaYtgDBo6Ba1SxIeuhULjDnwOXeSRumdz3aR8fpxcD4cvZWGgSSBVziiy73hWo8OH2TyefLPc0g45fqfVKkmYp1pwOUy04GO5FzuTGRBz52weuvXXNM+K8Q46Nr4rHXGHLXiD5jAXmmZ57IwU95cJWqlFo23Rt6ROa7rgkUtdPb/n/FCkZVSwEsFYi72vCN6X04obgUNnQxSX8y6TXgRQk6bIgD0rvDkgmKFy2YeKKsoD7+geMtRWTrAGjyZ1JYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aSPMCjTV3kuMO8msmo1Fp+zIQuCpvivXBKIaNxRrWU=;
 b=p+xl+AmnN7KzQ8n0vt1df5cFQkuGREMKSp7HK+yvH+/FbzSmwJ78KtBTwxE3RDFmcvCNLuRfxC48SHn4vyc7ukXCzAyP1GFN0zwWxMoX6Rhexr9uOQZgD6JtdGSZhKG8CQBKBY3Uch7mzru1vHwOeORSvsM3f7K9oIKKKp9X/TYceAfnXdicZhuvZgMiLDGSoaksgtE1Wgogj91MOVXFSDsdGg8hmytJpdZaXG+h+ZXfi1er4FvZ2b9WpeMHJ21/6xV5irxlJs0SCITZqf05as19Upvylyk+tg82HplJ+2y8+5D86eHfFL5YIAcs3ldV8C4XCRTqcez9KTDT4BELoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aSPMCjTV3kuMO8msmo1Fp+zIQuCpvivXBKIaNxRrWU=;
 b=uBkrBZpuxuiU6T9GSWzg29T1K+z1CrqUCoogHBIuTV5bEuczyKOrafG3M6BOQAo3+UVXfQWN6vEp4dcIkY6yv/nsKDtasCbEU/C2w9wbOsQAol6wWbjEiin13yJtjAsuyRkzuVyYe4Ve5IWJUxACPTEWyPHhY/A9J6FxDP0YRF8=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSCPR01MB12690.jpnprd01.prod.outlook.com (2603:1096:604:337::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 18:00:04 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 17:59:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Andy Yan <andy.yan@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Jesse Van Gavere <jesseevg@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Thread-Topic: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Thread-Index: AQHccNTTduZlWQWrnEiAvemqifSjf7WxuWcAgAA85YA=
Date: Mon, 16 Mar 2026 17:59:57 +0000
Message-ID:
 <TYCPR01MB113325ADBA0ACD1872BD4959B8640A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
 <20260316140232.GB31616@killaraus.ideasonboard.com>
In-Reply-To: <20260316140232.GB31616@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSCPR01MB12690:EE_
x-ms-office365-filtering-correlation-id: 559baf1e-024c-4822-8d8d-08de8385d5b6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 c+fujV4rBsMX78OkT4tissrIjGg3cVoOX31doXt9UpS2DCZgak15bB7t+hvjuMyv4d6wE+YfM+vHlSFXP7cAenn/W4N5xKSVPYkoEBO/+/8UgnkK6oA3/0251jC4pspUQkCzijsFCIjRit5JLJaafeIgwDozHy+UoPwqQlDYz8MFUhlxUNiOPissad13tTGwnX+C1PLuIe0FQwyXZ3SnsEUGLrHsIP3/0PWuNAgl50ldhHXzsKr+6GOCSPIO+0hiUalK+du77pioJfEtklocYZPfCTXiuVydF8dOfFsoQtFvQ5N+jAju8lt6pcg5eKt3jrt4d2uPyADvHld2gGHQwix9c35/972+4Ex1gKUMUYZG1BiSqZ1ILKcXOTK7Q5L3SxLF9tL+fh6B9/qFo6T4eo9xL9tiSJQsQOHcKdMFtkxWLdlyKRw08YtnQxTPzuxfLTWzh/oMqXdAW9dIqDpoMcxAZEe40Pb0keryw2tcPM94M/T5ynHWBifClvETma4MCa52d9vdFTbXhK9PGxjHAcjeMmtlwd1uu8NsUfmKs6W41g//Kr8LWqIOMWWBWnipz6upXK/ydom1z6xVlVo/8RO/jo+HgMAXZEwV5TKKFwI5QVVCgHh6jpEVKrmOsMS/5Kq5i+mtA+29TOFt0wcpdcfrjI9HSrzTjRNf1HkgkF45zmbg8MQOnO3qujYwgUNUDrN+9kw9ILYbdJXb4749dZ/c5tDxmwtCZzWLEQMKu8Gwp0pb+qGe3iK5YwVRof3aaTP5lAnfwleFEKbNaDZtrC46ut09bmqw+W+gm2tz1L0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTFVaXdMQWw3ZUt3TlNLMkx2cDlaZnp0WlB4MFBjczRNek9XM29zMmZwQ0do?=
 =?utf-8?B?YVZSQXplSEx5Z1hjMFdqdkI4SjE4d0Z1Ui9CRXJHUWdCQ0RXUWZvdnJSR1Nu?=
 =?utf-8?B?Q3crN0I2NlhyZVVML1FjMW4zZzNXQkVqd0FSUEtYRENzeVN3aSs2bXpaRytO?=
 =?utf-8?B?UTZuUUVDZ2hDMUhrREh1SFVmMG1FQkNSTWpnby8vZW9PN29tQ2Y3YjRySnNO?=
 =?utf-8?B?My9Zd0N3enFjNTl3RkVDQzdhbVc0WU4xbzM0bUl3ZVV6TEJzVjdNK0JDK0Iv?=
 =?utf-8?B?VnZrTWE1Njd2dFc5VnFOWWdmM2ZIRkYxSVBwZU5XMENzYmNYdmFYSXdtTXVT?=
 =?utf-8?B?THhZSHc1TThNNkpoN1pyYVJBUHlOTXovYUZLSHpudFZkSDlBMjBPbmVCb1pr?=
 =?utf-8?B?WjJOODFzVmVIY0JGekV3aEEvSlJxeExobXlOaHY1SFlxRlh6YXpYbjFYUjRy?=
 =?utf-8?B?MGJmRURPU1RhSmd3RW9lTllGb3R1NXZHQmtHY211dGhtbkdLRGlMRlozbE91?=
 =?utf-8?B?NUJTek5Ec05Cb2dlRVEwV1JvU3JYaWRvSW9RbGhZRWN6MXlTQlZPYm5EZGxO?=
 =?utf-8?B?YndNMFdrRkJaeW5hd1NReDU2WXBicm9BZmg2em1SY3B3SHhwWGxuUDN2T25H?=
 =?utf-8?B?bVZjazA3VlBoUUhSdzZkMk85b255VnRZTk1ISVZJUldnQ2JTanR5enJpNjdH?=
 =?utf-8?B?a1RNZS8vVXZHbk5RTytKQk9nSnVyYVdWYjlab2xPdTA0TDhVTHlEL1ZFSXhI?=
 =?utf-8?B?M1B0NlhDaVNGZzVUS3lXcGlvRURqVjRjRUh2RmIzYTRiM01HaFVyVTJ5TG9P?=
 =?utf-8?B?N0Z1WjF5ZFBRVGZGSjAxZzcrTFMwWjlFckF5M09aUmRJQ1kyK1pJQVpIRXJV?=
 =?utf-8?B?S2RrWm04WWhKYmpWTmxCaTRXUEdaSnNhR0JWeXIwcFRrVkdLY1JMZUlTVlIr?=
 =?utf-8?B?dHpDandMbVBwRDN2aXNCMTJZTUdKaWhUSmMyRHFEUmNYZEFPWTJpL2MreG5J?=
 =?utf-8?B?b3kzSVFqY2xMMXRzZXhpai80d2pGdE5EVDIyRmxyYms5RGg1eDlGWENYU05s?=
 =?utf-8?B?L0tDTHpqVzBkTSt0R2dzQjRhMFNOcm1tYjFJTGdzSEJMVDJzOXBKRmpPKzVO?=
 =?utf-8?B?UUdwSHZBWFEwWHkwV0JyMy9iNk9sc05tUHNwa2U1TTloWmhVOEFmSFlGUCsr?=
 =?utf-8?B?azJNN01XMXRwQ2U4WlN1Y00ySFJGYjUyMTllUHZ6U0ZsTnd3aGtyOFBHSk04?=
 =?utf-8?B?cXl3OHYxK2Zsdjd6TlZ6eGgrUDJONktkNldtaUlhSExjTEdSeC9MczFIOVF5?=
 =?utf-8?B?elNXWWZMR3BTMHlCZWc1OUlFQlBQS3VIM1dDS3grVWxnTm8vQ0xmTlNBUVl1?=
 =?utf-8?B?R3labEQ1NEVxb1I5dUlBN21kanEvWmZ6cUZrb3FOVTZsR1NMOTN6SURKN2pZ?=
 =?utf-8?B?M09zTzE4cThZOGRYL1REdFRISWJ6U25uaVZHNDVSS2NzS3NZd3FPTDRNTzd4?=
 =?utf-8?B?ZmlMbUVBWGpYR3B1VWU3ZnY3YjJ5MDdXZXk0dFY2K1JINWxLZDVDYWh6b0NY?=
 =?utf-8?B?cWlDSWp4R1RyWERvUmhSTFcxK3JaWDNxaUsrbUI1Sm5rdGF6cEVaUzNmbk1V?=
 =?utf-8?B?T3dXYlJGeWFJSDg3cFRSUnVYY09DWGU1RDhuVUhFdmNlMWNjdThLQjREK2hp?=
 =?utf-8?B?TWliWXVTOHJJU0gvL1p4VHRhVFpxM1FnMzc2L0JwTFd4WEZqL3UyRTBFYlBy?=
 =?utf-8?B?WkhDQlVJRkR0bzZadDRLNFN1NjhVMHBUQmlUMGNPSmVJL24rSm1oMjRVMmJ1?=
 =?utf-8?B?MDFhQWk5YXRiZkpjM2hoN05ORkNpSk54RnBvYWRYZzRLeUZUc2FEOS9qRkpz?=
 =?utf-8?B?b1RuS3MwWlBvYmN0a3AxRHdhSDZ2clJzMFRaSUtSa3dSb1BiM3lQMG5jeGps?=
 =?utf-8?B?cGZ3MWt2L0FBOWt3emJMUmQrY2dmK0Y3VnVMZWg4SGZnYkFwR3FKWXBIUjJU?=
 =?utf-8?B?YVE4QnJSUTB1UW96dnYzSFI0QWN6cWR3T2xCUm9sU09ScUV0MldYTXlYYUl5?=
 =?utf-8?B?Uk84UGpoR3htWlgxcmlVeDNpeklMZnVTOGFDVGlnTUJHYzlMMWhYMHlvTXp4?=
 =?utf-8?B?Qk1vdG5zRTZyd2tScUV5OXBPRDYyN1JyREFoZmg5ajhkQjdoSFFtMXY0ZXEz?=
 =?utf-8?B?dUVqNHIwSHdsYWhRZW1ZYjMyOHMzRkYzdTlEeTZHanpPeEJLUWF2N0l6UVUx?=
 =?utf-8?B?Umg5MGNRdk9VdVdCMnJLSE1zOHkxbWtBRE5qNlBWT1lhTEgvbU55cEVIcytp?=
 =?utf-8?B?S0dwWm5ENnIrV2h2S1FFSDRJWmVUMlFlTldad3NSb3pXQkJmZnFrUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559baf1e-024c-4822-8d8d-08de8385d5b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 17:59:57.1948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URdVHiQUJgtNSRzRMeUOBccRAN8pwJLQsJfpU9gvvJrTZ6uySxNmkOT7409HyyzC0Xv5aJo3shVUiSmV892LRKNHhq4qe1o4ZqvK/yTZFA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12690
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-29524-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,kwiboo.se,oss.qualcomm.com,bp.renesas.com,rock-chips.com,chromium.org,bootlin.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: D941D29EB5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IDE2IE1hcmNoIDIwMjYgMTQ6MDMN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2JyaWRnZTogYWR2NzUxMTogQ2xlYXIgSFBEIElS
USBiZWZvcmUgcG93ZXJpbmcgb24gZGV2aWNlIGR1cmluZyByZXN1bWUoKQ0KPiANCj4gSGkgQmlq
dSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gRnJpLCBEZWMgMTks
IDIwMjUgYXQgMTA6NDY6NTNBTSArMDAwMCwgQmlqdSB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBPbiBSWi9HM0UgU01BUkMg
RVZLIHVzaW5nIFBTQ0ksIHMycmFtIHBvd2VycyBkb3duIHRoZSBTb0MuIFRlc3RpbmcNCj4gPiBB
RFY3NTM1IElSUSBjb25maWd1cmVkIGFzIGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdCBvbiBSWi9H
M0UgU01BUkMgRVZLDQo+ID4gc2hvd3MgdGhhdCBpdCBpcyBtaXNzaW5nIEhQRCBJUlEgZHVyaW5n
IHN5c3RlbSByZXN1bWUsIGFzIHRoZSBzdGF0dXMNCj4gPiBjaGFuZ2Ugb2NjdXJzIGJlZm9yZSB0
aGUgSVJRL3BpbmNvbnRyb2wgcmVzdW1lLiBPbmNlIHRoZSBzdGF0dXMgYml0IGlzDQo+ID4gc2V0
LCB0aGVyZSB3b24ndCBiZSBhbnkgZnVydGhlciBJUlEgdW5sZXNzIHRoZSBzdGF0dXMgYml0IGlz
IGNsZWFyZWQuDQo+ID4NCj4gPiBDbGVhciBhbnkgcGVuZGluZyBIUEQgSVJRcyBiZWZvcmUgcG93
ZXJpbmcgb24gdGhlIEFEVjc1MzUgZGV2aWNlIHRvDQo+ID4gZGVsaXZlciBIUEQgaW50ZXJydXB0
cyBhZnRlciByZXN1bWUoKS4NCj4gDQo+IFRoaXMgaXNzdWUgZG9lc24ndCBzZWVtIHRvIGJlIHNw
ZWNpZmljIHRvIHRoZSBBRFY3NTExLiBBbnkgZGV2aWNlIHRoYXQgdXNlcyBhbiBlZGdlLXRyaWdn
ZXJlZA0KPiBpbnRlcnJ1cHQgY291bGQgc3VmZmVyIGZyb20gdGhlIHNhbWUgcHJvYmxlbS4NCj4g
SW1wbGVtZW50aW5nIGEgd29yayBhcm91bmQgaW4gdGhlIGRyaXZlciBkb2Vzbid0IHNlZW0gdG8g
YmUgYSBzb2x1dGlvbiB0aGF0IHdvdWxkIHNjYWxlLg0KDQpJIGRvbid0IHNlZSBhbnkgYnJpZGdl
IGRldmljZSBpcyBjb21wbGFpbmluZyBhYm91dCBzaW1pbGFyIGlzc3VlcyBpbiBMaW51eCBrZXJu
ZWwuDQpMb29rcyBsaWtlLCBvdGhlciBicmlkZ2UgZGV2aWNlcyBkbyBub3QgaGF2ZSBzdWNoIHJl
c3RyaWN0aW9uLg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTEuaCAgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExX2Rydi5jIHwgMzINCj4gPiArKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gaW5kZXggOGJlNzI2NmZkNGY0
Li4wM2FhMjM4MzZjYTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTEuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUx
MS9hZHY3NTExLmgNCj4gPiBAQCAtMzkzLDYgKzM5Myw3IEBAIHN0cnVjdCBhZHY3NTExIHsNCj4g
PiAgCWJvb2wgY2VjX2VuYWJsZWRfYWRhcDsNCj4gPiAgCXN0cnVjdCBjbGsgKmNlY19jbGs7DQo+
ID4gIAl1MzIgY2VjX2Nsa19mcmVxOw0KPiA+ICsJYm9vbCBzdXNwZW5kZWQ7DQo+ID4gIH07DQo+
ID4NCj4gPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgYWR2NzUxMSAqYnJpZGdlX3RvX2Fkdjc1MTEo
c3RydWN0IGRybV9icmlkZ2UNCj4gPiAqYnJpZGdlKSBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gaW5kZXggYjliZTg2NTQxMzA3Li44ZDk0
NjcxODdkN2MgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEv
YWR2NzUxMV9kcnYuYw0KPiA+IEBAIC03OTAsNiArNzkwLDI1IEBAIHN0YXRpYyB2b2lkIGFkdjc1
MTFfYnJpZGdlX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAg
CXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlOw0KPiA+ICAJc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOw0KPiA+DQo+ID4gKwlpZiAoYWR2LT5pMmNfbWFpbi0+
aXJxICYmIGFkdi0+c3VzcGVuZGVkKSB7DQo+ID4gKwkJdW5zaWduZWQgaW50IGlycTsNCj4gPiAr
DQo+ID4gKwkJLyoNCj4gPiArCQkgKiBJZiBBRFY3NTExIElSUSBpcyBjb25maWd1cmVkIGFzIGVk
Z2UgdHJpZ2dlcmVkIGludGVycnVwdCwgaXQNCj4gPiArCQkgKiB3aWxsIG1pc3MgdGhlIElSUSBk
dXJpbmcgc3lzdGVtIHJlc3VtZSBhcyB0aGUgc3RhdHVzIGNoYW5nZQ0KPiA+ICsJCSAqIG9jY3Vy
cyBiZWZvcmUgSVJRL3BpbmNvbnRyb2wgcmVzdW1lLiBPbmNlIHRoZSBzdGF0dXMgYml0IGlzDQo+
IA0KPiBUaGF0IHNlZW1zIHZlcnkgcGxhdGZvcm0tc3BlY2lmaWMuDQoNCk9LLCBJIHdpbGwgcmV3
b3JkIHNvbWV0aGluZyBsaWtlLiBJcyBpdCBvayBmb3IgeW91Pw0KDQpUaGUgSFBEIHN0YXR1cyBj
aGFuZ2Ugb2NjdXJzIGJlZm9yZSB0aGUgaW50ZXJydXB0L3BpbiBjb250cm9sIHJlc3VtZS4NCk9u
Y2UgdGhlIHN0YXR1cyBiaXQgaXMgc2V0LCB0aGVyZSB3aWxsIGJlIG5vIGZ1cnRoZXIgZGVsaXZl
cnkgb2YgaW50ZXJydXB0cw0KdW5sZXNzIHRoZSBzdGF0dXMgYml0IGlzIGNsZWFyZWQuIFRoZXJl
Zm9yZSwgY2xlYXIgdGhlIGludGVycnVwdCBzdGF0dXMgYml0DQpmb3IgZnVydGhlciBkZWxpdmVy
eSBvZiBIUEQgaW50ZXJydXB0cy4NCg0KPiANCj4gPiArCQkgKiBzZXQgdGhlcmUgd29uJ3QgYmUg
YW55IGZ1cnRoZXIgSVJRIHVubGVzcyB0aGUgc3RhdHVzIGJpdCBpcw0KPiA+ICsJCSAqIGNsZWFy
ZWQuIFNvLCBjbGVhciB0aGUgSVJRIHN0YXR1cyBiaXQgZm9yIGZ1cnRoZXIgZGVsaXZlcnkNCj4g
PiArCQkgKiBvZiBIUEQgSVJRLg0KPiA+ICsJCSAqLw0KPiA+ICsJCXJlZ21hcF9yZWFkKGFkdi0+
cmVnbWFwLCBBRFY3NTExX1JFR19JTlQoMCksICZpcnEpOw0KPiA+ICsJCWlmIChpcnEgJiBBRFY3
NTExX0lOVDBfSFBEKQ0KPiA+ICsJCQlyZWdtYXBfd3JpdGUoYWR2LT5yZWdtYXAsIEFEVjc1MTFf
UkVHX0lOVCgwKSwNCj4gPiArCQkJCSAgICAgQURWNzUxMV9JTlQwX0hQRCk7DQo+IA0KPiBXaHkg
ZG8geW91IG5lZWQgdG8gcmVhZCBhbmQgdGVzdCB0aGUgSVJRIGhlcmUgPyBJZiBBRFY3NTExX0lO
VDBfSFBEIGlzbid0IHNldCwgYSB3cml0ZSB3aWxsIGJlIGEgbm8tb3ANCj4gYW5kIHdpbGwga2Vl
cCBpdCBjbGVhcmVkLiBJZiBpdCBpcyBzZXQsIGl0IHdpbGwgY2xlYXIgaXQuIEl0IHNlZW1zIHRo
YXQgYW4gdW5jb25kaXRpb25hbA0KPiANCj4gCQlyZWdtYXBfd3JpdGUoYWR2LT5yZWdtYXAsIEFE
Vjc1MTFfUkVHX0lOVCgwKSwNCj4gCQkJICAgICBBRFY3NTExX0lOVDBfSFBEKTsNCj4gDQo+IHNo
b3VsZCBiZSBlbm91Z2guDQoNCkFncmVlZCwgSSB3aWxsIG1ha2UgdGhpcyB1bmNvbmRpdGlvbmFs
Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K


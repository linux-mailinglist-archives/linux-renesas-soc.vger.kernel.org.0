Return-Path: <linux-renesas-soc+bounces-29723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBNcNqhhumnFUgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:26:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4D2B7E86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5CB30B981A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75B8378823;
	Wed, 18 Mar 2026 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="U6aLH9xm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8937474E;
	Wed, 18 Mar 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821814; cv=fail; b=ScGuNdYwHH3BdNpNr/QvlkZjmMqKe/PsIze4Fubixx2UNVVjVdSq+OX1NaI6xLWxSQR3tiYSceB2HycxEGQvPVxcTUDma9HyU5MIMRwxdgZo2NBWFCp8l/TPs9xN2ADU/qLjgCrupvXBqiWxkhCWeOnP0t6ea4K9gkNIYS+MeMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821814; c=relaxed/simple;
	bh=Im5kPemnNjNX9gA1/qDlaK/nqmBZBgx5iGKYMQ7RW5I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cjNUHjH8cDl4ao9pINgeeFG1/z6/SdbyQXHzO45WWGRrb1yFWI/hGSj9aQtn8evd6mVEivi67lKOHcLpdAXdB73TnXdNyg7nWqEjlpOgEIemEcKsK+FveCxd8/wAAG5qsNgIu35/aP/t2bOSInQeRr0tNNdyIbFCVOAeWKsKxuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=U6aLH9xm; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIWcvtrrvL6yYVkRr2fVOjTcInFaDEO9AWwEbDlD2mIJZVdoM3XAZhGqHkqv+uk4IcrSqg6e81Dt1YLFs6/EyuMtmNCm25V9ngxylzANDNxnaB0E90yufdoqdILZRVS/x6QNdUKWT5JL7WENr71CHZeBWRHSxqLdOwudv4KkMwGapNrVzNQtpVIzsyR7IWAGtqtE4/4+1bmIM2s/hFooIO9qOLMuQKwNfzVfm96eQutQ30VUsmD9tknBIHdC5tgumM6Ok0a7oxWOKZCoOwH7jhIM1aFEXocWONKraH7CLdk+R9sPaRsJUB06ZWgXosQvnVtjG99myiF3FngoiV6NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Im5kPemnNjNX9gA1/qDlaK/nqmBZBgx5iGKYMQ7RW5I=;
 b=KwV96DKn67STAbrYiJSeP5ynaZZmXuJLTadcQKEZY9Py+9WUGj2sfhN1tIm/e/1MGpRuKHCxZFnMFBwSxfOlWxLC0sKsqBOeSyg0ZJFizGbTZWyJUstuHhV0JZ0lTNWB1+DEVf9TuxwOu6eBqRT0R5DMPfIFHuNdSC2WhVonphMTjfMMY4ojj4CAA+B7Jb22YK+cs/wKCJdRHfur6Ukf7o2q6nM8lhJRtJg15umSUeWvEyKoQwZW6gxF2uWh9dp+g0owvxLS+rKOePPaBHdkp7wA2bkzbv2L74LGinvOJcszOT24lYoznBFCVfrhrpJ2CwLICujmLuVDZqL/EM/ibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Im5kPemnNjNX9gA1/qDlaK/nqmBZBgx5iGKYMQ7RW5I=;
 b=U6aLH9xmc3cbhYbhOdoSBxsN892nSp8VthChYw3OJ0aCvHj+Re40oYfF57l8vogvWcEPK8qNPMTxxZspFssOdqMDyde2Y2icWdNAjQDE+dNs/f0JwuYNDr3Z1o9wG2QMwKx/cfK0+pPvzYhJaZxUeqgWXygpSWyuHJCBzG8coo8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12258.jpnprd01.prod.outlook.com (2603:1096:405:f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:16:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:16:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 0/9] Add support for Renesas RZ/G3L SoC and SMARC-EVK
 platform
Thread-Topic: [PATCH v4 0/9] Add support for Renesas RZ/G3L SoC and SMARC-EVK
 platform
Thread-Index: AQHctkaG049+twHo+U+dxBOWKUmfwbWzI+uAgADNDoCAAAFxgA==
Date: Wed, 18 Mar 2026 08:16:49 +0000
Message-ID:
 <TY3PR01MB1134600A330ACC313CC0AFE2C864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346876072AAF91064B2700D8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUiomf+6O5eDUBAt-41D-Lhvnda7w_bbdj-EQppapjdUg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUiomf+6O5eDUBAt-41D-Lhvnda7w_bbdj-EQppapjdUg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12258:EE_
x-ms-office365-filtering-correlation-id: e0791400-7401-44c5-3221-08de84c6b45c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 hAomQ3jefBbUN/HW7S0MsLUMIh2UfGFSbrUjIIL4N4f07IKHkd8gKLz50prWbp5pFCWrlWWJUYwjbVqw7oyILwoZtARLYcZ425lEqQ35TeZO5I7RqgBe+QoEo6Ol6jAb883p78kJJRZWrwBU+8LUCXgpsRt1d4p/4cvrRyPVImv6Y1EdDJH2/I4SN1F40AtQVWeHwAm9b92NOB7vsbk1JupyMZYjp9zGUoBG3oArIDYTCzrowxXNlLXwRlL075HFqOC6kDReASKl2I3OtA6xvlX/NedOdJvDx7mCSI6HWS0WjF4jC8xpP77Ap1QJdpr4W4YON7hqfW32O3Tes3w9l/GDPpV2ermiwhMCbVoV5D0bwgywgAmDaaPLxL2KQUMEQASM4Cu0gcnQ9Rsuy+PT+oDtemhb5p1ALTHgpc9BfepLS6YldnuaX31+rr1i2iBIypTZlK70r23Fiuv2ScwEABzG0EgRCdenyTkLgoWbbmUZ7eXouIputNSh1ZOasLnmJlXcJmh7UWrIDXJl/Gb0+fS0R1hJ9uWJH0720nQELhxxIteVVpYWllJuVn9Fx8kEJR7BokiEQpgd3gjVoF6f/4NpNQ5wl0M5chDFVVGVL0BOsM6ssGuFKjuoTBHDuvAGLGhLWjbv8vlzClkUchbeO3SJu1o8jsZE+hSt6D0Qozqe/WfkWz3vRCZ9V82lIDdPqwZJsYVAXOPLTmuuUUJOhh+/NTszCL5cAJPo3fCyARC4aJwfxNu6SRz5Q3v7qh3B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2Jic040d3plWWw2RDgrRmh1eEl0V3N0WmVPSGprdk0wRS9qRDArTWhtakQ5?=
 =?utf-8?B?UWMzcExHRkhYdTFNNDZLMzc5dTV0a1FOS0ZPNHd3OExuR3hLT3BLTThsWEtq?=
 =?utf-8?B?bW5kamd6Y2crMzlGQll6WGJWbkppeTdvaXF5N29rVlo2aCtWSnp0c2ZyZmtI?=
 =?utf-8?B?bXBRdnpDWmxpQ0NzZ1hNRFFmQ3p5OWFzbzZGa0pJcytLNDIyZC9IaitmVUR3?=
 =?utf-8?B?Skc1TFhJTVp6Tkx2blVMd0R5bnRWTTJCRE1EM1hYU3ptNm9pWXh0eld3MTlX?=
 =?utf-8?B?djhyYzNxZUZ1Yk9ZM3k2VXU3OTFYdlZXa1EzdlZacDNYVk5YU0MrT01lNnh5?=
 =?utf-8?B?UWpLNHB1YkFZMHR1N2FvVnhqRG00MENwajV0VC9aNzlJUFVnQU9SN2wzUFdX?=
 =?utf-8?B?L2c3UE00ZG5JWVVuWjQzNjBzbktRZ0U2NlRrYm9vZ0dnMUpJQnZWUDhUTWt2?=
 =?utf-8?B?S09vNkF6akVEVHlMNVFYVStXNjk5V1J0VUN4MlpDSWN4RTVBc29CQ2gwaGkz?=
 =?utf-8?B?QXZYMEtWeHNLWmRCZWU2c1N4VklzM210ZW11ZmpkK3piTlFnWlJKdWJTbE1X?=
 =?utf-8?B?K3RSMUorQ29JSDdzMlNnWElnbHZhTDEzbUFVOVZKcy9iMS9SdGhxV1N0d3Ev?=
 =?utf-8?B?aEtPQi9CR0ZOL3NGbENVMktaWnI5YmgxekRoajIvSGFTRFAzV1hDbGdkZ1BR?=
 =?utf-8?B?RWt3Z2Ntdmh3UmQydVB2SHpOajF6ZWp4OFFFQ2lCb2xzdmN4TUNWU1VsdHJN?=
 =?utf-8?B?dkd2ZjNXM0gzMlBnWTl3ZEY4ZWY1UDREdVRIY3p3aTJnUTdzL1ZSU2VleW1S?=
 =?utf-8?B?NG9GTFJYQnNwaUVWQjRZcW40WkhKRXNrejdPZU5JTUxyY2dvOVJUNHBEVllx?=
 =?utf-8?B?eGZpQXIxZWZyRk03VmNhQUJBTzVZdXJqS2JCV3pWK1preU9CNjZVNnpzcGJ0?=
 =?utf-8?B?UTFXZys5Vmc5a2tJWWpqajJWaDNlc05Zc2syMWdDTmR0dzRoWVRYTFVzTFg4?=
 =?utf-8?B?ZEU1NlQ1a0pLbXlDdWNwek56S0kvV2hLWkt1Q09WcHRuR2V4WHgyaHViOEdH?=
 =?utf-8?B?emZweks3L0JPb25RMlF1dEpKOUMzejAxV0J2U2xOb2J0d0ZKd3VtZXkvRDJE?=
 =?utf-8?B?Unh6dkJWNFpPelFPSXJlQnF6cmo4enpWWC9YY1RKZHhYQ1RWY20rNktJdWwy?=
 =?utf-8?B?QTdqUWVsb1dabVp6WE9XMG5Ja3RiMUJka0VURlpKL1dxUU5IanpEZXN6SG4r?=
 =?utf-8?B?a01KUkcvblltUS9HLzFmUUhCQVdHTWdDQnAzcjBuQUh2a2RZeVZnNHZjenhq?=
 =?utf-8?B?SFhJZW9JNWYvdDhHVFpDTis0ZWFwZTJsL3YzOHk5SmdpRk1xWE1BT0J5Q1R4?=
 =?utf-8?B?aWtEZzVwaW14TDVFSjZIWW5uNFlUZHh4cUhYRUkzbTVSV2JSZWtEbFVDWFJY?=
 =?utf-8?B?RG1ab1h6M3lLbUtJd2FFbmJTNVZvR0xCWkx1OE04TUJDMFZQUENKT1hHL2F3?=
 =?utf-8?B?enlrMlVYYkpmbjFBUyt2ZG4rM3JLTWZFb1luekxmWms2dm1CVG11M2VmTVIw?=
 =?utf-8?B?cm5HMmJxNGxHbXh1Rnl0dCtVZHdTR01HV0RubFZGMjNlVjBtdkwyeEJBb0pD?=
 =?utf-8?B?SjVNaGgzdWtmTzNXZU1pQm1DWUNFWnpkRTZaNWU2RmZEcHJIWGlBZTVhTlRN?=
 =?utf-8?B?SGF5Nm52bXpIb0NYRDdQYzJqNFN6UjVSM1J1L1RGZnRyRWdSY3l2bnQ2NlU4?=
 =?utf-8?B?Nm1KZWVKS2NrL3cyU2Q1VW9XTEphZDcxUmgwSTJraVRhUlRHWmloNmVmMFJC?=
 =?utf-8?B?SVpRRjFFN2RyYUtTZk85U1h0dnlCcWFoVDREY21reUE2dlkyaEFQMzh0T0FV?=
 =?utf-8?B?Y21GWm4rRkxacStNcDJUQlpYYXFjczdRb09hbWsrQjhtb0taNTA4TzJNcVB1?=
 =?utf-8?B?bFlIeWxkcWJXeHRsUkEreS9OK2NINjJlNWh2MTJwSVh6RmFvRjlBcUczcHkr?=
 =?utf-8?B?UExFRmNuMFM1TVIxL2xaSGtyOCtFRTFXZjByRCs5M3AyQ0kyU3ZlcGVTOXo3?=
 =?utf-8?B?UStJSWMwMDNuSUxZaUhZcWZtYVNQTEhRakdabENiZTJnNkQxVTlEOGNmdHl5?=
 =?utf-8?B?czdoU0NMTXBiQ1Vac2tNYlNNUVR5UzhMQkp1OHJTVkZ1UVdQWlhIazE0aWxP?=
 =?utf-8?B?Ny85eE5NVHNrZmFjbEY2T2lWNlJlNE5IaWVYS3lmRUt6dXI2MlhneUZscnNU?=
 =?utf-8?B?MGpyclhYTnlsS0h1d1BYOEFjR1Vvak9mSkhYNm4vbEo5cXd4UXFuMnJPWlJk?=
 =?utf-8?B?RmpaV0VKV1FwcXdUQndLNnN5dDdOSndJZjNZVE44b0MyZk1ZVVhmQT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0791400-7401-44c5-3221-08de84c6b45c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 08:16:49.7276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPQtzq3iwiCjWR6iSGMlKSyeoOrJeYcF/J8nooPdvHr0HzTzJ834i3u2sseciMuDrqohBYIAF41K6GFsbUeaiQIlziF+Wr9OeQV8y5vjHv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12258
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29723-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,baylibre.com,glider.be,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 3AB4D2B7E86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTggTWFyY2ggMjAy
NiAwODoxMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvOV0gQWRkIHN1cHBvcnQgZm9yIFJl
bmVzYXMgUlovRzNMIFNvQyBhbmQgU01BUkMtRVZLIHBsYXRmb3JtDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gVHVlLCAxNyBNYXIgMjAyNiBhdCAyMDo1OSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBQbGVhc2UgaWdub3JlIHRoaXMgc2VyaWVzIC4g
SSBtaXNzZWQgdG8gYWRkcmVzc2VzIGZvciBQYXRjaCM0LiBJIGhhdmUNCj4gPiBzZW50IGEgbmV3
IHZlcnNpb25bMV0gZml4aW5nIGl0LiBTb3JyeSBmb3IgdGhlIG5vaXNlLg0KPiA+DQo+ID4gWzFd
DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVuZXNhcy1zb2MvMjAyNjAzMTcx
OTU2NTAuNDY4MzMwLTEtYmlqdQ0KPiA+IC5kYXMuanpAYnAucmVuZXNhcy5jb20vVC8jdA0KPiAN
Cj4gWW91IGhhdmUgc2VudCB0d28gInY0IiB2ZXJzaW9ucyB3aXRoIGRpZmZlcmVudCBNZXNzYWdl
LUlEcywgd2hpY2ggYXJlIHRyZWF0ZWQgYXMgZGlmZmVyZW50IHNlcmllcyBieQ0KPiBib3RoIGI0
IGFuZCBsb3JlLg0KPiBQbGVhc2UgYnVtcCB0byB2NSBhbmQgcmVzZW5kLg0KDQpPSyB3aWxsIHNl
bmQgdjUuDQoNClRoYW5rcywNCkJpanUNCg==


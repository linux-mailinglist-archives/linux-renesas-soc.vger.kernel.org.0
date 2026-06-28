Return-Path: <linux-renesas-soc+bounces-34493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /7dMF1wtQWrXlwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jun 2026 16:19:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D65A6D40A1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jun 2026 16:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=O7o3puqa;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A3513002D18
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jun 2026 14:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3903ACA61;
	Sun, 28 Jun 2026 14:19:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C999A3A5E98;
	Sun, 28 Jun 2026 14:18:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782656342; cv=fail; b=Hh4SNf4k7Y/kZXdJS1GNR4hYEtF0Z7A8DHhaqO5tDe8BV6eNNu9SpO5z0CUAIipwptrUl+6PK1p+zQn6AVpI4ayvpecUrch2mob10w1ZVZmNxRC8RqMruYF4Fa85SrVbdeGUGNI9kXyXBNIr0i+xKwHvh4Qg/VAiiJJaSH3x8p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782656342; c=relaxed/simple;
	bh=aW0Y9yKj3o5bN6OaahLkMHu/aFDUBoAgQYh1ltBJTJQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oEek6nuMCOAl54oCdJBkGkwGxFpvsNYtMEfkxLHX6USCjkaAnX23nQpKvYNcL1hK/LVVUvcHkgngWUY1BHgl/jL2c8Xukv5rJVaNEVgjaPgtYBSR0DX3He3E5NbRv6DOqtX8MtHHpniH48FgY9UDvseqIGqw4mgcdVBtm6yt2S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=O7o3puqa; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9QaJriF6hrgWtpDfznBHIvzmHreGNAvMyAGddjMOfspE0YABcecu1215jeZDy+knsUNcZcmQOsbPE3Aj2jn+9pd/cn5ChVmlk4lvz0USnc60BHkew4JrbCWPzecCcLgHvXbWVf9NhN4T6BO83Vt6WxdBNWvaECgZ6cboDmpnubN2HUTH+EB+zja/K8wRewEx39tf944q3Y12lQ1yyX5aRrk/i9//YjWQVSQjcPVOfl+jXXFxFUwGgI6f8JpJTxZTS2iFTojgQrj9Aj7621IT1c3Eb9mQxuhc82NvhuiaYiyFDOuFZxHLu8hEl+g+zVf/vVGa/tqWrx69TXrJ/ShPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW0Y9yKj3o5bN6OaahLkMHu/aFDUBoAgQYh1ltBJTJQ=;
 b=Rkx3RC5wn8YVmOH2ahorWfc2k4o/brUPRVNtnOraUjBml8xmP4zVkyYzSqxhHVRX5Xy7WXMtrp1VwknnGoPwTz+cSiLIEafXdnieGQDhXZqmmcoAbTMz155eE2w4bV68MrZ9CYAQETIiyD5SnEQZdLiekFvt6qGZ+DyPMb6CNrvz6WyYXdAdaRPOaQB2odpIk7Mgrn8x/H2hpVJmcMPWJsrVu7RxKbhTmdwS6C+HZSzqWUPzlXphHhBSeuCikwFSjcJa606NfjiVfb0cWMovfPU9klqcXE/fiLSLdR3olaW9aJHVEzRKDFbptFxgsoCTkbRYUIRPLgDv9CWi8JIPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW0Y9yKj3o5bN6OaahLkMHu/aFDUBoAgQYh1ltBJTJQ=;
 b=O7o3puqaTRlgH7anj8dNb/Eddm1Vjj+R4zjPRwc1zZU/vzqjTvEvFlfNYBb+3h66AUpmU1PtI3STA+DMglg2SuQbYW0U/etdp/ADS9hLxd+TsWcvfp75actQyP+DDAJI3x2+hBG8wP05s04Fy9vBm5gMH5uTYbukRA54+QUbOtg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16186.jpnprd01.prod.outlook.com (2603:1096:604:3df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:18:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.018; Sun, 28 Jun 2026
 14:18:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
Thread-Topic: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
Thread-Index: AQHcnQYIEBblwDjwa02Xz21Etbf+ebW0kcwAgIRyqQCAASQ9AIAaq/Ng
Date: Sun, 28 Jun 2026 14:18:51 +0000
Message-ID:
 <TY3PR01MB1134624B4EF845D1CF2F2016C86E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <152f19a068fcdf27c063e845fe04a48a46c5b47e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <abq6ohQW-LPcmXgy@tom-desktop>
 <20260610212234.GA1632628@killaraus.ideasonboard.com>
 <airKwNu_PMrkpHjj@tom-desktop>
In-Reply-To: <airKwNu_PMrkpHjj@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16186:EE_
x-ms-office365-filtering-correlation-id: aabf8fa0-0e38-4eb5-092e-08ded5202d87
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|3023799007|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|5023799004;
x-microsoft-antispam-message-info:
 ek1XkFmA9JTx1f1TMTkDaPuW2BzLnNk2ljbmDYtEZ3qh0hIn5AiTR0aGxpRv060TL2vX+TUGKgHg32jP04QKIETSWEX6u0NDVItlvmGNExmChdQJr1c1af9H6UNud9iufrXNXoni5taimwrBGs5wi4IpYZWEBMWu9msIbM67rgCqrzJJG4CP+f2lbHcVnN9yQUG0FoVOaYZNH2M7Fg+9Fz+RNO9tUqLv1N6KmOp2DMumw/fiD1k4qkGt3M/+sbgYJYAxtF31A7eNy1LYqhlbmuFqbD0BqUR4N0Ex+PSeisome1QJHP1wg3La2fUbrwzezJoegphzbQEVKOOt1cwPBKtcGACJgu+cox3zqqrJ5VJSNpNmf5WMHp5XJ/+OfGwHmpN8iG3hOKvpYebj7+x884p934JprtDLePoKjTU5aolUn++PZjT73PSju5ZRub6qEf4V5lTtlDvdl0GU9hqGZ5UsLXkOF9LbaBE3jRdplSEv7/6TvpAyksKOSGDizfGynd+Nic03WiaA+MOCejuhFZE/wiBJzcDxxQKKgIz7NsktMYPb55lDCe3lIm0lELr+WAiOgPnhqlg2k8U4IP+l+VYhL1s72gHWy4PzPw40bdhO8Cj30MuvZxkQRjwYG5GEZHwtAEeyTJ4ldP5ysUFjoj7TNTg4aX/rFzh3WXaPYHutvg9A5QFE0YgaZ2uGi7Ku7lu/gOALpvzKCJBBCy0eVyo1/6inUthd8XIdkyrWESg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(3023799007)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azJzeU5kbmpFYjd6NlZaU3E4NmdmdEdpUXBiY0k3UWZTWW1wa2FzZW8yM1dV?=
 =?utf-8?B?dkJLOUxjVEt1K0x3Rlp6TmRCQUhEaTJtTmY1SHdQREwzMFM2U0FTWXhGTmF6?=
 =?utf-8?B?REVsZzMzd0FENDhVSFgyellPbC9uSXY1OXZFR01qd3NhSDJrOVJUN0tLYjJZ?=
 =?utf-8?B?TnR4U2NGOWV0Rm4wZmlvL2pkUmtIWmFtRzY3azdtbnB5RmR2dkdoL3prc1lW?=
 =?utf-8?B?UnlzVjdQOUdpMkhCVFlOMUhmaXloenlRaGlmOXlONnhDc05OYTg3OWJucU1q?=
 =?utf-8?B?ekZIMUtHSWVRRGhPMldLQ2RweUVFeFBTcGZyVE9ic3BWVW5UVUVzM0dxRW40?=
 =?utf-8?B?SmZxY21nOWtDYzFEcXhaa1FNNWNrUUpLSEVBZjNuV2E4Y1Y2U3RQbHRwc3NU?=
 =?utf-8?B?Zm9DRVJTakdEZWh4WWE5T25kWXMyUGcxRXROeEt3eHlWSFAyUTByQTEzMjlP?=
 =?utf-8?B?eGcyUzZRcG1LYW14ZXRtWTJPelhIbUEvc0pWazFMV2RSeE93STlxbXZlSW1l?=
 =?utf-8?B?dUNXZ3NCRXlqY2l4WWE5d05TekhGOFAxa3lva2JUaGxtOW9aTlpPRWNGSlBh?=
 =?utf-8?B?ZFNERDRkSFBDMFAwanB6Wk9iVlNIYlRqTzZPN3psZGxpVlBNMUxPOWJXT0FQ?=
 =?utf-8?B?bXpINU9PRnllUmZ3NVVzWUxVNmR2Y2FKMXRtWkExcjh5M1g1cTFpSjgweEJE?=
 =?utf-8?B?MkdZalRieUtEN0xhZllMQkd0VzNuN1FLYmtIdGRQSWNlaEozVVhuNzE1T1NM?=
 =?utf-8?B?Z1VjRCtldDBLVXM1S1AwemVIVXNPaWVoWFF0dXJnV1FjeVprbFBQekJMQ3lJ?=
 =?utf-8?B?Y1huSjI0Z0ZNa3NMWWZxUnhBR2t4bzZ3cmYzQVd1LzgxdUh0bVdRTldEenFn?=
 =?utf-8?B?WTBYTnVZSkkyWlBKNEpPeHQ2by82amExWkY3Q3UxQUlybitMK2pGeXl6WDQ5?=
 =?utf-8?B?REF6KytQajYyMTFBeFlUQXRML1pxMHA3a3RyWlZua0JRYXlZd2dpVFI1azBX?=
 =?utf-8?B?TTF2WnQ3aVlNUjBxTjJwVkRoa1laeWRIOE12ZnQ0SDhyOEhpOEUrTlFOOGZy?=
 =?utf-8?B?R1hOVit4dkZ4RHJYa3lRNmEycmIyY1BmbVFua0E0ZHloT3NYSHMyS25abG84?=
 =?utf-8?B?bkl1Njd2TEsrcU42THRYSDZzcTE1L0g0VS9wS2M2M1ZlRTlFT1Z3VG9iYlRX?=
 =?utf-8?B?dlN4djZMUjVaS2hvYlRaR08yRFZLOFg3QjdiSStTaUFHMTNlZE9ybGRQdW53?=
 =?utf-8?B?N3RuZm5kcmlpTUQ5Q2pvZHpTd3BiRStQd0g3SjRBVlpxbGFQR0pDUUxtRGRY?=
 =?utf-8?B?UGNOZURTTno5TjRTY3ZRM1JOUWZlUWpCc0JYTjNuNCtQbk9zZk5YSWFOUnIz?=
 =?utf-8?B?N0NyaFdJZTBaSnZiMUs5cTdjWWU2azk2WDNMNmhnQVR0Y0VqdnZhSmNselV4?=
 =?utf-8?B?UThiQXdkWXIxek9uOW16RTV1N1RVVEl2dCtJRHRvbGFZcU5TOTBFSDhmY0tJ?=
 =?utf-8?B?Q2Vpb1FNU01IV0VzbUFOQy9BdXNOVmd5K0d1aGdVQlFoc3N5S3I0SDQ3UmpY?=
 =?utf-8?B?ZG5VUHNZL2ZvY2ZDaGZhbjlqWm9GNGowQnZ2WmVxaW1MakVqNEdPditvQmRY?=
 =?utf-8?B?dFZDcVdlRVNaZzdTUHdLbldXQWpibE9mbU8xeEJHZ0cvL2h4R0NKa20rYlpK?=
 =?utf-8?B?VkNXYXlpdXFWMFNmVWxScFVmQW1FOFgvQTdmTXo0L2xpVlhWVUlZNW9NUnB3?=
 =?utf-8?B?M0k4VStBRFhJUlJsaGFpQTI2M1NRNWptVUQxUFhIY20yU2kxckJGdVdZSGlC?=
 =?utf-8?B?a3huZWJlWVQyS0RrZ095THdlK29FZ2E3NDdlK0tkZDJHbWJiTUdKMG5ydlo3?=
 =?utf-8?B?bTFHdFFYejhydGEyckFZYndKYks2UkZzSGE0TFJOM0dnay9OSjErRVE4UTQz?=
 =?utf-8?B?eVYxMGlUSHpsUlM0ZFFNTy8wVzVLOGVOa2s3VmdmU3U0TVdnekRna0xZdGpT?=
 =?utf-8?B?aVJSeWpUWXBhNDZUVEk0ajBldXFnN21vMC92Q0FLeGJLZnV0R2g1UEdtSWo1?=
 =?utf-8?B?ZWtnVDcrb0k4SXlib2tnaGd2VVBTNmFoK0lweDI1dHJJZkRiQkMvMTRtcmxl?=
 =?utf-8?B?SzI4QnRXcGozb0hxbXlHOU5iZVJma1YzM2F5Zmh1eERTaEFNdjQxN1pHaHlX?=
 =?utf-8?B?YTd5RTU3WGJmU0VDaGhodHV4YnFFZTV4RUNKNFdWTmR5L0VWK3BpZEJuV1Rh?=
 =?utf-8?B?dlVaUXBieWdzLzdPbzZKeVR0MXZTK2U0SzBxTDN1UVpTUzFOTkVvYy9PR2ds?=
 =?utf-8?B?dDZOV2I4eVU1VTY3YldRTGIrK1l0OVlSZ3dqQ2dlaWVRck1SWlVldz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aabf8fa0-0e38-4eb5-092e-08ded5202d87
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2026 14:18:51.2631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7sk2LPJUwsM4/ZC0oCNT3KdqJQAoZsppY6199tuY1sMlVKCi74qc3DtE+L1j9pVl6L84/hvoSadCFZzBOODj0B3QGg6fInF2Y2Apc3M+g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34493-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:laurent.pinchart@ideasonboard.com,m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:linux-renesas-soc@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D65A6D40A1

SGkgVG9tbWFzbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21t
YXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gU2VudDog
MTEgSnVuZSAyMDI2IDE1OjQ5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTQvMjBdIGRybTog
cmVuZXNhczogcnotZHU6IEFkZCBSWi9HM0Ugc3VwcG9ydA0KPiANCj4gSGkgTGF1cmVudCwNCj4g
VGhhbmtzIGZvciB5b3VyIHJldmlldy4NCj4gDQo+IA0KPiBPbiBUaHUsIEp1biAxMSwgMjAyNiBh
dCAxMjoyMjozNEFNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+IEhpIFRvbW1h
c28sDQo+ID4NCj4gPiBPbiBXZWQsIE1hciAxOCwgMjAyNiBhdCAwMzo0NTo1NFBNICswMTAwLCBU
b21tYXNvIE1lcmNpYWkgd3JvdGU6DQo+ID4gPiBPbiBGcmksIEZlYiAxMywgMjAyNiBhdCAwNToy
Nzo0MFBNICswMTAwLCBUb21tYXNvIE1lcmNpYWkgd3JvdGU6DQo+ID4gPiA+IFRoZSBSWi9HM0Ug
U29jIGhhcyAyIExDRCBjb250cm9sbGVyIChMQ0RDKSwgY29udGFpbiBhIEZyYW1lDQo+ID4gPiA+
IENvbXByZXNzaW9uIFByb2Nlc3NvciAoRkNQVkQpLCBhIFZpZGVvIFNpZ25hbCBQcm9jZXNzb3Ig
KFZTUEQpLA0KPiA+ID4gPiBWaWRlbyBTaWduYWwgUHJvY2Vzc29yIChWU1BEKSwgYW5kIERpc3Bs
YXkgVW5pdCAoRFUpLg0KPiA+ID4gPg0KPiA+ID4gPiBMQ0RDMCBzdXBwb3J0cyBEU0kgYW5kIExW
RFMgKHNpbmdsZSBvciBkdWFsLWNoYW5uZWwpIG91dHB1dHMuDQo+ID4gPiA+IExDREMxIHN1cHBv
cnRzIERTSSwgTFZEUyAoc2luZ2xlLWNoYW5uZWwpLCBhbmQgUkdCIG91dHB1dHMuDQo+ID4gPiA+
DQo+ID4gPiA+IERlcGVuZGluZyBvbiB0aGUgc2VsZWN0ZWQgb3V0cHV0LCB0aGUgY29ycmVjdCBT
TVVYMiBjbG9jayBwYXJlbnQNCj4gPiA+ID4gbXVzdCBiZSBjaG9zZW4gYmFzZWQgb24gdGhlIHJl
cXVlc3RlZCBkdXR5IGN5Y2xlOg0KPiA+ID4gPg0KPiA+ID4gPiAgLSBJbmRleCAwIGZvciBMVkRT
IC0+IENESVY3X0RTSXhfQ0xLIChEVVRZIEgvTD00LzMsIDQvNyBkdXR5DQo+ID4gPiA+IGN5Y2xl
KQ0KPiA+ID4gPiAgLSBJbmRleCAxIGZvciBEU0kvRFBBRCAtPiBDU0RJVl8ydG8xNl9QTExEU0l4
IChzeW1tZXRyaWMgNTAlIGR1dHkNCj4gPiA+ID4gY3ljbGUpDQo+ID4gPiA+DQo+ID4gPiA+IFRv
IHN1cHBvcnQgdGhpcyBiZWhhdmlvciwgaW50cm9kdWNlIHRoZQ0KPiA+ID4gPiBgUlpHMkxfRFVf
RkVBVFVSRV9TTVVYMl9EU0lfQ0xLYCBmZWF0dXJlIGZsYWcgYW5kIGV4dGVuZCB0aGUNCj4gPiA+
ID4gYHJ6ZzJsX2R1X2RldmljZV9pbmZvYCBzdHJ1Y3R1cmUgdG8gaW5jbHVkZSBhIGZlYXR1cmVz
IGZpZWxkLg0KPiA+ID4gPiBBbHNvLCBhZGQgYSBuZXcgaGVscGVyIGZ1bmN0aW9uIGByemcybF9k
dV9oYXMoKWAgdG8gY2hlY2sgZm9yIGZlYXR1cmUgZmxhZ3MuDQo+ID4gPiA+DQo+ID4gPiA+IEFk
ZCBzdXBwb3J0IGZvciB0aGUgUlovRzNFIFNvQyBieSBpbnRyb2R1Y2luZzoNCj4gPiA+ID4gIC0g
YHJ6ZzJsX2R1X3I5YTA5ZzA0N19kdV9pbmZvYCBzdHJ1Y3R1cmUNCj4gPiA+ID4gIC0gVGhlIGBy
ZW5lc2FzLHI5YTA5ZzA0Ny1kdWAgY29tcGF0aWJsZSBzdHJpbmcNCj4gPiA+ID4NCj4gPiA+ID4g
QWRkaXRpb25hbGx5LCBpbnRyb2R1Y2UgdGhlIG1pc3Npbmcgb3V0cHV0IGRlZmluaXRpb25zDQo+
ID4gPiA+IGBSWkcyTF9EVV9PVVRQVVRfTFZEU3swLDF9YC4NCj4gPiA+ID4NCj4gPiA+ID4gSW50
cm9kdWNlIGByemcybF9kdV9jcnRjX2F0b21pY19jaGVjaygpYCBoZWxwZXIgdG8gc3RvcmUgdGhl
DQo+ID4gPiA+IHJvdXRlcyBmcm9tIHRoZSBDUlRDIG91dHB1dCB0byB0aGUgRFUgb3V0cHV0cy4N
Cj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNv
Lm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2NC0+djU6
DQo+ID4gPiA+ICAtIEZpeGVkIFJHMkxfRFVfRkVBVFVSRV9TTVVYMl9EU0lfQ0xLIHRvIFJaRzJM
X0RVX0ZFQVRVUkVfU01VWDJfRFNJX0NMSywNCj4gPiA+ID4gICAgdXBkYXRlIGNvbW1pdCBib2R5
IGFjY29yZGluZ2x5Lg0KPiA+ID4gPiAgLSBBZGRlZCBmZWF0dXJlcyBmaWVsZCBkb2N1bWVudGF0
aW9uLg0KPiA+ID4gPg0KPiA+ID4gPiB2My0+djQ6DQo+ID4gPiA+ICAtIE5vIGNoYW5nZXMuDQo+
ID4gPiA+DQo+ID4gPiA+IHYyLT52MzoNCj4gPiA+ID4gIC0gTm8gY2hhbmdlcy4NCj4gPiA+ID4N
Cj4gPiA+ID4gdjEtPnYyOg0KPiA+ID4gPiAgLSBJbnN0ZWFkIG9mIHVzaW5nIGNsay1wcm92aWRl
ciBBUEkgdG8gc2VsZWN0IHRoZSByaWdodCBwYXJlbnQgY2xvY2ssDQo+ID4gPiA+ICAgIGJhc2Vk
IG9uIHRoZSBvdXRwdXRzLiBKdXN0IHNldCB0aGUgY29ycmVjdCBkdXR5IGN5Y2xlIGJhc2VkIG9u
IHRoZQ0KPiA+ID4gPiAgICBvdXRwdXQsIHRoaXMgcmVmbGVjdHMgYXQgQ1BHIGx2bCB0byBzZWxl
Y3QgdGhlIHJpZ2h0IHBhcmVudC4NCj4gPiA+ID4gIC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZSBh
Y2NvcmRpbmdseS4NCj4gPiA+ID4NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6
LWR1L3J6ZzJsX2R1X2NydGMuYyB8IDQ4DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysgIGRy
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jDQo+ID4gPiA+IHwgMjYg
KysrKysrKysrKyAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2Lmgg
IHwNCj4gPiA+ID4gMTIgKysrKysNCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jDQo+ID4gPiA+IGluZGV4IDZlN2FhYzYyMTliZS4u
Y2MzNWRkNDA5ZTNlIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNh
cy9yei1kdS9yemcybF9kdV9jcnRjLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jDQo+ID4gPiA+IEBAIC02NCwxMSArNjQsMzIgQEAN
Cj4gPiA+ID4gIHN0YXRpYyB2b2lkIHJ6ZzJsX2R1X2NydGNfc2V0X2Rpc3BsYXlfdGltaW5nKHN0
cnVjdCByemcybF9kdV9jcnRjDQo+ID4gPiA+ICpyY3J0YykgIHsNCj4gPiA+ID4gIAljb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSA9DQo+ID4gPiA+ICZyY3J0Yy0+Y3J0Yy5zdGF0
ZS0+YWRqdXN0ZWRfbW9kZTsNCj4gPiA+ID4gKwlzdHJ1Y3QgcnpnMmxfZHVfY3J0Y19zdGF0ZSAq
cnN0YXRlID0NCj4gPiA+ID4gKwkJdG9fcnpnMmxfY3J0Y19zdGF0ZShyY3J0Yy0+Y3J0Yy5zdGF0
ZSk7DQo+ID4gPiA+ICAJdW5zaWduZWQgbG9uZyBtb2RlX2Nsb2NrID0gbW9kZS0+Y2xvY2sgKiAx
MDAwOw0KPiA+ID4gPiAgCXUzMiBkaXRyMCwgZGl0cjEsIGRpdHIyLCBkaXRyMywgZGl0cjQsIHBi
Y3IwOw0KPiA+ID4gPiAgCXN0cnVjdCByemcybF9kdV9kZXZpY2UgKnJjZHUgPSByY3J0Yy0+ZGV2
Ow0KPiA+ID4gPg0KPiA+ID4gPiAgCWNsa19wcmVwYXJlX2VuYWJsZShyY3J0Yy0+cnpnMmxfY2xv
Y2tzLmRjbGspOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJaWYgKHJ6ZzJsX2R1X2hhcyhyY2R1LCBS
WkcyTF9EVV9GRUFUVVJFX1NNVVgyX0RTSV9DTEspKSB7DQo+ID4gPiA+ICsJCXN0cnVjdCBjbGsg
KmNsa19wYXJlbnQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkJY2xrX3BhcmVudCA9IGNsa19nZXRf
cGFyZW50KHJjcnRjLT5yemcybF9jbG9ja3MuZGNsayk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkJ
LyoNCj4gPiA+ID4gKwkJICogUmVxdWVzdCBhcHByb3ByaWF0ZSBkdXR5IGN5Y2xlIHRvIGxldCBj
bG9jayBkcml2ZXIgc2VsZWN0DQo+ID4gPiA+ICsJCSAqIHRoZSBjb3JyZWN0IHBhcmVudDoNCj4g
PiA+ID4gKwkJICogLSBDRElWN19EU0l4X0NMSyAoTFZEUyBwYXRoKSBoYXMgRFVUWSBIL0w9NC8z
LCA0LzcgZHV0eSBjeWNsZS4NCj4gPiA+ID4gKwkJICogLSBDU0RJVl8ydG8xNl9QTExEU0l4IChE
U0kvUkdCIHBhdGgpIGhhcyBzeW1tZXRyaWMgNTAlIGR1dHkgY3ljbGUuDQo+ID4gPiA+ICsJCSAq
Lw0KPiA+ID4gPiArCQlpZiAocnN0YXRlLT5vdXRwdXRzID09IEJJVChSWkcyTF9EVV9PVVRQVVRf
TFZEUzApIHx8DQo+ID4gPiA+ICsJCSAgICByc3RhdGUtPm91dHB1dHMgPT0gQklUKFJaRzJMX0RV
X09VVFBVVF9MVkRTMSkpDQo+ID4gPiA+ICsJCQljbGtfc2V0X2R1dHlfY3ljbGUoY2xrX3BhcmVu
dCwgNCwgNyk7DQo+ID4gPiA+ICsJCWVsc2UNCj4gPiA+ID4gKwkJCWNsa19zZXRfZHV0eV9jeWNs
ZShjbGtfcGFyZW50LCAxLCAyKTsNCj4gPiA+ID4gKwl9DQo+ID4gPiA+ICsNCj4gPiA+DQo+ID4g
PiBJ4oCZZCBhcHByZWNpYXRlIGFueSBmZWVkYmFjay9zdWdnZXN0aW9ucyByZWdhcmRpbmcgdGhp
cy4NCj4gPiA+IFRoYW5rIHlvdSBpbiBhZHZhbmNlIGZvciB5b3VyIHRpbWUuDQo+ID4NCj4gPiBT
b3JyeSBmb3IgdGhlIHZlcnkgbGF0ZSByZXBseS4NCj4gDQo+IE5vIHdvcnJpZXMsIHRoYW5rcyBm
b3IgeW91ciB0aW1lLg0KPiANCj4gPg0KPiA+IEkndmUgdGFrZW4gdGltZSB0byBhbmFseXNlIHRo
ZSBjbG9jayB0cmVlLCBhbmQgSSB0aGluayB0aGUgd2F5IHlvdQ0KPiA+IG1vZGVsIGl0IG1ha2Vz
IHNlbnNlLiBBcyB0aGUgU01VWDJfRFNJWzAxXV9DTEsgY2xvY2tzIGFyZSB1c2VkIGJ5IHRoZQ0K
PiA+IExDRCwgTFZEUyBhbmQgRFNJIGJsb2NrcywgSSBtYXkgaGF2ZSBzZWxlY3RlZCB0aGUgZHV0
eSBjeWNsZSBpbiB0aGUNCj4gPiBMVkRTIGFuZCBEU0kgZHJpdmVycyBwZXJzb25hbGx5LiBJIHdv
bmRlciBpZiBpdCB3b3VsZCBsZWFkIHRvIHNpbXBsZXINCj4gPiBjb2RlICh5b3Ugd291bGRuJ3Qg
bmVlZCB0byBpbXBsZW1lbnQgcnpnMmxfZHVfY3J0Y19hdG9taWNfY2hlY2soKSkNCj4gPiBoZXJl
IGZvciBpbnN0YW5jZS4gSW4gYW55IGNhc2UsIGl0IGRvZXMgbm90IGFmZmVjdCB0aGUgRFQgYmlu
ZGluZ3MsIHNvDQo+ID4gaXQgY291bGQgYmUgY2hhbmdlZCBsYXRlciB0b28uDQo+IA0KPiBBZ3Jl
ZWQsIHdlIGNhbiBjaGFuZ2UgdGhpcyBsYXRlci4NCg0KSSBiZWxpZXZlIHlvdSBkb24ndCBuZWVk
IHRvIHVzZSB0aGUgZmVhdHVyZSBmbGFnIA0KUlpHMkxfRFVfRkVBVFVSRV9TTVVYMl9EU0lfQ0xL
IGFuZCByemcybF9kdV9jcnRjX2F0b21pY19jaGVjaygpDQphcyBMYXVyZW50IHN1Z2dlc3RlZCwg
SWYgeW91IG1vdmUgdGhlIGNsa19zZXRfZHV0eV9jeWNsZSgpIHRvDQpMVkRTIGJyaWRnZSdzIGF0
dGFjaCgpIHRvIG1ha2Ugc3VyZSBpdCBjYWxscyBiZWZvcmUgdGhlDQpyemcybF9kdV9jcnRjX3Nl
dF9kaXNwbGF5X3RpbWluZygpLCBzbyB0aGF0IFBMTCBnZW5lcmF0ZXMgcmlnaHQNCmRvdCBjbG9j
ay4NCg0KRGVmYXVsdCBpcyA1MCUgZHV0eSBjeWNsZShmb3IgRFNJIGFuZCBSR0IpIGFuZCBvbmNl
IExWRFMgZHJpdmVyDQpjYWxscyBjbGtfc2V0X2R1dHlfY3ljbGUoKSBpdCBjaGFuZ2VzIHRvIDQv
NyBkdXR5IGN5Y2xlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K


Return-Path: <linux-renesas-soc+bounces-33980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RmFbB3qbL2qgDAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:28:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDC683C9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=LjNzY5lm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 869F73002E36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 06:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73373B0AE6;
	Mon, 15 Jun 2026 06:28:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C771A6816;
	Mon, 15 Jun 2026 06:28:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504887; cv=fail; b=EDPRDZ5PATpnd46LeIWZbKf7jOhd8ScWplwS6kYgXGWRhqd/+TukaN8UiHSXqwCSYYgMdWKfnhPTjjx1V9wxQ4ib5D1HBbGenpo8Q4filhhgJoPlEMG5pv9uYQBFI/FLTNR4xStGitnFsjGneZYjd9TdKQGUOF8TR0J18J5vpyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504887; c=relaxed/simple;
	bh=qICAofIUQnGyqVYYw70XUPEntPh0yWW/lxN8VmyqaRg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CTMmzSOmRZKNWJqK5JqVSts7ZyQTWGgVlKzyPE1t4/01hj6YhbH4aiuNHfucd0IAvk1Jd+KQXZ31jTMCIVpqIFf7pvAhiTym/5CiadzvXskdL8mtMwlrGeublaOEftAxMFq2zNW28NJugoT2Zx0p+vJ0g01iSgsBmC29Ya+lrUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LjNzY5lm; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSBMc3V8fsl7T2vrpss90nHFUqW3U3vnVtVK9fUrvK0vQvva9UP+W9XhM4xRqHD3gvgz6zlXmLmA29GQOAUQHRuhtj218IZNQuwbRBdakcZXjWuCjGQsqAuKOUAMNQ9uNiVYlabYHnftVghVxalG6n+5n/93IIUXqCx09sTFjMjiIGuiDd7yv5ojCmEJ5nh5tynopB7jqAVN+TWcsnzo532+PBXfWTiMyhs34xA9hf4L2s1UwHqx8sSsFx2TwyISxTfAJ9AWv8SFM0VHtWJiVNYXLkgvqry7N1nn9emltaCxC4FRvTpqcjjDeYiWHBvAl55IIlLNkq7ucpvx6gNyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qICAofIUQnGyqVYYw70XUPEntPh0yWW/lxN8VmyqaRg=;
 b=s1B7ChNvblWg4Ch5Ua7Z3Fze+9EM552fFfh8vYhABueJirqApJKLzhcsMWgOXMnyv3JDEsivXQ5xgLbuQFBMCwWv9lo4cdKJ97GZTJsISJtVbUYE346+X4gk9lkQCa1X/lM8+wjioB+RwHJRhiiM1i8RCW722BZ9m9gE+mSgJDQ5Uj7/H/x9WCE3EKPp15HC/dbuJOL8Nui4IbtzjzQekkkWOipkGbQ9unxub0/j4/+oB1wNdyz+A27ZZqSFn/0aFxEvvBUx1vjCSP1QNtLEx+8P5pt9ils7CaAEevmww17tFfj7jgCxm6hA20iL2XISPYJnL7QU1bc6JavRt2uFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qICAofIUQnGyqVYYw70XUPEntPh0yWW/lxN8VmyqaRg=;
 b=LjNzY5lmHBnm5JKrB/7ldx4zjf5TcRtJFEqgjKVcti0cGp165dFpjjyHD8ohri+TGd2lpewagV7Puzb14fE/uUgS7GlrrjO4yrq5hZvnhp/vlXozkN1+yd2hhHwNF8TIMAXS26TMQEPENBjIhAdgYI1McRQoLoUxrM2CiEoyvC0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14337.jpnprd01.prod.outlook.com (2603:1096:405:23a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:28:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:27:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Index: AQHc9z2t0rzHysclGU226VvULbQLWLY/LNcAgAAEh6A=
Date: Mon, 15 Jun 2026 06:27:51 +0000
Message-ID:
 <TY3PR01MB1134649D1F8020544193652F586E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260615-ultramarine-vole-of-art-653db7@quoll>
In-Reply-To: <20260615-ultramarine-vole-of-art-653db7@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14337:EE_
x-ms-office365-filtering-correlation-id: d1bebf6e-5892-409a-8e5d-08decaa73a17
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 70m3XSbnVak8sfKrYt2T2ngrfdgaVmteJ1y6H9pnTJ59yBCm5clo5AEKRMRgg7noWc2t0nSpOeMLMcz5CtJeA3o9pjEunPIsuv2Rh2+wViJ6BMR3XEr076EkMteImDbOYBVqDk/sD2TLmrhV1TX7UA8gABr95AWIBjd9SDDAwic+JDS0QARJgbFMb6WkgIdJPPFjzVhKGmIZTyZamo5KTuLln7pJY0FuIGf++XFPEB3onLoGsh7JP+3b6/DusEcQ9GbtA/okYr6FxJNGjiM5kwhTVpRkRzHsMdlxuuJ21Yp4kn7yhrsGmkHMCTtx5J0s9rhQGj/6rwKq6ulF5BRC8eEk0awOT994vd5IzBGbicZ0lOj1zMokWnvKZWR9DiIT/JcnnesevjfpSs/Y4lnAeOKwzbDVKeYqvLDrNlymgxEBE4gzoNTZYXpcHqnh8OZFNwerw7X3WoyfD+3gnMp+CBBoPcEPfgHLOJfB5RBQH54aVSh2VxChNR4Dkn5NnHWVDNO2xC/qjjkhlNZDvLEmvlni9pHdZcOISSKtQUKY47yIydqX6fdZNf4WZilhnaTk0mJZ9XAJZ2LclBhx65b8H4SKf96pTAwQIP7yt0KocIvaZv1Mj/ScHPqerxep+/t1HD/9Dk7hPc2N6Co94STQsTxQfvVnqm1M8gJstOEvByRBp7a1QwEas3nezwdPQY+/7FIA8s9F5KRIHGnc3Z2UhDNfxXaZDEfyxQ9Z+gW+c7iYQvziucLz4GNaL3BYRBaU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWVoTVM3MXpQakRNZVFTc2t6djl5VEZjUWI4by8rc2Y2dWM1MWFSVjk1WkVk?=
 =?utf-8?B?SDh3Wnpjd29kcnU4alFpcm0wYk1IVXIrRlg0dFRVQmlBVngrSmpWdWM3Q0pa?=
 =?utf-8?B?bW1yZFlsTTdKaSsvaCtHemwrTHYxbEo0OTA1c3RZQlZVSHZHZm55aVpoaGVW?=
 =?utf-8?B?VkJhMWY0ZWM2OWZ5dnZ4dW8yOExOQVh6YVo5SDdoWGkzSmRkZU9tdEpWVEVq?=
 =?utf-8?B?cFlyYjBTejF2TE8rb3hUZ0ZicnphWHQ5cU1obHo5ZURiSHBpeWwzb2RQb1dZ?=
 =?utf-8?B?RWVnb05WbVRBRUQxQ3VML0dpcmtKUThPajlUc0dicUlUcDZXNjBoSDd3TW1o?=
 =?utf-8?B?d0Jja0NKYjRyR21lV0ZKYTE5OXJobFJUWE4way90c1B5T0ptSmY1Z1o1TGFj?=
 =?utf-8?B?Z2p1dU4vRzIxalN3MkxSdXNHMElVRHc5dGtVTUZoa0c4c0ZLeERIOFd6RTZ0?=
 =?utf-8?B?VStMZHRobW44OERjaUxEaXBmdzRSOGI1STM0Z0g1MytRWjVKU1hxelRHbjhk?=
 =?utf-8?B?ZEVDM1MzN3lTTVZtZTFqcHhuZE9xcy9KenQ4cGk0d0F1SkNZQ09oL0w5K2N1?=
 =?utf-8?B?Q0xneVNPa21wTXpJcXUySGZJVi9kSTlIbWFHcnArY3dmZy9qbXdVMGF6WmE1?=
 =?utf-8?B?Tm50RE5qa25vb3FsM2liVXNLWmlYQ2trZ3dsMG40ZngveXdOcVg5d0tpS0N1?=
 =?utf-8?B?Ui9hRXc2cUtSWmp4L0UxQkQ2RVZnNElhbjZJVUpsbHhQUWFRQitKdHYyZkNI?=
 =?utf-8?B?eGZrUElYd3haVVZydTExcEF6SUZ2bFY4S0hPRmZnOVdnN29JcndiTHVFalRO?=
 =?utf-8?B?TUthaVVWTVlqcXhPdy9UNnhXVmszSUNpNHlocVdUWWxjK2U2RERuc0tiTGY4?=
 =?utf-8?B?bFdTZm84bVB0YzF3MHFOSEZINUd4MHlrclQrS2ZJYitSWTlwbU1mR3BIQW15?=
 =?utf-8?B?OUtIOFFXeHR2d3R4U3Y1N212ekRRVVVyUVF2M3VtMEE4WUxWdW1kNzZYL2VF?=
 =?utf-8?B?bFM0SWdxanVEM3FFSGFCT1V1MEluTlVIdloyQ3lmZU1EOXFrUXdBeENleGhV?=
 =?utf-8?B?cmF0dmRzUE52Sys5amczS25TNTMyOS91WWNnTFI3cnhwTUUxbjVjQm9qWVBm?=
 =?utf-8?B?WU9vYmFoanZaRGZ3eE95M05JOHpQUjhNeWFXK1hNUlA3czdDcDJNK20rc0pi?=
 =?utf-8?B?TGNvSVFNZk5BWFAzKzRmQWRteEkrSzVPbG5oUkJtSCtlTlJqWVJyRFlWSmZF?=
 =?utf-8?B?cVhBL0FZS1JPT3pSMUhNTHA3TEpybWcwYUpqdzlBZ1BNNlJnQ2Q3ZmxNdEVw?=
 =?utf-8?B?NWQxNUdVZWs1emRHdTZWUFRVTi9sV1p5Q1kzQUxSY1lFUytyREl6OHU5NURp?=
 =?utf-8?B?RnA0OHNuTDBYMWFBVDF4MUFSSy9qUzh5dGIyN24rM2ptS2o4alAwTmlXYjdp?=
 =?utf-8?B?bzlUaGpWZjk1MlREY1lIY3lxamowcGRPS3NTMk5hanQvaDNiY3VDQU1hRkh0?=
 =?utf-8?B?R1VzUU1EYUFMbUliL1o1RThGUWd1Q3M3aDBuYzBwZzM4TUx0RnFXR0dDRHZS?=
 =?utf-8?B?QW9Yb1ZFMHdvLytmdFFmOHVPZDQ2b29JS1pDazNRYzFtNUZyUDFabDVYSXZt?=
 =?utf-8?B?N09tS0dGRmtsSWxySDVEZVNBMmRYYzcxckE0VE1lbmR3Znp6Mm1jSEdFMzZF?=
 =?utf-8?B?S0NHUm5tMEVCTi9kZzNIa2ZyVWdsRkJtUTJ5VUVQNlk5RmtDSWlJejNFMnU0?=
 =?utf-8?B?eXB0dllIanA5SVphOXRUNDFpcjQxK1Z3SUJsbVFGbm8xbUd4dk5FN3hCS2xJ?=
 =?utf-8?B?YUZHNk0ra0hnbDRhYVVCLzhzOHQ1bldDZjNWWSt1MnpyeWkwQ1J0Um91bTcr?=
 =?utf-8?B?RHlRUHl0d3k1QUFVSTV3cXVpWERDd3JiSjhqRE5OdmtzS0taNFZKZE9WQTNP?=
 =?utf-8?B?UDE5TUE4SzhBR21qdXVSbmxLU1VVSnRJWmM0bURoSTVSdWtuSllyYzQ5SG9F?=
 =?utf-8?B?SW1FeCs1Y1dxU05qK1pDQVN4a2lmeG5LdVhSTTdQdGVJQkRHbnFuY2J0aERk?=
 =?utf-8?B?MkswOFI4TUZvay9sbzFrUHV1NjEzZzZQVlVURzJKRStsZHd3dHlKaWd0MFdP?=
 =?utf-8?B?cGJMSW5kYlRSSE1YR0pUcmxNQjNYYXVkM2ZwbSt0dmZDakhWQUJoMHdiTDZq?=
 =?utf-8?B?UmMyTVZrekFHNWRYMU1FUXVFOHRUclpvb2JoVnFGUHdkK1Y0aTFabXErMjRC?=
 =?utf-8?B?TTY5M3FsVjNTTWdTNWJDSVhJWWNUUVV1UHBDOXRaMGFIMHUxdlMrbnhwUjVD?=
 =?utf-8?B?dlI0QlRXcTM5eEZHak5vd0xnMGZSdHVCQXZ5YStOSVMrL2J2dlQrdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bebf6e-5892-409a-8e5d-08decaa73a17
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:27:51.5762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wU5xKRz7ALFsZcAmJI4wIaKtMrjRdBfvCSVcmF5kfjnA0+XWLY91hghvm+urpVbObeEDdtkSIS+Wn6u00yxHYOft06nysL7dHO6y0g4vEaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14337
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33980-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EDDC683C9F

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDE1
IEp1bmUgMjAyNiAwNzoxMA0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IFJldmVydCByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiANCj4gT24gTW9u
LCBKdW4gMDgsIDIwMjYgYXQgMDE6NTU6MDhQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4gPiBSZXZlcnQgY29tbWl0IDUxMjg0ZDhiMWRiYyAoImR0LWJpbmRpbmdzOiBtZmQ6
IHN5c2NvbjogRG9jdW1lbnQgdGhlDQo+ID4gTFZEU19DTU4gc3lzY29uIGZvciB0aGUgUlovRzNM
IikgYmVjYXVzZSBpdCBpcyBjb21wbGV0ZWx5IG5vdCBtYXRjaGluZw0KPiA+IHJlYWxpdHkgYW5k
IGNsZWFybHkgaW5jb3JyZWN0IGluIHJlc3BlY3Qgb2YgcmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1j
bW4uDQo+ID4NCj4gPiBJdCB3YXNuJ3QgZXZlciBidWlsZC10ZXN0ZWQgYnkgYXV0aG9yIG9uIHRo
ZWlyIERUUywgZWl0aGVyLg0KPiA+DQo+ID4gVGhlIGRvY3VtZW50ZWQgcmVuZXNhcyxyOWEwOGcw
NDYtbHZkcy1jbW4gY29tcGF0aWJsZSBjbGVhcmx5IGRpc2FsbG93cw0KPiA+IGFueSBjaGlsZHJl
biBhbmQgc2ltcGxlLW1mZCBmYWxsYmFjaywgaG93ZXZlciBpdHMgb25seSB1c2UgaW4gb3JpZ2lu
YWwNCj4gPiBwYXRjaHNldCBpcyB3aXRoIHNpbXBsZS1tZmQgYW5kIGNoaWxkcmVuLCBzbyB0aGlz
IGNvdWxkIGhhdmUgbmV2ZXINCj4gPiB3b3JrZWQuDQo+ID4NCj4gPiBGaXhlczogNTEyODRkOGIx
ZGJjICgiZHQtYmluZGluZ3M6IG1mZDogc3lzY29uOiBEb2N1bWVudCB0aGUgTFZEU19DTU4NCj4g
PiBzeXNjb24gZm9yIHRoZSBSWi9HM0wiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBL
b3psb3dza2kNCj4gPiA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiA+
IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55
YW1sIHwgMSAtDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24u
eWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24u
eWFtbA0KPiA+IGluZGV4IDljODEwMTBkNWE3NC4uZTIyODY3MDg4MDYzIDEwMDY0NA0KPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1s
DQo+IA0KPiANCj4gRm9yIHRoZSByZWNvcmQ6IHRoaXMgcGF0Y2ggaXMgc3RpbGwgdmFsaWQgYW5k
IGp1c3RpZmllZCwgZXZlbiB3aXRoIG15IG90aGVyIHN5c2Nvbi1yZWxhdGVkIHdvcmsuDQo+IA0K
PiBUaGUgY29tcGF0aWJsZSBoZXJlIGlzIG5vdCBjb3JyZWN0bHkgZG9jdW1lbnRlZCBhbmQgc2hv
dWxkIGJlIHJldmVydGVkLg0KDQpJIGFncmVlLg0KDQpBY2tlZC1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KDQpDaGVlcnMsDQpCaWp1DQo=


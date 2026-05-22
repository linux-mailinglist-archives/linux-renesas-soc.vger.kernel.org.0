Return-Path: <linux-renesas-soc+bounces-32917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFtxDlf3D2oTSAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 08:27:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD665AF7D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 08:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963BE3013A8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 06:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1603B33F58E;
	Fri, 22 May 2026 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SdkNR6NV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16F359A6F;
	Fri, 22 May 2026 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431252; cv=fail; b=q4nrTexkk077CcPxSEcNch1FhRT++sAkir9nc/9IzFxQ9nonyU2jHnBA7pmZUFp67Um8LsUcrhIzbX4EXUD9uIGx7UEqTnFoxnFWTou9uaQ8R/a3zg8wqLGPy0swy0xS1sf4Vi1XZVrhrcO3LvpW8mxUxBeO12dH7eEB7LXR6qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431252; c=relaxed/simple;
	bh=fXq5HEzOyw8JDhx3d49Ygv7C7nyk+GxcZadguYKPKbc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LKHIpHhmFkEf8jYVFgNwNkSoM+TS8KsEtdxJRzlG1wDa6NG7/wWtxn/ToG5/GKDz5O+yhhaHvzCBjVf6pvBIuy8GU1+k69fe2De6J+HDgleSC9iP23n+EoEtSbcUU7UuxmsPBtzghYiP/grl70nFQlTvRCfXiuZiY0rf8J6iIRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SdkNR6NV; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy5wZMC89tovQ6+hREFX98MbQH/pOh6SNQwH3f1FxldO4veUDufJn7Scbc0OSgcfyxKPmWl43tQrpWnVBHDbRvJFBSS9PCodSHW8c0kwmU9Z0otuPvqob9WFJuy9oc0VwoXLYhRjzgbs9uMySmtM/fVI0XxuA1yVWQmYXHDr7d2CDiE9LVacBl4LRR3qBbMWwsxY/BCH0pZVFYenzGvd84k2Et1XsJp95f2jhyMLyo0ruhAnGHPBSiofGYqu+C4PhQhv7DRiG3e0mzoCvaVbdwUngGN7lW3KIMWws/48nwjwGQQwwpA1SReA6ct4JGrQCfdkb5SFHVMoWg9yYsuokA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXq5HEzOyw8JDhx3d49Ygv7C7nyk+GxcZadguYKPKbc=;
 b=gTk3JZtI+eF//1bOvZHwHfQS4QRlM+KwQxUog9OzMq6nGQxB1sitGIn4DfjqyZ6SFqYoF/lIlnYco/nt4M63UZEM1dpY2r/qjMBXzOF+b0g0c7a1+oTgEwv00mGTtDo+Pg5HD6OLwHdBvm2VUzcHVMMaE2z2bgfR8KlYYgW8xFGTMuFxDHxkdKYH+Yf9v2IOJlB+DO9Pv8iVdLWpqaPsyoqC2biOtclTdISXKWmO+QK3bYwE1TlxnwHWJJs1SvVdTn1kFZ9CRp7oD2gd5dJllvrVadGkPVKa2GCLWT1gAgGn50meW4skYmenamXnHc03qPpTon9ocUgJ4LUT2ISiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXq5HEzOyw8JDhx3d49Ygv7C7nyk+GxcZadguYKPKbc=;
 b=SdkNR6NVj2XvNL7tJ5Zxx5l18bDC7yIjTle29mFXNm3NIusjgP735b9jqDxpjLSQxUTkFwxA9FQAi6f20qC/rvXrV6F51mBPoWTZFES3mrpBdm6OU4gtK39L4yyEeNGdUNTdGeaZCM81cN2+QgRlez19wBzb4fDfw0Zf4/0AquE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9592.jpnprd01.prod.outlook.com (2603:1096:400:19b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 06:27:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 06:27:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
Thread-Topic: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
Thread-Index: AQHc56nK9BJ9tFiG1kiCI4Ue74glYbYWZP+AgAAs2YCAAABF4IADBlmg
Date: Fri, 22 May 2026 06:27:18 +0000
Message-ID:
 <TY3PR01MB113462D69035FBC66C90F79E0860F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260519160825.4082566-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346AD5B7CDBB72EC8FEA16686012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8uReGLazx5xPfCG+EfSeT_zDy-xfq8Et2pEkmgOKT+8QA@mail.gmail.com>
 <TY3PR01MB11346028C0876AA344758AABA86012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346028C0876AA344758AABA86012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9592:EE_
x-ms-office365-filtering-correlation-id: 114d8c8d-6b27-4e34-3f75-08deb7cb2c61
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|22082099003|56012099003|18002099003|11063799006|5023799004|4143699003|3023799007;
x-microsoft-antispam-message-info:
 uzlR4VqTaqeKLiCfpChMVM8Kh432Cb0chrpMwIr0xFTYqfbLJEX4yRUf/zcEGAf41tjmTQtMkxpWz24ur3L3TMqkO3gWlHoac/q0ICJsVYQOlcbzxqmKf1vJLPHC1XnFgNB5CkuAPno406jj990tE55hH6dYX3tWl+i+VkzyDPA8xP1/Un1dWj0hhaga1hm+flFa+Xmy/KGTlIheLxHwhWKHk5Gdg5tBtx2s6WtM/ps9t+z9OO/+64xKhdtC8NY5+z+7OlPmdChhkfU0daYfjzIunTOrbFl5+LvQm7m84sOtqrNrurSnUAhlu/9MK8fXrKv+p0OpojnNS3Yc7cJPTg7JphdOBZPVLbjR189FSyS9c1283zqoXVaG8aCchCz8MTvMtgPm7bgsKKSLMPMJxsemVuL3sd/NitlY8V0htjEmGIvdnVKaRz9NgkSMr6plwJoGK4GZcHH0CLE41M0ixVj7YncEnyBRNzxrJplJFQ/i04B9vtAxBgJKMlTW0WVmzJt6EmD1SO6mqJwgCp9ZlbWl0U1Esfo0ZFAzRF4aHA2C/iLmpHS93XDTJ/v8GHsLrNVI43sa7Vf2YvUHs7RUgkEzJd/qVFTU279+aVdm24mjDrEKvXtZPZocIOHeBGqKSa8cLvZ1aUU0sWT7ZkHo9GNwpp81+kPrObJELqAEwWiegll8uNjMv23pib2D3fWp6F052qorTQvzJMx4bfyg/JWyrFVdLiuLtFx4bc9l4ikrK0gUp2xoAi24hFfmPV5d
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003)(11063799006)(5023799004)(4143699003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmRSc1VpNFh0ZGlGcDVFMlMxVHdoVk1CQmp0ME9xbjN3ZnUyNGZqTVFXclRZ?=
 =?utf-8?B?ZHB6K3I5aGZpaXhxUHFJSGVwOUwwSDBBTVBZTmpCSmREdUJNam84WGlXKzMw?=
 =?utf-8?B?VFJEMlQwSkpMbUZKWEVhYldmaWJaQWNEUFRmaDh2MG0wRFVUYnpDV2dISU0r?=
 =?utf-8?B?UW9oTmcweGJUaG1wZG5na3pTZXZwaVg4ckdkdWthSFYydWI0ck0zamNWcng2?=
 =?utf-8?B?NEtpaTlyKzhhNEZtSEVXanRPQURMTnNXOGZQU0wzd01SK1FBZmhxV3l3ajkx?=
 =?utf-8?B?VEVMYUZxU0YwT3JFOUpZM3I4b0NyaTluUXVoYmc4eFlENEFHNndrZjJzWWdt?=
 =?utf-8?B?eHNOSDF3bU5yemdEVGVyMnB3bGtqNjg5a0g0c0F0RWd0bjZaMmNnRG9aUzJS?=
 =?utf-8?B?K0k3Z01VdGVTcXJUaDc0YU1iNk9wdDhuZTFCcWZvWkw2NWhLcml3TG1BZit5?=
 =?utf-8?B?b3Q2Nlp1eFdDbXpnNlE2VWRhMENQT3BMb1MxdFNyMUVLc2Z0TGc2YzZnYS80?=
 =?utf-8?B?alltS0laeTJlU3FDeWd3blpSaGRkQ09WTjZIVzNKSnprWUlteVBEWStJWlZQ?=
 =?utf-8?B?ZlBIRkNqakg0SzArYUR6QkxzUHAxRW1VUkk4NjlPSU1UaEErSXlyRFRpSW5B?=
 =?utf-8?B?OVJyRmNLM09mcGtocDdnZys4dS9uOFhMSU5QQXk1RnJGTDNzUGxFaExUcXd2?=
 =?utf-8?B?R0p2Q3cyWEpnTlR0RUR2NThLd0dodXdYN2wrMGVvMmVFUXI4S0t3QmhXcGxp?=
 =?utf-8?B?djc5MkZ3UCtKYzU4d1M2ODJPQjQ5NmlqZkwrSE5sU3FJcmF4cFp2eHRPS05F?=
 =?utf-8?B?aG1MMUFhcTRtWU4xbU1wTldSUHNLaFlGN3lZaGtrbUh2dlAzSFRpb0lLcVUr?=
 =?utf-8?B?RnhHYlF6WWJIeTU4c1NRM2tiRlFWUVFmSFZla1RzZ3hYSk04UThtYlpxcWw5?=
 =?utf-8?B?c25rdFMxajVVRzQ1TmdkcE02OGp2WVVBTXlRMHdjbDI5N1o3M0hlVE5WcnpS?=
 =?utf-8?B?djJpSkQ5QWJQY0lJM2RvYStpMjlrdnVQVWQvU3NGeVViZmxOM1dhY29CMHVr?=
 =?utf-8?B?Wno3cHd4V3RrZlU3cTY3bmtLYlJLUDZnQ0UrQXBMYm5Jak8rTG81b3lYcHAy?=
 =?utf-8?B?cTVGZXBjeVpYSzg4WGJnTFlZa0lUN203YTIxZ2hCTURZQjJVa1FPck9lMGF0?=
 =?utf-8?B?dTZ3QWhRelAvZUJyaUxGQUFWVGpSYmkyOU55dEM0K3F5ZVM2Z2cyK2lvOVFa?=
 =?utf-8?B?Z2ZqdStUZGRoa2dtc0NnYlZvakZWS2hvMnJQcENDSW90ZGhRd04zQWtNSHY4?=
 =?utf-8?B?SG1vY2tNT0RCT2RPc0dHS09BL1NtR29Fa2lRMklJdyszSG9PUDZtRTNLT1lM?=
 =?utf-8?B?RHJ1eDN3Nit5TmEwNzhqN1AvcWFjRE1JclVjeU5JVUhVR1F6WjV3Q3BCNzdV?=
 =?utf-8?B?aUsvdExscUEvOTdTbVJGYmtDOWtIb1diZUp5TXIyakRzdUZMV1NHeVUzeWNI?=
 =?utf-8?B?RVIyR05lM09iM3BUNDZmQ05yOXZRNHYwS0FqRzRWTFNIRGVLa1MzR2txM3hw?=
 =?utf-8?B?YTJoV2p3ZFBqKzNGcXVTNS9rVG1URWdyOGZkVHBYajkzc0Nydjh5c2pOL1Zl?=
 =?utf-8?B?c1lFSG83ZzMvR0Z6TUtzdlZtVmhXWm5mT0lLNE9hQmUxVHRmS0hPVWxta1VF?=
 =?utf-8?B?R2lzV09RSkpnSlJjM1BOR1JNMEh1V1BMc1d5cFo4VktyT0szVG85QlgvVjRI?=
 =?utf-8?B?dmFwb2FxVDNnd0FVcmIwQW1MR1gwdFpZV0R6Y05ROGVXcTc4Y0V6RWl1V3M3?=
 =?utf-8?B?UG9lVEo0eXRQcUtyVHIwUENEQldaNVYyRHRqczN5NW04ai9UdEUyUWloR21i?=
 =?utf-8?B?czZTUjJMNVdFREZkNGkvYmNsbkZwY0dFTnRKVXhQejJRTXVaRkp0Y3JteU1Q?=
 =?utf-8?B?QVFkbmJveDRLVGJNSFdSL3RMM3diYTBEWFBvL1dwajVkeVVRTUVhczZqK01q?=
 =?utf-8?B?aThjdVVBUVN5MnN3aldyRlRBU0QwRjNTcEVsd2M5R2xFaVZsSkdhNktKUExL?=
 =?utf-8?B?SCtQM3ZjdXpRODd6VUpHRTh3WDNROUU2MGFncURhRGJGaU9lRzVVTVNDOE1h?=
 =?utf-8?B?N2NycW8zZ0REUjVSNmZtdmpVZHlRRjA3b2pqMjU0UFl0NkRjemFndjZxL0FY?=
 =?utf-8?B?ODdUWFBJcXFuQlNNY29pOGxnaXhJMGowZHdza3RwbUpHZUl0Z3o1VnROT1RG?=
 =?utf-8?B?RmNMb0tnVlo4VEhka2l0dCtaVGpZcW1Fc01ubEtpM1U5RzhySEc1c2VoUlBC?=
 =?utf-8?B?MVErOWhva25pS1I5WUQzRXl3VG5PS3Jkc3hEckhsTzFENHg2d1FZQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 114d8c8d-6b27-4e34-3f75-08deb7cb2c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 06:27:18.3866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OdOJJw3R/qTW+1vu8B30GMyNml01GRk3CEAxAhc2TtOwWtyq1K0rygwRHQJBFqqIGvVy/esI2uWneR0g8CZiuZ9CkzFOQ/Uai3eEQwCXjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9592
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32917-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.954];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 8CD665AF7D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMNCj4g
U2VudDogMjAgTWF5IDIwMjYgMDk6MTYNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NCA0LzVdIGRy
bTogcmVuZXNhczogcnotZHU6IE1vdmUgbW9kZV92YWxpZCBsb2dpYyB0byBwZXItU29DIGNsb2Nr
IGxpbWl0cw0KPiANCj4gSGkgUHJhYmhha2FyLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWls
LmNvbT4NCj4gPiBTZW50OiAyMCBNYXkgMjAyNiAwOToxNA0KPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjQgNC81XSBkcm06IHJlbmVzYXM6IHJ6LWR1OiBNb3ZlIG1vZGVfdmFsaWQgbG9naWMNCj4g
PiB0byBwZXItU29DIGNsb2NrIGxpbWl0cw0KPiA+DQo+ID4gSGkgQmlqdSwNCj4gPg0KPiA+IFRo
YW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4gPg0KPiA+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0
IDY6MzbigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+ID4NCj4gPiA+IEhpIFByYWJoYWthciwNCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHRoZSBw
YXRjaC4NCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+
IEZyb206IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiA+IFNl
bnQ6IDE5IE1heSAyMDI2IDE3OjA4DQo+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2NCA0LzVdIGRy
bTogcmVuZXNhczogcnotZHU6IE1vdmUgbW9kZV92YWxpZCBsb2dpYw0KPiA+ID4gPiB0byBwZXIt
U29DIGNsb2NrIGxpbWl0cw0KPiA+ID4gPg0KPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4gPiA+
IE1vdmUgcGl4ZWwgY2xvY2sgdmFsaWRhdGlvbiBmcm9tIGEgZml4ZWQgZW5jb2RlciBjaGVjayB0
byBwZXIgU29DDQo+ID4gPiA+IGNvbnN0cmFpbnRzIHN0b3JlZCBpbiByemcybF9kdV9kZXZpY2Vf
aW5mby4NCj4gPiA+ID4NCj4gPiA+ID4gUGl4ZWwgY2xvY2sgbGltaXRzIGRpZmZlciBhY3Jvc3Mg
U29DcyBpbiB0aGUgUlogRFUgZmFtaWx5IGFuZA0KPiA+ID4gPiBjYW5ub3QgYmUgZXhwcmVzc2Vk
IGJ5IGEgc2luZ2xlIHNoYXJlZCBydWxlLiBGb3IgZXhhbXBsZSwgUlovRzJVTA0KPiA+ID4gPiBh
bmQgUlovRzJMIGxpbWl0IHRoZSBEUEFEMCBwaXhlbCBjbG9jayB0byBhIG5hcnJvdyB3aW5kb3cs
IHdoaWxlDQo+ID4gPiA+IG90aGVyIFNvQ3Mgc3VjaCBhcyBSWi9UMkggcmVxdWlyZSBhDQo+ID4g
d2lkZXIgb3BlcmF0aW5nIHJhbmdlLg0KPiA+ID4gPg0KPiA+ID4gPiBBZGQgbW9kZV9jbG9ja19t
aW4gYW5kIG1vZGVfY2xvY2tfbWF4IGZpZWxkcyB0bw0KPiA+ID4gPiByemcybF9kdV9kZXZpY2Vf
aW5mbyB0byBkZXNjcmliZSB0aGUgc3VwcG9ydGVkIHBpeGVsIGNsb2NrIHJhbmdlDQo+ID4gPiA+
IGZvciBlYWNoIFNvQy4gVXBkYXRlDQo+ID4gPiA+IHJ6ZzJsX2R1X2VuY29kZXJfbW9kZV92YWxp
ZCgpIHRvIGNoZWNrIHRoZXNlIGJvdW5kcyB3aGVuDQo+ID4gPiA+IGV2YWx1YXRpbmcNCj4gPiA+
ID4gRFBBRDAgb3V0cHV0cywgcmV0dXJuaW5nIE1PREVfQ0xPQ0tfTE9XIHdoZW4gdGhlIHBpeGVs
IGNsb2NrIGZhbGxzDQo+ID4gPiA+IGJlbG93IG1vZGVfY2xvY2tfbWluIGFuZCBNT0RFX0NMT0NL
X0hJR0ggd2hlbiBpdCBleGNlZWRzIG1vZGVfY2xvY2tfbWF4Lg0KPiA+ID4gPg0KPiA+ID4gPiBQ
b3B1bGF0ZSB0aGUgcGl4ZWwgY2xvY2sgbGltaXRzIGZvciBib3RoIHRoZSBSWi9HMlVMIChSOUEw
N0cwNDNVKQ0KPiA+ID4gPiBhbmQgUlovRzJMIChSOUEwN0cwNDQpIHZhcmlhbnRzIHRvIGEgbWlu
aW11bSBvZiAyMDg3NSBrSHogYW5kIGENCj4gPiA+ID4gbWF4aW11bSBvZg0KPiA+ID4gPiA4MzUw
MCBrSHouDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXINCj4g
PiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4g
LS0tDQo+ID4gPiA+IHYzLT52NDoNCj4gPiA+ID4gLSBEcm9wcGVkIHBlciBwYWQgbGltaXRzDQo+
ID4gPiA+IC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSBjaGFuZ2UgaW4g
YXBwcm9hY2guDQo+ID4gPiA+DQo+ID4gPiA+IHYyLT52MzoNCj4gPiA+ID4gLSBNb3ZlZCBjbG9j
ayBsaW1pdHMgZnJvbSBkZXZpY2VfaW5mbyB0byBvdXRwdXRfcm91dGluZyB0byBhbGxvdw0KPiA+
ID4gPiAgIHBlci1vdXRwdXQgY29uc3RyYWludHMuDQo+ID4gPiA+IC0gVXBkYXRlZCBjb21taXQg
bWVzc2FnZSB0byByZWZsZWN0IHRoZSBjaGFuZ2UgaW4gYXBwcm9hY2guDQo+ID4gPiA+DQo+ID4g
PiA+IHYxLT52MjoNCj4gPiA+ID4gLSBEcm9wcGVkIHN0b3JpbmcgaW5mbyBwb2ludGVyIGluIHN0
cnVjdCByemcybF9kdV9lbmNvZGVyIGFzIGl0J3Mgbm90IG5lZWRlZC4NCj4gPiA+ID4gLS0tDQo+
ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9kcnYuYyAgICAg
fCA2ICsrKysrLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxf
ZHVfZHJ2LmggICAgIHwgNCArKysrDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9y
ei1kdS9yemcybF9kdV9lbmNvZGVyLmMgfCA5ICsrKysrKysrLQ0KPiA+ID4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2
LmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei0gZHUvcnpnMmxfZHVfZHJ2
LmMgaW5kZXgNCj4gPiA+ID4gMGZlZjMzYTVhMDg5Li4xZTRiOWYzOGM1NWIgMTAwNjQ0DQo+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jDQo+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5j
DQo+ID4gPiA+IEBAIC0zNSw2ICszNSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnpnMmxfZHVf
ZGV2aWNlX2luZm8gcnpnMmxfZHVfcjlhMDdnMDQzdV9pbmZvID0gew0KPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgLnBvcnQgPSAwLA0KPiA+ID4gPiAgICAgICAgICAgICAgIH0sDQo+ID4g
PiA+ICAgICAgIH0sDQo+ID4gPiA+ICsgICAgIC5tb2RlX2Nsb2NrX21pbiA9IDIwODc1LA0KPiA+
ID4gPiArICAgICAubW9kZV9jbG9ja19tYXggPSA4MzUwMCwNCj4gPiA+ID4gIH07DQo+ID4gPiA+
DQo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZvIHJ6ZzJs
X2R1X3I5YTA3ZzA0NF9pbmZvDQo+ID4gPiA+ID0geyBAQCAtNDgsNyArNTAsOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZvIHJ6ZzJsX2R1X3I5YTA3ZzA0NF9pbmZv
ID0gew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgLnBvc3NpYmxlX291dHB1dHMgPSBC
SVQoMCksDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAucG9ydCA9IDEsDQo+ID4gPiA+
ICAgICAgICAgICAgICAgfQ0KPiA+ID4gPiAtICAgICB9DQo+ID4gPiA+ICsgICAgIH0sDQo+ID4g
PiA+ICsgICAgIC5tb2RlX2Nsb2NrX21pbiA9IDIwODc1LA0KPiA+ID4gPiArICAgICAubW9kZV9j
bG9ja19tYXggPSA4MzUwMCwNCj4gPiA+ID4gIH07DQo+ID4gPiA+DQo+ID4gPiA+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZvIHJ6ZzJsX2R1X3I5YTA5ZzA1N19pbmZv
DQo+ID4gPiA+ID0geyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUv
cnpnMmxfZHVfZHJ2LmgNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9y
emcybF9kdV9kcnYuaA0KPiA+ID4gPiBpbmRleCA1ODgwNmMyYThmMmIuLjg4NTU1OGViOTU0NyAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxf
ZHVfZHJ2LmgNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpn
MmxfZHVfZHJ2LmgNCj4gPiA+ID4gQEAgLTQ0LDEwICs0NCwxNCBAQCBzdHJ1Y3QgcnpnMmxfZHVf
b3V0cHV0X3JvdXRpbmcgew0KPiA+ID4gPiAgICogc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZv
IC0gRFUgbW9kZWwtc3BlY2lmaWMgaW5mb3JtYXRpb24NCj4gPiA+ID4gICAqIEBjaGFubmVsc19t
YXNrOiBiaXQgbWFzayBvZiBhdmFpbGFibGUgRFUgY2hhbm5lbHMNCj4gPiA+ID4gICAqIEByb3V0
ZXM6IGFycmF5IG9mIENSVEMgdG8gb3V0cHV0IHJvdXRlcywgaW5kZXhlZCBieSBvdXRwdXQNCj4g
PiA+ID4gKFJaRzJMX0RVX09VVFBVVF8qKQ0KPiA+ID4gPiArICogQG1vZGVfY2xvY2tfbWluOiBt
aW5pbXVtIHBpeGVsIGNsb2NrIGluIGtIeg0KPiA+ID4gPiArICogQG1vZGVfY2xvY2tfbWF4OiBt
YXhpbXVtIHBpeGVsIGNsb2NrIGluIGtIeg0KPiA+ID4gPiAgICovDQo+ID4gPiA+ICBzdHJ1Y3Qg
cnpnMmxfZHVfZGV2aWNlX2luZm8gew0KPiA+ID4gPiAgICAgICB1bnNpZ25lZCBpbnQgY2hhbm5l
bHNfbWFzazsNCj4gPiA+ID4gICAgICAgc3RydWN0IHJ6ZzJsX2R1X291dHB1dF9yb3V0aW5nIHJv
dXRlc1tSWkcyTF9EVV9PVVRQVVRfTUFYXTsNCj4gPiA+ID4gKyAgICAgdTMyIG1vZGVfY2xvY2tf
bWluOw0KPiA+ID4gPiArICAgICB1MzIgbW9kZV9jbG9ja19tYXg7DQo+ID4gPiA+ICB9Ow0KPiA+
ID4gPg0KPiA+ID4gPiAgI2RlZmluZSBSWkcyTF9EVV9NQVhfQ1JUQ1MgICAgICAgICAgIDENCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1
X2VuY29kZXIuYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LSBkdS9yemcy
bF9kdV9lbmNvZGVyLmMgaW5kZXgNCj4gPiA+ID4gMGU1NjdiNTdhNDA4Li41NjIyMDEzOWExNDkg
MTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJs
X2R1X2VuY29kZXIuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9kdV9lbmNvZGVyLmMNCj4gPiA+ID4gQEAgLTUwLDggKzUwLDE1IEBAIHJ6ZzJsX2R1
X2VuY29kZXJfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsDQo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGUpICB7DQo+ID4gPiA+ICAgICAgIHN0cnVjdCByemcybF9kdV9lbmNvZGVyICpyZW5jID0g
dG9fcnpnMmxfZW5jb2RlcihlbmNvZGVyKTsNCj4gPiA+ID4gKyAgICAgc3RydWN0IHJ6ZzJsX2R1
X2RldmljZSAqcmNkdSA9IHRvX3J6ZzJsX2R1X2RldmljZShyZW5jLT5iYXNlLmRldik7DQo+ID4g
PiA+ICsgICAgIGNvbnN0IHN0cnVjdCByemcybF9kdV9kZXZpY2VfaW5mbyAqaW5mbyA9IHJjZHUt
PmluZm87DQo+ID4gPiA+DQo+ID4gPiA+IC0gICAgIGlmIChyZW5jLT5vdXRwdXQgPT0gUlpHMkxf
RFVfT1VUUFVUX0RQQUQwICYmIG1vZGUtPmNsb2NrID4gODM1MDApDQo+ID4gPiA+ICsgICAgIGlm
IChyZW5jLT5vdXRwdXQgIT0gUlpHMkxfRFVfT1VUUFVUX0RQQUQwKQ0KPiA+ID4gPiArICAgICAg
ICAgICAgIHJldHVybiBNT0RFX09LOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgIGlmIChpbmZv
LT5tb2RlX2Nsb2NrX21pbiAmJiBtb2RlLT5jbG9jayA8DQo+ID4gPiA+ICsgaW5mby0+bW9kZV9j
bG9ja19taW4pDQo+ID4gPg0KPiA+ID4gSSB3aWxsIGF2b2lkIGNoZWNraW5nIHRoZSBmaXJzdCBw
YXJ0IGFzIGl0IGlzIG1hbmRhdG9yeSBmb3IgU29Dcw0KPiA+ID4gd2l0aCBEUEkgc3VwcG9ydCBh
bmQgRFBJIGNoZWNrIGFib3ZlIG1ha2Ugc3VyZSB0aGF0IHRoaXMgcGFydCBvZiB0aGUNCj4gPiA+
IGNvZGUgaXMgcmVhY2hhYmxlIG9ubHkgZm9yIERQSSBvdXRwdXQuDQo+ID4gPg0KPiA+IFdpbGwg
eW91IGZpeCB1cCB3aGlsZSBhcHBseWluZyBvciBzaGFsbCBJIHNlbmQgYSBuZXcgdmVyc2lvbj8N
Cj4gDQo+IEkgY2FuIHRha2UgY2FyZSBvZiB0aGlzIGlmIHRoZXJlIGFyZSBubyBvdGhlciBjb21t
ZW50cy4NCg0KUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBDaGVlcnMsDQo+IEJpanUNCj4gDQo+ID4NCj4g
PiBDaGVlcnMsDQo+ID4gUHJhYmhha2FyDQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIE1P
REVfQ0xPQ0tfTE9XOw0KPiA+ID4gPiArICAgICBpZiAoaW5mby0+bW9kZV9jbG9ja19tYXggJiYg
bW9kZS0+Y2xvY2sgPg0KPiA+ID4gPiArIGluZm8tPm1vZGVfY2xvY2tfbWF4KQ0KPiA+ID4NCj4g
PiA+IFNhbWUgaGVyZS4NCj4gPiA+DQo+ID4gPiBDaGVlcnMsDQo+ID4gPiBCaWp1DQo+ID4gPg0K
PiA+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0hJR0g7DQo+ID4gPiA+DQo+
ID4gPiA+ICAgICAgIHJldHVybiBNT0RFX09LOw0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjU0LjAN
Cj4gPiA+DQo=


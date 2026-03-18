Return-Path: <linux-renesas-soc+bounces-29719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEngAXFZumnFUgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:51:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A5F2B7400
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCA15302F7DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 07:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9EE36AB74;
	Wed, 18 Mar 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AXF5Eom3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB736B066;
	Wed, 18 Mar 2026 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773820247; cv=fail; b=Krbc7IQNArcW97dj39ISggo9IqLVwgamoUiHLnRSGyywpK0v5g5q7VmcMylnPNJjWCSSIg+diElRIiIWz3rxWIbMxvyXfTAsM249UjBJNhZP9JBn1ctPdg0lf8QJco2dVn3SklU71GT0dG+gC/o3EkV1fxoFGAe7Oa1AiHVDx1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773820247; c=relaxed/simple;
	bh=03OZI/PlT5ax9sqWgs39vk/T/x47HtdGAVC2ns20S4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UQuJ0gxiJl7WI1lH/4plB1kMDDpcSwevHbzyJwZG4owTxKE9YfxPiE78IowQ8F2jLv5Pei0ip9lzsdf3bPQSNyEegnXauoZn2dN8nvvwz8Q46Z1ekkoSt2z4t55H5qwRaNI8R4lHjdv4jNukxwbP7KhgnJQbJkOMZsllwjYWVR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AXF5Eom3; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fade7qywwOPN/MpXWnWkM4Ro5HoVsCJcN/DkgZibxIdktzfl9i0blfInNxFIkcjaYvS0bYRe+OJFqS1BG3L7CA2dZQoZklzQvhuVMHAmpnuT4Swc/362SpbNg0xIFcMrtwRhIMqM5RQWWBcRUeWL/UuD/gbQBQb/KCBvHNy8MPYjqVZ8LSj+kZ7f2mNuAqhfEICtIkVaRkV9udVvagEEh5KLU1bozF+80WeGhuFLeOrfB4Cne4nNWBPDQ5M94wUVGpOlkY1scgh+cpfsSUJIWnM6uNWMHRh0+iAuIxKkDQ+Q13q9vPeNVVJeY6KN4rbWmms7imssAwYex1JViKz/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03OZI/PlT5ax9sqWgs39vk/T/x47HtdGAVC2ns20S4Q=;
 b=SNpvUndrpaBsILBeTRIeMYEGDXZB4nMGQvnrsnN7zZgwoGgpc266N5Hc+zLP8fJOzaLs84QoDHgZ+ZomCJbXHUVenLFLkKEsaG9RZ/a4DSSXp0CgTfU8TNyhpzARj/f7MHZXu4EmeiYd+aWsYLybVMsfwZuP45XwkOom28V37bOVoLaXiyImQKb1O93nZ2XZSZVBHe73ri6Q+K+pIQvuqkseZZiPo7L+VNaxbrDkt9pOZDCoBfz6FzQYi0nfexNhNpWnyVCB5K57ekYw0ywHxu4lNNtMS4r2OWyuTtdjqp/nBhuDh9hIL3VYddVG5Jdorr75l3jlK2bO8JGyJC0SeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03OZI/PlT5ax9sqWgs39vk/T/x47HtdGAVC2ns20S4Q=;
 b=AXF5Eom3iCp/hpSpHVj2pD+NzNxw5FhfkNhQ8P7K6WydmSUaSvNUmJH2e9JpazDHcpLM1vqtZZsKS+DfD87MoeWcfcQXBJToAkNhJVFU35Ro5KZynpE6Qh9RGHJgpq3aNqovwSMOhylLmQpJN8R0tR81iqGoWInfHlAoohAArek=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB10718.jpnprd01.prod.outlook.com (2603:1096:400:2af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 07:50:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 07:50:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 12/20] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
Thread-Topic: [PATCH v5 12/20] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
Thread-Index: AQHcnQX+FR544OmisE65x0Wi4LugKbWy4jAwgABT7ICAAObRcA==
Date: Wed, 18 Mar 2026 07:50:38 +0000
Message-ID:
 <TY3PR01MB113463B56247EE1597B7A1B4B864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <d1f47b9719edab4e85a8971020c7d7f51fff39e3.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113466CEA27DC0486501E89C38641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ddad817b-6c20-42fc-90ed-3b841b3e8ce7@bp.renesas.com>
In-Reply-To: <ddad817b-6c20-42fc-90ed-3b841b3e8ce7@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB10718:EE_
x-ms-office365-filtering-correlation-id: 1c250215-653c-41f7-b9ea-08de84c30b9a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 R2i65p1rBsXQDeujQenpSIWPqBatdCDMdkA5Fh1D7SqlL3Upux8q5ziHY2Mw1ImFxGn02S5DZorLj2wzQ1HXfmA9vUPW3SnJMauS6d3ZSpNA23EI5lkflvgUahIK7BzDrM/32KGPr/2PTci5U7EwSB+sUlanOH3Wf7huJSXayinmB9L8Zc+koxZAPnaEZB9/zJknJv4ve3rxwdLDU2ZvlrJ8H2s+mDO63XjsUlLFC+qcHv64iX1+TWedULdPSpH0jLUMR0Y5hM79x1fvjBymLTWCbykv1gJHTtp6Vw+eCW/0WSxRE1if4JsATOCM17f4eNuHKLnZIVriw5dVEGGxlcaX+/3EYugoCjiz6iNdq/YvRkdmbBckbZkWs1MYJn2EpTM11XLldg1eBta8zXmJHx3QFsMLHQqaUQ0Ry3rgnYVh60GhvbVlteEfkae6irpwztVaLJxABB+5U5Sqg83IQ14l0U9/gO3TOR0IvlEHTsqyw9nd7VXijSvi+Liz7W0A08wfsayonjbEhQtX++9uS7c3foGo9ZSiDAJX8oyaZuXyPaRKR8WUMQ5dd/54YZ4pA4BwHV+Dvjz/clxFWGV6XV/tuGZ4k67RtUY+7vB5WgQuYzHa/bb1O0xYJEAE6zVHhxYSnbyPR6vkDatSxhFtIMt7K+QDfgyMCTPKju7kJ/lDx3DQn9FsH9Ffhdsn6EubVJV2qFDn1nIUdxib/7aJw0mhyzE235gghMCcT+MYqPYo0vECXxKDGKFRE/CXLcx2mnSVpK65VpZMRBCbNmSX7tg6BvtJ0LUNw4swhjTscZ0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UC9CZkcrUGhyWnNydzB1N0p3ajhSYVl0dzZ4Y2N3WWNWNFM4Qnhla08rMnZy?=
 =?utf-8?B?cVBzVDFHMU1MVzg4dXNHcmpwY3d3eVVqOGQreVRwblVEcjgvdDErOUsrbGJj?=
 =?utf-8?B?WlpON0FINjMxUUFMdnpZZ21CbyswMDUvanFKVW56dVhWbWg0cVpjRi9Da0l0?=
 =?utf-8?B?b2o5czJpeEE3d25BNnl0bEdYZTZrY1ZmT1BEcUJTandHM1JBZ0svNkplRnls?=
 =?utf-8?B?MlJWWUVLOENMOFZYRGx1UjZ6cDVZZjRidnVxanJ4c3k5ZmgxYUVmSWU1eFhD?=
 =?utf-8?B?UUduZVRkcllBdWtBaHZBeGJ4SEIxYS9iSnZjT0pjalJmaGxQNUx6UUF2aksr?=
 =?utf-8?B?ejFmaG1DcjFQODFnSU9ZcTltU1lXT3ZEVGlKM1hhdkNpYU5wTnVBRTlzeFlx?=
 =?utf-8?B?YWJKay9GaUs2Q1VJc0JObmVtOCszTUZIUG5XKzc4aXNTNk5jeDYra0x3cEcy?=
 =?utf-8?B?clJwemxCdHJVSmwrMzFwbU5BMDBsYXlOWHBXZmY4MnFVTWNZUndLTVNmSmRQ?=
 =?utf-8?B?VG5MYlFCQTZiSGdXRUQwS1NRd2VNY0FzM09VR3hKOVRDRDJITXFpRGRYT0Fu?=
 =?utf-8?B?b214TTFtWm9Ib3RlcXp6Q3F3bkJ6akg4VmU2NFJJWjVoRXJxMkM1T3VINm5y?=
 =?utf-8?B?RFl1VjJadDdMLzRweVc1QkFvVFRneElSODJKTWpQNElvMjJaeWtjSWtvMno3?=
 =?utf-8?B?Njl4UFR6a3EzUThjYmI0ZVZ3SjMzYnROZnI3NWxwYldqb0ltM0dzZ01vbEhD?=
 =?utf-8?B?VHFpVWE2ZUZJTERxWFhSTDBOZXVaVi9qSFcvbGRHMnUwYTFNSzY0VysyZnk5?=
 =?utf-8?B?UGtCWFJKVDQ3ZlZ0L1VIR2dCWTB2ZFFGbHhoZURsYVJCc0FVZStoN1IwbElu?=
 =?utf-8?B?eXZWek5BYXNVd1VyZTBXUGd2cEJ6VDd5UWVJeXczNE5mZEtXcURPZHhsdHdp?=
 =?utf-8?B?anNwOHlPcVU4cVY5cWtiMW1RQ0QxZFBjTlFRTWxnbW01M1lnWjBJRHpjQThY?=
 =?utf-8?B?MkZZRTducGhXR2VhVlEybG1KTHYxMmZaeTBUVC9aUEorVFZPb09uRnBXRktE?=
 =?utf-8?B?dWhwTU5kWFR3SnY5Z2tZV0xKNTRMWGpFMXJkeVVkeFM2VmNyaC91d0JtQUx5?=
 =?utf-8?B?NXJad1VBbXVNRDFzLzA0bGlpZlVNMHZaTWNPMjEvUkNjRjhnT0ROc082cWNX?=
 =?utf-8?B?SmpsYUZENmJnc1JjSlRmM1ZuTC83YmJMd3Q3RjdYWk5OZzEvK09mamVLck5u?=
 =?utf-8?B?MndyRnViWmY5OHVxS0NTYXJObmRLQ0l5Ulkrc2pERmE4clZTSFY0cWlGQkRY?=
 =?utf-8?B?M3ZKOGxVMW02dXRubFZZMHpVQnVCekRGUlk5UzNqWWdVaWhWUU9meXA1bng1?=
 =?utf-8?B?SFZXSTdYQUl5YXFKVFJ2TmxIcHViRG83d3RUWlZuc2VJYjJ2N29WM1ZWclBG?=
 =?utf-8?B?QVlBNHhRQ2x6K0ttWUJTakFlc2NOQkdKNHlHWExEVmp3bDVYVUI3VHltc1Fp?=
 =?utf-8?B?UEErQVNsalg1cHduVjFlVi9EOVpHU25GemlIOGNjaWpOWUtOcDdrVWptNml4?=
 =?utf-8?B?TnNaelFqSi8vamlqblRnWDhNNFo5ZFpLcEV3OGp4QnZ1bG9ORFg5T3NkN2J6?=
 =?utf-8?B?OVprOTl0RFpTWWEvWEJWSFNWZlBCMmdhZzcvVUt0RjZ6eGs5NUMzMnFqdnVP?=
 =?utf-8?B?VUVVemt2TWQ5V1MyR3lwUzN1K3k1blZDNC9JWGdyWEs2Y0FYZEI3SWR6MGRI?=
 =?utf-8?B?QXJXamhmUTBDdElQeGg0dytQQ2hmdm1jRHZ2WHZVWU5kK1pHWTBIbEtTTDBE?=
 =?utf-8?B?K2ZYUCs5bEx1UXMyOXErTDA2bGlZeEdVd2hSTkpNdXJLUmVhU3VDZE5lR3Jo?=
 =?utf-8?B?M0pHMU1tb2tBa05VSHBrNzNqQURhYm9RbTdFS3FBMW0waUk4eHJrc1c2QVg3?=
 =?utf-8?B?N0ZIbEZ1RnBMbUZSYVgwOUNjTDRiWHVheElvckF6dk9MamNjc2JjdHdjWWV2?=
 =?utf-8?B?bG9VTUdpQTN3aGtlVndHWlhyd05uZm4wTzMzY20rYzJVV3FyL1dUTzFWWlpZ?=
 =?utf-8?B?K0pCZHBHbEZRVjRYSjZjYXF6cmhvM1lydldIQWFGbHU1bUhHbzljNWNOQ2dP?=
 =?utf-8?B?U1FxaDAySGpXSHFyT3IwNHlsZFFlZW1xL08rb1Q0c25vbzk0WEdhbm12V2xJ?=
 =?utf-8?B?VXlLUzJXN3JaU2YwY2tDcWs4MFIxaG5LdTRvUE1mK3duMzVDa29MNHNWeFpW?=
 =?utf-8?B?Vm9uMVhLVmgxb0x2bVJoZGowd0pWejVRQ0dJQ1Q3QzRkZnluaWV5MDkrcnZD?=
 =?utf-8?B?NWtnSktvOGZscEt0aW1JdXphbksvWldqT0d6UWgvTzl0UGJkaW1QZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c250215-653c-41f7-b9ea-08de84c30b9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 07:50:38.0930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYKdGodUYbEKtaU+M4DgSpmJgvP1f7ttO5ow4Jda8GDK7EjPg8nkPz2z2QOrDGWzq5juzZx0bAKJ4yYfA+25qfXQLjmDY1KK096fKuQyx0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10718
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-29719-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73A5F2B7400
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVG9tbWFzbyBNZXJjaWFpLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFRvbW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0K
PiBTZW50OiAxNyBNYXJjaCAyMDI2IDE4OjAxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTIv
MjBdIGRybTogcmVuZXNhczogcnotZHU6IG1pcGlfZHNpOiBBZGQgUlpfTUlQSV9EU0lfRkVBVFVS
RV9HUE8wUiBmZWF0dXJlDQo+IA0KPiBIaSBCaWp1LA0KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3
Lg0KPiANCj4gT24gMy8xNy8yNiAxNDowMywgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgVG9tbWFz
bywNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFRvbW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJj
aWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+PiBTZW50OiAxMyBGZWJydWFyeSAyMDI2IDE2OjI4
DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2NSAxMi8yMF0gZHJtOiByZW5lc2FzOiByei1kdTogbWlw
aV9kc2k6IEFkZA0KPiA+PiBSWl9NSVBJX0RTSV9GRUFUVVJFX0dQTzBSIGZlYXR1cmUNCj4gPj4N
Cj4gPj4gVGhlIE1JUEkgRFNJIGlwIGZvdW5kIGluIHRoZSBSWi9HM0UgU29DIHNlbGVjdCB0aGUg
dmlkZW8gaW5wdXQgY2xvY2sNCj4gPj4gYmFzZWQgb24gdGhlIERVIGluc3RhbmNlIGFjdHVhbGx5
IGNvbm5lY3RlZCB1c2luZyB0aGUgR1BPMFIgcmVnaXN0ZXIuDQo+ID4+DQo+ID4+IEFkZCB0aGlz
IGZlYXR1cmUgdG8gdGhlIGRyaXZlciB1c2luZyBgUlpfTUlQSV9EU0lfRkVBVFVSRV9HUE8wUmAs
DQo+ID4+IHVwZGF0ZSB0aGUgY29kZSBhY2NvcmRpbmdseSB0byBtYW5hZ2UgdGhlIHZjbGsgc2Vs
ZWN0aW9uIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZg0KPiBgcnpnMmxfbWlwaV9kc2lfZ2V0X2lu
cHV0X3BvcnQoKWAuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFRvbW1hc28gTWVyY2lhaSA8
dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+PiAtLS0NCj4gPj4gdjQtPnY1
Og0KPiA+PiAgIC0gTm8gY2hhbmdlcy4NCj4gPj4NCj4gPj4gdjMtPnY0Og0KPiA+PiAgIC0gTm8g
Y2hhbmdlcy4NCj4gPj4NCj4gPj4gdjItPnYzOg0KPiA+PiAgIC0gTm8gY2hhbmdlcy4NCj4gPj4N
Cj4gPj4gdjEtPnYyOg0KPiA+PiAgIC0gTm8gY2hhbmdlcy4NCj4gPj4NCj4gPj4gICAuLi4vZ3B1
L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMgICAgfCA2MyArKysrKysrKysrKysr
KysrKy0tDQo+ID4+ICAgLi4uL2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpX3JlZ3Mu
aCAgIHwgIDMgKw0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNh
cy9yei0gZHUvcnpnMmxfbWlwaV9kc2kuYyBpbmRleA0KPiA+PiA4ZWE4NTk0YWZlZTguLjM1ZGUx
YTk2NGRjMCAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUv
cnpnMmxfbWlwaV9kc2kuYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9taXBpX2RzaS5jDQo+ID4+IEBAIC0zNyw3ICszNyw5IEBAIE1PRFVMRV9JTVBPUlRf
TlMoIlJaVjJIX0NQRyIpOw0KPiA+Pg0KPiA+PiAgICNkZWZpbmUgUlpHMkxfRENTX0JVRl9TSVpF
CTEyOCAvKiBNYXhpbXVtIERDUyBidWZmZXIgc2l6ZSBpbiBleHRlcm5hbCBtZW1vcnkuICovDQo+
ID4+DQo+ID4+ICsjZGVmaW5lIFJaX01JUElfRFNJX01BWF9JTlBVVAkyDQo+ID4+ICAgI2RlZmlu
ZSBSWl9NSVBJX0RTSV9GRUFUVVJFXzE2QlBQCUJJVCgwKQ0KPiA+PiArI2RlZmluZSBSWl9NSVBJ
X0RTSV9GRUFUVVJFX0dQTzBSCUJJVCgxKQ0KPiA+Pg0KPiA+PiAgIHN0cnVjdCByemcybF9taXBp
X2RzaTsNCj4gPj4NCj4gPj4gQEAgLTgxLDEzICs4MywxNCBAQCBzdHJ1Y3QgcnpnMmxfbWlwaV9k
c2kgew0KPiA+PiAgIAlzdHJ1Y3QgZHJtX2JyaWRnZSBicmlkZ2U7DQo+ID4+ICAgCXN0cnVjdCBk
cm1fYnJpZGdlICpuZXh0X2JyaWRnZTsNCj4gPj4NCj4gPj4gLQlzdHJ1Y3QgY2xrICp2Y2xrOw0K
PiA+PiArCXN0cnVjdCBjbGsgKnZjbGtbUlpfTUlQSV9EU0lfTUFYX0lOUFVUXTsNCj4gPj4gICAJ
c3RydWN0IGNsayAqbHBjbGs7DQo+ID4+DQo+ID4+ICAgCWVudW0gbWlwaV9kc2lfcGl4ZWxfZm9y
bWF0IGZvcm1hdDsNCj4gPj4gICAJdW5zaWduZWQgaW50IG51bV9kYXRhX2xhbmVzOw0KPiA+PiAg
IAl1bnNpZ25lZCBpbnQgbGFuZXM7DQo+ID4+ICAgCXVuc2lnbmVkIGxvbmcgbW9kZV9mbGFnczsN
Cj4gPj4gKwl1OCB2Y2xrX2lkeDsNCj4gPj4NCj4gPj4gICAJc3RydWN0IHJ6djJoX2RzaV9tb2Rl
X2NhbGMgbW9kZV9jYWxjOw0KPiA+Pg0KPiA+PiBAQCAtNTUyLDggKzU1NSw4IEBAIHN0YXRpYyBp
bnQgcnpnMmxfZHBoeV9jb25mX2Nsa3Moc3RydWN0IHJ6ZzJsX21pcGlfZHNpICpkc2ksIHVuc2ln
bmVkIGxvbmcNCj4gbW9kZV9mDQo+ID4+ICAgCXVuc2lnbmVkIGxvbmcgdmNsa19yYXRlOw0KPiA+
PiAgIAl1bnNpZ25lZCBpbnQgYnBwOw0KPiA+Pg0KPiA+PiAtCWNsa19zZXRfcmF0ZShkc2ktPnZj
bGssIG1vZGVfZnJlcSAqIEtJTE8pOw0KPiA+PiAtCXZjbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShk
c2ktPnZjbGspOw0KPiA+PiArCWNsa19zZXRfcmF0ZShkc2ktPnZjbGtbZHNpLT52Y2xrX2lkeF0s
IG1vZGVfZnJlcSAqIEtJTE8pOw0KPiA+PiArCXZjbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShkc2kt
PnZjbGtbZHNpLT52Y2xrX2lkeF0pOw0KPiA+PiAgIAlpZiAodmNsa19yYXRlICE9IG1vZGVfZnJl
cSAqIEtJTE8pDQo+ID4+ICAgCQlkZXZfZGJnKGRzaS0+ZGV2LCAiUmVxdWVzdGVkIHZjbGsgcmF0
ZSAlbHUsIGFjdHVhbCAlbHUgbWlzbWF0Y2hcbiIsDQo+ID4+ICAgCQkJbW9kZV9mcmVxICogS0lM
TywgdmNsa19yYXRlKTsNCj4gPj4gQEAgLTc2NCw2ICs3NjcsMTEgQEAgc3RhdGljIGludCByemcy
bF9taXBpX2RzaV9zdGFydHVwKHN0cnVjdCByemcybF9taXBpX2RzaSAqZHNpLA0KPiA+PiAgIAlp
ZiAocmV0IDwgMCkNCj4gPj4gICAJCWdvdG8gZXJyX3BoeTsNCj4gPj4NCj4gPj4gKwlpZiAoZHNp
LT5pbmZvLT5mZWF0dXJlcyAmIFJaX01JUElfRFNJX0ZFQVRVUkVfR1BPMFIpDQo+ID4+ICsJCXJ6
ZzJsX21pcGlfZHNpX2xpbmtfd3JpdGUoZHNpLCBHUE8wUiwgZHNpLT52Y2xrX2lkeCk7DQo+ID4N
Cj4gPiBBcyBwZXIgIjkuNS4zLjEgUG93ZXIgb24gUmVzZXQgYW5kIEluaXRpYWwgU2V0dGluZ3Mg
Zm9yIEFsbCBPcGVyYXRpb25zIg0KPiA+IFRoaXMgbmVlZHMgdG8gYmUgc2V0IGJlZm9yZSBQTExF
TlIuUExMRU4uDQo+IA0KPiBHb29kIGNhdGNoISBUaGFua3MuDQo+IEkgdGhpbmsgSSBjYW4gbW92
ZSB0aGF0IGludG8gcnp2MmhfbWlwaV9kc2lfZHBoeV9pbml0KCkgYmVmb3JlIHRoZQ0KDQpSZW1l
bWJlciB0aGlzIGlzIG5vdCBQSFkgcmVnaXN0ZXIuIE1heWJlIGFkZCBhIGNvbW1lbnQgaW4gdGhp
cyBmdW5jdGlvbg0KYXMgaXQgaXMgc3BlY2lmaWMgdG8gUlovRzNFLg0KDQpDaGVlcnMsDQpCaWp1
DQoNCj4gDQo+IAluZGVsYXkoMjAwKQ0KPiANCj4gSW4gdGhpcyB3YXkgdGhlIGNhbGwgd2lsbCBy
ZWZsZWN0IHRoZSBwb3dlciBvbiBzZXF1ZW5jZSBkaWFncmFtLg0KPiBBbHNvIEkgdGhpbmsgd2Ug
Y2FuIGRyb3AgdGhlIGRiZyBwcmludC4NCj4gDQo+IFdoYXQgZG8geW91IHRoaW5rPw0KPiANCj4g
S2luZCBSZWdhcmRzLA0KPiBUb21tYXNvDQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEJpanUN
Cj4gPg0KPiA+DQo+ID4+ICsNCj4gPj4gKwlkZXZfZGJnKGRzaS0+ZGV2LCAic2VsZWN0ZWQgZHUl
ZCBpbnB1dCBjaGFubmVsXG4iLCBkc2ktPnZjbGtfaWR4KTsNCj4gPj4gKw0KPiA+PiAgIAkvKiBF
bmFibGUgRGF0YSBsYW5lcyBhbmQgQ2xvY2sgbGFuZXMgKi8NCj4gPj4gICAJdHhzZXRyID0gVFhT
RVRSX0RMRU4gfCBUWFNFVFJfTlVNTEFORVVTRShkc2ktPmxhbmVzIC0gMSkgfCBUWFNFVFJfQ0xF
TjsNCj4gPj4gICAJcnpnMmxfbWlwaV9kc2lfbGlua193cml0ZShkc2ksIFRYU0VUUiwgdHhzZXRy
KTsgQEAgLTEwMDYsNg0KPiA+PiArMTAxNCwzNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX21pcGlfZHNp
X3N0b3BfdmlkZW8oc3RydWN0IHJ6ZzJsX21pcGlfZHNpICpkc2kpDQo+ID4+ICAgCXJldHVybiBy
ZXQ7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiArc3RhdGljIGludCByemcybF9taXBpX2RzaV9nZXRf
aW5wdXRfcG9ydChzdHJ1Y3QgcnpnMmxfbWlwaV9kc2kgKmRzaSkgew0KPiA+PiArCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAgPSBkc2ktPmRldi0+b2Zfbm9kZTsNCj4gPj4gKwlzdHJ1Y3QgZGV2aWNl
X25vZGUgKnJlbW90ZV9lcCwgKmVwX25vZGU7DQo+ID4+ICsJc3RydWN0IG9mX2VuZHBvaW50IGVw
Ow0KPiA+PiArCWJvb2wgZXBfZW5hYmxlZDsNCj4gPj4gKwlpbnQgaW5fcG9ydDsNCj4gPj4gKw0K
PiA+PiArCS8qIERTSSBjYW4gaGF2ZSBvbmx5IG9uZSBwb3J0IGVuYWJsZWQgKi8NCj4gPj4gKwlm
b3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKG5wLCBlcF9ub2RlKSB7DQo+ID4+ICsJCW9mX2dyYXBo
X3BhcnNlX2VuZHBvaW50KGVwX25vZGUsICZlcCk7DQo+ID4+ICsJCWlmIChlcC5wb3J0ID49IFJa
X01JUElfRFNJX01BWF9JTlBVVCkNCj4gPj4gKwkJCWJyZWFrOw0KPiA+PiArDQo+ID4+ICsJCXJl
bW90ZV9lcCA9IG9mX2dyYXBoX2dldF9yZW1vdGVfZW5kcG9pbnQoZXBfbm9kZSk7DQo+ID4+ICsJ
CWVwX2VuYWJsZWQgPSBvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKHJlbW90ZV9lcCk7DQo+ID4+ICsJ
CW9mX25vZGVfcHV0KHJlbW90ZV9lcCk7DQo+ID4+ICsNCj4gPj4gKwkJaWYgKGVwX2VuYWJsZWQp
IHsNCj4gPj4gKwkJCWluX3BvcnQgPSBlcC5wb3J0Ow0KPiA+PiArCQkJYnJlYWs7DQo+ID4+ICsJ
CX0NCj4gPj4gKwl9DQo+ID4+ICsNCj4gPj4gKwlpZiAoIWVwX2VuYWJsZWQpDQo+ID4+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPiA+PiArDQo+ID4+ICsJZGV2X2RiZyhkc2ktPmRldiwgImlucHV0IHBv
cnRAJWRcbiIsIGluX3BvcnQpOw0KPiA+PiArCXJldHVybiBpbl9wb3J0Ow0KPiA+PiArfQ0KPiA+
PiArDQo+ID4+ICAgLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPj4gICAgKiBCcmlkZ2UNCj4g
Pj4gICAgKi8NCj4gPj4gQEAgLTE0MDgsOSArMTQ0NywyMSBAQCBzdGF0aWMgaW50IHJ6ZzJsX21p
cGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4+ICAgCWlmIChJ
U19FUlIoZHNpLT5tbWlvKSkNCj4gPj4gICAJCXJldHVybiBQVFJfRVJSKGRzaS0+bW1pbyk7DQo+
ID4+DQo+ID4+IC0JZHNpLT52Y2xrID0gZGV2bV9jbGtfZ2V0KGRzaS0+ZGV2LCAidmNsayIpOw0K
PiA+PiAtCWlmIChJU19FUlIoZHNpLT52Y2xrKSkNCj4gPj4gLQkJcmV0dXJuIFBUUl9FUlIoZHNp
LT52Y2xrKTsNCj4gPj4gKwlkc2ktPnZjbGtbMF0gPSBkZXZtX2Nsa19nZXQoZHNpLT5kZXYsICJ2
Y2xrIik7DQo+ID4+ICsJCWlmIChJU19FUlIoZHNpLT52Y2xrWzBdKSkNCj4gPj4gKwkJCXJldHVy
biBQVFJfRVJSKGRzaS0+dmNsa1swXSk7DQo+ID4+ICsNCj4gPj4gKwlpZiAoZHNpLT5pbmZvLT5m
ZWF0dXJlcyAmIFJaX01JUElfRFNJX0ZFQVRVUkVfR1BPMFIpIHsNCj4gPj4gKwkJZHNpLT52Y2xr
WzFdID0gZGV2bV9jbGtfZ2V0KGRzaS0+ZGV2LCAidmNsazIiKTsNCj4gPj4gKwkJaWYgKElTX0VS
Uihkc2ktPnZjbGtbMV0pKQ0KPiA+PiArCQkJcmV0dXJuIFBUUl9FUlIoZHNpLT52Y2xrWzFdKTsN
Cj4gPj4gKw0KPiA+PiArCQlyZXQgPSByemcybF9taXBpX2RzaV9nZXRfaW5wdXRfcG9ydChkc2kp
Ow0KPiA+PiArCQlpZiAocmV0IDwgMCkNCj4gPj4gKwkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRz
aS0+ZGV2LCAtRUlOVkFMLA0KPiA+PiArCQkJCQkgICAgICJObyBhdmFpbGFibGUgaW5wdXQgcG9y
dFxuIik7DQo+ID4+ICsJCWRzaS0+dmNsa19pZHggPSByZXQ7DQo+ID4+ICsJfQ0KPiA+Pg0KPiA+
PiAgIAlkc2ktPmxwY2xrID0gZGV2bV9jbGtfZ2V0KGRzaS0+ZGV2LCAibHBjbGsiKTsNCj4gPj4g
ICAJaWYgKElTX0VSUihkc2ktPmxwY2xrKSkNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpX3JlZ3MuaA0KPiA+PiBiL2RyaXZlcnMv
Z3B1L2RybS9yZW5lc2FzL3J6LSBkdS9yemcybF9taXBpX2RzaV9yZWdzLmggaW5kZXgNCj4gPj4g
MmJlZjIwNTY2NjQ4Li5jZWUyZTBiYzVkYzUgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpX3JlZ3MuaA0KPiA+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaV9yZWdzLmgNCj4gPj4gQEAg
LTgzLDYgKzgzLDkgQEANCj4gPj4gICAjZGVmaW5lIExJTktTUl9TUUNIUlVOMQkJCUJJVCg0KQ0K
PiA+PiAgICNkZWZpbmUgTElOS1NSX1NRQ0hSVU4wCQkJQklUKDApDQo+ID4+DQo+ID4+ICsvKiBS
Wi9HM0UgR2VuZXJhbCBQdXJwb3NlIE91dHB1dCAwIFJlZ2lzdGVyICovDQo+ID4+ICsjZGVmaW5l
IEdQTzBSCQkJCTB4YzANCj4gPj4gKw0KPiA+PiAgIC8qIFR4IFNldCBSZWdpc3RlciAqLw0KPiA+
PiAgICNkZWZpbmUgVFhTRVRSCQkJCTB4MTAwDQo+ID4+ICAgI2RlZmluZSBUWFNFVFJfTlVNTEFO
RUNBUAkJKDB4MyA8PCAxNikNCj4gPj4gLS0NCj4gPj4gMi40My4wDQo+ID4NCg0K


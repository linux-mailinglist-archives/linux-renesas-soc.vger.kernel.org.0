Return-Path: <linux-renesas-soc+bounces-19473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDDAFFD94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 11:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5E63BF6DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 09:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06312220698;
	Thu, 10 Jul 2025 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nPOKUWcx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6E41C861B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138620; cv=fail; b=KYHlm8bm/WXXaPtimGQYWNFRULjFfNZPdw4iQubsmEm6kKUOCVP75a8UzzvMswS09/ha0eL5Iy7T9XGGd27LJrRVSpgY5lkRgHA3Cx7O2/rg02iJwsmmRq0XgCUmKECxQv+TZse2SbsgQWPunGe91Wva5ExPcT8V6CypvEeCV/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138620; c=relaxed/simple;
	bh=Ixzp/nuGw+XLSarYIG91hhAM5R0zRAqs8BrDGxpyPeE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IH/54HAokLcmTzyPQj5AEED/3GnGgSnNCwTZRsVKz3fzEm8Cx1GNz6lM8FIwAu0e92AB++IXjZBxptH50Li7yFZ5KWUTnOLOrC/VvP/n11VE6FifXfzd3dYjLnAMVrMM83oFwXQVCttKDvRcJY5nQfxn7UkwKIx+MpHTXASQjdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nPOKUWcx; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGcG/J6U+S0rFP6zEzhDeO1++65pcSF+aCEkX3/0GvYXfJti2OQDTR8bVAjsonPISJrpAT+9z5CKr5pC2e2Qvr5TriV7CUOhmB0itG1n/u4fuScDw3VgUU6Q8rQVGrI0KmsZ29EM9bnVEeAs1PdA4NUfPlCq9rk+AztR9Pnse3bg5KY6GdrbJ4LC5MZLER+9Gg99m+ewT48W6PV/k/TKnmlddD+HbhCMOlJBFXMN6PDYeoliwb87/nVaWT+6RlDAyhsvu9NVyYoFMPjvX7sJpGuBuj2VClU+7BtuaIbTSHVnr7mtUdgWK0tih6XqGVewDL4XLuyzYKvvqYzJgqywvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAQMCfo1ADZgUD8clYrqzc7uHrgvFtpDGocX3aUWAq4=;
 b=lyuoex5vz5zkruf7la0SUcQB2Sr1Ouc/mo5s44V8GoRiqg76+WKgcDZvcx623GmfBmTdWuPwYaUtMoTKk6aOa/TlbA/4OuXnOVT1+COAwb2qDPpyoYTLeXG6OcYHRycIBDujVEYG+csCBTzPmA4twyPOuB864T0+sfXltpOFcYFlKN3K4ixHqxzIUvDDnOIU27d4VhP+bV61BtoCu75nCEBsnvnU/5vFP8MbHEA9drVg85q0Sw/mnee8mF1fItBHLnWiHj+mDFi7c90xdXEDQNaiRcbHY9Rv8tWYUtnaPkfeDJ+hxzTr5GXFWfVONfdJWrh6/9MpsLh2/GqKfnS9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAQMCfo1ADZgUD8clYrqzc7uHrgvFtpDGocX3aUWAq4=;
 b=nPOKUWcxpQLXGVlMWtFHiZUUKlBufAeuDClk2TsKuZYAJanC/RoYCY46OMZWOjylrH6DQehfpvERyg1PLlwe1pYCMJTQz5r4mcHqw4e6CrtNSWypecNAoEN4xPZXoVcusre9jlfOE5pfrBiEQVT6Z+yyiZyc+jvrsetgvp8IDAg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB5858.jpnprd01.prod.outlook.com (2603:1096:604:bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 09:10:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 09:10:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to
 RUNTIME_PM_OPS()
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to
 RUNTIME_PM_OPS()
Thread-Index: AQHb8QFhNutWp9A0X06pg/ebOf+IWLQrEqMg
Date: Thu, 10 Jul 2025 09:10:14 +0000
Message-ID:
 <TY3PR01MB113465470522FD4B74A83CB318648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <cdfc1b8ec9e62553654639b9e9026bfed8dd07d1.1752086582.git.geert+renesas@glider.be>
In-Reply-To:
 <cdfc1b8ec9e62553654639b9e9026bfed8dd07d1.1752086582.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB5858:EE_
x-ms-office365-filtering-correlation-id: 75baa619-7361-4cb6-8114-08ddbf91949e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8Oqs9qvJSS7/Fe04JnFSyO41LHrkbO8sJ1tBROIdJZc7s0e6hc+BS/Ac/Dpp?=
 =?us-ascii?Q?rLG63RHNxVgBHkP0X5zExb0MBsJslk0WVsUUuAKN8arn73xy2ky9CqMkAVWJ?=
 =?us-ascii?Q?VqiHNh/iD/aii8xallf1dtlkHAhcQPUwreVJMfwWUim+fGRMOf/C1gtIDqo2?=
 =?us-ascii?Q?b1VaKdTLA8zSm5/PKCHrdJ8HeIfevaPl4Ap0/2szcocytIrSwibwJQJEQhsM?=
 =?us-ascii?Q?5UZQgQKOtUhaswvECCjApgBds2EotFD2EGHLgeCn0wsUMOLPBc8SXZq4dHwE?=
 =?us-ascii?Q?p+KwDaRSUa6/ME+XhqCdcndHzl+7nKTbSY5RSkVwk8pEjv6MWUT7IzkvemKV?=
 =?us-ascii?Q?sOg6Y+GgifsDI2kvnlsz8Lv6l5pVyhExWjVO/PWgdmvhgShhOaZ+cY/Za/pY?=
 =?us-ascii?Q?ht9kBpBb3o4cALVmLb77dHru19SOuVkEsY0K8wH2HqoTzfbj/jMp5htA2yg3?=
 =?us-ascii?Q?pyL8C3sY1KREOeGG+ymXqn8YTdumsYjDbef8DbWcUJ4FRhThvY4x38Tp7xH5?=
 =?us-ascii?Q?1h044V+4sFKWl0OBg9FIx28gZyxXG2AU3hBIweL/ETlB+jjaOWDbBWIqUlxC?=
 =?us-ascii?Q?uYawDOYHRtbi8ZywjA9F++7x5DiITnD6nW8DTR+T507ppjiROgf+g1V7dR1k?=
 =?us-ascii?Q?jYP6wm5ZXkuxtN72+MDL7Y+zLvjoKkKm6/lCLDoo0XZjBUUI8CWwpfRgmRoa?=
 =?us-ascii?Q?oI4LPrqNO0bfPiZ7MpdQv4cRPiLCVkpjWBu13MkcUDAg27PX/4tIYkUKd4Fa?=
 =?us-ascii?Q?shCPAo8ExQMBk6waiS8PpvtoUfR+Ia61qkj6soG6WFpryaSqkYGTLxcLErE9?=
 =?us-ascii?Q?6cuDJOHt3ayGDwQ8kHQEhh6GM5Wkd7NItpLaJbAoqv7l1gqhBq4JXDkyEVyu?=
 =?us-ascii?Q?Kr4HEcqMswhY8uD0+VfrM3MVpgcNb/3oLtYQsA6E2KoxiEGNFeiCimO6MjET?=
 =?us-ascii?Q?1W5bOMcEeh0fM71jiRy1UT9DQqgalMVC/3/SH4wuJG7yV1L/pi9o7yiztvB7?=
 =?us-ascii?Q?YlD4ZiZmuU0Z/A7y9BYV8QJarM7xZKDxNXfT+svl+XT+LnNkcPujOt/fHEVs?=
 =?us-ascii?Q?l8qP601T4ehGj012OSTJjIGr7j/vAi4YFem8LXmWhA1eWYYpEccZ/kDMQtVw?=
 =?us-ascii?Q?ybt3uWrtkXB7to1gGgcwfJCgAwL/xxiyWIxooG1p9+FHbkiXE+OMFubEKESg?=
 =?us-ascii?Q?Ldv5843EJWEZdyHBonKNTgdfwHu9tT59m06Q7krjNrvkJjqFYekcbr6mfhPB?=
 =?us-ascii?Q?6ev/mY97RtIxgt659nkUIGXhzhDLBbwi7cWWITs8HZZu1RQRbZXNR5cyMDVZ?=
 =?us-ascii?Q?5i4Oy8zY2nRksJdakQR1MMGZgvClnBacndAZLXDZGPqpGJ3Trc5bUhtNROuM?=
 =?us-ascii?Q?DFx4CxO6Tl/hWWj9DpzV8Mwf8WN2Gd2ArdNYUqCdhLfb8NnJlQ7aEQ17wyZE?=
 =?us-ascii?Q?3rp9o+7XByEL0vjkywDppyjyLQzGnWAcY860qLlDmVj6L3bLmErxYA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H5dUUXoikYko4RGBTTes3Pwtmji1vuBTksjg+GJHPikxBw7z8IijYGLndSfX?=
 =?us-ascii?Q?uvPhDEpsOLz0zQDE5+A9Qr73twlFhbdBzjTScmgY9mjCsZ1zXOqHb9g27Mqr?=
 =?us-ascii?Q?QMkHRVn8A1/9Ia6150rmwJkfhfwVBa3TGt1mkRqYVbMHsWpJR4QlENhAYd6n?=
 =?us-ascii?Q?e6v4k/+yX2GZdVAXZs8snuoXY+MflZWlC6p2An1uHE6Hvcd9S9xmNHrhOMm4?=
 =?us-ascii?Q?A6kp+1rZ3KUXWOaJTANEZh1pTdyzPABeJ5eKr3AxoP0rOAsSJQakOCtuSAJd?=
 =?us-ascii?Q?20wsIE4pCtyt+G8v9iJOtpuJ7zn3soqfZL7jRQTT7rNtwuwlCqmRTjnXgAVp?=
 =?us-ascii?Q?0rOTso7KpIoDYX7o2quLN8aVklogF2b4uzMTMX8ZQCbzW+kEsT+exGhCKCUT?=
 =?us-ascii?Q?pE5sTfXzRIDUrPlUwRdlgNFcwagqxzTztPgltuNTk3h1ohayF4j4v9Yd/WS+?=
 =?us-ascii?Q?OL01M1nD1Dxlq671kb8QgbdaCHlpvb5/FyfqmhtpQnGe2msx6VTNWIy5StXm?=
 =?us-ascii?Q?4l2tOYHbpX8tPNn+D2i56etT4YWoguaTmDymV+PEx90/ATRbUSr78+nJYUmv?=
 =?us-ascii?Q?YZdpPAZFDJHeUruSb3O3ntdlGe0fc10j8Mb6rxPNUV0KkDQOGVB0nbs70L6U?=
 =?us-ascii?Q?2UKkl4g8vDs1qnQjwps8sC78xTaoxCXFSmjhMVbzL4aY+xI5JaMR+hetu/tm?=
 =?us-ascii?Q?61zobjjaEm3BqlF94JVYI2oq/JUcHJ7/NjdHTFe1nPmZg7BQ6Qa3DJWMnlZa?=
 =?us-ascii?Q?WP2G72tYZct8VDvnE+Nw9degiuB/kgTzTHPLEropJqB56Hf5GT7ffBI7onCu?=
 =?us-ascii?Q?HuGSl6KCLHOm6Uwb90pFcYCoF41Dl0vcpUeIcwIKSZn5Qd5Vg+Rd+U3b2Qmh?=
 =?us-ascii?Q?ZxHtlt+LP8WluDZ0bloux7dYQwGitqys9ebPQcu+7wacFa96CiFZzh/190yG?=
 =?us-ascii?Q?1QUbRP1WOa1hf8mRXqfi7gQkoIBhPYc9ej0eC0BPhiek8BJS1/KA08apmW1y?=
 =?us-ascii?Q?vaLmmwo490WlJdBPTQTO9G/Uc2xdvbXqhUg7Xj5MqyW0LMXkuIoytSFPWcEx?=
 =?us-ascii?Q?BzHWzwWtJd8IaZ9YTXfoCsDBkBta2LyDIl3iHR2Z8BBNQvg6gcjDLRK5CwEY?=
 =?us-ascii?Q?i41+YtZb7CE8c41fwoy2FCEpj+xWK9/V6OZnQQExplQbG2UPyp5c6tOxpbxE?=
 =?us-ascii?Q?JYdhobFxmxfyxmlcz/Y5c3hU3cpzXrmGaVL60zwDS1RGzNZnnVpleJMCNE8k?=
 =?us-ascii?Q?KgYspIM9uLPa6X468FUy5j6aUMuYR8ojanXZif/DsV5iBwugKsemSXRYFx6a?=
 =?us-ascii?Q?UPWUdXNUMuSs80tiIGYLXwpksXBRSRvkwT8pOHS59B47GuKari4yAwexkkxY?=
 =?us-ascii?Q?MfoLybgCbT2GOHwqT3G+tlkeLrprQAevpz/X8AOsYn+oWQEORnkrrthSqn0I?=
 =?us-ascii?Q?eS81n0YfYuolWPdYXfKFCz1xKnTFKQu3r5EHAK2A++T058qXpEnEGspFAqMZ?=
 =?us-ascii?Q?wIpgIrJsD6yNJPy3Pno5+QojVaqrK5WZWq3hN9JjnWuI2KXNz53/D/p59k8T?=
 =?us-ascii?Q?VIZYI/IaVmaZDX9YvjgC6SJrt2FjgNoTlAoW7I+dKnjSeYYAQtfBiNb8bjP5?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75baa619-7361-4cb6-8114-08ddbf91949e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 09:10:14.0486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZNnVSp3qRhuBittdslkvQIxqybguS91W7QMVkhVJ4ECY4lB7Qjpc5v0p8U775+8tFTq2gDfmUyMwcvcifoROLqJgjHbo5LczmzLOFpAdtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5858

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 09 July 2025 19:43
> Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS=
()
>=20
> Convert the Renesas RZ/G2L MIPI DSI Encoder driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS() and pm_ptr().  This lets us drop=
 the __maybe_unused
> annotations from its runtime suspend and resume callbacks, and reduces ke=
rnel size in case CONFIG_PM
> is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>


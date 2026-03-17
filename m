Return-Path: <linux-renesas-soc+bounces-29591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJLHBFosuWmVtQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:26:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B22A7DA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98EF13016CB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644203A451B;
	Tue, 17 Mar 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c+zWif+I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C1139D;
	Tue, 17 Mar 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742902; cv=fail; b=Dc3v5f8dJQuQ56J10ky1K8CZ6FmxoO4GofwZEUvRieZc+7vo3VJtE8F1FM6JtgsnVLTfyHVImel0TlCYY6/PGespiIgIYLKYfEtijQmHbcU0q/fna4nJMypsxpilX03QrioBy6uZFDvHNda+B8NsDhrocTS2bVmXuPYEeX9q0vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742902; c=relaxed/simple;
	bh=G5N5aHLpqPCSnX542mfrdR3b8V0lGCsHdxlz0b5BqE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R2hCVoFLse4ejGIuoV95TNULg7UupY+FR73zziL7KXaAmJxUt89tiurQCLZJxQLcEescED9FObIjhoPRH0sP8Ra12omQYFm6x9PFofleQW2y7qL8lu1uQb9RQbRxn8bXDkyhkl0pBnX4ymzcxNvvS+RHKfnd8Isf7S59loWyUR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c+zWif+I; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcSQ5HAzBxQitbL/oTxXYaMvnCqUZ1N/3hLk+wiI3S6PMJ76fUKD75UB343rSE4vlIJjs0CaH2NqF+jJBxHWAvyNgxUy1nvVs/XvjwNMetXpeznuQRgX72Op1xfzQEv4Quf4tpoMK3u1sU0ZRS1385tl+un9FRgcgTN+ahJFocBQAji4xpoTbs4v2lj+y9GvgGmiCznMiDRBr49cmVRXk/Q2hD6h47PP5Jlv75LRw7Xq3SC3IGvkpGjp2SoSovElMipkfEnHRAqUl1tGNN7xara6VkwFD3zqUCDa3I+JNJUOazGWqDmARHd9ksHLF+tl+nhCPrJNzcCytZT9VWb5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSR+0ejuQIWIK9+F6pPtcvHK9nbaJUXBGpVIvJqbHg0=;
 b=L2oqltBKo+2uqUp7pXENR0d5HDOcpXNgVJlu0RQWODPQh6vWP9r+S5WC06UFJfsAI+iw0zRbqDTtGoY5PfqDFHyXeKUJntxIXjwtbus/N/7SjGsx9P4aZ/P6cKlZI2lZ77kF+MI33Ll8VJXQVTISTSmHaQTJ4ISLxgKGZG/cTUGw90kuuCyWd7aRra21zhbfeQnAarNT4H1rKw5R8NFBvy9VZTGEnt/nQy9SLXMwu/47caB9jcGL6K5SvQrq4Ite/Lq9S7B1saSafyRtTdcWF2Svujmv7akVS2eGX4YZUYSVSD4ydsa5/L9/jy5ejLyZtLieEPByhSkIbaokSrvIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSR+0ejuQIWIK9+F6pPtcvHK9nbaJUXBGpVIvJqbHg0=;
 b=c+zWif+IUEXZbNzsEQAWShItZuEeGvjVgxxZqbFKWqE8mrsVu9o74aZi7/Du8/7pLLnfn+j5FwDEU9MdCjFVKCnTC47+gRtqM9iddFFeFGi5s/OaR+1avj6m1vWtHNbh25UyRNlZA75sDdPVEKPiGMBGmxfddyRiFXygPchf2Dw=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB15539.jpnprd01.prod.outlook.com (2603:1096:405:284::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 10:21:33 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 10:21:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, John Madieu
	<john.madieu.xa@bp.renesas.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] thermal: renesas: rzg3e: Drop unused kernel-doc comments
Thread-Topic: [PATCH] thermal: renesas: rzg3e: Drop unused kernel-doc comments
Thread-Index: AQHcmN1Z6UkJ4av95ECQBJc8l9MOQ7WyvZ9w
Date: Tue, 17 Mar 2026 10:21:28 +0000
Message-ID:
 <TYCPR01MB113323FD2F63C1E7DE9C0E07E8641A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260208092848.5313-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260208092848.5313-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB15539:EE_
x-ms-office365-filtering-correlation-id: 3c8eebdd-a2b6-48d6-45eb-08de840ef399
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 e5tqKvBitOg4k3gxxeVi5h6G3CnVwYfhV5Mzj+RulfvCTf6rZJriNoRhpM97XgyFsu5Jwp7x2nbfRIYbWv2gtv21LBl66otywlklFLudpd813E65tXuqWDxbjcPN9GzXZcY52U8YZM759GMGqv64sGzQZXH24uRXCMmB+wgB4pQXUOwPO+yHOtNK0AenezqxxyNL9BE5vIvKWNWmiegpRxNUx/FjtY8HtnAgVfkxJifI+18e/S3QJE9Q7qkZ4dz1T7B+KSjagvbdXoynA7HLxNVRd400XehZ+/cO6RMWuX6uDQJreQymCXDGvnex7t+Ck7dkR1KsVRlerlR/vOKFp2oJrfAAgZItUfwd/Tkq3yDrZA9i83ehhorpqaW59tIXyboB+WjKp2D5grxRczcyXT0ZPoq+DNgC8H3AG15kBaPpcCugMaJwUL9ih4YksCHE7HvSbaAE0Da4kj/k3s00ic8hPP/SH5y2hExiJ2oI0t4tqtu1wQgBwgXO8hJ3xVqoLBF7+iU4WWxYNgIxVS1MCNC4D9MOctAMI/XHIk+3+4lzwsaXo7gE+2a9wVBzKeN85VCVzlY09Mw5LBacSTx+hiXI9yUIW57LYmJ+vaPAwXG9u2bxTte6/lAITPzRAnMMeqYnHk5ZPWXG/qaINoE7MGND6HOaNkKSzM55CTjWI1wvBX4T4ndZbycp/CmPejiTBIxbEPLlfSjQjw3NHe57AKWpaMvEzxa8XOGMRL+v2ZYfQtQKKk6fTvZM+Usg6ti0yOqjmvLfOIEliWX9VK4UkIPIOVObVEZpFJourb7IFOk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?T2Rv2lDqOXWRRjPN1j0ErbDkel1OcK+I/9meL+NP8W6VSD1Bq2ShDN2rM/dX?=
 =?us-ascii?Q?1w2PmkIkvxG5EvhGT1AvZ+jFOkfN/s3XHl5jQZpU/KuEeBoiPHAW1qDuT2Cq?=
 =?us-ascii?Q?O5yDeZz6A/kfnDLTjn8YNIbt2TOhC66fBouFK+iMUqoGXN7+0HlZHD2gcNXN?=
 =?us-ascii?Q?oyiJ5ZjxDfCxKhhbpz6njAz56eLZnrznAOtNxsX1VGW0s/ad701LVOge++7P?=
 =?us-ascii?Q?4w0wY5NjEihBurdKFWz5Gx8smemot0VxEVFxgIuRBuvLoT+DFTyKgjhiMXSU?=
 =?us-ascii?Q?NWT3qw6GBdZnS+Rm2GD9E6NqVPwBX6BVs4A9o0jkUQ8ieGQyVWz2ZTsCfTJy?=
 =?us-ascii?Q?+HuMf8Qq43FGrD3++NC/LHUDYrPdeBlUcQU9RThalE2wl6A3FSYvUSUEjtQ4?=
 =?us-ascii?Q?2H9dHITCJUOfezGhdRY7zKQKeC8x0ZxLSOwQsN92RNalkMjc5r68W4w0Wk29?=
 =?us-ascii?Q?yIjc+zAiSW4jPJepmcucJ+7TjyEbF2yxjsy+Je8/Gvx3mUX8/RS9db5diS+p?=
 =?us-ascii?Q?2e0oiQdhYUaQ+/X7jL3hPNWLx/GEK7il1/ggdmZOZ1SJx7JlFJp/I416Y9NZ?=
 =?us-ascii?Q?xa4PzLDetYDOkmvNhySFp445iQh+ByRJO7PD5Qg4Qz1ny0b7KUikEkhjiKhx?=
 =?us-ascii?Q?IlggLjJ0I1SvtqCfr4w1X2Nf/xAbTPR4kMChEQgyTUrrIN5s2LoQRiZnbY/d?=
 =?us-ascii?Q?Q6UWBOXxRS+wlLQyTJsttSHtwz8FXEtigi5k9A6iUem3p0LQG+LnN0ANSi4z?=
 =?us-ascii?Q?GZ4m3RknN6eG3mM6R6U8sbeGtXvcjGG2zyF969KL0Iw4KM84XXbAAh2CGiID?=
 =?us-ascii?Q?SnrPLiZvoEVCgEyr3Pg8387TKLzcOHx32xn+AAlqpPBtr+09QRhcGASaAx/p?=
 =?us-ascii?Q?4uxZEBXRirNVCHnTtGd0kNHXYpLHFfivUHcLWEKV7LNsCD9ws6QFJQPmBxHX?=
 =?us-ascii?Q?jESGk+k1lNmeYNQ67ra2AeI/WzOK9UU3qQnSwE4psdoAkAG4Gg2+zk+OO6bk?=
 =?us-ascii?Q?Bnyp23ZXq3Wqoh3XCVP+vk76jSDcjaP4GlfXV8xmLC0x6BqAS514YKHJTtyQ?=
 =?us-ascii?Q?XVpI9LfMZmhDwtwrVVlOj/Y53nIDHPiuRBaCQGt0Rq0lsWoIk/rEvqrAM8kY?=
 =?us-ascii?Q?Ag3h/J1l0pw5F3d9WsRBLYwMtgFFFjXTyLvXX2eoiUpOjQ2+VGmTGgc6mgQ9?=
 =?us-ascii?Q?WQZjpJ9a1ClR4JQMQZ89reQCz9hqsHWXEIMSxN0M9nCGcaHfkCbYd2KfO1T4?=
 =?us-ascii?Q?PSLrhp0y3ATOgzyqsBHmQZSQUnRdu/GDGEYqRZJOGQaZ+8z1ejGKVSlf0ym5?=
 =?us-ascii?Q?+FUE4uvd8HLOb9OWWKMZa5yUnjnLwR4I4wRo7IYfY31E7xygWId9XVmaZw9/?=
 =?us-ascii?Q?FVI+RXQVUYAFP/C1pP2ZDxMF1PlZ/Jl+zkY3Vol9z3E7M6Oo4VMdhVr64Dyb?=
 =?us-ascii?Q?TiTf/Z3uKQPNM4A6qsR+onyCvrmfL6b3AdgrlGcmIKxLmgjtYy384jUU/P56?=
 =?us-ascii?Q?+j2bgKLo8eipmTijB1vUUd6h13Rr8V6nmTa4iN9NVWBworHI7o0HZFDg1j9F?=
 =?us-ascii?Q?p+VFMAAMIn2YS2/zHiSv7ss0UppkZxOu2VCs/W0Kqfch2Z5PYWqT5y37HYH3?=
 =?us-ascii?Q?7q3YAYgeWHhPfEPRcN6c2L+8Ph0a2usetrzrHmw7PQxUQvk3ulWlo6uxsQA4?=
 =?us-ascii?Q?1HlYdQGE3+KUWidK8zQn29nK+OgDkeUheHSCDzQ6BwI9y6TZJKlrQlUMnX2J?=
 =?us-ascii?Q?WtfEC8riuw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8eebdd-a2b6-48d6-45eb-08de840ef399
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 10:21:28.4436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Lf90zQJmBFL+3Emap4sfpGEzRVvl9acHfcktd9gRXz8ef/mWDXRHMRulFUDEVWSlcEzBxgQp0QAk+zNm+mfWTTyDTOSvCxq+O1ZJjo4EjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15539
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29591-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bp.renesas.com,kernel.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,arm.com,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 6C1B22A7DA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 08 February 2026 09:29
> Subject: [PATCH] thermal: renesas: rzg3e: Drop unused kernel-doc comments
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Drop unused kernel-doc comments from struct rzg3e_thermal_priv.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/thermal/renesas/rzg3e_thermal.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/re=
nesas/rzg3e_thermal.c
> index dde021e283b7..086bd3da10e1 100644
> --- a/drivers/thermal/renesas/rzg3e_thermal.c
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> @@ -87,13 +87,11 @@ struct rzg3e_thermal_info {
>   * struct rzg3e_thermal_priv - RZ/G3E TSU private data
>   * @base: TSU register base
>   * @dev: device pointer
> - * @syscon: regmap for calibration values
>   * @zone: thermal zone device
>   * @rstc: reset control
>   * @info: chip type specific information
>   * @trmval0: calibration value 0 (b)
>   * @trmval1: calibration value 1 (c)
> - * @trim_offset: offset for trim registers in syscon
>   * @lock: protects hardware access during conversions
>   */
>  struct rzg3e_thermal_priv {
> --
> 2.43.0

Gentle ping.

Cheers,
Biju


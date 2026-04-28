Return-Path: <linux-renesas-soc+bounces-31688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCPVJO5Q8GlNRgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 08:17:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8FE47DFA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 08:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3926230089AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 06:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E33C2D0610;
	Tue, 28 Apr 2026 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CG/YuTMu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A633101B9;
	Tue, 28 Apr 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357035; cv=fail; b=clZyhOs0+5ofo11CMgWgBbzB58bMEmAbvcvDx3660PLiWIYjKtlHv3k5BG9o2r3x06HCN+4FW2numS2viw0l0Q3NRJ8IWnQVphJVO0lmeaOIrSVkp1cg/lJ+mjPqhZISYAje1hsKMNPp6ohzsEBykorV6SSDJm99Scg2jDt1vc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357035; c=relaxed/simple;
	bh=BIa2h7DhRf1ba4XDEEwXnr+FKzIVbMJCvidHCCYeruM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KzCiUNY7rRyWdlJ6c0n8hquFFI8xi46bCrB6iIjkqmI3X1HR0NX0FHD8HmW8qLYLWernYT/BEFujSjiUP5JMXxWsVDK+50LUv07PqkeYZe3I6NioW00a445wFrQYT3En6QM5avVC80H3fK7BEXlKHGGixCV8ytRI92FrTYCUHqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CG/YuTMu; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZMA/88aFU4yp8H0fqpZMAf5hAM6YASoZOxVr2DayT9ws63eo3rZy6WpB/TNQsAZz0Spv+oOI4ymIcYK1VHSJecBzy17/Wf0237+dnb2p2SlmsYR2RVbhgbq8S24KlJ7VBq8EByQsOZF7pjKJuVqfPWcz+vjlGhiYTw/0LiPk1HZ4tQpj7gGvrjnZA8TvhwoPj//eQZB1epi4QkQqyKh5azMVytKNsVIrU3uSXwkdqCBbpj1W+CCY7ogvFBXMsoNKCBTU2HGeqcdz8VpNEO7+CrooUWoxPHZwzSOrBrYfp638EqOhwdXC6S1HXQjbdjjH8TmFFOljyQ0kXqV4NOqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vdmBEWoP0p6rFdyAf1rZp5qTWZYtyt4N3uaPTxhS98=;
 b=AuNMPT8FDAh/35MFgGoKt7waOa7GHOXGquqlOMe++ck6V9AjMwbiVZbKrtPuMS5Pmp5bWlQMUtyEr0DJc++c5ETX5B5yOHyvm1G3Q5u5vdrJYU/3fe9c3XIppedLCGImSExc8dn+IEArr+t15K4L1dDXpIWDSyx6HzDwZfi9cvSFO1/HO7qWZgWv+2u1qZ5CbSGI7fsD5kL/6lZ1bA902yA/+pkYOfPO3O7T1/FtbyGPUARzFYl2Q3kKywpS1oPP9LWfQ50gmMIRuKMdfOqcAsvgNJxveurpdyIlg6RSLUfMxurOPELIij/o9ODiAaUo9oJJGYJBg5edeOFFnt3fDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vdmBEWoP0p6rFdyAf1rZp5qTWZYtyt4N3uaPTxhS98=;
 b=CG/YuTMunDjkVGZ5SYj/wXURZp54zsTnCWr392ct6Ku0Melfz7i6QRqEacx9Q6f83eH9jFSMIyYfva62eh465E+NjqgixzmRifXYxzOdBKd4wEn7G+CLj9UEib+JjalRRbS+SwtdFvoE7vSxCGH6Ub21vnMrpDxnTX2cWpT3REo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8605.jpnprd01.prod.outlook.com (2603:1096:400:13e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 06:17:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 06:17:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: RE: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Topic: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Index: AQHc1n6/R7hZJapUgEme8pFZ2/rXrrXz+kOQ
Date: Tue, 28 Apr 2026 06:17:08 +0000
Message-ID:
 <TY3PR01MB11346819FE6253E90C7B4F88486372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8605:EE_
x-ms-office365-filtering-correlation-id: ca895923-0a68-4401-b615-08dea4edc6e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 /ooAuoCvb/WNCJdkq1OpR2xXRsNxF8KcklNlj0vrEoIaIKsG09e1uImKRwFHre7ufI8+DXTdPj0gKGCVMN9u4i5LAWUqgbOxxrdBEgEqHyqYmTlZzi7NPxy7Zugl/OX9nRxHc/Og0qh/9IPWAT82eAeCS8nXU7GpE9zwHPRebBsNX8cjlxaAWYGLNjmydEAtf6OekxuCSQ7Pt2bAqPBbHleE1isdeAB/B7DO7FfCZcpAaR6O2qnfNYeqAbXAD/QzPyh7HbOIaDgHG9hYqNAmgk/49uHzK8nZ+l44XsROdx5INVOVM6ES4OkDf5b2LsUYyX7lPKVGBSPPfGY1Q/r4E6muzSVYrVqBkdG3vOwA1O+2eF4gfDgGows3mmJRlPYkv+gokKtUjB30CkLlxn8aYVnaTsPk7yiYHqiqs40YbWuEysQ3wI1myBSK6/IPR3tAum56NK9BEnnYbb7FdXJ8rTwE+sE9nuYYTMUwXAtERhDVL8J3ZLEOfyd3JzbJo+UVh2WOml3T3+9bXwAVcvP3VN2GD1WZP7+m+uOMb3b41IKYqNDFUM7OyTYBRGc+YjJNEztuHi3YGQxYRUdLv0dq6ULAkBFPRqYZYwM6QTtHAfPNwuaZD8MY62Y8a/g9ucCU14xEdV633KaIY4gRzC1QIBuaXwS7SnsrOUK9kRc1flUnduDcwVH/T7Smc1th85YHZWNbOmttRdscPeigtGZukXCw/tzUhh13lixyH2cJV/UD/9OBr0dBx2GIx1i/bFPh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZsBDLSVaCY4sPaf6eHFgbLU6bTn2RZs//Rls1CAYmhX2a6xFa7zdo45ghT1F?=
 =?us-ascii?Q?/syriaK8jWGyqZ2GKstomniW/NikhPLruuO8apjdkeCXrl1L4tPtQBMZ9V0e?=
 =?us-ascii?Q?ucPQlgkCNhXG1/JrApH8J3+92e2133nhDy5xJ8ApLi82Ak6AV+aHjXbsg9KP?=
 =?us-ascii?Q?s1DmUDC698B/6iV2qWasN9/vqTlqEj0loOrkUwzZG0r2zCIw9wZ2zwaR8RPT?=
 =?us-ascii?Q?DQ4mOZYUvLJZJ7D5qb9uKyOH4FIw+kidSjUV2xuXJjgYBkMDxRO4Otko81i+?=
 =?us-ascii?Q?luxvaoxEgaqnBMNrlIqR2A5Ty7FGA+cdGLKVWUoc40XMSr8GNmJKnUBpIhiF?=
 =?us-ascii?Q?gPZ+dFyCGtnvJGhEDi33JTUNLD3+eoEqrhM3H3KoGpbrhYKpLqiXMsXA/NdQ?=
 =?us-ascii?Q?vCJpMqL7zukfeuhIgbAcL698gaG8EfF1LyFqmv5aEG+421Hj3ZOc1ClPHeNh?=
 =?us-ascii?Q?CKEkB7NtMsRMK991DoXMK2qDUv/9b6shEel9L6VrCDk2ty3kh0DpesiKWfD7?=
 =?us-ascii?Q?fHgD6lEmtJnKBXiPXpjtKfWukLL73mRaO+TZGig/3y/eFOosjcHfNxZNcCV3?=
 =?us-ascii?Q?lv301tnPjPXuQctVUTEIUiLEfsJDfBYnTR8YMNl5h3uy00Jxp0QHfgtbR3S5?=
 =?us-ascii?Q?dA+jVtFRo9htGVPRAR8ITGD8I+G89NjAqdJTwaXjKoSj5D800KhhhqfGFBTq?=
 =?us-ascii?Q?G1B5MpkwnBVDxYta5xbcaaRUwjPmH/UAQlXo760FAFPIJelH9rND8O55aVFU?=
 =?us-ascii?Q?PqP1/PlpdCvhkHLR5O/G0qdEt1waeJwDPjP03NLCz96zkqdcy03kmBjyd9/l?=
 =?us-ascii?Q?Pp7mjQlf9DQOjfTwwn/ZQnA1uuS895l14biLbzobdSdMsMxd2B84gVpfQ7lX?=
 =?us-ascii?Q?YqRcdwClD23g1pBTH3GufT6ndskRliJzDrX8MzRk4kLy2GimU9+5utdzct8u?=
 =?us-ascii?Q?hXn+F0M42NBWlKTvnX+yAkoZYoj1zBtSE42Kf8SI4/B4yR/rOAFnBChnysVx?=
 =?us-ascii?Q?Nv6XZv4iVyDGpTq9ZGoNfeIcURrjqQtPiXOeURt+OD81bp3dcMIKrAOXu6aX?=
 =?us-ascii?Q?XR7hzuOJAQ936dPIsC1yiPklyl8ZrZ+E/D3N6u309ZxUamDvPQcZhLYaGlia?=
 =?us-ascii?Q?ZlyVGc/2G6BDRp+YOYLWQIYRYyL433qsGTFcf+ZAL+C2q1wfnQRAKYmv9YfK?=
 =?us-ascii?Q?K0iB4zTUbebPa3i5r7pvNz01xhNC4HmXOOLvzZ14DV7k7seP9QcKs7MfkXPm?=
 =?us-ascii?Q?OO8I4I9fLEIFWxHut1wvOVo+DylNbp7niJTU0+pmPY5tkec8MEpC86ZG+DQl?=
 =?us-ascii?Q?SSKLKDJRXBu+OPj0wN2tO8pIkCbjhl5/hvIUIZp0+NZsX3BYG18PIoF2x9U6?=
 =?us-ascii?Q?+fO6fNlMqPlS6lvABLwfjI/64MxPOw32ERlNk5qXgYbYwqpBaIOiKKgYDWNI?=
 =?us-ascii?Q?Vep636b/QLPlhGGMFFLqdbfgkZMW6QR0CEbS01B5j7G5wdi2beL1zcehKI/5?=
 =?us-ascii?Q?gKzrHa6XBZO7/eUxTPJmECBTiEi/G2mVEJ0GtG6GodFTFF3cbkp6tjP/eueW?=
 =?us-ascii?Q?zrfKnJYmk6DIY64u/f5nIRpK9Q+1eAvLCg6Oz6JpTknFx5oTR+0P/f/nILTh?=
 =?us-ascii?Q?8ghNr/QvoFKemlB/828wGkpkQWhJDNW/NvJQPoqDRtvk//1kVEav9tleeTcf?=
 =?us-ascii?Q?kklZI4MF78aNWLoV1HrZNJFYpQLWaxnoS8CO1eMM/ZWwjHruioGXsSkYoGRy?=
 =?us-ascii?Q?ZA23Mlib0w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca895923-0a68-4401-b615-08dea4edc6e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 06:17:08.4023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WONc7heP/6+7Vs2zewkIOFlq4cKR8oGlJ8gTVODSy+BNFa2gtyh7w2zLNjH053q6EyouYSVvzy3IHLFQbNwYfpgMWJxFNkZToIf+vPAJ4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8605
X-Rspamd-Queue-Id: 2A8FE47DFA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31688-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim]

Hi Ovidiu,

Thanks for the patch

> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 27 April 2026 20:48
> Subject: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow d=
uring suspend
>=20
> On the Renesas RZ/V2H platform, if the xhcd driver is unbound and the sys=
tem is suspended afterwards, a
> PM underflow error will occur:
>=20
>  # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
>  # systemctl suspend
>  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -13
>  15870000.usb-phy: PM: failed to resume noirq: error -13
>  15870000.usb-phy: Runtime PM usage count underflow!
>=20
> Since the PHY framework is managing the runtime PM of the PHY via phy_pow=
er_on()/phy_power_off(), there
> is no need for the PHY driver to manipulate the runtime PM state during s=
uspend.
>=20
> To fix this, remove the runtime PM calls from the suspend/resume paths an=
d add a get/put pair inside
> rzg3e_phy_usb3_init_helper() to make sure the clock is enabled during ini=
t, even when there is no
> consumer for the PHY.
>=20
> Also, change the suspend ops from NOIRQ_SYSTEM_SLEEP_PM_OPS to SYSTEM_SLE=
EP_PM_OPS because runtime PM
> is disabled during the noirq phase and pm_runtime_resume_and_get() would =
not actually enable the device
> clock.
>=20
> Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver"=
)
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  drivers/phy/renesas/phy-rzg3e-usb3.c | 31 ++++++++++++++++------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/p=
hy-rzg3e-usb3.c
> index 6b3453ea0004..055775e1a0f7 100644
> --- a/drivers/phy/renesas/phy-rzg3e-usb3.c
> +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
> @@ -64,6 +64,7 @@
>  #define USB3_TEST_LANECONFIG0_DEFAULT		(0xd)
>=20
>  struct rz_usb3 {
> +	struct device *dev;

Do you need dev as struct phy has dev member [1]?

[1]
https://elixir.bootlin.com/linux/v6.0-rc4/source/include/linux/phy/phy.h#L1=
53

>  	void __iomem *base;
>  	struct reset_control *rstc;
>  	bool skip_reinit;
> @@ -130,11 +131,21 @@ static int rzg3e_phy_usb3test_phy_init(void __iomem=
 *base)
>  	return 0;
>  }
>=20
> -static int rzg3e_phy_usb3_init_helper(void __iomem *base)

you can add one more function parameter dev here.

static int rzg3e_phy_usb3_init_helper(struct device *dev, void __iomem *bas=
e)

> +static int rzg3e_phy_usb3_init_helper(struct rz_usb3 *r)
>  {
> -	rzg3e_phy_usb2test_phy_init(base);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(r->dev);
> +	if (ret)
> +		return ret;
> +
> +	rzg3e_phy_usb2test_phy_init(r->base);
>=20
> -	return rzg3e_phy_usb3test_phy_init(base);
> +	ret =3D rzg3e_phy_usb3test_phy_init(r->base);
> +
> +	pm_runtime_put_sync(r->dev);
> +
> +	return ret;
>  }
>=20
>  static int rzg3e_phy_usb3_init(struct phy *p) @@ -143,7 +154,7 @@ static=
 int
> rzg3e_phy_usb3_init(struct phy *p)
>  	int ret =3D 0;
>=20
>  	if (!r->skip_reinit)
> -		ret =3D rzg3e_phy_usb3_init_helper(r->base);
> +		ret =3D rzg3e_phy_usb3_init_helper(r);

ret =3D rzg3e_phy_usb3_init_helper(&p->dev, r->base);

>=20
>  	return ret;
>  }
> @@ -187,6 +198,7 @@ static int rzg3e_phy_usb3_probe(struct platform_devic=
e *pdev)
>=20
>  	platform_set_drvdata(pdev, r);

>  	phy_set_drvdata(phy, r);
> +	r->dev =3D dev;

Drop this.

>=20
>  	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (IS_ERR(provider))
> @@ -199,7 +211,6 @@ static int rzg3e_phy_usb3_suspend(struct device *dev)=
  {
>  	struct rz_usb3 *r =3D dev_get_drvdata(dev);
>=20
> -	pm_runtime_put(dev);
>  	reset_control_assert(r->rstc);
>  	r->skip_reinit =3D false;
>=20
> @@ -215,27 +226,21 @@ static int rzg3e_phy_usb3_resume(struct device *dev=
)
>  	if (ret)
>  		return ret;
>=20
> -	ret =3D pm_runtime_resume_and_get(dev);
> +	ret =3D rzg3e_phy_usb3_init_helper(r);

	ret =3D rzg3e_phy_usb3_init_helper(dev, r->base);

With the above addressed,

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

>  	if (ret)
>  		goto reset_assert;
>=20
> -	ret =3D rzg3e_phy_usb3_init_helper(r->base);
> -	if (ret)
> -		goto pm_put;
> -
>  	r->skip_reinit =3D true;
>=20
>  	return 0;
>=20
> -pm_put:
> -	pm_runtime_put(dev);
>  reset_assert:
>  	reset_control_assert(r->rstc);
>  	return ret;
>  }
>=20
>  static const struct dev_pm_ops rzg3e_phy_usb3_pm =3D {
> -	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume=
)
> +	SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume)
>  };
>=20
>  static const struct of_device_id rzg3e_phy_usb3_match_table[] =3D {
> --
> 2.34.1



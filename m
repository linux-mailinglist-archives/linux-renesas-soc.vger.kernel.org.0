Return-Path: <linux-renesas-soc+bounces-19564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D6B07CA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 20:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A3197A5449
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 18:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D981928C85D;
	Wed, 16 Jul 2025 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iZl1Saq0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B433B35949;
	Wed, 16 Jul 2025 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752689983; cv=fail; b=cjXDdPQR2gB8VeBbkP2VVj4d1AOp52vawvuNN0fFw4r0Cam/FDlX6GwwIMOCre8zj84Q/MtcQncx9b99uZmTEJxxB3nTYs6fe5MfXgcdXlZJsMGLFptk5EJ1JwYPp8bqRUvfMJEcctnETAUtKxkSo+7dPlTPlCoqXCltq5Zf4gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752689983; c=relaxed/simple;
	bh=BBnJKpl82Afa8EpiYEyWoogDds3OnBFZxmZKI4xXBQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rKB5rNHtaWf455DSfB5N8/V/6spZAqc1PEotXLYcrU1q3Oso3ed5IwvEBWfBNt3pfs8jvuNBxlQZ6sD22zUqkZuaEXhBcj34Iz8QFA9RyP2zFw0xp2V+joYAgQMvHWWUT8mNH0C7OLKLwgXZQy/PDzelRlO2sRO9/XHlCNaWbB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iZl1Saq0; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNOcEgVJSMaQu4SrfxxCYyBXmIafDsA/Nr8Ffsc49yWk9fKaMTAsw1AT6FmO4qVjj/OJkQ7JoPvo/OftC9xoVuwK1Np9vVWtsxHtH8W9oJ69pNMKC/u2DOqfl+vjZJwBLQzOtsRJ4zc/KngiAGzgy151brDyoSXIK7N3ZGGeoPYJy6ETR7yq5vD9cbbjacEDXRH3LWS1l2lKBXsep27l/FXeBKMwc9pZ3/P1yPmVe/b9AGuPmehlwITQfyn5tUpLvbyh9jjaxiNWM1m+U4CT+Ge7Y+NN5PpDYwwSd9r5lwak33nPd/4SsWUYmCFyUenHuN7JAILxBgLnG+3MQXMm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyDXjwVUy7sWdd4AnS0BRamaayO6x9EB8a9X8ksaOrI=;
 b=LyKhV6h69qZr9lwnckHz36bBawjhiVxDPGDuWWZxu8ZJImxT4FAzrllpBvPSIU5mJfVa09re7dETlfzIe6O0Hnwc6yVQcYadeclahJ6VKK2JmnrtXnm66oofELU4KOov+j8s6P8UUv2QpkRmFO2/64nAL8bTzJjNUwFsd0UVFMkYOL1CdRtw/tXxbXlTwURTk1IH5YI7Pw69gZdunnqdcB+zevETFnDX6SgQATheErP2XMHl9Ny86TiMl4GKX/i6+498BTupvcMAFCN70zHcfwmsmxJOR7CT72nh/VY0GmX3XcJPwvG1vOyEKfJ0vRL5o7iB+utGWkgYLiMuky8r/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyDXjwVUy7sWdd4AnS0BRamaayO6x9EB8a9X8ksaOrI=;
 b=iZl1Saq0JrcZy5X2WfNORNLQch4kXtALoXRMOu1KOKj6nRSecbO2vShD8pPvdoS9ke5R+gLjxhwdS+Nxbf6046gbjtgaZU/I90o4K4+6qUxkVc4yLb8y8MMCoTJWiYAb2GaTqf3vDIHJv1aMGe6IQoOv2cBNPjGm6ku5pkHi7v0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10075.jpnprd01.prod.outlook.com (2603:1096:604:1e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 18:19:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:19:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Topic: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Index: AQHb7c6+F2cIzXpCE0eHQabSLpoq6LQ1IIJw
Date: Wed, 16 Jul 2025 18:19:33 +0000
Message-ID:
 <TY3PR01MB11346F9BF41DA974F52CD4CB88656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10075:EE_
x-ms-office365-filtering-correlation-id: c65e6165-e331-406a-57d6-08ddc4955087
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QcaZtl0ra5oKd9YdoCpljEQhLHAh3uyILAMIPVvppIoQ8OI5MAEz6S3qjTqw?=
 =?us-ascii?Q?D2p2gSEeYKDqVXRnxDCOr/mUiND2VbdJslPOsrNiK0YhjH55BsRnaQaSbJbU?=
 =?us-ascii?Q?m2Tc7rrybEGDT6Q+O0YdAyKW0s01Pw/DZqp/haREVGFHkXEuHB9M6Hq+ZBUC?=
 =?us-ascii?Q?5Ny+/R4md3+i10PTTtdItt4xy0Jvljoq5bFwViJHJqHelwALA0bvMfKfXXCt?=
 =?us-ascii?Q?89sTayn9V7TvZyniXmaq/c1bkYQAeY9/nBL0qn9tsByUlF/SX4t+8rC5U4FK?=
 =?us-ascii?Q?lovlzqNyo01kcuMvDBdK31afbKYbNe9/1ye5jFv7We2YRMGG43mQ+N9jY3Yl?=
 =?us-ascii?Q?927kxIgJIoBXzFDuSyjqvx5VrRoNs4MaDW0nLBk3ikvKLN95LdH6ysGbjuYN?=
 =?us-ascii?Q?/S83Ab4h2+h59jQ489fiCqsXonP7gv4vwJP9FFj1tq/ON6Wi4JL3QZPovpvH?=
 =?us-ascii?Q?KCZHnacrTUeLmXO5r7IcAV6IEXaVz06IYuthaKPANtrz1gVqVTLrzmZbXv22?=
 =?us-ascii?Q?BNSCwnWX3qevsUx3OhC3SE1HWmKYuMhkelxfFrZ6cd5busD/YoRlmgOOI76G?=
 =?us-ascii?Q?j3RDUqXF2c2c2fQQBhDeifLIlr517DgkRSZ5QLbELPNP4hRkX5GZgkQzvFRf?=
 =?us-ascii?Q?DwDPN0x4PhSWmb9G4PcM8wSnVzBnMCI920WZbHffmnSKsuJDr4xX2w5LbMG9?=
 =?us-ascii?Q?VnfVmDzPmtPDAhbFuNSp09Cq0Qsh40XyJ7Ux9ck1xcnC8RcmW9LhTGlCJFyo?=
 =?us-ascii?Q?r/g1v6uIiyYFUcGDq5eu3MT/9ztNC9nCK9zkz6rjU3UHxZ7rGQvn4AsjF5Dt?=
 =?us-ascii?Q?5uV5brKr21KmUYnLtWaffQY6kVjQ5mJRR0pYhoTA24Oqos5fVYYBw7+Ndcxt?=
 =?us-ascii?Q?8p3s9QwbFlW477nfHVLkYwT5dTOD8VFPuZCxTGe7TGHErxNpi2Qb6RRVWDdG?=
 =?us-ascii?Q?jGYY6TMHVvfQ1eEgRnglNyVdh9MMNHjYKgyAbv43hJvYJJAPObRj6qya6WXb?=
 =?us-ascii?Q?YpsurI/hbrQVd+UlP3YOjmet709to4nREaw1jo6YaFg2NGr3vuTveSZAU+X7?=
 =?us-ascii?Q?zAIz9li7XjwhWG2dNv3uO5fvVIq+8X9XhXis90DPhakZn/BOs76nexd1loEo?=
 =?us-ascii?Q?JyCN1tA8e/kOt7JB7Ef96AfA1qatfSUqj9TeTdEKnRvaW/si62X9czK8dS1b?=
 =?us-ascii?Q?4Qt1aRz7f0UVS7GG3IUDooy+wOUxf5nJWG72WNcqPiuiwb1OC01mKlxGba1m?=
 =?us-ascii?Q?/VKLduqKUXhDpEqxIQtF3GVrefXFiECQB5c/fBK2Awj0Nx9EfvOikE1tczeS?=
 =?us-ascii?Q?yPsjIzAKLrAJQpkPR59WHnAv+XC2hId4vJP++aqSM/X7IdRaHqr3pwMcSoLc?=
 =?us-ascii?Q?tzp2m+nJElSvGzILMA1LWEb8gHPhWJKbPjs/tIKKjCEvuk2bW0QtVIPt2C5s?=
 =?us-ascii?Q?iWnPLBlAoNTEM70klF5WTAUifxA2q75//PHHXy3T9Nzbytws5fDo7A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bfFnZeJcd3vISO1RhzumAV9MIqw6fGJSt7xL3sM+vi5M40sCQRV961OEMTvZ?=
 =?us-ascii?Q?7apBOc1ZezPJ3dq2JuXHKrHl9ywVLv4saHfeUJuYQOY9qhgLbiRaIo5ClJ/G?=
 =?us-ascii?Q?qbiSDUCT1Cgu33RGfeBu3c7+sECeMKnxNocpj3bqVPG2SpppctxwLgXIotZd?=
 =?us-ascii?Q?7SQioEoZytNYlrNGQztKa4fsUrplCOkh6sRmZEk7ECzXj9vXM1eo+19hOieI?=
 =?us-ascii?Q?kpkxP73c7zWxH0XYNwAyRbIXy3KzifaINiH+AyW57iAt50NfesDLcmhwqREh?=
 =?us-ascii?Q?G9+9l2bu8yZU1rx2c1l4cxdRbmKoX14ghuTSXB8X2HBm3Od66NLTb3mENzHG?=
 =?us-ascii?Q?9HyruVjjps7rD4GL3a8709AomrEldJkR6/7qkXhe8jVsnzk+Flb1dt4afh2L?=
 =?us-ascii?Q?YB9dUE4jz89IchzYsy+MOoLkr9g0bHCBx7Aeo02Fw3PtsREx1P7eWJFAe+c4?=
 =?us-ascii?Q?9zn6JGgKZ45QyviJ+X36c9lV8by1rqlzwonMXEs3kMV9zrmFm8zxmy7hEEKC?=
 =?us-ascii?Q?0XnKgvEwGUegY0Toy0REFJLjmnqX5k30G5Hjj6E7uCNNRTIG5E5iGXtKRLb5?=
 =?us-ascii?Q?QKyS+aR62InVMr20oZusNM7y9U7eMZA0LDqH2rtGHELAozyRRIS2FxwdgyC1?=
 =?us-ascii?Q?kVpRi/O07tZ/PCxJvUJwL41SBTpXE0xOwGeZN3HsP4uc3pUif8J2+6g+yUZa?=
 =?us-ascii?Q?ISG3txWqd01DGxxw+4c1MLDpERRn3trQ8zhhVDUAWAPHEtO+O2fIRfp4FEK1?=
 =?us-ascii?Q?VyWsaAjD8Y1I2IXTHtHJFfdYtP0Moow5hJORydSE7Dy4KpBY/ElH9Ab+UYj+?=
 =?us-ascii?Q?QVxDXvI2ehur1682VVA0Om9I288wmTs62QJwC90eO0K6UdErKRjQx91gTrNs?=
 =?us-ascii?Q?oUrQ35RPulA+HI2rj8KDQsvAM585SyHEiu9Bsfi2QI3OMzoZVdIdWTRUELFB?=
 =?us-ascii?Q?6BQC9yYmzsg/GvA2/Q/FxwW7alux9pLzW43FGNNqaZ6KQgu4yawzJcZ04P0k?=
 =?us-ascii?Q?lJ/n5M88R9hzJ2EPBpXso4HBUarvCRrqD76pkMQkjjwwY9BRsbf+nXS/Br9o?=
 =?us-ascii?Q?KzlVksR8joCnSnDtwxNwvZNYYv+OwS5kn0PpndrgOK4XWUuQeel9WU0TSM1w?=
 =?us-ascii?Q?PNF80ZWW0bdoUHX6o9c/52ecVLYk8JSQf/pjj1EtzZ5+uWRnpO2RdNKZ2zAY?=
 =?us-ascii?Q?0GNX1QYJhUBBZX0hyZx/6zLIz3BBK0UCrpDU9U82/r9j3I3FsV/MZkxSXDp9?=
 =?us-ascii?Q?V9Mewt3+hads3DK5k38Uh+H9Piyh+P6cK3dnz6xndWDxazFdbBybGOTQMcKb?=
 =?us-ascii?Q?dbX1s1iwiElfLDkp4ee0ifo+yffPVivVYTjKOYrLQ8FbUR+4DF+qaYp2r0DH?=
 =?us-ascii?Q?7KrQnHrbvN1tCKpmBuCtlBENTgipfPB8gyGk3bzauS80pfJsYuzz1ZqDCUMN?=
 =?us-ascii?Q?sznobvtR8qAp3gGhSdnVBskK8GNo38VuleLyaDwZ6lMeTqP61VAEHGIU+Ihs?=
 =?us-ascii?Q?9E7/CmVTmrqFjsFw373NxWbZNl0clBdEVa9btcIU56YwYgRlWPJXYm5kqGTr?=
 =?us-ascii?Q?H62l6kLx8AbBN1MMmkZp3aUUnFQukdL4zdu6rr93NHs4I7BIsk1PfSNOelG3?=
 =?us-ascii?Q?7g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c65e6165-e331-406a-57d6-08ddc4955087
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 18:19:33.6576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rzr93f7NXdZVoyLYaGsgBdU0aYncBazTcdLLyg+Kvdnw00Cs/xmxY3OXNczPkFbeDUI1QhtKZt7e2JSz9QFplRLXHlKoQCAq4QaxxLLht0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10075

Hi all,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 05 July 2025 18:03
> Subject: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM suspen=
d/resume callbacks
>=20
> Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
>=20
> The PM deep entry is executed by pressing the SLEEP button and exit from =
entry is by pressing the
> power button.
>=20
> Logs:
> root@smarc-rzg3e:~# PM: suspend entry (deep) Filesystems sync: 0.115 seco=
nds Freezing user space
> processes Freezing user space processes completed (elapsed 0.002 seconds)=
 OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> renesas-gbeth 15c30000.ethernet end0: Link is Down Disabling non-boot CPU=
s ...
> psci: CPU3 killed (polled 0 ms)
> psci: CPU2 killed (polled 0 ms)
> psci: CPU1 killed (polled 0 ms)
> Enabling non-boot CPUs ...
> Detected VIPT I-cache on CPU1
> GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> CPU1 is up
> Detected VIPT I-cache on CPU2
> GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> CPU2 is up
> Detected VIPT I-cache on CPU3
> GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> CPU3 is up
> dwmac4: Master AXI performs fixed burst length 15c30000.ethernet end0: No=
 Safety Features support
> found 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported=
 15c30000.ethernet end0:
> configuring for phy/rgmii-id link mode
> dwmac4: Master AXI performs fixed burst length 15c40000.ethernet end1: No=
 Safety Features support
> found 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported=
 15c40000.ethernet end1:
> configuring for phy/rgmii-id link mode OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
>=20
> 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx root=
@smarc-rzg3e:~# ifconfig end0
> 192.168.10.7 up root@smarc-rzg3e:~# ping 192.168.10.1 PING 192.168.10.1 (=
192.168.10.1) 56(84) bytes of
> data.
> 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D2.05 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.928 ms
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is tested with out-of tree patch for save/restore ethernet OEN=
 registers in the pinctrl
> block.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> index 9a774046455b..df4ca897a60c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -136,6 +136,7 @@ static struct platform_driver renesas_gbeth_driver =
=3D {
>  	.probe  =3D renesas_gbeth_probe,
>  	.driver =3D {
>  		.name		=3D "renesas-gbeth",
> +		.pm		=3D &stmmac_pltfr_pm_ops,
>  		.of_match_table	=3D renesas_gbeth_match,
>  	},
>  };


Gentle ping.

Cheers,
Biju


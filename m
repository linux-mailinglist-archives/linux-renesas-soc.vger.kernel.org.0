Return-Path: <linux-renesas-soc+bounces-9610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A56995BDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 01:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51AFB1F250A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 23:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC001D1303;
	Tue,  8 Oct 2024 23:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S25eaMYB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981511D0B8B;
	Tue,  8 Oct 2024 23:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728431338; cv=fail; b=QQ+9zGpiClN0xwFQ0qhTOE4+Vh+3JBfk5RMbL+s8lNVW8CiK+Ud9MNenTttFnz7VrF5w858DbIYT9k7dfRCbNx4Q8oKnNAyWBGyyTOVVIGJWesApjB4xednmMtJ285pf7NAiVIpcGS96SowkBgSZLV22zmzcvJ0Zo1pe970s/3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728431338; c=relaxed/simple;
	bh=WKmdmdWuV7qK4m0/3dot85Zo6spoFMynXr7ZWp2Pq7M=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lWGCZ9Rp2fQIujFdJRbE3nXb1fMl4r0E47ACbDVzR7N+5j/ts9smYdHXKzvZKMgoOTJfheGz/BV/BkRZuT2zMmaBLtZvAdHiccdTgpQLJg/lFNW1s8jR50jX72Dvwfp6sGzzojpN99TPYz0gMjTvz1OJJowdjEGMszR+byGtG6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S25eaMYB; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUrHADQYDpemNoKp01goRniXsu5SY1pDL2Dm+fyxl8Vro3unIcadpjlEOVsJPD8DAX69Dz7oP5Udia5e/eBreiANpBhBVTDJ8tSrR29oVbG2d4q0kwrNfY//ZiJH3PpCCWIRuvb3ZdvgHeKtJmOOsIKTdC4SmPLFmcqMSN5OWX6OkDv09wtIv0CUov5pysVyqY5AnH3zZ2kDSVAbuvU89A+ZmxkYqBHiHxhmtZYm1CyFj5YUpli847oLOzoWRTE9J+RasET+4wk3CNxFZfyalewKFtnx8L771w6udVjyAiBBeGagpLQdYHh4VN17ryqB9vPfwVR9T6MlVsi2fnET3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZKjRF2i2NdWX3mr3F1vqp/cLY/U/NMsswiHj+F+kaU=;
 b=F1IsvRwRf02EsgIzxHtpfuXpZA21fk/89AiTZGvdYURrQ/vNW4dCaNuvj6Y50dbwREWigBHdebMpnN0kDMjfzE6rIMQUJ05/oNIKVY6sxzKJVDk7wNs1K9QSwshjUxbH9E1J+ZeldO2dFWp9or5A3uySWUjAZar/MCjDdfRKPliQEuxsK+KmDOyya5+hPh/uuB42NnXz1hXf1ccmNInY5dOimX5aAhQoQzHQs4FMTG4NfnLaWS3m6dxZbBot8mUzQ/rF4NBBJ2YuVuHOGHdw2nyRIfwHW1T9v/XMNrRUVx0GfsbNRgk1XhfmEeXBEo6jTlK6p6gebUL6xgQpHrytWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZKjRF2i2NdWX3mr3F1vqp/cLY/U/NMsswiHj+F+kaU=;
 b=S25eaMYBX+tQTlA4aXVPBHSNs6PFlfMgqjQlwD0FavjVHVdyuFidsdpNZJQHCgAPOwbdy0fI/763vUYt5XmCLCWrF1FOfOyMtCpPGa/hJiMa/VIwgt7fUtWYr93w32vXxchoYPUIWb5AbTUh72gtG1xPFPrB4FEMMkfZcDyLR2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10198.jpnprd01.prod.outlook.com
 (2603:1096:400:1ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 23:48:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 23:48:53 +0000
Message-ID: <87y12yrw9n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks
In-Reply-To: <0d2789cac2bf306145fe0bbf269c2da5942bb68f.1728377724.git.geert+renesas@glider.be>
References: <0d2789cac2bf306145fe0bbf269c2da5942bb68f.1728377724.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Oct 2024 23:48:52 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10198:EE_
X-MS-Office365-Filtering-Correlation-Id: 7536c890-75db-4e27-97a1-08dce7f3c3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-7?Q?cJKwIH0+1xSbUFV3e43sVSynbw0sbjruMtzew0tFN+AbLOpXcYytTY9o2R?=
 =?iso-8859-7?Q?kC0KuuRmo8Bg0IK7L1xUCf/G49/I/9LhVUQQXnPV8bPQ+a1vEFAstJ18iJ?=
 =?iso-8859-7?Q?E1fJTMSSA3Uuv9ZnerV6jVnQYDvqmR37qZ238+LXe5nHAi40e0v3lwmz7e?=
 =?iso-8859-7?Q?URIFCHNVfTXJCxvhhygf9FiUCKqEJlyHH4sv8A6inD7moHDOA6w08GK62I?=
 =?iso-8859-7?Q?c+D351zg2h1ONxsPACqxQ49lF5ul5ucBMP5EpryArf2n0IFHmfkHEPVgDQ?=
 =?iso-8859-7?Q?pgnIMpH3FzZDn5T02V8eu2is4UZu1NeDE7kQFFVnpQtv6823mDc0gCKWUC?=
 =?iso-8859-7?Q?R6YSxl8hMek7ug8YdRfR3wO9dFOZMBE136aFFAlRnOknmTrNEFXC8XVP3l?=
 =?iso-8859-7?Q?SwkaaiO1Zs2zTGu2bv0RyWlX9JrDWkZ9p20mvjW4+6xuJJGdBBf7nbL22i?=
 =?iso-8859-7?Q?0PTrNHSHTNSLUSanFuuibia4Pqjf41pbc58Ug9FSQOuBCUccffTG0fSksS?=
 =?iso-8859-7?Q?zYVX2F5vMmHJnEFRPzM6BPUJ0UpELv1J+VZgtsb7g7I+Jz8iHW4r81ZaOg?=
 =?iso-8859-7?Q?bzcKEFK4zfTmu823GwsMPuXGgiqVG7JDiu7ukmSi3bMW8AEuypJRG8WXQa?=
 =?iso-8859-7?Q?EPTITeaFzwfGs/cILY3qaOkdNI97Tjly+Hb1IbLGA9RKyaDoQ37crG3K9x?=
 =?iso-8859-7?Q?nGeuSNzeuL3TsllSLnCDBb7FDxQ6NLHZHqIQv4P+xgA58Tb+1zAiikctDO?=
 =?iso-8859-7?Q?KQmvGVteDZYvhwLN8TEsQutBeJeuPq+TZrgyuALMXoiadqQC8P9pQm/8nN?=
 =?iso-8859-7?Q?xw9jzBMuUkZ+he83PiBPyLtLICZyIJop735kOeC/6tBQ610RDO+jXHu0uf?=
 =?iso-8859-7?Q?IB0/mRJEedQVb4HQGgqJ4enzY9RM0ljs0wrJ21ukYO4OO7Ei0iBrZ+ahlV?=
 =?iso-8859-7?Q?g69rc/VzJzcWnICIu2N9wbRTKWyp4BYfA2WlFCgwM+YyC+tjNIDd69/Myv?=
 =?iso-8859-7?Q?CA14O12zSa0q1OXdNZEoHVNVztJGeFm8TSuKGYEWfAvyZJt9L2FpjsQpCl?=
 =?iso-8859-7?Q?a6TzQk9Tf+p6aYJvWthguUclvnDtIxkcLTa56uuQ+p/uFhBQvtMpcVnF8z?=
 =?iso-8859-7?Q?64tAki1+OzxW7Pu37Xuxs0nX8ds1HxH/iKjjlCIJ46o3jW2O2zA5yl9UXe?=
 =?iso-8859-7?Q?km3k4v2FBMtpiIq4maTdF7tz8UcjeeeDOReuPDNcuJkvllAzgMTaPdfkpN?=
 =?iso-8859-7?Q?DG43P5MwdahlOHXVl+UVfk2xjYuJBGq0OjKzD18E3MGReXURVPH9QBMowU?=
 =?iso-8859-7?Q?le1798/jDEiUxevIO2p3B75Da1T1wh3iLX1IG95GhNqu5Fm7kaKLKioEKX?=
 =?iso-8859-7?Q?vIlcLt5DHYjC95gtdDIc0sZ7XaUCN4CA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-7?Q?03tjJDaTUUSPfCjmNkeHVj1LbE1G7dRMDK/2lSg+fgAi4lnZ/uVwBwkSZ3?=
 =?iso-8859-7?Q?GJedWv2d35wZdUT9OIbKoV0uRLjXS82LurdXyviIIABUfEIENpWRhNkYeM?=
 =?iso-8859-7?Q?wAbIaCV/e4MAGm+9wUUCuv40/FEh20QVzbQk1KbbEyWzW484tGDayAnDsn?=
 =?iso-8859-7?Q?L3WGV7g97TSJPbS0g/Cl2rzyHxIKc8QBFmX+80xZsNvFQ1VPSlNqpbJDTp?=
 =?iso-8859-7?Q?XxlqGw1Xxxu6QmL8zKtBli65t4H+H8ufC8Fi3B6QJN5NFbm4cGqvOluHZ4?=
 =?iso-8859-7?Q?u+KcoN/8jRk/7ljJfMiVdO5LSx1ICaOPBsWy8Cy3Qa2s1Uko/PTDY87cDO?=
 =?iso-8859-7?Q?HkUZhzIhF1BM7QX5nJr1oS6mE12oCdaZ20mcSUStcNrpoLuid97tLd0FMu?=
 =?iso-8859-7?Q?Ik1T3Bo8ef7d5l/VTjnZoLI0yUx5A/3E1dWEhlepO3L0sQystX2wAT7m2E?=
 =?iso-8859-7?Q?/1TJ7iKpGvJKUY+oCLrvgVu6AShOsU+C2582V6xbC8Vx/LQ4ISFOQVmBxn?=
 =?iso-8859-7?Q?XNdFvTk8Tl8GA+vuiEez67rHbObqVRrm2wxGXtMo+oabxkARIl4r84gBkg?=
 =?iso-8859-7?Q?JLU4UnxLq7xoydQvAsbpTCyyo/jE9fhYIc+eg25+OGoKu4hMBtzN6aO4j3?=
 =?iso-8859-7?Q?XpGOgZh2oGBwJM74JFPKU3STY3NOEDDfHQYa2v+Ry7CIZFIzcJasf8CxWO?=
 =?iso-8859-7?Q?SwzAFeGDqIPzCZzRtj95NTGZxaCo7YPonXrbhJ6QLlnfaIYyIQOxOxDzYq?=
 =?iso-8859-7?Q?8c5Ov7e9ni5s7Z8ksNgyhjcPJ1iO1gUppgWO4/b+BuADl9aoCeZRGJnwJg?=
 =?iso-8859-7?Q?BLJisP7Q70cRgrNfH/TaplkIKhGWE4ddHuQTwQpQAOZN+MMXBs0QwbFspm?=
 =?iso-8859-7?Q?qV8+nhwz0dnLbaUpykZLrFuLLWf1T98Pk81h24dRQuiVGdsmkHZPI7x/gk?=
 =?iso-8859-7?Q?5OE6c8yLBYl8xVUF/HZpcvtaXFN4u2xvKpmPWNF3E5pYcZIzD03127hjpi?=
 =?iso-8859-7?Q?70XqAmE2S/dU3Lg9JkJpkm2bWT9TXtv3aK7BTHa+IldZKMju8KF+CLz4zk?=
 =?iso-8859-7?Q?MpiI6UJ5CozmSzh27kgRJruk0LqoYynphbQ/du235LIoDNL5V8kZmmMsj6?=
 =?iso-8859-7?Q?SH+fs5DbC2BcxO9b0ji/q10KlET0Hj0K3PD/Q/cxVgoARLhv2iVc14guxF?=
 =?iso-8859-7?Q?SQefRrHylbVg/3QbjnPs/BbMZBn+y3PLVF/grLuNf+uRMKGiRrI0fbXEkV?=
 =?iso-8859-7?Q?JQrfAx2P5MeWNdmXvmvaIBaAO4U/cSKcZ5+EzYqUIbn1G7sU9PHmDU9CYk?=
 =?iso-8859-7?Q?nTIRYNNjDGQwU7lZjR1f+E3ejTNADQvve3FqmV70d9fVXXkgp369v0OS87?=
 =?iso-8859-7?Q?ECvAL1A5BMTDss7QPTInuG1q1pjyEYwy3QZrD02ZyzSknDsV5jcTT0Zzuc?=
 =?iso-8859-7?Q?3K30x9IS1fy57AJNdvLG59xJHzRUZo+PGefLlBE9/ZXRBrng0I/ve6Wzt1?=
 =?iso-8859-7?Q?bx1wiF0Mw9i3KEQs7XxVMztUTZrUPDn4dDbZk/HNh0Vi2ecFEYv90f/uJG?=
 =?iso-8859-7?Q?zO303ZnB2xTvhgP0LYZ9ygCGZjIlBBEFR3d5zSbbAFTKvdtN6zGPWf0IAh?=
 =?iso-8859-7?Q?PJU/xKWWTEttqRcaEs3O67T71gU4jHKXAhHArEIIxi0u+f3BXYhI6RQPYR?=
 =?iso-8859-7?Q?aCnLXJginHh27BrtSdo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7536c890-75db-4e27-97a1-08dce7f3c3d9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 23:48:52.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWkeBKJkKS2s8DFrY2eM/wXmaaIXOd5wH/Ol4YxQ4CuBpWUG0korc8o+9kH8Z0MXKhrOWfq796CGaApMva6xC5/jJpAVNeGEeJiWwc+sF8zsEBpG7mfwo6n3aPz3xu9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10198


Hi Geert

> Early revisions of the R-Car V4M Series Hardware User=A2s Manual
> contained an incorrect formula for the CPU core clocks:
>=20
>     ZCn=F6 =3D (PLL2VCO x 1/2) x mult/32
>=20
> Dang-san fixed this by using CLK_PLL2_DIV2 instead of CLK_PLL2 as the
> parent clock.
>=20
> In Rev.0.70 of the documentation, the formula was corrected to:
>=20
>     ZCn=F6 =3D (PLL2VCO x 1/4) x mult/32
>=20
> As the CPG Block Diagram now shows a separate 1/4 post-divider for PLL2,
> the use of CLK_PLL2_DIV2 is a recurring source of confusion.  Hence get
> rid of CLK_PLL2_DIV2, and include the proper 1/4 post-divider in the
> invocation of the DEF_GEN4_Z() macro, like is done on other R-Car Gen4
> (and Gen3) SoCs.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Please add

Reported-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto


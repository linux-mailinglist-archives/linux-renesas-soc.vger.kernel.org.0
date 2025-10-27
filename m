Return-Path: <linux-renesas-soc+bounces-23614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508EDC0B83C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 01:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E723B153F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 00:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727A154652;
	Mon, 27 Oct 2025 00:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DCXpnB2b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F0F4A07;
	Mon, 27 Oct 2025 00:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761523672; cv=fail; b=UCZIhmvegYLQevWmv13YDIsa7G1W913HWPBlI2xmJk3CmVIqsXi885WV51j8arndEpXmHEN8jGRtgKAOzcZnFm64W/e38dQZbb0X9GYTJp+v+yZn/3ahI7v3nCwZEN7g+s854sVj6WTejPHJiwiywhOCqgr1RRGtzRPmRpBI8S0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761523672; c=relaxed/simple;
	bh=FikyT5k6XDtO1QbIA27qgeRFuThgvqvL3YWliPG8y3M=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NN7DDZFpKfm83mcem2Br9akJHnltebk+xEvzJ7XrNBQEgfOKXVUTrSFep0/sEEMxI2xuOFJj90k2gvi+vcxLS2X9/j7l9GZ6P7Je5IvAwpO+x0UJ7R782AeuWReVLBCgJiQD8DRMjGcDu5Jh2K2r1BMfTv/aAEVxkOI1vAeW5Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DCXpnB2b; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbI1w0UKtkLKYtXjpuFUv2wDnBHimfEPG5Ifvcc/YVc4MkCdtzy89wCzXvWrDHaHcnQDOqW8tDNTwROi+lF3usclfps8YU//BJrI+foCcsOtPoIxOTOuDlR0j7RtCvXGV7+ndzQL2WVWCziNiR45EXSH9YbC4g2cRPLIVacAm6ePRA0SNgHdlvkxFb04J7q5J71CdoOcpJvh81Ljmsc6uWmohbAIFkPebDDy6b6pwi+9/po3nCBMgcBjYq1pbEs5ATyquLW4KUrX0B0qhiUx/IkqDOBYjEHTQWStZJgM998oiBiW2umqay9z00f8m0uwOhOUCnhMoTcs13m+wugsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/nMCVT/Qjr8NpV+YeFq/Q0BujIi40l9PuyLY1XUNpQ=;
 b=dfiOWPoxTf93vF4xOC4FGoJtGzdN+5yWLX3xxmgEGZgTybRShaFJAqhiJ5PNMTdxmzMx6wiCVQefFdw5mUEri9APrGy1x+kAApjkriS1e1pwCV7RsPg5PL4SEkRL+ZeRWshC5zohoUon0a7GSgC6ejO7HwWFekJW5DvNpd7xRlKOu7zYRefwlHq7BsD5RNsCAqfLuNiXSbO40685o/2IMmzMIX4o5uUqE8izofLZfoXmBLJfhhilodCtEy0y9KMQRcu/ocBTe43xxGoJb22BUOYGdo/BArzRhUUEYJSirqMS1LPxqMrAEw1+vdJUZVCt7bzjEWfrDN5+pOTo8nruUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/nMCVT/Qjr8NpV+YeFq/Q0BujIi40l9PuyLY1XUNpQ=;
 b=DCXpnB2bSu7QD7HQoygzzUCs0RXnFrimM+KBE7J8NPNX0tVLtWdADFrkFNsIeVLpWWS3lSIGhzUyMYvA2kcwT0g99ls7dRm1rOdK7hE/kpbOg+Xfkr76oakNE+P29V0T6NkKgENar4wRMk2xj9zAc5PAjxPl2EvTaq2XB37KV7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16060.jpnprd01.prod.outlook.com
 (2603:1096:604:3dc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Mon, 27 Oct
 2025 00:07:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Mon, 27 Oct 2025
 00:07:46 +0000
Message-ID: <87qzupgqb2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: renesas: fsi: Constify struct fsi_stream_handler
In-Reply-To: <88ca34df9006b74a7596b91714e700bcff666c4b.1761507792.git.christophe.jaillet@wanadoo.fr>
References: <88ca34df9006b74a7596b91714e700bcff666c4b.1761507792.git.christophe.jaillet@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Oct 2025 00:07:46 +0000
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16060:EE_
X-MS-Office365-Filtering-Correlation-Id: 7472b743-9ef7-41fb-c7e6-08de14ecdb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sj+ydzgXMUm1EimvQs5WnYSBSSgPfbgfb4u7xwvHoqNbPjw/yrixNsejERJr?=
 =?us-ascii?Q?70Mu5kKSUmC51LMIhefXRnJA0OXXE/VXMknrfUIAulBFGfkoOIjWHluS+2L8?=
 =?us-ascii?Q?ceqMT09bPqHGJSD7XQfYqQOldsmWguu+gSe7Xw0qWR/zKCrZzqP1giC84N/b?=
 =?us-ascii?Q?oME4gdTDPwQqIjRdtjw4g0vQT8CESMtAhl8LZ5e6dPcPSZUnc5zuWHD0JOMU?=
 =?us-ascii?Q?iRskIRwSud3O7bv1y4DIOx2hiCzju9KYiEGbwFfZ3bKHqt42PGXvlXpfnivw?=
 =?us-ascii?Q?Db/Px5dMXqr9l9CO+Gnktq+j7/qZogEBXOL8BpmvRq06u00HmYDU4LodWspM?=
 =?us-ascii?Q?nhLkeQGBR1V6yqkb7gOm46ZsaUp5KSu3rniRWc0LgtQiMN3+IeXnTUR5Yrda?=
 =?us-ascii?Q?Az276Yq+WBlUkT6DdixLzxaa2nj/klWB/x8ATy/dOW+GapTDWoo5OBoRDd40?=
 =?us-ascii?Q?tJih1Tt3HP/9JdPW0kfr26/CF1TwMZ4YUBvTBkHQUrimE2BcD+dZ7Op2j5yQ?=
 =?us-ascii?Q?qsytzFHulgRi8C6x+9ki3QQqc3tM32p/vmNF3JMA1QofCyUJwNooZFy0JzB8?=
 =?us-ascii?Q?8fjYIZlEQexYGh86mAKRoKrBdF5Klnva2eKVk/P2Efgnfe0cgbt5x7z7NFHv?=
 =?us-ascii?Q?eUHFUrWkXwE1/4KRFNmf48h6/3VIYHnV8ACwCPelJKsPxBWkL/oSQh5F85R4?=
 =?us-ascii?Q?Tg71Tvylty0uid3SN/0Wve4XM3HBjb3oJ0cl9SlzTc5VkOzFIxaHY1ooD+on?=
 =?us-ascii?Q?kQlwQNrU+K5m333OUqgvyPokOWWlCdbLhIJdylqUehb4PZNQUUxQT0ZxZFD4?=
 =?us-ascii?Q?iedca+O16S/sgMvHu1vGYfuZL7najfOlmbRB2fc928sVShGOkSPQR44fAjr9?=
 =?us-ascii?Q?V6FVN/20EDh7KSls1HwSb7obQTj7m6IGBYwAVNJLz2tnGuw20D5k0h7wugWw?=
 =?us-ascii?Q?d0POHG3P65BdF3Yt+RmkJ8pLNCxCcr6JgsLwB9k0WjPPGucMjvaZOlhfSpua?=
 =?us-ascii?Q?pSP3l0KrsbxOX4a3DwwUn3SQMTQuhTl1oxl3xYg9UVQLVX+fO0IcaR6XIlzZ?=
 =?us-ascii?Q?ONtQ7GzJshnisndn8uah9NG+nQnKnH23SwuASQ433f5TekoVi1rqGlkT4mJq?=
 =?us-ascii?Q?MIdmRtiw1q7Yx7wnZwHgwwd5VloVe2ZluKHZX7a4S/8BVtpjE2hqqAICTnwW?=
 =?us-ascii?Q?I1QJMWaKzPzDAZDdLRnI0q9qMUHNJTX3OboH3I6TPIgwdEFU9VkP9XF0y7Uq?=
 =?us-ascii?Q?CefOiZYEmsHyKlHZ9VwYasSpBl6Uod7TI9mdwLjET4Bsyu2huK8V6h1El1PP?=
 =?us-ascii?Q?mkOurI2e/zvJWYpkqDjtwC/VNFEUI+Nt0G3Fjhkby7uwyaktxgfUWsP3Nn+4?=
 =?us-ascii?Q?sUoOysUvEehFUtSJN/IbwDWWkzAEpVYuRq3DCLBcqK02/pecb6WiFPNphQJ0?=
 =?us-ascii?Q?scY5mCjQUMCSoWYsKDiW+ft+w0JNcXxekkKMzZfRh5bpm8uuOX21Ap/fw7rf?=
 =?us-ascii?Q?bjTMbNvFJBPUGEqWlbf9e0eafRgFvdeJvRwB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AOHZEmbdT958ZIFwAcuLwZD9H0Dn5f+fjNSjskEBtbwJUdITFrA0z5nOLjUl?=
 =?us-ascii?Q?F0+cMSyBkcSb72aPGg/hQIxLo/KJjl4+pX2nyPN7Mj7ft6LPwJ+mj/e3mMek?=
 =?us-ascii?Q?nZ2Hux44CLqBXL3MrHilx3sMiX4OiiBuLHZKhx7586199efaXIX6XXZgL5mB?=
 =?us-ascii?Q?T6A45+iPG0ENKjx8zc6E1Gm0XJWjbKdMlBEP8Z2vmlbu6DwTmKpxskgYKajw?=
 =?us-ascii?Q?ClgCWX2sYH2BPdD3sVmjGmcxzd1LGmzPlWWuCbADpvzbp/xZzXCcC3WlU5XQ?=
 =?us-ascii?Q?MOqVP8NL23YiECNggAbWUzFYdOkuzDWAX9f5ZqoMSconzmlLLXK1gH4dEnkt?=
 =?us-ascii?Q?gM40qx0pJ2gOEEIciJdj3j2QWieOfRzRjTRhcRThw/8SWigpfOHff8F4HJcX?=
 =?us-ascii?Q?y/kvkI8eW9p7713mz3UVcY+/mVCHpA9Bajrg9kWbGfO06IVlFI+SqAFB/CjW?=
 =?us-ascii?Q?pFrQUd5If7qgZqtksGgW+UiOQN81tUZLvxkGCTNllaV9tBYOR37nj/GYcGoE?=
 =?us-ascii?Q?pCzQDWI7Z8vKzi3v+S3lbkeawgcTDt/fvfkU1yHJe5pXwNJu238hvBGfSFGX?=
 =?us-ascii?Q?WC+uzeLxcNbI0rlnob1S6iZWwFZcKZ9OpJZF4eoYfMFqenmualzV+hudURau?=
 =?us-ascii?Q?scjg4fblMdTffql5E7NwgDyuLKDUqwzkoOjoY3g3MHE/UYGwAKXbBQy7DcvG?=
 =?us-ascii?Q?KnhDD2CNmV7czpdTS3uYFMPnIeX1iojLZH1zOnIM+TkY5ytNzmyLFk3msgm3?=
 =?us-ascii?Q?/sF1oTDnJi8WgudusNn3r+qakLpeCTxKtqiZwUnUASk/SBxKmLwIxm4ie/Y6?=
 =?us-ascii?Q?aZMm3fFEBbPefI7RxevnjWThewcP5W+aO/y/2hJ7BbMnU2WN/7swSLwo90id?=
 =?us-ascii?Q?EeKhY2kUcODtYyZiZVAPJSyjBcX2QpgE25DDDBxtYkHShTS7I7j1f8jBpMbf?=
 =?us-ascii?Q?C25IRvItw8ktruzlvyoY/DojATNNZmMHxJcV/5XQc09QzYkumJOFdN5PUDzq?=
 =?us-ascii?Q?19er8FJ7cM10zRLBwhIBsH2lkBi4ZKO578opeXOdye9gf6kBgTzgGk5hRhsz?=
 =?us-ascii?Q?Ybilps/qReInWL72Gy/jYmzx2RHE8bbwSOxd4iS3zgKd2ZzHX3ulp8ipQ6Wz?=
 =?us-ascii?Q?9aKmos2I5ybEXpPh+tCrYxu30FTX/wemP1cdWnQFMzuieUvlTQ7LLdIuYR/j?=
 =?us-ascii?Q?jVgUb8eGPTs5U8XT+uqOPwWsbpH1npU4x0DtUsXiLzL1avOMnLLdJETLu39v?=
 =?us-ascii?Q?OrjEBuxIqQx2xBsPrU4YYMzu9C5OR+G4Bxpn+vlxMpSNLLq1wKPhzahwR9qh?=
 =?us-ascii?Q?5+F5Xruze7DDEQ0ckLrB+VC3LwOit3T0Ox1swFkJgb7+1KiHeZPt7CTPXWlA?=
 =?us-ascii?Q?Pgrs4EjsJ1yhbKmH93iVatpzOfPOKSEOAZBga6d32KA6SoN8dvPCXi25HEu6?=
 =?us-ascii?Q?o2BXYTzgYEhjWxBj8sm3beNZHV5Tb9YxLtwuq0nBXbkx0SbCk5ppo5tJdXjv?=
 =?us-ascii?Q?Bufcb95UqaTl13ZlG88tP4dWS04TyFjBe8nk8gRrHnWBgqn531rLN0xFf0VC?=
 =?us-ascii?Q?bcwvrRHbAbs+7Pgw9wRk/7PuvTtDvmvNTlhEiD2XE7fpJltC22icS0JOHVKn?=
 =?us-ascii?Q?PBWxvHeLfLJnlXglSoepFeU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7472b743-9ef7-41fb-c7e6-08de14ecdb9a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 00:07:46.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8m0z/SQWON6gAe1r4AZUDKPMllYhGNwFiHjn4+AFXFHz1rfX9IKCF72cDfXM8SB/KU47Sx49b/Db6KBOhXoL4srPzcV7zVTQtAZ6nTZz6RmK+xFRnbvygE+G5PPopFUP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16060


Hi

> 'struct fsi_stream_handler' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   51837	  12312	     64	  64213	   fad5	sound/soc/renesas/fsi.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   52125	  12024	     64	  64213	   fad5	sound/soc/renesas/fsi.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto


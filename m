Return-Path: <linux-renesas-soc+bounces-6820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 551CA919B9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 02:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1536D2859CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 00:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A476B23BE;
	Thu, 27 Jun 2024 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZlvmSAyp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2071.outbound.protection.outlook.com [40.107.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863E23A9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 00:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719447058; cv=fail; b=sHMtmQK6yeTXjbxnE5bMbhYSoDAhs4Ytf/MAQKNZznYxT22J0RKBpp4P/+RGCHtyh0U1iu+LYL8TVCna37CnTHL7c6/aipkmCZJn+9a3qui8VD3DzPyjiPXIxCEmHw3JyHj9eexCL3088iQqC4a0ciqyq4TSwSfwfYXl4+ZQ8Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719447058; c=relaxed/simple;
	bh=RGz4SrOiIdZuUhjyIa+wdT/NGVvPiAgHY6WT+jkMtYM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l4//9sVi4h4GiDozSXXYT6JdlYjzB7emzVndSGZwhMdoRs6c+k7HSwRZY/EAWoi43OfNZSuz48p0y5B/9e0S7xn1feIyEEP9l6MxoSccaUmwO3opm5+scul7OxRyU8aDJ7U9T+7FHuXK2xmjOclzJTzZFGKElb0kvStTSbKYjSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZlvmSAyp; arc=fail smtp.client-ip=40.107.114.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr8l6hJwjkxboHbVvwlIc1BvuhDTiHYzCVJ1gCrmPsYxIwBczSSUuNQjToeyd9FU1hw3bQbWfcfNEZM7NAO1z6Ejs2EKDR+5Xf+X2tG1+RdxAZi7z43WYyiGywoFzfheRoHeRbuumwngCO6lHv5aIRopuNwzNatvcX4AYGCzz+N1ypDAUzb94hpfuijD/8sjjnZBa25qmRRkLkp4OoJW+C0jq6y8rd1UFgKp17L2CR69yXU7ZNa7DaTx6SJPDzK7CMcY5m+96mJUPlR7jOJZXu5mmrVusOxAW20ZHDgEYw0XKhtTgNNMt7eVdSY+qlIwUI52yKzMBWPtOxNc0i/kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz7L+6r1SE9lyD+US7EbtTKtbaU7OcY7D4ffZyIA1G4=;
 b=YV73S7n8uKmoSWfdDdKLfhJpUg4XrCZFXsMdx2fQ3xLW2+sL3cjuqxHqTfv8H5Z1qehFTHIevz/FYmG7HeT0pdcB6olyEfzQqBV5RBAO0IL79s3Y/8MDL4Cbo3NRBhyTYbK/D8kW4ChVb9puZ4UVMuMBEUgr//95gHr6+CaGa79BA3ZbbcMfyXvg9Tr6IYxEJ/siti5QBinIgbSvJCFJKmNjWTPqaHcS7Aj6zm0hHdyWjextuCMuyuaZ1he92a4yYSIC9BXhPrPs7TECPOwii/0wZ489OTVPj2ZapvWboQg7ofe8Nm8zLSr7kXDFtNCGm02pcGT7K8fdXpdJ7Pvv0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz7L+6r1SE9lyD+US7EbtTKtbaU7OcY7D4ffZyIA1G4=;
 b=ZlvmSAyp8CEcJWls/l1TAIxgadhdfBmSyC5jTjSlRwGBN8MffHJof14cCuWcciy6B6q0F7Ew+lzE9g25U7xp8cQk89uPZ+vd2AZsNMvG97JKLlSZqvRJS4RI4Kd/1pEUiuuTm9O4oOC56/j+o4avx28DvrE65OA44rJT+uC2Hmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8191.jpnprd01.prod.outlook.com
 (2603:1096:400:104::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 27 Jun
 2024 00:10:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 00:10:49 +0000
Message-ID: <8734ozqm7q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: gray-hawk-single: Add Sound support
In-Reply-To: <CAMuHMdVuXreoDxQHT9Yf88fhrCTnOwRJjWNVRoue=8DsbO0=4A@mail.gmail.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
	<87cyo7kxek.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdVuXreoDxQHT9Yf88fhrCTnOwRJjWNVRoue=8DsbO0=4A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 27 Jun 2024 00:10:49 +0000
X-ClientProxiedBy: TYCP286CA0310.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c004d5-c6a3-458a-13f8-08dc963d998d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UlEOtCsHSM5oupUsQ6tSDoDi51BfXv7XAuPDJh9ESJ7EtRu8f0IcQUacJE0+?=
 =?us-ascii?Q?9umNzb+sA0lPunxi3xKuLmoHmEqNkX1mvgiN6sJ+N7Rd7FP8Je/iHnqHvFbA?=
 =?us-ascii?Q?jCNthIAcWIU/y7exttj7hUjxIH9dzwADIWyI4mBAkz/m83EjjfcTZG3NL2qB?=
 =?us-ascii?Q?LKH0BpoZkwOiNX3rUv5dC45uwbjim78y475JkR4Lq+irFGC807g7LN3qSIz/?=
 =?us-ascii?Q?kosCjpXRZshNL6DT/+7IGk5FFiFURA+oeGVlLHctbqx61KOzU2g1XzAvPupi?=
 =?us-ascii?Q?gWqFanjiv7dwDhe6uaScB8OscNOrH5Q/krKh82F3EoGxDash+z6hyboEFFIM?=
 =?us-ascii?Q?OKrvQQkSyJgcueyVWlSB3eUXIXcdNX1ExwcyYXxrwy5MlNtIv9bUTQSI5USU?=
 =?us-ascii?Q?DWlC7Zs4xUJ0rIOFMF3B6tAxnDLxUFhJSvvLkrVkDvxtuQkYkpR7IuB82FOg?=
 =?us-ascii?Q?OUuMvVhS2CXGxm0vqDpBkKlHKpHW8hLJ7JJInuSWRrehq9tQh1pBV/30VFol?=
 =?us-ascii?Q?e8Kdv4lm4C2pRa9ddCLzIxB/A4vianaDJ73Bw92L2yzlLMtkW9e3Ix3hgG8c?=
 =?us-ascii?Q?ZEAzdvpFtFJd/6Ldi/jVS77tRUVfXscQ3Y2XQtDk0jjQrRaWtqJWpm5lUFFF?=
 =?us-ascii?Q?MYNjzrajv1LEhnzy5QTJufs9e2BcCsf+3mlrz0M/ppl0RYaMj2h5i1fFMhFN?=
 =?us-ascii?Q?ym4puWv7up2sv1fzUFVHmlG+40sKu8DgLrvVT2jDQ33S50OK60Nk4fo7ELj/?=
 =?us-ascii?Q?yTPppUMyP1yJmuHW1k3JCuWMlJTLE1M2HlxPEK1cz56lWuU0xviBdLdMrV7J?=
 =?us-ascii?Q?cS1S4npOoyO5htQCHR5tC5zbltIi93uRm0mhGbW2/qsPe0INfxDRQzWWGUAL?=
 =?us-ascii?Q?XZW2doNymDAbWzttJJUeUO3LOMCktSTpfdU+KwrsusADkdDtbrsFwl7McUmp?=
 =?us-ascii?Q?CGw8+8Rz83oz6JefV5xMbSRyMl6BoCkr1rMYJPbR7Byjrv5tLoeC1Kf6sLCK?=
 =?us-ascii?Q?5eHQparMyfV1QKI9LNJojsaoWfBuqdZsDugbC7ecwMpQ0bCu+/r0PvvIy2s2?=
 =?us-ascii?Q?cnsi43MtBmpP50/GiJDLFxQGqwHnAZFAXupwmLcSJIKzf9LmGCg3Xi5IYUEI?=
 =?us-ascii?Q?cpOYwojkxdrO4ehn/7jdggcsU8EsySHqLEbd6pFi76mBe4vBxoOZtxlWEKxb?=
 =?us-ascii?Q?I6b211p783Ew9sgqnkibSqD5URTt8MZ3mzVSo4Zv1s+aKinEB3wehvAytATD?=
 =?us-ascii?Q?3cplvGtIHVLIJoLoThlQJsBiVhDy+u5gUHO7u7ZV5HY87GTB4IiyQSMXG6hf?=
 =?us-ascii?Q?YOlhZcX6utWBDyYA8paM0mdX6m0xnK3gBNQ2Obhlgre5tBraedO6E0+y+tjV?=
 =?us-ascii?Q?zyoIDuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1mrLQDY4UgpU+j5C67BrTfGnuwOYeiMaTot/TFI1L3u8m+hJAqi+Fat9alGv?=
 =?us-ascii?Q?mqAQd7VeS+hP9laaFGFfxSczZvQoewx0/fuFOUkoZFhyBe+iKr6WUGajEBkI?=
 =?us-ascii?Q?L7G65NzOk+p8tVPp1zyFfmlmWWHAuS/tYKcRUUSWW9JxeuwPV1qzoi+b80/x?=
 =?us-ascii?Q?Dx2tJew6aRpxIEbtj5B4aIVJa9jjg+05E9if1HxU/0bF5iCtQAyO3p6JRbpp?=
 =?us-ascii?Q?eGMyGQ6j0S4BKRhoZCCr+gBWQGNxiiToQYcsRRpfivBDxlH7Ry2hzripbEV0?=
 =?us-ascii?Q?r6cVGT5N6/Z8bErK5pvHFIx9lbngk7DQx3jdd7VNuD69tEhSL7ceo/v9kRhT?=
 =?us-ascii?Q?9GyVQ1QoYBDcSe57mCmYeVxgcZxUuDFNkfTvVGMd2supdT8tuRik+RU0Zv8s?=
 =?us-ascii?Q?IRmKqfUOJruQxsJIU2qS0xVHP7yWdLivXL6hFXzZhja9D4JzOJknXnwKX8uu?=
 =?us-ascii?Q?1wOIh8TAKkBUormw4SFKzMFUkIsBs4NTIcS+OathBvhQFZY+f7IcVU5+H3Ke?=
 =?us-ascii?Q?pMnpRsfYWQvVoY0f+wlp+ClNhkZyip/rMxSmKURt21DA9c9ksCtqGE/guN1S?=
 =?us-ascii?Q?+qD0dH4E2Bds0NiikA/cWMQULkniWLAXaPCJFeIkQNUbv6iX8HMH77ZD8mLf?=
 =?us-ascii?Q?fBbZ1UPfATOJxUetPnAnCEgmBYtDK8nZgIqwWMA3aye83C9wNe0nhIMpkKuz?=
 =?us-ascii?Q?9UMvq4EUUASe1qEXoXQICFKls29Vckdk95RGKW3J4u9EPDVvulZueEHAHcFd?=
 =?us-ascii?Q?IgVRlBq61CWsvYZO+hjB4er7cQ3A25p/NiLFv2FivXqRn3ptQrghhuAQ8F/v?=
 =?us-ascii?Q?y/n5KJQ1eCa5Y27DnRKof0WDflLZsJLMB3sEZHYh3bCaPwnZSgfyZuHaSfv2?=
 =?us-ascii?Q?hyi6f6cG+z48mrFeo9NfXH1pT3gQLd1rVK/08Hc324DMwSv+Z0xZVr84bwsR?=
 =?us-ascii?Q?RQKjLavVpGX0HHuAsclykQLgebhEBnTsg65pltls//4BT2QRj7KCe9XtseWw?=
 =?us-ascii?Q?QXLSPlkwE9Hzk3yM+yjUwFkJ9uBb/a/cQ8y+Che7PUSzi/tVlSLjDgLNx3B7?=
 =?us-ascii?Q?S3xmdkZvO0PjeaaBjuTQMbctNGvTGMa6bxr7vnA9Fr1OLO9M739s6ZMHK5d1?=
 =?us-ascii?Q?pZ6XnRBFH6hqI3YKeAhJgmBV+Nr1A2SGJO7tpf7BuQNsnmabo1ExwGqsZ9cn?=
 =?us-ascii?Q?hTDCc4ooByiM7oZzrh5bNAguB8BxZW4t0/o6XIikoexf6O1JyD2TX7RH+Hh+?=
 =?us-ascii?Q?SrNAxS1tF4gHnxpO0x+masxq6611gUEDnIoMdDhAxQFvu0j5ZrfOMIUNBw9G?=
 =?us-ascii?Q?tGJ9mz5YoRMsHM9yHUqtA3/3naPVA2H/QModN5vRvICOseqM4dwSyjkWFAYv?=
 =?us-ascii?Q?QPWBd+rK5mguyBfHbRtILwORLW51zMkqv6xu9GdDVMkcsyjvdxru1olHRDIE?=
 =?us-ascii?Q?jPow+yvshUyY5WJgqLjg2HaPgHe+hLW1HvCU0Wzxtms9kk1CgG0fPhKMmM1V?=
 =?us-ascii?Q?/RXPJkvl5+16k/I2TsCz4srm7+Ftx64Kg0LJ9xSwWuvRH3Vp4DpObkT5EldV?=
 =?us-ascii?Q?el1MYLhu+n8Mt9chNG/SDh5058dl/iz8vxtP7ra4aeVnEmtMf6XDgJPZUjHm?=
 =?us-ascii?Q?7iXclack0gRWKpvil8QG+Do=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c004d5-c6a3-458a-13f8-08dc963d998d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 00:10:49.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KydmdJErJBowQesUkneSkEDI+mYsLcKWU7m782A65Q39LHQ+ts/7FQqpoMdO7WQCX6iIk8pFpLYqOTtzIiHjIch3JJHEii0lOML9yZK2XcuVHrvYdHqA4JECLIMVu5kv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8191


Hi Geert

Thank you for your review

> The use of "Input 1" and "Input 2" sounds a bit strange to me.
> Looking at sound/soc/codecs/simple-mux.c, these are dictated by the
> MUX driver.
(snip)
> Adding support to simple-audio-mux to override the default "Input 1"
> and "Input 2" names, using e.g.
> 
>     state-names = "Playback", "Record";
> 
> would make this more user-friendly.

I have tried to re-use existing driver without fixes.
but yes, using own naming is better idea.
I will try to update it, and re-post this patch again.

> Still, I wonder if there are any side-effects of (ab)using
> simple-audio-mux for your use case. This MUX driver is really meant
> to pick one of two sources to connect to a single sink, as described
> by the topology in simple_mux_dapm_routes[] in the driver.  Perhaps
> there exists software which interpretes these routes, and offers the
> user a graphical description of the topology, which would be wrong?

If you are talking about detail of direction (IN/OUT vs Playback/Capture),
indeed it might be a little bit mismatch. But, Playback node and Capture
node are not shared in general. R-Car Gen4 Sound concept itself is very
special. So I it not cinderella fit driver but enough driver for this
purpose. I think there is no *bad* side-effects. 

Thank you for your help !!

Best regards
---
Kuninori Morimoto


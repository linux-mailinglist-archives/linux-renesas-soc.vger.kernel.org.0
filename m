Return-Path: <linux-renesas-soc+bounces-10981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9518A9E616A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 00:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46D15283983
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 23:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC5E17E019;
	Thu,  5 Dec 2024 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CAoeR2fh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6C49627
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 23:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733441869; cv=fail; b=pvhkJggc5e3oIFaa4BuMr0ffgERwPCFzCu6NRW8VSXiwkghYiKzlBMYi7gSKs9kJENBNxPIYRw7Eccb/yUkF1vDGVLJMc402YawE6gyQu3CpoMp4dP5HpCgYjEhZ3QOB2jb6pSPwzUEtou26uiwIqyB60WuV+c+rvRGbeP6ULUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733441869; c=relaxed/simple;
	bh=BeQOlMe7R0X1dXIZh2qgugLMUIH36j/mxPUZhCgYbm8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=msfrUjPbKxNEMzwPhPS4+sZwrYrTcFTwHAyU2sWchE9AcNL6n26E0YadIBxMiwXCDS4CVjL723lBYFrNPOlvBM0t92dHNBw8ziAeFBhCvcVZ3MsoKCwhkqTPcpCk8HvKcUaEvBF1i+JLQsPvAmdM1lzvfTbg38cfQGNKUQu6T68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CAoeR2fh; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgMnG1+G0n3l6kEYouI8KJUR334YFRFnV86J92K4InwHu4CjfsNRgLP6XSRFcaOOl/z9TGLzzJo7pyKFgv6iwAeRtH5fc9sHl3utD6LixMtl2Es5nD9VixsS2eY+Cb92gQ8mzySsvBKAnq7LgIQP+bNbbC8dMgXWUQjhiGYydgf/8GlyqQWSOJt0fvUvQfVqhIBPkeWKYjrkm6hbwDnnfxSN4vvHZc+jxPrkibYHBX/MbnYTW8Pv2Ax5PtoqZnys6u+s3f6amifQwkG1JWYjJRCbV1JgsUX95gJ96lfclm/YENHjpvPiUlTPHGsy0zfSyEee2u98xm6ULZafXSALnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13xdIa79jMHce12fWe45uLsOwWKWk7fLKu3uIFXypbw=;
 b=xEEL52tkFlpY3esuwfXE1TY4oh6jnm0Ubc0/Cl+IlsrOIe4If/Ncm8hf29dQ4YEgFaFaSmqwwqnEIE4WwYoDS+8TTpLyvq7CyS1s+VrSUlwOJJ1lkJbZPuf1ll5csbpHngT+n5mFm/8zLie19Ra0pZRewQfc99Unvd1cXv6lKFd8VmF64u0FeqiOg7uV3YpyZez32PfHFGij3ZXZQZ8dvPmjlO1HcWftYmU1LmcX+dGscXZpdSKOvlrBtypdBNYI7wxNC93lQZCAikY07JWTHMyVE0+9U3ysQF+AA8io8IbOfo92mzmMO3ld4k4X8YKpj5Qi5TdXblJFIhZe1HV5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13xdIa79jMHce12fWe45uLsOwWKWk7fLKu3uIFXypbw=;
 b=CAoeR2fhEnNXE/pwKGe69Z3CW1jLBJml7LF5RZYCwKqTIz9LAy1yNN2OizNBIZJgz6GFQi3k+vB1jyXKyn3R0fkBNfGwou99vluCuxkmpbt9n7VA+4ODsjFKyG8zjH9SAkB7L6me1wXGw6z548HdSW7nUtI92tiZewIHUqZo4QU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7457.jpnprd01.prod.outlook.com
 (2603:1096:400:f4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 23:37:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 23:37:44 +0000
Message-ID: <87v7vxvgzc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
In-Reply-To: <cover.1733402907.git.geert+renesas@glider.be>
References: <cover.1733402907.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Dec 2024 23:37:43 +0000
X-ClientProxiedBy: TYAPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 308ff71c-9855-48f2-a6d7-08dd1585d10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iFoMLqRv6vdsBypVFDNh/wmm8wUOVwUPRD4/XvpwwaKXmCy6OqujW07hbjfn?=
 =?us-ascii?Q?Xb26qDeZLepRFdLlhu0bddxrCh6KTvPLrU6qmFo/AtpOLVdp4pDawlaGQs9f?=
 =?us-ascii?Q?vKYZZIITzMkNkZN6pmSPY+M4SQoPZdW46ImwhyNKRk+ZxJQ3aigyRoZRCEJE?=
 =?us-ascii?Q?ZWWhKGadR476ZUo4KelrII/pZa3V9uDP72Scot1MUSA0qW8W3e+/k5RE3ZIN?=
 =?us-ascii?Q?+e8hhGreUxS6sDS63xESgoerwJeK9xr1shtwrahxl1EQc0IZ/T6m8VHLxUGv?=
 =?us-ascii?Q?kOo7Dl8u4eChZbEht7L12EiaBw1YAzPYTddMcIUIBNN0qLwhA547tqlJRSiR?=
 =?us-ascii?Q?EQ0JxcteAmwuFy4kqiXYCFvfRHrfmIofF3aowjLvHD2FrVD1tP68az4KGAha?=
 =?us-ascii?Q?wEFJM3ACB3DZy0TYMvyY1Y/tha9T5ACJbs4+rabhwPqRwNbDNKwRpR8BZQu5?=
 =?us-ascii?Q?N1Mp7qXK2YHe1sejCUw7AB/Mli5Bo6fDVRAVOtwlfuX1z69jpQgzm2o3VMG0?=
 =?us-ascii?Q?0UlYrPOEkxUjI5pTLU9foohNS/vec/wtnKI09Q772vT0/qsHp23+j0vqj3Hs?=
 =?us-ascii?Q?ef6yp+nroZFBQjPG84bhs5GeyOu1r+f8RG+7Ew2ttQksWqILypy8G+G/B7TP?=
 =?us-ascii?Q?ElwlnoWu8h0byj06d8jVlZ2OSlo355/4jvCMPGAxfcua89B7wZ7nyWnRDSM4?=
 =?us-ascii?Q?RHNIJE36gGGI+uGBikBXrnIHJOM08UAtMuqIbqjGqpGEVX2b/GcELGmWlZtq?=
 =?us-ascii?Q?a9FAUuJUass4gz2D/IN4+7jtNEHBlp+KTqKn6LIeJcdRHm205//gJjbfkNCC?=
 =?us-ascii?Q?5zwwUi5PkZxGd1RpzjZU3L+BhrRM2Z2fwyGYxBDh5ZDnP3hPBdkyxyqfNZcJ?=
 =?us-ascii?Q?7Zou+wIFoCZr6QnQUJz2Ci64vL0TNui/dbYFJxSSdezGe0VroY2zeNG7jSPI?=
 =?us-ascii?Q?r4pjbHNq1JIta+3yJoZ0Qhw6NUMf13N3xdWAg8HzRmsxdouPqIgSI497E60p?=
 =?us-ascii?Q?xZLqta89Ku4SoUmpoQBaHVpCau//59dgM34PTAFiv1bfeHo3t782HbZMGWu8?=
 =?us-ascii?Q?ZI16ZF8aoxUJrfhf5tHfEOMGoK9PLsE9W75Ngtb60yHn/k6cpYgX1OX1XsBe?=
 =?us-ascii?Q?V+10mWnCCNRLEdrDhIoCqoLNYnj28h6g1V5qR/DTKIIHCXErrxU8CEQV+Qq1?=
 =?us-ascii?Q?hRt5gl0RlVw/1JKh+Fr3qd6PFTfyhKYq19l77MxKEeh+jbASrv60ibIyvybS?=
 =?us-ascii?Q?o9A03x0XUZHH4lEC0GykH3Y2Wriu0KROFtDC2qVzRaYxz/MrOUagqL8gnW2r?=
 =?us-ascii?Q?oHZz/VJr+1pN6pJ425vmBZIBM6Wg6cMITRhoCiT/IammIbUfeheBDu/Bj1Z9?=
 =?us-ascii?Q?l+3Y7AIFG9QpuQvfRhyLUnLVldI/cMFFyGdF3FwLDZXWNMoodA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gjmLJKkgWHSxg/8BagapXUZHYzUp0tllowDZYfeFxvf7LZgBC0Ow3ojb2Cjn?=
 =?us-ascii?Q?u5N5KHQpQBILFCUbE/DHFuXwCU54JceX0fL6TC2nvgsVUN9G9rGZ4vRrPDMU?=
 =?us-ascii?Q?vtyzjEu0ggDQgmNU8HsPkXSY8Ywm5frKZArpvMyUtuvgMO4EVUa6UB8z7wug?=
 =?us-ascii?Q?TFjXLKczZ2m49wOxraGH0OahcEgQNysMbiHpLstrjyH7Y3iHFZFyLc8rZbzq?=
 =?us-ascii?Q?p1GKoWBHAebNgUdEQ21GWRme7AF2IgHbns6FUEic+juuNB1qiQodmYko1kMa?=
 =?us-ascii?Q?MDgzzogRrYzUdAIJhdjJgsTpyQ5TVRMFedbJLhjY630c6HxaeQwUGMx/S4Ej?=
 =?us-ascii?Q?TCXGGxTqCwClgZp0ZNyNR1Hs7aHl1CaFaY+ue7hZRM3azTqgmlyvkS0sIHM2?=
 =?us-ascii?Q?DsAfmUhC1M/SgeGqeg6D+/nNT5bqPbfvFdMcd2WENUGuZ4TtbVKrN4LeU1EA?=
 =?us-ascii?Q?U1FnAoce5LyTTpxaajep10biCPt/MDw6pKoApdXBINnfAf5nj5dgz1PbAZBk?=
 =?us-ascii?Q?Nr977z7smUueK5RdqCdpqgYKeM81KIoacJmEN8QuZPPd02er5JAJuagGjGB3?=
 =?us-ascii?Q?QF28bf/wegeMn+qZkfGJwxvCWxQVjmzT89omRVJcp5y+9E17PQn7WFJVgUsB?=
 =?us-ascii?Q?uRBmTjBYZE5kUEms1T9KjXL7ybUidGGwfF9S35ZKeNIrYnTP5ntNvEtvVJ+z?=
 =?us-ascii?Q?tuTDa/u8d2D6O0PuMETPCi1Rf5QOYjjqOwQkOJxBj9KnzvucYOM8w0E3xir6?=
 =?us-ascii?Q?G1++EHg3w80NQYUgSbAb6+m44oqI4Xja77/VZNTNLwCRgf7ahQ2wGNkamAbZ?=
 =?us-ascii?Q?Zi6XaAPyx6RJU3c9j/oq7ePGNWtpzGDHvEOsdHSrENcTJZpb6yAs3+xKXufi?=
 =?us-ascii?Q?9ue5CzxT7xpdbph6GBXygJQN4h7urM0fgeYRQEoOSmVAuLJHhu5Lo2XI19T+?=
 =?us-ascii?Q?0YCYdCX0GXgqCekg4DYDj7G1Wr3LhCxSPobB2vrEYV9mFBz6wFCBGu5q6T+i?=
 =?us-ascii?Q?sSxXN8Wjs8Zxfvs08gFzH+nDOOwHtJVgYZc5vz3D6DUDHSc9U37EUxAnkEiV?=
 =?us-ascii?Q?CyMN8C2YAzddU9SydsWdcZeb0wnQPcJBwn3sml068wK9w60qtR93wk2bWREF?=
 =?us-ascii?Q?WcNxfG917bNFQjc1hCyxnWhbakKbI8Zv1Rul7aO+xsSkRzuHgHIFG+nshZpL?=
 =?us-ascii?Q?BfMcXDvoZg1SwniHMy37OuxC8pLq1wDX4BIWLC1dzDP9IqnsPJ4tUXhE24Pj?=
 =?us-ascii?Q?N33MQaZq8PDgCzXEtAg1qZ1X18GioeydoG16qHgtKF/5kci63Z4zfGoD++jV?=
 =?us-ascii?Q?lCl3GHfQ9iV3ReNwns3sRPqi61OAJfGudvsrCEtIC07VgRLajmeEV9qzq8mO?=
 =?us-ascii?Q?cnSsjNCyaGJ2ar9UM2Mznip+OQnjPoP3H1n6pjMfUqiGmJcVHpuW7V0Qfb6t?=
 =?us-ascii?Q?hbvai+t22orir9bSrZ63U1V37SH+oelP0yKUPgtW8HVzrrnXEwPo3S2AYm+x?=
 =?us-ascii?Q?l8b94kOJ2fKdKeIs6UXH39jX5iEbzYxfC1xtf26JedkuzJAE9tYxMGYZ/lqe?=
 =?us-ascii?Q?IDc3tlTm99rfsSfnRkGp6EWi8Z12fk+RIU+P7Tlj4WCH/2ePQWJcjbPL8zOV?=
 =?us-ascii?Q?1fLb8agjuKQ6kHK4O3sULIU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308ff71c-9855-48f2-a6d7-08dd1585d10b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 23:37:43.9743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBJ5hnTfNZtYI5oRB+r0Z9yB3ABuy0weBHTW0hpYpRQ470CfbDS2xCXdzCYEbT4ErpjksLX7MXFJlONuvj4rfoK2S40V1q/bBFPJzpcUzGf/4TYPBZRg7FzcV56dPhLo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7457


Hi Geert

> This patch series add R-Car Sound support for the various variants of
> the White Hawk Single development board, using the ARD-AUDIO-DA7212
> external audio board.
> 
> The second hunk in the second patch depends on "[PATCH 0/5] arm64:
> renesas: Add R8A779G3 White Hawk Single support"[1]..
> This was compile-tested only, due to lack of hardware.

For all patches

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto


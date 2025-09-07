Return-Path: <linux-renesas-soc+bounces-21543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA3FB48162
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 01:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2DD317AC98
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 23:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770012253E4;
	Sun,  7 Sep 2025 23:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hj3T3GVr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D84A06;
	Sun,  7 Sep 2025 23:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757289047; cv=fail; b=D81yNblL/dfP9Pvim1iFczjL9MpAPa4ntNJ3iSBSQn6xTex7dao8cvFKKR1LIvAp33Rt59v0gARcvJC1et4s5OKbiTQ/BK1iKsKccpqvjwCVmdnYYxfWL/iGCVx5GqHRzpayHlmmV88HzRadjsnJ9qAgJcW0UV6zPFUozMNz9Jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757289047; c=relaxed/simple;
	bh=+KLhhdoVG9cbM3HpW3j7X6gcX/BlJz7ERrNMgYGzHkQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=egQdm/sx/qNHsxz34A45IzCXmRPnCywjCYFwhfAPmwMHnn1DQHxHwlvCd1Ks+/Cq8bPK6BnQZ9jjnin0VkHQKBgHjPssMS/WNAZ1PcM0pe3i1jxtT+HNcot4rmosVoQPfvSt3H8R9+2pwEM7DKcSFofFLIjZHcE7Ry9WK4Mzw48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hj3T3GVr; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeHZtG8v+/KgnN/+oH6vQdjY6f/WQpRoqzjiz2WycrvBTuuDowB950Z8o27eekmFN5T6pAQu1lk65Z4eukjKpa62MT7XVtMsD+9B8u9pGWbsHKHyMR2akRobwG4p9czT7pA0VceudYYCsqhz6+j4dK3O9SoUtoRqzy+Bk2jM00uPR5luZOpus9pbIVNPsM3vS3fQNQDfudS3guUFTlSSbbkEVO/RstfITBmKQG49R08lTz6FuRghnQHKK/ZeviejSnJeQXhMq6bz/9nvXWvRGxitiFUbtZ8/bRF+ZUD/3Sg//mAx2oYiGBHy0PK1SBgcFShjVzFxt1t6PNSKTB2ugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRtBcc1lhc2wV6t7yOPwUdpDH4nlRIsMdiDqZ7RjJww=;
 b=hfNJtm1QT0I/Lv1ZleSYPhsNecctcSycr4OXf5s3UTDNkuonJoQEnzfE1EpqdDIzg+ubihpODVQkzRiu6D86c/LX9vtemaRDybH7kI1M6NKrpynzv+yu5OPcNMRGeAail8+cL7tenV4iXExfih5+nUhQeeSZrJXdZdWlPO1dTiNjyLyoQn7F1zOaaWX+ijLdHxIxHexvotTlF5DgzTIDV5TR6r7XhOEXxWZ8NBFyPsTMvTcCdQxgVrRYtcrg5QYvVjt1mxs8HptG3a7N+6g1SzahxU1oe6VtdaQpZVRfbr9rtVI93rAnbdFY9L5wKIvLCuRiaXsH+lllI9Uv09ip1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRtBcc1lhc2wV6t7yOPwUdpDH4nlRIsMdiDqZ7RjJww=;
 b=hj3T3GVrvdDbc1e0CK1luXBGBlZDZrtRIlzJT+cx1P3b/FD7rKBoRun5NLmrubk6yBT6yjK5aw3feorDruti3j09KBtVnuAp86eqn4ctSNzySyjIwGY0tnlrWK+h6Mbcj3V1nxiiwV3coTco46AnZiq0/T9RG8yHXgkM3caQaTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11324.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Sun, 7 Sep
 2025 23:50:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.018; Sun, 7 Sep 2025
 23:50:40 +0000
Message-ID: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: chenyuan_fl@163.com
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan CHen <chenyuan@kylinos.cn>
Subject: Re: [PATCH] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
In-Reply-To: <20250905015735.10347-1-chenyuan_fl@163.com>
References: <20250905015735.10347-1-chenyuan_fl@163.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 7 Sep 2025 23:50:40 +0000
X-ClientProxiedBy: TYCP301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11324:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e6d025-be96-43f2-d4df-08ddee6959d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a3N3euEBcG7ZWR39asQrRxc+vOIRRpXW6rHpnbZZw7/Az9FBhEZhE+VkraJB?=
 =?us-ascii?Q?B0kyRNq4g6LcSlQBJJNTcx6KOUFcSm0WcMP7VATKiTwZDVuEJ619xGrokrhQ?=
 =?us-ascii?Q?ArWBoxjWPqlks183Qm+NGuIroffh8LJKxa+VBCXDRnd//KPsoPhl+5ULKFaO?=
 =?us-ascii?Q?CwrPudJmEUJc2l8WadBvkMgQJdaFXidnTO6sKdNBxMf4IWkPydNRj3fKtBrL?=
 =?us-ascii?Q?+mYO6N3Hr6NWWwygz8v5gT16zebc+Bd7PmvMDIXiGYRvK/vQcDy5Q/ySSBjS?=
 =?us-ascii?Q?/mCJLfU+p3XU9yfOLAQQrPxRnxaFXlgOmukfkpx6ErXeY4GBJX2rgy0S8iog?=
 =?us-ascii?Q?Zv5HHajT8NLDgV2w5fldOh9U0DojYu3TosgxaFm6hQP1BIBsxfXGiijijvmu?=
 =?us-ascii?Q?/JZTAiTYTzPT1T2PD/4Lo2ndPOZml7enbB8QmhManaQKXgjHXQMtjmnBkUQy?=
 =?us-ascii?Q?aGfB0EeMvmiL4a+3LUzcyen92YuZQraWH1M9fbsQhvSNGHNZ+rZ1Tk4Qz328?=
 =?us-ascii?Q?JsWU30DHhYtd/xhtv1BPbrAf2JZU+c5Wp+zQDLWKEIL5Fhl1Id99yjGFqg+9?=
 =?us-ascii?Q?HS1SAdRY3bV0dvLjfua+AaffY3HgkNOJ/MSptNllbKOS8s0h+nM3lAWGNW5o?=
 =?us-ascii?Q?ZkC+kB7GzW4wvxlw604cIb3xW/SceSx+5wqMkJex1PiYD+a0qCiFwHSIMou4?=
 =?us-ascii?Q?DSBkK9I8GZV6RgZMWmDRFOCtyK6sorPmwbviZNNxe6yBjp05aVJvudtiuYto?=
 =?us-ascii?Q?IN9iCO9h5VsAUslPeekwKS3vdZrjsWoAYP8+Sy5Ju9BD+/DeWH8XScgKC+cU?=
 =?us-ascii?Q?FPh8uRMZUn+g66VCVXjfeuMr0RCBvGDLA0CZGGJjGlqdd0ogqYUZgkERPeUH?=
 =?us-ascii?Q?h1pTSOJh8YJS4pzo3bafeq8pjjcM+uX3xjxMI4WHypkV/kPdNBa5HxYiPCiO?=
 =?us-ascii?Q?ute3ZllS5fTe10G49FFX63aXD6wP11n5mLcE1z5im5TVtR/Zrjfp7nmyIpjE?=
 =?us-ascii?Q?a3cKhji3JPzJRbx9l4OhbdIBem963FkZ4xeJ/LE1kfxdSGq2WTl5xMzg8ews?=
 =?us-ascii?Q?9WVaSXI2oN+N8VpCCMlv0LfRHZuaXK2BPUWoZmZpSO+Y0pTb2UxpcmQgtGee?=
 =?us-ascii?Q?ynO5RYFkDn99XLBrXPDK//VHQzweMz7WG6EHBQbVZ7yZQpzohvrcqXoUyn1l?=
 =?us-ascii?Q?VYSOXgtrdKk5vtleTDkk4ac9BVWPZkb2+kvSiZSrO4hbN4RFGTsql/OKmj8i?=
 =?us-ascii?Q?KHljmD6Cm4cbvjjM3cdW7GrIBLGzpvAC8E9ULa1iAVsMtx44bXjwS1a86Sfo?=
 =?us-ascii?Q?kQx3PyQGCm8JVdhaFQWJ4gD5YBmmsJmJsVaHKKG0REtgv0mYbRP/rcdd3rAA?=
 =?us-ascii?Q?xa0aCTiJCvQLQU+h2uoomDJmYj1JYNEaEZHctrLBL5ihsh2LEuMGkP0dfj1w?=
 =?us-ascii?Q?KPojGD1/epJiNKfWJdcSDJc9T4SFmMDyxB2FPdPl54tvZhft2/4Xew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6zmBlpHaBh8r5C7RrJKh4fJXgLaFVKnjjznyUhmplYv2KDRaXN/fW8tDRqaw?=
 =?us-ascii?Q?5rv1Sq5K21VDeKoS09pE+twhFfjS5KGFzSJ/QedUI6JyDIPjbl6/XZ+dlztz?=
 =?us-ascii?Q?/AW90EF8jtvSEnfyasXiYwzqGpbkesrXlCTaWd53HH6gA5iEgxcckNmKcDqH?=
 =?us-ascii?Q?V3FAZTopD18WPEz4/WKx5H1VthzoNjCvhuCeh8S8VchI7kpI/LSsFw2Owrr3?=
 =?us-ascii?Q?sDVwHC53c33n0AFzbSrkZ8DdSuYt3YDxOqvXp72O3jlsRnRAN/LkKfrqRZ4e?=
 =?us-ascii?Q?lrNJmaMeUTXibVJK1mXMcU0B//aS5twnt26Y/MPO+9W2lvHuwUX8QnG/Hn/4?=
 =?us-ascii?Q?chvVCC1viElcZG2HTCwC3FefmYvTBoyO3ABt41LIVbgJ0zPMtsxpwU9Mnttv?=
 =?us-ascii?Q?gSMnBxM3iEtrgOdU197hnK+8VBVBTFuWGhJs3B130QPpWsAXuCmSsgFFd/lG?=
 =?us-ascii?Q?uKhbus/pVgSbxotFmLgPuFcM7/ApkgSXhLfTyvnkAyh9em995XzDei5T/YSw?=
 =?us-ascii?Q?H2F8MYE/xd4MHNqcyeok1UZS630FDu5hHcx0WGxchHMRZt9bKLqt+2YgTBfj?=
 =?us-ascii?Q?NOKum8Olo7VDynWh5Ygz+EgnUhUGW2AmZh+TcEinOlRy87m8tqN9Puz3/o6h?=
 =?us-ascii?Q?4epp7/MEZBbWWtCeRI5sVqzRjJpFQCHdMrKwgR7fyt6jSCo53woOWNyGMG5A?=
 =?us-ascii?Q?VX1vzb8A4xcRHsJw147NbQzJW4j3pbeh45Y96n7FRBNk29GnL6z9qfjXjJk1?=
 =?us-ascii?Q?s0gwmQiSi9ad+aaHwG510+yee15QmWeHmINibi4lQ2ViiRy4sf3izcE7Ugi2?=
 =?us-ascii?Q?bFnvAmCA6tp2uFVO0UzXdHwIHIP/OmviRsD/FTrPABXW86poXpHIZ9Wkz/ox?=
 =?us-ascii?Q?C4JahRTC5b7EMP6hekXgP5/MsR7tnPL8FwU3uDSv38B/0WrkpTShlxirTPzs?=
 =?us-ascii?Q?YEgh7zekNLPudmvNuz6/1S0EnZGldJ+s0Ai5D2kC5G7FeisjqyYLkFZ6elsW?=
 =?us-ascii?Q?ZvgDObp1EakD6ofntLLkFkeDA7KBPg2EJ7SP2u/xTRQRIqWEUnaz7QMivTju?=
 =?us-ascii?Q?4nMQfDRXv0urkBQWuebWr29Hx20SO2moS52PrLBZDuq+/jszDwv1BFu0Pl17?=
 =?us-ascii?Q?2NCSGOkFgiWW+zE+pgxhdKQBkQ67wmvlrdAOPDLY2F8xhSnWMxvRlb79nXKL?=
 =?us-ascii?Q?xwN+Fv4QF/o2vT0ZwY4JgoSp2WNMChNuJVC+etUHX7d6DiUJEMM9f5XPs24p?=
 =?us-ascii?Q?MAjfFz4b6dIU3tBria+H8WH/jj9Xe4z6dOq2WNwJ3NaV95vIu/3SainJckYr?=
 =?us-ascii?Q?B3AVIiJfcI5XcXthvLGf6NIv/Wow5ZsulUmC4JlrzrIu1+Anp5va45Y92SJU?=
 =?us-ascii?Q?ntLIOJNneMw1R/9hUR+MBC4dC0qPQNaifcnvDVTNw8aQGTdnxTPThq7TWsvL?=
 =?us-ascii?Q?PUKH3u4zyy6msVWf/Z57qrCiOeVQD0kQWDyNf+7xehjL3HzkRGfEhnbgQeQM?=
 =?us-ascii?Q?zsUcFRYyzi+gAfeB7LP24h3VOeGrSPcA/Y8CFKUW4TUBBEhdTNdYHHfB+D5V?=
 =?us-ascii?Q?RqFUrMpX2j3uy01MzlTmxQ0C0Fp9EnZtwZnv7+H7hxVFE7pgNEeqbQXQqfMS?=
 =?us-ascii?Q?V5ZFdftgCj649lJJVLKB5Bs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e6d025-be96-43f2-d4df-08ddee6959d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2025 23:50:40.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LULq3Ut+ZmbMBGF6OcbbJbjMC1Z3H6pWTXRSvkIidVLrRQomqnOZ3kr8ZoWPDc7CxLZcgxjieWkLLSQFo7aq4oofcwIImAHJtNBWSTEJao1kjErwEjyMug/t10LuJr6i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11324


Hi chenyuan

Thank you for your patch

> In the current implementation, when krealloc_array() fails, the original memory
> pointer is incorrectly set to NULL after kfree(), resulting in a memory leak
> during reallocation failure.
> 
> Fixes: 6aa17547649 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
> Signed-off-by: Yuan CHen <chenyuan@kylinos.cn>

Basically, I can agree that current code has memory leak issue.

But what does "the original memory pointer is incorrectly set to NULL after
kfree()," mean ? I guess git-log needs update ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto


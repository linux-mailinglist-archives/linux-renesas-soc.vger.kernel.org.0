Return-Path: <linux-renesas-soc+bounces-6670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650B913F82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0263B20C3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773FD621;
	Mon, 24 Jun 2024 00:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K5A3f29V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2078.outbound.protection.outlook.com [40.107.113.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172C7FD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188209; cv=fail; b=m3u25lp/99Bl8yoVQJSNnkWqaB0EJxMB+yUs+0LaXdWXLfzk2SUiEnAYKmdObwhV8A9FBmNLYfC87XzI9Egk3YVlasePQPL/0QfMjSaOkCgjK9bW09Wz0NtoEPB9VJ90As8rFunfoKyQj+WFKT8XVetLHHXYwbhMG0GGMHTG/y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188209; c=relaxed/simple;
	bh=Zltk+mW8An0cclQG14G1UfvhJogCA5zu1juBSqFMVfA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jTvcRSYBoMXbnquqvZmvpZ18nnW37UZyECn2DsZeN/PirdLgiBoi801pcmjkiQzsldlZN9qfGEhJ4p0PGtOGvkFmCxLXlpNdsjHCeGXvWlFGIl4P4VOCWhDJ+pEwgZxfmOMz3iNLfLhq/DOg7womDE1Uslx3iBY4V+pApwgvBYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K5A3f29V; arc=fail smtp.client-ip=40.107.113.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0yZmhCYV01sxHEW1J70FGgDoPZDjWdTR0vYIo5BG79lJYocWruviaJG86ls6yr7xElXR+lJl9m5iTArtbf+56BAoyT/pExMSxN0EAFYcFsaM62A0KgNS8wOrfJheifl2wDCvWQzoz77gbV7Miql9qdf6c7/Uyv7r4eyDrZ3BTTRw1WoMMgSXQodC9T28TBxljO2KhDsRQvv1cLGpkMEVo6+uOcqNL1F81QUwvLZ+/w0I7KaMVZ29NFEOfUDAeD16jc4hSNyYT3AkqXgtOdoUey8WDkb6Z904QBme3K8ijTTt1NavXTwIJ9p0iKN4CMTkDGW+nyrq6tA0zQmZRiH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4q2AKl8dwRXFeKEkvA8mMzhOXGYEOBKURUeDtDcIafQ=;
 b=lhFe+i2o4YO7iNIb6e3eowcUNyaD3jjZqK3P5ZPeDzUgNNOFUHq0hubdiskFnzuDsPYAfW1pmMplc3KBjLTr5W5haZZ/1anGwkFb4ZSybmmH3PVAKZ61mifl8zx8X8GJ0f+DpUR1IXUB6m0NKg9hUQsEFBDDaGyT1uHQldhWdxV2bRrE5OmwzNhCAs4tZi8+1MiiM6+hfkynwblUO+jTApOWuw59kX0jr9k+nl5pJNyWXEcd5qgsq/i0xfY37FE4/lceBfKqK+cnrsUN57ukSgSD1Db1Zg1LmXg2Kv6rtLT//LZ3GgnVfqRTBOXGUhUi42vp0UWVJXhGggJ+vAkchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4q2AKl8dwRXFeKEkvA8mMzhOXGYEOBKURUeDtDcIafQ=;
 b=K5A3f29Vv1TJuadiOWvLjZn3D6imT0G4+WY+KcXRb80kBIJVBAbjY0vRr8k6pjH2KKG5skgapOeLhBxgGBmPsZOeEYHhghy7Y1+YA7m0vzM0MzCCTv/9yJFTm95TtKyZPwmKr70+UGhM2zz5plO4Qu8cOYDjJBV3wcLkcu+4o4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6250.jpnprd01.prod.outlook.com
 (2603:1096:402:3c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:16:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:16:45 +0000
Message-ID: <87a5jbkxeb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] arm64: renesas: defconfig: Enable AK4619/Simple_MUX
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:16:44 +0000
X-ClientProxiedBy: TYXPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:403:a::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: d32c46ec-08a5-483a-a5b8-08dc93e2ee41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?abSLFMafgjThI3atJDWo0NyVnbLTaXeGCfCKlpESXUWd7XikNvfwHIkIXKFT?=
 =?us-ascii?Q?aCo0VASRhb/ud0Jegl2TFDs4ZEvj5b6hZPG+6vbCqcWYgoGe+TRJzvJBYlPW?=
 =?us-ascii?Q?g3w/XqCPTl5165yW8SAtquZNCC0bm7GgBBVHFD+LxfF3EDJ35L9zmOhN/Fr1?=
 =?us-ascii?Q?XEEFOaksVeLPyMF2VPCarAm1NWpBB6JYrgaRk1WHwR80A44PzrbrD7flemtN?=
 =?us-ascii?Q?T4Jca1VJ+QV4BP6wUVQWx8m0MkOvcXWy61haij5W66T137hNv4UUlhT8lyI3?=
 =?us-ascii?Q?BqZ1P5GM5taGzpXLnTgEXm0Epjlt8RylP/TXKBPtCUa74H9HAbB8o160DVoZ?=
 =?us-ascii?Q?/WUqIfGu3osl65xnwFOiQP2KqrNO8JP8rwpM/E/iPAc+yt4uYit+JBIFYcwQ?=
 =?us-ascii?Q?0yA8cQWuDRecRDogFlqlJkZAfKQammwJdccSANSNJo6AGAXKLrMZmX0sJFNg?=
 =?us-ascii?Q?HMzswkYFU7TP6CI8nDRuq+g/FzxKuPirIcMkeUV5rzK9uiom8GLXDFp0s4mn?=
 =?us-ascii?Q?kjwePbZ879rK7z/PgbFCBs/Yu9ToVxA8yrXKhAkjmjIeEqrXwb09vE//yGOG?=
 =?us-ascii?Q?O+ZOKx8hl5V0EETlldtdSWiMcjbnzoMxeFawO8l4W7CRfpL8zXzpLnurKhoL?=
 =?us-ascii?Q?uABMxO5NhDfDyxVCUPcOJZ8joZexAumNmMHssnD7n0Qvw3f5q+OxMXoYdCWM?=
 =?us-ascii?Q?EOfF1Flyf+tDeBfwLpa40ca10KlaWqPSF5SyWm9d3xm3gwDtfC7fei6f0z9q?=
 =?us-ascii?Q?1bulrwzBAberX40RERDbl7XwVoYC+RPIO7crYSsAlYlY604TsY7rz7J6Gs8A?=
 =?us-ascii?Q?enNEuCsTrKNEEpykcypbaBNsfweGYMxoNtT8UwZjeGHa4gYkev4zuJIpY8ve?=
 =?us-ascii?Q?YXjo/ibhGYrZdjc0eU2bnzDRbQ8AmyY86eFUcw16/YOoVTf5N/ab+0CSqiKn?=
 =?us-ascii?Q?GLDDZT/zlHj7E4Ce8bgcc4E/QUr2ijyzIti1jHpjfB+iNbVHgj5CuMnSg9F6?=
 =?us-ascii?Q?NV3REYwsaH/1YwHD04MkCqZbdtAfiJpT3eOKekmknSJalI4MwD35K8XgSak3?=
 =?us-ascii?Q?tCQ5kM/2GvaGGYZrHAtETmhTYWGXOG6sSxfLAlWygExsTNUSl5mXIH3b7eYQ?=
 =?us-ascii?Q?KiHWDmd+6YhlAAwqVK2qDxMZSoZ1ElbU3281ef2jRZehLfhfvTScG0C5HTLk?=
 =?us-ascii?Q?WZLkzvZm+CglQJLn7Ie/uboLGLsYoRF4kd9hfQT4EdAka+PYNP7Go2Ph8biL?=
 =?us-ascii?Q?fcAH1y+dGY0FLlliIrT+xFAu9r5tqsaNEB7c3meDcKZ4Guzol/Mu4Ktu6hbl?=
 =?us-ascii?Q?ueN+awD7NE3nTvX9jqL+VQ0cPuB8TGZFkjXFstTshnVgMRjmem6hewuPprTH?=
 =?us-ascii?Q?DQkzwk0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5XXBaNabEZiX5ifv32PsY2ZgxJ252552T0/12OATJOjl6U5EvEmCq7f12kBL?=
 =?us-ascii?Q?G6qB3XpTyPYsP1+A1zqNb+TFG1TTT2+FWn82PU9Xp1EPWFjAJ9zlTgqiglmi?=
 =?us-ascii?Q?ndI0s4dVHT2lkpsGZfArW0w1rYPtILC1zEOce3MUmjDGhoQljLKPVRXMTJRq?=
 =?us-ascii?Q?wUOQDT8a1NCED65sdEWkjxeqTI1sSyxk3ETImtj+1k2pJV0uH+L4O1BNWZ1Y?=
 =?us-ascii?Q?oTxGVPuF3OLdDttCQNKRv0Vw/8LYYcVNZ9Tf/xUBY+/yKxBLFBcgGJmTtFTn?=
 =?us-ascii?Q?Se4bMpMLYOPQ/o0lOp1DTPeqRz0PgxBZoGEpDWUGzGturH96fFxJAWOS3vMq?=
 =?us-ascii?Q?2iK3y1oP42GI6HwNTe9KN+NoBOWKeIYdD5Yi2JwMde7hLear3fwZtdjFVnQZ?=
 =?us-ascii?Q?m5LKHR4XzucsKA736Mnp1lNroMmPHQ8qONp6vk4Gxhto17kLlkDhXaGjU0WX?=
 =?us-ascii?Q?bzaCFKSkWH5/tW6tY/18UGYPG62F2JaXLHJ/bPCY80eSAWbDwH+q6ua+gA0i?=
 =?us-ascii?Q?pZSNGqjZmxvZtx84nQhj/pOH8h0MvRO4sMSwrWSuihr32l/yPFsPjLT4PC87?=
 =?us-ascii?Q?QS/eOyj29zbCG2EvxMqi8Ey0O16It6iKnYo5ZlTEE5oMnHsiqS3wVC3dd1ZF?=
 =?us-ascii?Q?wPRu8x0PQclbRc/3igpr5BW9fdnc0rHl1K7DITffFZib4dtA3fTeeGTQ9lut?=
 =?us-ascii?Q?20AKA60/QI1FJHLlh04eRGlSZIq2roEm/0YhDKbw/AzH40XN2mRg2lWCGCdY?=
 =?us-ascii?Q?VXm6Huc8ZoEktk9dAtzQpYTV6JMZ8/9cMvSnnDdfcu8udIIx/v+7SfYpZro+?=
 =?us-ascii?Q?ZoniO5jQQ4hmpaMjdOMOAXGYzWXLeM+0u58V/b2ubknzBXzkPPRgvwZDSj3L?=
 =?us-ascii?Q?+XmOVtEb2BRRf2MVixre1YBL0C54EuUJuju1A75X6Do2u+gyek78YgRZmueP?=
 =?us-ascii?Q?r8+kMkfLV0uWTEOkiGB75fhmq9lToph9/w/rTx2PR6poqyY6mFY5mRH/wUVs?=
 =?us-ascii?Q?OH/0xhOYLGFKXjDgKBRb2x8qZ+j9wE2vlq09bHZc0IU4x88UvC18unLrmeSo?=
 =?us-ascii?Q?TPW9mtn0kSeBhJXIjquHS12vVQmnz1L99XODCs6TXh09uIzJKo6YrCR/aiyx?=
 =?us-ascii?Q?s72yUIavXiKyow1UR0g0udOeN3LF2rfD7jg1sP/hjcGOUZeFfgTXNGIU3hGV?=
 =?us-ascii?Q?UtuIixukLt3ic1J8gLTyIz/ciNJMsFNN7N2lM8g33L3F0iIUlD5UkKh2EFg7?=
 =?us-ascii?Q?neDKvDjQ3Z8ez9DUsTnEABm66OhK4A3yKs0UO9dX7v9nWDJ/vuEO2WRvZNFl?=
 =?us-ascii?Q?jaiXgqTM/8OGDDwDy3qTwIy95qKgVrvcv6+MGtjlN3rQodEX7JeRvl67ACHc?=
 =?us-ascii?Q?buY4aZt5XhgqDSDaUFFQmVYcUIZ6tjYJKPEQtBS/t7SmWODPoWgLnH42/9t9?=
 =?us-ascii?Q?Q0EWXiNUmWB1eX03JmN4hO+U72SDIe4Gyz4a1uWmG5YO3j4eUh06ZQaRpGCq?=
 =?us-ascii?Q?4ThlBFOfqJQl0GXF7LjaJLa1jibJJ50Xxv0gE7yc6eVdXY2TqdsgRBiMYYRR?=
 =?us-ascii?Q?cPh+nA5X8N0QCCpRsfN/9f0RlCFV+jyCR8v8YbxDyrfpEXKq+UJ2wkLqsNly?=
 =?us-ascii?Q?0YFPEIC5JI+BSs8tDM30qnU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32c46ec-08a5-483a-a5b8-08dc93e2ee41
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:16:44.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vptCo3AYseaRJd0mF+wbAs+sT26r9rxVGwH+eeoHYftfy2vmpGHSBBulTSIe7z/qpIZARopmpSwY8JZERLc18SOJD60yYw+2l47QzNkim2z8nEzudB4jnm1LRRnnpGDi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6250

This patch enables AK4619/Simple_MUX codec which is needed for
V4M GrayHawk Sound.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d0bc1a04c3a80..7f36fe041fb00 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -304,8 +304,10 @@ CONFIG_SND_SOC=y
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_AK4613=y
+CONFIG_SND_SOC_AK4619=y
 CONFIG_SND_SOC_DA7213=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
+CONFIG_SND_SOC_SIMPLE_MUX=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_SND_AUDIO_GRAPH_CARD=y
-- 
2.43.0



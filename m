Return-Path: <linux-renesas-soc+bounces-14447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C06A64594
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9D9A16C9E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 08:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81C521D5AC;
	Mon, 17 Mar 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mkMzqOIU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C475721D590;
	Mon, 17 Mar 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200379; cv=fail; b=EsKmhw5ku/HfToqSaZbbaFSYrT7y/DeQZRASLuEmd+r2LZWa/iwqgEVM07deyCiKN9pxH4YJVQ174RTdXciQr93MmTevuQPxgroTZ6dAHxeaXauFmjaJElMpt5+t3nikMtV2awM1uFE2uLfpsq2JOKgbpJ3dBVoWGOVKv9uamko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200379; c=relaxed/simple;
	bh=sINnVYgIaHJl6vaeTsticg670U7T5SOYhKRuNrNZrWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aD5oHzpK+rd4QFDQIOO0hpRHEBlCWjBTt+e2utLMlrQXysVtGX18md7cTKOPJUCrO4CE7huXubtp5feo3ruJleYLviHaNZL+/xOBZTxyg/VruMk5ULsfN0fuSvs9II/vfxTnjtGAtoZiM9Rw4JWN5Pw7GC2upJ41ugNFNpPvEgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mkMzqOIU; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAOQs3xoQ+HrhIh0U4plkWsf0wlLKO+FWAmt1fPYeGQrNVMeAHjnobGftYm2y6dzJ8L+PYHAGTzaEpcg2G6eG+Q/vCxIncTXQsa1X+Ks33kjvKRKiiFHqFmnlzhoADFQ1WXLItgFLKoE7gUrmKCEGpsZcDbKN/ETScHXfJJmz5ZMM4f1WILCVuA9ambMhpZaMUGJ7G2CNmHda6LnHYkwVEPL3b7+EfyWG4zV0LqkqHWP5cqPosLDNNKRVR5CdrPPGNswYa/wiU1XLJI6DAurV8tMrkqLSY/nitFi+Wdd9Dk/F8a6B5juZqQv/V9jTXMnOAd7lDDQfonWw+Ns5Mx8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ea+4Iyf3lc81xIu0Ach1YDgNc5ToU8+UoSRstQyVCU=;
 b=m2XjhgWgTFmeO+rf142oH9WKNVjdYZX2Mmkp4O7Bvo88hB3gSAau1XI60J0oBoexwKFaavWHbtF1f3RgYR0iqkRNW0xC5cNOOPsDB90U4AZdyP8mKk1IOdwHuwwAPcLd0IzOMMrxCsicTzPVoK7N+oCXv2WWsi9lYYYBuPnQfi/JjScp/fNnCdd9sHiCYHZM5pg/IHhsPIKhr0WXLeckoV0bJpzHEIBsZfhaS00PS0P3mRnwubQicIAn3xf99oZ6IYnmRCzbojxN16vC0Pz7nNpMBZrBeLZHHtBmn5efYrgTU5qU+MUPMHAvcqNp5GpCu6DGuqZxu4uTErZLQpJU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ea+4Iyf3lc81xIu0Ach1YDgNc5ToU8+UoSRstQyVCU=;
 b=mkMzqOIUJnM73CDrpKUW8GoU9prq34tu13abnqQPLxhZqTo5VPIAEkvm6+oGvhDsOuru6DkFN/d5Wmi8RPKaDK4qe+pKr7UZN0ERKgMjJzVb9A56hbJ8NvTzAzU+tjd7PnRDgaekNJCaTZ2Phqwmk4MFHCDLTUA8c4f6j1U7Aws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB15407.jpnprd01.prod.outlook.com (2603:1096:604:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:32:55 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:32:55 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Pavel Machek <pavel@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: renesas: rzv2h: Improve rzv2h_ddiv_set_rate()
Date: Mon, 17 Mar 2025 09:32:10 +0100
Message-ID: <20250317083213.371614-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB15407:EE_
X-MS-Office365-Filtering-Correlation-Id: b65abda8-af18-4f3d-f99f-08dd652e50b4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1UOoxnCM2p8+RL3ABsqTRN7Gy1N3drrsG+tDilIMYkR/lnF8IVi3c4RMsWKO?=
 =?us-ascii?Q?YWIqQXUh0PDPF0lIpaL0t0do5ETpCE5RQc9a2cn2tANJhQjjrgJClZVS0rAN?=
 =?us-ascii?Q?rFZcLQ6rMb9gU3ogtwkBJ4VAThOgTagsCU/Sr3aoixCdG3QVY6O7SAqQWL5O?=
 =?us-ascii?Q?5xzSAS3cziM50WWW3GtqVjcMFZ1zQgYg0MjmcAUiDJcm67jPVrXJhn7Rb5RF?=
 =?us-ascii?Q?vyeXT3vEGpAFuMPg9kiCkRfZDdUql5FKIWFIhmNLKjywoaY3Dv8/4y3sTJYJ?=
 =?us-ascii?Q?OC29Ht5U3pVzjFYL6a70MJgwM3WbFS21VdTa2+7GeHZGaEsqsrMUwLcQ6YaT?=
 =?us-ascii?Q?bnhLmQoS+5/a3klX7mUyNk3t8LAQQKAc3LbPSEGEdt0iTpLLjODL9c6Jucx0?=
 =?us-ascii?Q?kzcHMaEGvkkNhw7vqt+mxz4/+B/4bf6SkJvIRPrMyTw10KnqsOvT3lSYmQA2?=
 =?us-ascii?Q?ZANkWs5ElRTf6C6uCkUj5U7roy/QiBFCPO36VUs7/KrrjTf1Afm0zqNm4cmw?=
 =?us-ascii?Q?WcSSIHz23lVyfvCVXMy5eBMQTLF43UNNbusQCAY76rElI9bx/dUlA41VrQir?=
 =?us-ascii?Q?0Vj+6th8OPeD+QZfuT2njUsn4XYpCxMTQYLmaVyYNn7WMtE77liZmUnZQyzq?=
 =?us-ascii?Q?Ud14Uyk4c2Ra+atsgnaMm6vXwB7m/J1DLIPN3B8q24L0OTkWMerELPBHinuP?=
 =?us-ascii?Q?n6Q/AqK/0wDnBXgWIzjJuXUdvqBczjNOUOnNDrk6cAXik1Df8fSNygq+Djx7?=
 =?us-ascii?Q?nTMyTpW5Bi5NnkTIihQ1oRUsD4+T4owmkhctjHfXJUo+K8mPFIpi2mQyJ80F?=
 =?us-ascii?Q?hko3A3QmIx6OdWl4awjHO/nBZ5gMh687QQ9X2bnNxwroCVknBXTMWYcrWvzg?=
 =?us-ascii?Q?VgUqYp17Ub3vLpnkwU8D4Oxc5xmeyK6tWW8OTHIAiTal8SxNI8oOuULw5O8V?=
 =?us-ascii?Q?IQlFgdkH9Pmu6jKmsgSIeShKtTZ+HQV/VQTCZJZ7nxpQxyRgzT0USe9yw9sB?=
 =?us-ascii?Q?u/hJgJRg78EAfk7dUjFBdyDznBVCNWad5x79lJ87BKxLVeY5Nqub8Aq41JdN?=
 =?us-ascii?Q?Fd0EDYUD93kzzjfDbOi9lynP/UnupUCvS1/aibd3hrgB/wwM+Q3d46DjXvNs?=
 =?us-ascii?Q?1d899Ec5GxWpZ2k5ItEcJMLHv/Gd2YvibdQxgJFyY5MiPVXNifbEjgk9Lq/r?=
 =?us-ascii?Q?zkWVsIXKdk4+2SpEgAUgnE5RD4mx1c3pzK5pcS2RwAXvtrAmkdzmUZnbeW/d?=
 =?us-ascii?Q?JReHz2Alg3BKiC4Vp/BcTTh4p45mjItJk7B+rojOifqzm96eIgJ4xC70hIrZ?=
 =?us-ascii?Q?3OUK25l6UuEZvM79RlrSmijkHVs9G1VPK66IeOpmQHal+fAEw7VMnqR1B2vi?=
 =?us-ascii?Q?6d6+5LRpUcfIBOS1hv+SDWIt1HINnuyF7QJ8GMkFrw757Upb2/oRowMcIZf4?=
 =?us-ascii?Q?fS0RgwU7IIC8AQ/As3Z4sO5nEAoSzaxx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mt4ijUt/xxlUaGw08txLANwlH8kN1zFmqIWlK635GtWsCC/aw+5jznlk91Rx?=
 =?us-ascii?Q?hV6QJU+lNv8oHOhtI9cH0NmV49Nw4yYqXjtuzQEn6v4zp2W1SUZ9SWAPoL6G?=
 =?us-ascii?Q?RQQNAmnXfdG97TE5gXEfMXr2UJn5RdNxsSssOvmuFZXTq3rw9knFM9u7fu1J?=
 =?us-ascii?Q?WUIo+T0rxLcl1sti/ww3vn4wt1E85/8FB2XRBEe6w6wVxQa5Q1yrEQwHsU/6?=
 =?us-ascii?Q?pILxh6uPmQ5TVx3kGmDNQfHs1IsTTvaYFAQ4K6MmCOhbI31yH4qU2t3xgbuq?=
 =?us-ascii?Q?mPnJWBLdTkUK1mwnH3QDKc3Kskg/L50c6jmxBjBjszalQjR4N0iD5hE+UAn5?=
 =?us-ascii?Q?tpYG5sl5J4GUU+q8+kdTHKrwlyCpaT+2M05oiNbsQKfZHFn4ksWnJQ3j188T?=
 =?us-ascii?Q?xO6lpGnzKZW9ii/2BbFaDddV7L/mTTvj2/X95o7lY4V5pppDHZgf5JVFlxWj?=
 =?us-ascii?Q?qMGsCCQGFKXjv497YymeD27CuLyZKquBKcLDpQ+vwGjuWoqYT+4LEWDlcWHd?=
 =?us-ascii?Q?R9FL2V/xOGIIljqlyTgH2DqSmXqTiGt9S7q6gsLyMeHGIMoTg0087mAUyoYT?=
 =?us-ascii?Q?PQsUmBiLOKFaUNYZTj3/bJW1AvP8m9tmh9asbSFgG3cl6+KoaxujmYmO4lWg?=
 =?us-ascii?Q?9jo2+e/6H9CK1oWG/d2DmP+/4GG/Stg/sT/86YaPvUzacaTfn7v9JQnV/JpQ?=
 =?us-ascii?Q?IdV8jS2aVmGe8eIwF/ivTugHbDYrlm9PWVywpwU1RtT0EVp4aBmcRi+Qzt+a?=
 =?us-ascii?Q?Zr6bVKdvN1xEie8k7wNizWxXoZU9WiPtRXvwpvLkgBkzgNVb2VonlDRotUpy?=
 =?us-ascii?Q?EbKsp+QzVMSJ+yYu/6WisODLK2SZpKHu1y/ahBTmALdvhbOafIAwXaD00Am3?=
 =?us-ascii?Q?PVrmN7ETFFfR/FK/EsZ/vgvdrhqbfy4+GT1O0/3ltqTHMWXzsH7VXe/9VAX0?=
 =?us-ascii?Q?HPXZqYxC+I1VBkvCLYEPINU+fidBG5r9GkYi36OSm19gdM5tBamX/L42fsXD?=
 =?us-ascii?Q?mqB/rEpdMeXaVbA2klukD1fFbMKr6HKGqwyWwi3jeyBewzwAD09zCPTTbmaB?=
 =?us-ascii?Q?yM5Y0nBHyLzoD/+rasDs53/JCF9CKd8AWPKwaVRPIbc7obWfiHamJkYb33+s?=
 =?us-ascii?Q?4i4BhykIH/gnfMV/L4cAuzUM1nuYge0gzPD9dWZxT875y6miXZ6pRtrqLby6?=
 =?us-ascii?Q?WI6Qw39wkaQL2lH4VMGq/q8/XugxkI29C8XCMYC/KMv4rPkb1VyGCm3pvwc/?=
 =?us-ascii?Q?8aTy5Z0iNV+ZiV2WKHO+Qa46biNMWrf0cK3p+mBTmpCprdfswLajYz2p5oOZ?=
 =?us-ascii?Q?pb6yg5dB3J3Jg9inBzfUjyCt5rVVXEQCWc6FSswQ8W6OUSYMs2c1ZXJ0H5/h?=
 =?us-ascii?Q?/+lgZ2xKa8vJDnPO+f523WIr2xl9ibkjpRKgGB0JGV28KTFmA9I81Odu7KYR?=
 =?us-ascii?Q?R+0MlplwPVVsqNlLwBv1codTwvCmMJ35I6Utet2Qxb9d4QC+YxDhC8WVta3h?=
 =?us-ascii?Q?cZW0U7Srq9y6GBXfFW+0pWBShOdPFQEl+/YyOyQj+QmDCZZ9RWyCXBF+ijJp?=
 =?us-ascii?Q?MeDNnaw5ZWyohmF0elArBzu9yFzw7UOXhUpGYc1EAupEUPTHGJIRBgORve6i?=
 =?us-ascii?Q?QjOc9VE03RlT+gJBTaa9o90=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65abda8-af18-4f3d-f99f-08dd652e50b4
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 08:32:55.7448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQ5SYm6gRnOzMu7/Q0PvwEXtH7LCD19US11Xw2wnXyw/wOkTvWqqDMzzfzxYTOrnMQU2pGZvF/CiOHKCQmOiedn8xCXOOcmUcK4jNNqxD1e65fGHnQ+xFzCe8mNDu91h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15407

Remove duplicate code into rzv2h_ddiv_set_rate().

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/cip-dev/Z9QBZo4GgtMjid0v@duo.ucw.cz/
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 2b9771ab2b3f..bf3ccc0522d5 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -272,12 +272,6 @@ static int rzv2h_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	writel(val, divider->reg);
 
 	ret = rzv2h_cpg_wait_ddiv_clk_update_done(priv->base, ddiv->mon);
-	if (ret)
-		goto ddiv_timeout;
-
-	spin_unlock_irqrestore(divider->lock, flags);
-
-	return 0;
 
 ddiv_timeout:
 	spin_unlock_irqrestore(divider->lock, flags);
-- 
2.43.0



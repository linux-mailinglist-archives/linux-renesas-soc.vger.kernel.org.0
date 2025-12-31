Return-Path: <linux-renesas-soc+bounces-26218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8270CEB861
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 09:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2531930386B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 08:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF86831280B;
	Wed, 31 Dec 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jp3J4WxA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3731280F;
	Wed, 31 Dec 2025 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169423; cv=fail; b=IwneCd3DLQCw5YaEKGxiUYV9jNxnNBwgZsRPVzb3MegCtyTXhbae2UyjA1GbaGfIJGr4WbOtxxR9bNAObfcLwgRlukxrQgH4+cB5aDI1MXch4OlIk/WJICKBi9wOhDY1FjFPjtkYfswtOEWmzIJqigvOojPVwoPKs2lSPn8VSzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169423; c=relaxed/simple;
	bh=o2qjc7FLfUrxLBDx143ZXh7n9A8CsA3bcA+bkyjsDfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gYkWgQNlc5ltlN2C/RUvU0QiNBz+xbrF9iwXC+Gjp1GegtUd9kvZ38/GrO25WElunFkVkUeilGqJPOkgXenjQsfMhbNpBFrTtynqlmJMWkUIdenn4iGAL+CX2C6F5bDC0yi9JampVSWRuThiTnfQmSbXqhYsZpcyKAdQBjdUYsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jp3J4WxA; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f37LQSkvKH9QJlf6tR5p5efKvHnDLDsTD55l8uNz5NI/jVwYC9Zs2x3XwbP/5iVn8BYqX2e/WpY/oisGV+S8iKm6CYBqjpsQpSPXxAtqcxHWHpvvUIjdIyUBqvkrQoUiOBn6lxIlYmkaiYdMRAQ5GjEov5dPS8avsia85KzVrt4/IAt8urWJOLvnvE4VmKLnsi69CLFRelql1QSYOwLUccZd0H+zHlbqKf9z27UG/mOr0txT+XZ8Rt9M5lN90IpRcR7HdMxwAPnLPqSc9jXEZL4WI8mMRZfnhaVQMItZCli0No2gUlM7DF97wX22oF8QlE7w+mvFcsrDH5FvSvXZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcqPkCjsjrIz2qzM51FE05fs9jFbvUWHCaqeE5ZQWKs=;
 b=e9Ag8YUPtYTH3Xl+7AzJhSMJYY7A22rlrp2ZVLOzYLwk6nk3bqbZ/lsT8u8Pg8JV93+KS/IBCSJ5EOnZfD13e0/RpOHvxAKzvMfAuQ+Nr6vxefzk3T4dY7B9FBKteEnElz6/RBGZPRRR520pTLwhBAFlqfmDD88v9RBRredIARFz3Zcn3gsdwydgWw5GcP+NCIaEuB6hGmA7SrAaUlS1pWcKeErrVu2mI2ruHBbE0O4NeHom1dB6GAh8nMk//T03DceBOy8GZwIV1Gf6sQlPyGHw9HHSl5AewBWjgfIlhZ8hYjajALRE/5x89LThZLVBExByFnuzGxMvclCzBMaLvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcqPkCjsjrIz2qzM51FE05fs9jFbvUWHCaqeE5ZQWKs=;
 b=jp3J4WxAh5s+jn6aowCuyZ6YmedbxQkmoMdz42zFt6E0yY0HQzO8cFcAIXUD+yXE6BFOg7ojcKAk5hLAbuvtfqHq8Owzjvh6fBRbpk4ZZp6GvJaQehIJJjbBjIXDPqlvEkQu5Wb9JCwHyHIhgLtlhCEnB6s006c4fKql1Jnz1VI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11751.jpnprd01.prod.outlook.com (2603:1096:400:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 08:23:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:23:33 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
Date: Wed, 31 Dec 2025 09:22:58 +0100
Message-ID: <c6678c398f89eba9ae7b349ec31bbd0a1cf7355c.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cf2dd6-2d49-4b1a-da93-08de4845e2f3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vi5EbU3493NIWBHoLtY6m2fq7rVRtZguMhLXh3L9KVk8OaZmT/JRYSwGg8rD?=
 =?us-ascii?Q?9JtTj8rpR9qYzcmUMEJWQjVKC4q+HJQPEESEqA1PVKWiru900rD/VC/qKJFp?=
 =?us-ascii?Q?LxUVbrop9PCoqUThfwZbgX8NcBLxxHwr8rqv3+DiSZQ2DAb1xD4Q+gp3IZoU?=
 =?us-ascii?Q?YFuVO3D1bAyDgUDuT9hZGJ/WyilHhtybS+vOb29mfAyALhKijjS7dHYVbGPD?=
 =?us-ascii?Q?ghHoTqqcso5E4/pXIwL5O91Flzjmi5JuDYhmjacdlZTQQ2X/YGZ7bamuPRG4?=
 =?us-ascii?Q?zwyQmT02zZJzHDSqkZWA3pe+VnQaM7phCulUksp7kUt03cKI3ZwY28srZtRw?=
 =?us-ascii?Q?XiU/+U+Zt167R4N/DyVvoWUNaoUtd9EVz9Jzq2XEiFCXhY/ofRCZIQiZ7gbT?=
 =?us-ascii?Q?w8LVe8KvhfVyaUj47U3vMGr5yOcoYTTxV8Dsp19EoALdxLiUW62NID3a8e3q?=
 =?us-ascii?Q?pXCiWdRjcs9mhMMdnOsBRn+7LZzRTf77IAgzivjuIXEyTnOAQg8aEuZyuiBh?=
 =?us-ascii?Q?cIafRJbUSthYOzTA6VvliYtCP2pcJ/jbiwqf6+EHEpAkAu6GIQwP66rHS+r/?=
 =?us-ascii?Q?8KjjNDsElrcaC1VoHY6RZnDO/RyOX+TOswErhzuOm4a1+VL47oHVimjouTzQ?=
 =?us-ascii?Q?KdjxfrCVZAwFBJhgPBHCupFAQ+NnaYRlxFiTFslZj1I/XicH6+kMtZd5ofuT?=
 =?us-ascii?Q?BsrXD11YmelCivrFtP2NTlB1Z5CXrBg7KpfeAhy/GmfDumThaynriW6fYagt?=
 =?us-ascii?Q?WfLFXduTvtgRKXeWRyL9Rg3hoQv8j+iFhxICimb6o0HAioW0lblpsO5+Qwvm?=
 =?us-ascii?Q?8rQrk/KgcxkpoFz7fIFzsTwvGf4AMpPmCw3s/otEfdaw4pt0b3InsMqN21gj?=
 =?us-ascii?Q?eBsnsb+0E3WZQ876sw4kE+XSmbp20GGr4vLeED3PyWBI+ZOZSWWKkpnxbj0x?=
 =?us-ascii?Q?Jf7ZIGv2/uikdjxFQCa+gf3evvfiWDagGqoSxPkorTHeImaX4gsG6IluZTW7?=
 =?us-ascii?Q?UXwfNoG0J292vFxr1/QW7pB+jmXpOLJr/2zpdgymdQc40m/q8nasQd4OqF2T?=
 =?us-ascii?Q?7v/1mntVCF8RxvJz4Ie9zux4U3ngir7zzvktU8NgZYhDzg7uBoOt4th3+Lqs?=
 =?us-ascii?Q?Mvey31+2R8Hs2C6w+OCONNs7FOXFFEJ2A0oGxb+ea8+4aOneWOiKLuEtKOBN?=
 =?us-ascii?Q?QJHLg38iuAnNymfGC6I64ngGJvpf+pt5p4jSaYZmqwQ7mqhfP+ARAzJi8vup?=
 =?us-ascii?Q?fnHsYUZjHf2mYek7WpSZI8x9OI+ESUGab4VHRHWbbjwYJkD4mhTuepKkI0/N?=
 =?us-ascii?Q?J8K9U7pj9SfYZQTUGLylH9MWRHtG2KLlUSOsxP4YWVi7gd8bLQ5NeTDKJZwl?=
 =?us-ascii?Q?Vl3bA4uWTQ18a4503cySBjQXbRaJNEq+uuYeX1vPP1hHZlcQkgtWEAKR/nPP?=
 =?us-ascii?Q?KnEQTgphFPFRz389VWN2HlJ/oM82WU5HJoVLJa8q3PPIMU7CnL9MIFmLBUPx?=
 =?us-ascii?Q?ScTGn4Zfn+Yq4/bW/vcVOIw2Qjb92kJosPpy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EFJ6Jx8uXqUDbqaWbiVGyfwiEacG26IX589X9NlMGoB8DTjSP7z6cP9neh+E?=
 =?us-ascii?Q?bIX56FH4b/R3jwuSTpo5+tyD2dq7MRa5Arz4GZIITHQVAZAkdmM3ptXBT2Lx?=
 =?us-ascii?Q?Hl9xkvxEbSyEV404E9tcBhsNzUx8GSeCNp4U/tyfHwQqgLaoy8TdC3rY5s5M?=
 =?us-ascii?Q?RihB5+m1tPhoSK192IXrs2MVopbm4zY5mxsF25bulRv4uQspQ6hPFcZegjYH?=
 =?us-ascii?Q?d7ttQljgpSA/iMEABlgokMY8xcB973j8x+lqvku/szBVgRdOhXxXDGzjYGEP?=
 =?us-ascii?Q?RnsNXT/sCoaIESAQ8yiuBxvbvIBU2gznmeiCzJR5azjtkSnT9jHFJKl7GS0J?=
 =?us-ascii?Q?+Y8M+yntrvJOzR5M7I0XeDLEAH052laabX4C5KOmF6cR20BYLQLL4u0kRPJV?=
 =?us-ascii?Q?Gpbb69x9eC8+acVd7BrVDSsnoron9EzV4uyE7oHJ71QHEphFGfXu3cU+XlOv?=
 =?us-ascii?Q?sUrsYW4PitkqJnSi3nT87UaagDRJOMWaHFfCjvwgWp+732fc9X/+TRWRYUKj?=
 =?us-ascii?Q?qlRMcV1+NZgVNLPh3HXCQ+m6jNvQaGkUq+BVwcUPUiR2ajZKrCOhr0U1ivS3?=
 =?us-ascii?Q?FaM5vxx14VnZFo1WDLd8e9Z+snLaMb2xA4H6mG7Tsh9oNU8DJGLgGI5C9yqO?=
 =?us-ascii?Q?EW5hYeWd3ILK7Edo7mhVOVWvrosrDHgcs9h+JxrhUWDIxcmQMzuExrySYyY7?=
 =?us-ascii?Q?HtqumKxMcyvFp1icXEFG9PGT9Fl42bZIs6cY2PCzbPxZirmv/vIFWc56Rl8h?=
 =?us-ascii?Q?LKUOUKyDg1SeqapQqzwVrNASb39vqci2mRXgfK2+vcg+xA3EXT7gguAEMgjG?=
 =?us-ascii?Q?OQuyKZBl1DRvLPEyeNL0bs+GWIPOMsdVfJnaE6QDSQwRWDuHiAVICtrC5ioB?=
 =?us-ascii?Q?yypaGulRla/LVs7XnTf6jnK+cItiwNspjz//ljnxDvlMXwWXL6NAH52McE+1?=
 =?us-ascii?Q?7O+0BRO+7n25iR91LK5YV8BWCjGqDJe8JpKZ1nvgj88ELhioaL9X0w80o65/?=
 =?us-ascii?Q?Y25xgeWNNfAJsJX0pRDNcE/3CVPJBvoVECqemKDPzKIINaBdFe9UQgaVrlg+?=
 =?us-ascii?Q?rzcGFfUJpDciJwgxr6PZ2KmOJB77EjUBn3BmT6Z1A3/9d+xcCgXX1aZh2Niz?=
 =?us-ascii?Q?Cgjyhq+k0N8uID9mrI2kKZEVTDH2jqe86ogN4m143BmKf1khfR/I0r7QwGZQ?=
 =?us-ascii?Q?pxwJw8mgDqyuzuujsfPdEnYMRipegS2og6hLea7IsrTEcBMYJmAiO7VDd24A?=
 =?us-ascii?Q?BW6f7nX0hq49Y2MWvUog0Au0imgQ/IeYc2D6VWgt0KAUbMXVdgQVA0eT0h5X?=
 =?us-ascii?Q?j9ScXWCNiLldTD4aJx7kz8uwUKMV5Q2lfMZOZGEHEt6Agt4cGCsLX84ofTK3?=
 =?us-ascii?Q?kQ0kO4NxQU41e7Df3eudhXdGiDt4H/qjxGiSK8v+VT3aDq+66J1qeCj9SJdU?=
 =?us-ascii?Q?BFsmBh7slX2Q2rH045nMsAPxuS8xeTtBTiNJUKEWnz+GsiwPO57PagwZekMK?=
 =?us-ascii?Q?/POl7Pz8RFxqM+zdfzhTFsiwJ2E8jD/FKVu/gaI06h3DsPpYlHEwPcXx4dsm?=
 =?us-ascii?Q?AumsLTijFyXSkxzCRl8ENVmfcsgPYGVRZZkjt6XZIsfGJrhOovECxQ1iMLRN?=
 =?us-ascii?Q?gP8xIVbZJ/SdrvAEs1WNIou2DOIqhO25jy+z1mg+EPqucvaXX8dB/7Yf+ILn?=
 =?us-ascii?Q?dwTm5p+BHkbeUib368fBHkSCmKENrGjkgbMSUFDu7NHlp0mfPHMs6MJc7sPR?=
 =?us-ascii?Q?wy0Gm99Ss8lvC1VzhHNQTJ558W+tCOUAbkDwd96j0K0QmAe58vI2?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cf2dd6-2d49-4b1a-da93-08de4845e2f3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:23:33.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2w8O11MMNlJALcyueDg6MMavGOcACQGLed+0Gc5T8oA9ZjyGemKrwrmJWW3tTrBrZy2oDapse1EMQdAAWR7vCwwEAsHjUeHBao1qavrqXqRtKkDpVKY3sdhi7wUku18M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11751

Replace individual devm_clk_get_enabled() calls with the clk_bulk API
and store the clock handles in the driver's private data structure.

All clocks required by the controller are now acquired and enabled using
devm_clk_bulk_get_all_enabled(), removing the need for per-SoC clock
handling and the renesas_i3c_config data.
The TCLK is accessed via a fixed index in the bulk clock array.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Added define for TCLK index.
 - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
 - Improved commit body.
 - Dropped unnecessary static const char * const renesas_i3c_clks[].
 - Removed the need for per-SoC clock handling and the renesas_i3c_config data.

v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 43 ++++++++------------------------
 1 file changed, 11 insertions(+), 32 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 426a418f29b6..1b8f4be9ad67 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -198,6 +198,8 @@
 #define RENESAS_I3C_MAX_DEVS	8
 #define I2C_INIT_MSG		-1
 
+#define RENESAS_I3C_TCLK_IDX	1
+
 enum i3c_internal_state {
 	I3C_INTERNAL_STATE_DISABLED,
 	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
@@ -259,7 +261,8 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	struct clk *tclk;
+	struct clk_bulk_data *clks;
+	u8 num_clks;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
 	const char *desc;
 };
 
-struct renesas_i3c_config {
-	unsigned int has_pclkrw:1;
-};
-
 static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
 {
 	u32 data = readl(reg);
@@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->tclk);
+	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
 	if (!rate)
 		return -EINVAL;
 
@@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
 	struct reset_control *reset;
-	struct clk *clk;
-	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
 	int ret, i;
 
-	if (!config)
-		return -ENODATA;
-
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
 	if (!i3c)
 		return -ENOMEM;
@@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	if (config->has_pclkrw) {
-		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
-		if (IS_ERR(clk))
-			return PTR_ERR(clk);
-	}
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
+	if (ret < 0)
+		return ret;
 
-	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
-	if (IS_ERR(i3c->tclk))
-		return PTR_ERR(i3c->tclk);
+	i3c->num_clks = ret;
 
 	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(reset))
@@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
-static const struct renesas_i3c_config empty_i3c_config = {
-};
-
-static const struct renesas_i3c_config r9a09g047_i3c_config = {
-	.has_pclkrw = 1,
-};
-
 static const struct of_device_id renesas_i3c_of_ids[] = {
-	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
-	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
+	{ .compatible = "renesas,r9a08g045-i3c" },
+	{ .compatible = "renesas,r9a09g047-i3c" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
-- 
2.43.0



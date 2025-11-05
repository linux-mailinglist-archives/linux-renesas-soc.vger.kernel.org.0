Return-Path: <linux-renesas-soc+bounces-24156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF2C367A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD067660B8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACFF330D30;
	Wed,  5 Nov 2025 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qFdcfTzU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802B316903;
	Wed,  5 Nov 2025 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357226; cv=fail; b=q1vOHmWkJXrAL2bJtNiUpjZ9nDsY9MZmJDbnfVp/YzyYxDixMHWAt+x0nyaWTc1EFAcxKggtjPXl5MlRK15DBPac42E7u3AJmb7ynJFmJI1TrBnVdLx9mYKAjm+m4PA5e7ETxvnrTEdQWKnn0kN9J01DTq3RV2oQoAgzVO0ztlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357226; c=relaxed/simple;
	bh=x3MlXE5wVCMlssfAoyB0IAZXY33yC001qYsyhHZqu78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QtqQFj0zF9XSoz6HmmnmBDw8/OOYdiy3OIqkm5IwjVXw5/oojESJ7x/voh5TfVOxW0JZffuDfsX6Nfz5mR/Kd46EZ3vZvPnk676/373/eneBp3JT+rXvh/NX1wDflWriQuxXLmWRANoMjJpdY5eal12cdhw+eizb1i111327Tbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qFdcfTzU; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwRtdeCORxx35mUOV0Pw8qYR5ZcBUuZn8x/60bYq0zdaawHzFyT1DiJNCxqYcZfuJldDJp9G8Lco4z4QIhkp8FXlSK8u2H6C4L+pcrObklETQSO/JznCLspTSg8MfNs7I/jSeWfE9lwqXQ5EYtDRtaykNEOv4d7DpsogGgL/Q4bNjzutrEAaAgOCXjjHEDEzfwUdMEwxLWaNYt35xaIYTS4pGPQ8xM9hWQENtjIJq60oFUEEA6bctihysFY9VGFuCbskHTD69Ld2YxQn5pNJLSa4n0DwJ7X7dNvOD/5MAONfXnQejyI2W6rffe+M3GoNnpgpkDLC0++nhVZWNIHu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjvuvlG54zzklAO0wY8F32q9fcfTkyMmtNuCCxLdj7k=;
 b=qwMVF3FRgf4K5b2bV16W6gtTsTXDTTwRDANdtQnF6I4c1C4ILXgsizYHOwdnd/CcMf7Y1TH8Kk3uaFKZs+435IgvwmerBd4IoUTKVQXGnJFGlHJl7c3qHgCSh8cJD6a7fcVlmifHSRxgoKfL88aqQ8C56j5YVTPau2QqDV3A37Gu/j6oqI1LQRBcWuVDlITKVsQaUY0BNXHKIgkXu4NpviVP6RoaUdZNVg2DnDQXvtaqYoVSqz7sBWYqhRx3sWIYBzmHUgN+0+lsUWWJGdCL+WcBvQh0OOZaEmTXE4SqSv2VBJs6Uj+b14yYhrh386BQunluNRSzx4Bc30z9EWDDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjvuvlG54zzklAO0wY8F32q9fcfTkyMmtNuCCxLdj7k=;
 b=qFdcfTzU+MThkh6cF48eYGaaHGGIWCB2HIud8+uFBwNqpjxqizvINtvh5uPx+Yle1x41JAriwCQSBAJFIAbL7MsYO4wabB+AeXHYWRQh9u6p6XdWCp0IVEM/A/YUOmv/AAc/7rFLQXA2CXyeOLq2BPoiGZs0oSPdykcCIfPqt7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 15:40:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:40:21 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/21] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Wed,  5 Nov 2025 16:38:59 +0100
Message-ID: <4b760e6e39679edd7f3d3a9a5b4babc7805ffe29.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be5224b-46e5-472d-7dce-08de1c81a0f2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?561R6Mr4um4vjkIf9+h+zz1ErtkheIAIb5cq8ZfZq3mPyjLylNS0XDI0HZeL?=
 =?us-ascii?Q?g3nTMvkqPkc0vwsl02F85lu6ln7YPNwDAH1GVCm4CS3eXvmbaPemMYFgwNEH?=
 =?us-ascii?Q?stVmDGPeJXE45H8x5hMYIBW4L1isGyXZ9oazXL9s7zyo57DLM47zqxdSSIcU?=
 =?us-ascii?Q?agHkzimGbz531XwEyOQNLL2LpCxh3LiE0SwvFcM/e6bCs+vpEaOnNQ6tRus6?=
 =?us-ascii?Q?b55Pp3IAtezay8b9GlOBmG+xRhetbXC3l3hEU3Y5/PKBk0L1EGYhm4Q8H8t0?=
 =?us-ascii?Q?bPx0y1bhrUpD/EMx6yLF2LPSkkixkvGTe/w05AkTX2Oox324NbvA3uevnbTA?=
 =?us-ascii?Q?1uyfksf/W5PK6SJMxAytLyDjqJdY/2lzYbdj3eTIpgd1SPKjPejZIx1fX10Q?=
 =?us-ascii?Q?xFflhYDRgh9YKathu0oXgrnBO0GCMxWCRilYijXheGWN97uLjIKIPQweaWuo?=
 =?us-ascii?Q?IZV/Te1sNSBS0OMnPGmVx55PSYDeKVDOdCJhtEut+r92ZSdDIMnGUfCe+PA5?=
 =?us-ascii?Q?VT7WHLai2Q6dBz7LFLWD9VnXaWdfOOTBvBtbU3JR5xKX1EfrOVtMmoy+bOTx?=
 =?us-ascii?Q?/UZc7C64p6ACprKy/z12W51RkYi9vniWsDVZzj4GtukOSqM21h8++XuJ0iHw?=
 =?us-ascii?Q?5Xd7WE2lUlMl1nu4T7CqVIJAbqbRJM+hPkk1elDBeCwZ/P2quD0pyS/2+xi/?=
 =?us-ascii?Q?bBS1MHbGFmDeHAt2KbrJ4ftJZRaPtKMmigK8cPi2WvoMOdKHLP6emDhhwcEA?=
 =?us-ascii?Q?A43zdkvmi2IojoNtz/NqajNhwjlCmcJfcMbVV35tEAyOZ3kWE49OSD7ROpe1?=
 =?us-ascii?Q?acnpTNVjzP2cnJfyPtZ9Wv+Oj9tbNlkjUzFJDMdiD/PwR0nzB1PvG3VNNiYP?=
 =?us-ascii?Q?gsupJJVPwatJQjhGPuD/RF/NUdNCcoUtWYbAwcNpbrLWrWNUIh6Rkj42bmZ1?=
 =?us-ascii?Q?h5JEYLmJrcawCHBA5Rzzace63FUd6MjXJTvFJ4cdCCbT09kIc4PSs+RyitER?=
 =?us-ascii?Q?5SUoMjz3WjmwzYcsSjRgvqiv+rP2Uclg+hxp1LrG0CR0X8XyvIxAwS/bFd57?=
 =?us-ascii?Q?ATwZ9MiLYEqMaDfMNoiY5B+QEN3gUdgub0H0E/9n38brESAnbP6p9hbGfNrl?=
 =?us-ascii?Q?/XahgsyBDx3XVMAif3ith5ptNKyLNcXfzNL5jU/wdsK1N7IOwCCVKfykIBGB?=
 =?us-ascii?Q?ts9kBK29CLV8N42bJN8l2IIkaAJy3EHcpdBFB/ctAQUCfZ4HCUopIhoRfr1V?=
 =?us-ascii?Q?auCfqxGrXdpkS+76yJizQoapwa2FJ97oujsoxwGGm1n1wlOqOPUQvvqcbDbU?=
 =?us-ascii?Q?0H76nzsq3tGGa72YxQKCxgdPqyCghBObPccC5vPq9htCKY22eN73Xp+i/vG6?=
 =?us-ascii?Q?FUtNOKuvHTKe9KJyv+/4F4njLQYJDQIJHk2WveP6obnEVN1U2rbFR97yPf6f?=
 =?us-ascii?Q?IhClY5Z8CdYlH7kAw8KoKitsMi2XrCIXrvB6V+zFwE8vmVeGGIb+p2Qk3cTC?=
 =?us-ascii?Q?sd89IaxkWrDzFYBkifrQ9wRb7Hzvpej7C9jL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qyG97SlIsl4/27okkUaiuBrX2mfpyy6s7NrFA8TVReEnBFZggGiYYt5X0oFC?=
 =?us-ascii?Q?itAbRWLEdakyHttpF+nR+XWUSZ/VoXdEYaxfDM6cvAyXS88/7R/VTbX0kNDD?=
 =?us-ascii?Q?5I1JQk/UgMOaFZNJEXDJphjJHL886b/ktnvap521rn7MdnowUIDwt9GIN3Mp?=
 =?us-ascii?Q?C87DZo6Ud7yW5GQa1DWhU8fzJEeLuUtjw7aYfbKlRyl+K2T1zqae0w/Te2gV?=
 =?us-ascii?Q?kQUZRkfmHZOuly8h7rFeZWYY3RBL1mOexY1/fEkgi8Nt5r1UfxXmDpQt7mtJ?=
 =?us-ascii?Q?MQXzs5yPJLa6meN1vCK5gCe4b+ZVqhczG/gL4y9dug7yWnk3ZQ64G9hnOxYx?=
 =?us-ascii?Q?T5Sm3AaxpgqTDYz5+OARPD2dxM2uSJV4LxjeSHtyU2l5ADqIiz3S2sQAMOwd?=
 =?us-ascii?Q?y8DVelobtakqIa8Ce3cCyGwnK5v7upxHj9VM7txg2Fa38HnYErvoL8Uto5Pk?=
 =?us-ascii?Q?x4G/3jUNHlL/Q2Fyk2+6X60Xo3WGX9zPpfOvE8COfRPtLfrEdmsMb2B5EH3x?=
 =?us-ascii?Q?7KgN2+8yEn/7D3cB8fq3kszr5rMhbDQhIBfla30Y7roC0ujjaArdUbM46waN?=
 =?us-ascii?Q?IzN9oXv8CtQcAwwXnZ7Wvfslw01NK2oBk4B1jWKfLb7pvgVDT9aGQZ1ue/LS?=
 =?us-ascii?Q?TzSc+VXZj7l9VbC0tj0zBdJYUyLIJrOvyofZhnIh8ZsnCvReFTiCSqvXQLZ3?=
 =?us-ascii?Q?dpWQA8PPCAIebsJGC5YssXMH9zu8E9CbB01hWot+hviU+QvNaQuP//blHyza?=
 =?us-ascii?Q?4oQAH8TPrmQgmPxNa2241HOfGCEyD2dsaXu0R1C5dQKSC+eiBByl10tFhbZh?=
 =?us-ascii?Q?1qUTw40SniPxQfbPoninYz0Jq9Qd55zXAx2HcGQC7L571Umo24bx3vuCV3ea?=
 =?us-ascii?Q?jYFGl4yQUy1LS5B4Hseibrw2/oCFwdgdaQszXGrtKo/85V2ipHrJACMM754X?=
 =?us-ascii?Q?8euhGj09A5cgF8PBoit3gmQvYTibPiDASqCPiRvTfPI8tih1EijZfrc5NCw6?=
 =?us-ascii?Q?2BcUnG8h43JRlgfD+aciF2OjhXvZkBXvXIPFhrTsoHnlDRqHTJmEoFZNmBJh?=
 =?us-ascii?Q?IBa923EUVBVUMhgZ8nN2PPv24VUQ17AnE+UyEhOPNyxhVS8lKYF96yE5yPZ4?=
 =?us-ascii?Q?o/kGUOu1k0LRpUOA5hVFNV8bT0cZ8EBX7G3BhkXC1FZ5ko9Ko/kiv8QkEnEg?=
 =?us-ascii?Q?QpGW971Po1CPyytpi0Osx6O8N2JtUZnbvVWSCgW9P3U0mOKdBjUeBI3jy1En?=
 =?us-ascii?Q?fXs6qZZ9f00dpHNsgJOgu5aWRhsb/RCu2OuHA7xcdrTvLqZ4orHAC3PaD2Rk?=
 =?us-ascii?Q?WDHnafbJzJlwkAA7Bf7Ac5ySNKakpb7XsU21jSd6ykygQCuJwQEKu1We5OoM?=
 =?us-ascii?Q?JRfPpWoVjroPX3z0h46kYdEP1n/D7d2caeiffprTD5GZNqg9EGeVU+vgyNnR?=
 =?us-ascii?Q?LfaAAfWPChXtNsB8Fgd7kYgYB1q3hlUDRoxdPcdk/z44VFiaV7mVkszlYchu?=
 =?us-ascii?Q?bYZ6VWnrsZa+okiigVgjAiMg/cWKI6f6HYe3BZxp4KHIiLEmRW8oRqey9Sk4?=
 =?us-ascii?Q?4rEP00ZJOI/D6NTGs3NegjKzhE60N6b3Y73dzJ/icfHOSoCLq9palGaD8K2n?=
 =?us-ascii?Q?VZ0SH7daqik4E92/0v7k6jw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be5224b-46e5-472d-7dce-08de1c81a0f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:40:21.2883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgU8i8qNRtOCQvuBnq4t1I1P5w8NIgkzt32ncFhYVTo8d16FvLYINJaVOa8095jqUOu6bKfyTBmBFMMOpRET5iPfHZAgyWIUSZ8lsHPyBG7nfobxqQRRuZNUW4njsnWu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

The driver was disabling the USB2 PHY clock immediately after register
initialization in probe() and after each reset operation. This left the
PHY unclocked even though it must remain active for USB functionality.

The behavior appeared to work only when another driver
(e.g., USB controller) had already enabled the clock, making operation
unreliable and hardware-dependent. In configurations where this driver
is the sole clock user, USB functionality would fail.

Fix this by:
- Enabling the clock once in probe() via pm_runtime_resume_and_get()
- Removing all pm_runtime_put() calls from assert/deassert/status
- Registering a devm cleanup action to release the clock at removal
- Dropping the unnecessary rzv2h_usbphy_assert_helper() function

This ensures the PHY clock remains enabled for the entire device lifetime,
preventing instability and aligning with hardware requirements.

Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Improve commit body and commit msg
 - Added Fixes tag
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function

 drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..5bdd39274612 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -49,9 +49,10 @@ static inline struct rzv2h_usb2phy_reset_priv
 	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
 }
 
-/* This function must be called only after pm_runtime_resume_and_get() has been called */
-static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
 {
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
 	scoped_guard(spinlock, &priv->lock) {
@@ -60,24 +61,6 @@ static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
 	}
 
 	usleep_range(11, 20);
-}
-
-static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
-				     unsigned long id)
-{
-	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
 
 	return 0;
 }
@@ -87,14 +70,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	scoped_guard(spinlock, &priv->lock) {
 		writel(data->reset_deassert_val, priv->base + data->reset_reg);
@@ -102,8 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +84,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
 	u32 reg;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
 	reg = readl(priv->base + priv->data->reset_reg);
 
-	pm_runtime_put(dev);
-
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
 
@@ -141,6 +104,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
+{
+	pm_runtime_put(data);
+}
+
 static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 {
 	const struct rzv2h_usb2phy_reset_of_data *data;
@@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
-	/* keep usb2phy in asserted state */
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +158,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
 
-	return devm_reset_controller_register(dev, &priv->rcdev);
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return dev_err_probe(dev, error, "could not register reset controller\n");
+
+	return 0;
 }
 
 /*
-- 
2.43.0



Return-Path: <linux-renesas-soc+bounces-8342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91696060D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB56B2826D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714241A00ED;
	Tue, 27 Aug 2024 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DBWIgqmJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2079.outbound.protection.outlook.com [40.107.215.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378F1A00D1;
	Tue, 27 Aug 2024 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751768; cv=fail; b=RSaRJwxWEA/bYNMlnEDIzvXNLLokoeKn/NaGYw9yl35tJItWhEwGlzeA8KHJA4SzrtHV9h+myD6x9So0ivK+arWDcNfT5f9LBfEt3Y3ftHNp2Dsbk038yjbhSldc3c9oCxNnkOV631H+lBEGQQ+/plDUc+Z/WFweSAL93GCz154=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751768; c=relaxed/simple;
	bh=lam3i1C/fKVtSspHCt8lTEW38ChaahKD5MaeZy0zAN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zv8VUe4Sw+8/sAZG/kYcgz6QOx+WxDZ1SSIR+vH9SDbWL15hPgmvxSL6j7pACeusrDB2MpCM/xmnDCz9B14Tfeb123D+6IOUc+LXFzW7X83cWPNNyRqsjNHHht+e/tGO5I+7fluVYw343Uftf9t8PeevyQKNr1VYPxDX2TISY8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DBWIgqmJ; arc=fail smtp.client-ip=40.107.215.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOrKxAx5dvQm7AJFPUlm+yw2t5aix3MSj2eU4YtDsPcs7fb3dR12oO2A9kn7nBK6lkQALwrmFgAIGZbIC1vGkwAFug7AJgYsiC3gGhwi8YFeUhilIhL/wlYJC9LL/UpIkbkhSSxJ1UNZkt4fPIztL/kruqs0J3oCJtC4I13V/UGtmfJkKEvsd/ImU7TZcdUjSvGJ3fOB4wwMSRmQmKZJxrxnahca5MqK6kTDPdJXjXXF6kyUjIlsAuYwGIqu73s772WUVhJwZVHPtXIuiahX0XU2TLv5L/EuXmBM7L9L+z7qV7E+HHZIH6zFo6rLDXYjly7Q5GAA/CS0VWZRVZbb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ClWPIRRFkyW/ETzB202vCf3b9EilvOpJIebbhY9/zg=;
 b=PRGzf6Qprip/x/g9raGWgQj33IWUS4tyxFmwNd01p3C+LhL4fzGmG6IyrF9K0jI6WH0isb9sPB4XCOXMm/Rnfm/cBIaS0y289MED3u+DhMrZ4LrNPMPDT+a09BUI8HWuyk7991hZWPNX9mwqgTXPmiqWiQ0VHK2K79clyACsSGXo7JoI+/Qq4tymafolAhJ3hM4vzaXt+4DEnfCfxOCcZALLNAx4MiFLWQpiqBb/1Pi4N4wntU/khmio6SezV49c5xPfmf8dPZsRrQOpG/z3DuchL9DjSBo01nKKIMtjkHQ6wlfPblxYEdSRR8DNF4oTlfDG+E5yRgsKWHoe+thDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ClWPIRRFkyW/ETzB202vCf3b9EilvOpJIebbhY9/zg=;
 b=DBWIgqmJuOD/YLZLMe1bpTHzxB6XeikJ2cBrppBOXc7bOxi0Qw/8jsKBJU5ojFAKeacKnmpjRyKhcj6nhcxuKmZh0NcTYyAOhrhDriObiGWv1YyytTw06gcH23owokP/L2gyg4Bx5mviOI8hXaQfDG1blQnL2yOgyuk8F+EVJB2y6rs1iQpOnjZ3HhiN7XBes+K5gdQ9BeRPwl5e562a1RbfUs4CpVvZb23OdHlMpdreBlZ7AVYkS47h0lkcMZEc4lSvZjwxLkKiWKck8M7AsHbQ/iMzTPbvKuSfOYzZSC/Ygd/uN3uUCieEdv9Cal+667TDyCS9ajNQpiT5sD10Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:43 +0000
From: Yangtao Li <frank.li@vivo.com>
To: clement.leger@bootlin.com,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ulli.kroll@googlemail.com,
	linus.walleij@linaro.org,
	marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	hkallweit1@gmail.com,
	u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com,
	justinstitt@google.com,
	sd@queasysnail.net,
	horms@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [net-next v3 7/9] net: ethernet: marvell: mvneta: Convert to devm_clk_get_enabled()
Date: Tue, 27 Aug 2024 03:57:10 -0600
Message-Id: <20240827095712.2672820-8-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827095712.2672820-1-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 3684bd01-5c0c-4750-01fd-08dcc67c99be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gPQ212Zl+TePH8gbqp9W9V6C8/EeV414BlYhiuHgW10a9MCJNrMza9nrPoa8?=
 =?us-ascii?Q?4QozrGToOdrTGAr1jpAQSd26Z0AKSBWgR5YMfajCu9GICBmssHk1Ebr9oO1x?=
 =?us-ascii?Q?IBKIBqyjdWEjZLSZKL7GCr8nJvSK8J1i34Z35zWygB49FlEeT8tYnbRZNSPP?=
 =?us-ascii?Q?iy3q6P/YASk2kunpkY75L5WMJg+cQ/gfFd1sPVDSIcygOkC7XH9NXdLJvOAH?=
 =?us-ascii?Q?kfq2IymhTFPJN/s1lgtIeQwtn5Dr4wNDZcyPGRvGKgcoewGh1HTHCxLWtWGW?=
 =?us-ascii?Q?hFBdtaLQfffRkPFhWx9AFNIWBO52aAF+5w8vREVXwBtl++J9p3G/w+hAumrn?=
 =?us-ascii?Q?dzPvYAdI9lwW8JzlQsNESG0DFVRC+O/hQfRvkoY4I6XEtC66NRbD1j2svrN2?=
 =?us-ascii?Q?im1ZNtny4+yxEcEXxwpKukqTIHC3iPO89WwqsB6ifKyt1HsyCXD1Ae2DWDLg?=
 =?us-ascii?Q?xSypO1NIMIUcocOqfjcV37bVEQmw848PTMps+YlqvzcshtsQh4Gvt8azB5zo?=
 =?us-ascii?Q?ZJ/AMObYSfaozBITJwuvcNh0oCthDyz6u07w8IokAWOWxiPYx4wWra8TIp+3?=
 =?us-ascii?Q?12fWuWgCIfsL0guPaPpW+g6zy1ZH/iYB39Xy3Sl0d+xQ4uEVToUidkZjCEiD?=
 =?us-ascii?Q?dML95uQnU34BsVkThVEXRpCX68XF4wRGrPUYstFVPE9GVIZv24xO8s+WinCL?=
 =?us-ascii?Q?AQe3qUKGUgYkG6MNepwMHkXnX1w58J1nds84bT4zgJTZuD2Ag0EWAlTxH1iJ?=
 =?us-ascii?Q?FQggoTQvR+/CT5vcV8Mh0RGlqaDOHF8M4Tjy3CeDNWlo/9+ElCiQ5jygwj9O?=
 =?us-ascii?Q?oMgu0S76PtHdFZVX3C/BpDGLcndFAoLh482xRj1iY2LF8BX4Nmz2EFYCG4xM?=
 =?us-ascii?Q?LAOsRTZUsApxNrAIt1z+yaaxZbDBHAdz7RLB+SOmxkStjgV1idw5bMa723Ei?=
 =?us-ascii?Q?OQSrpu4c6EyvNeAU8ZdlWCmVyHCjhpC3wHxzvA6GrLaG8F4q5VrYvqzWWxev?=
 =?us-ascii?Q?LUuGiVmEZDVkjh7yvMAJy9EhmX2ZysKZp+IQWAq96pccUV5UoHqazPi+xwMj?=
 =?us-ascii?Q?zMCrToQ8uIVJEsGfaT/9PJJUNY8nsNnxGve4PfpBPc4KrstZhQHhyro3ZQYN?=
 =?us-ascii?Q?03IPxwpS481QxoAjDqxk9KoXSdrKmzmtLigb8AD6HJnqQXLR+By71cOdfzhg?=
 =?us-ascii?Q?l3nqnEOyYr6224jLCemutD64GF7MYXKVRwnrURtnaWFBb0lkcZAz4vNU3QMu?=
 =?us-ascii?Q?ECIS3ZY+hASU8rBxqCEp3KqrVNdeTp/sM25LToCRV9eeJvwXtayJ85kwbVm9?=
 =?us-ascii?Q?9m7i2MMC7D2lOrcG623JedpcFrKt9AsknOSR89XY8Iaft8SG8dHjwi60bHjv?=
 =?us-ascii?Q?cnkg/sS8y0V/bJqvNmd0mO8lmW1cOSk6jiLxZ88SEFh0C/Uu1KvZI2Auh8bx?=
 =?us-ascii?Q?JLhMNC5IKHY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ohhRJ5IFd6w/q7Bug5h5lZYv6sAIvKVJT4xj62ie85pniHBt2YCP2yHAizm?=
 =?us-ascii?Q?CCLACevsJYj6m4kccerO7pNCHOg9Q6qtvF/hOQedyCSgPIJ/DdSush/SAHdh?=
 =?us-ascii?Q?M9ZdoxHVHXnLIcKF/BzZ/w4vyWwrO4OugNd0Icm1qKb4y+W3JCi6mf25VeD2?=
 =?us-ascii?Q?fnhG8jJY/vaVzdbnxtj3pt6XnQimiPRQccVYQN+GpM1HtZDuAoNB2med6Uoj?=
 =?us-ascii?Q?P8sXITRmopHwINDtROhyHmbSriqCW2kvCgVCnOGH/KyjPFNfAG+2kdkKxsF7?=
 =?us-ascii?Q?smUzHRmDY57iqaHwsrNnTwOCL9uc3NflEh0hW6RDLeeYtMQm/QQpwqQsf24X?=
 =?us-ascii?Q?WjAmirdnsOEUdGyuskSjdxvoElP4jQ92xlDZJgDFS/FZWj4QbE3SFGYK/NMQ?=
 =?us-ascii?Q?hbk5eyDBRXll7cT98pKYnnkk+JOjZu88VWiEKce5fZim3mkxGyr5r3ZoCZZv?=
 =?us-ascii?Q?3OxkjquSvMmMGkcbUEfSsS2Y1Pr6sFStkdAF5KXVTF5SE6DKc+9EV7ZvBM22?=
 =?us-ascii?Q?31wNfUIyAmTp7ux54qopkwih3li+JjX1oE8x+PFLPLyPf6xUEhJqffXAP9M3?=
 =?us-ascii?Q?KQ3HeHK0wdzXHvIdokPXLmspjNLR3N49sLRIjlElM1bii46bSLtZJRoRPfhS?=
 =?us-ascii?Q?gelnq9R05PWo7Hq9LdE6aBblGzs3ItkQp3I/gpUp56OjTXCZm3wX3IlNsTGv?=
 =?us-ascii?Q?gyGsc9jxuKpGtq6MygTQXMnlztLj+dwdJ6RB2aNYQhzgmKfnECjwqHsQAiUq?=
 =?us-ascii?Q?jJLMyVoY/QwkqeKPVu2snX4vhVvZEI6w1rIW5lH5aStX9YpzUlVfWT+tvNwx?=
 =?us-ascii?Q?8r6MSSA0Dukn9xvJ90et+mqGt9CjR8/Zt9bPyrNQDE9Z48gxuq0iBixd0IE4?=
 =?us-ascii?Q?DKoDc2tIgZOO1mjsb4aPhAjVY3vIpztqEpyGkQ862r+zBvJ+1Lo6iW+Tredv?=
 =?us-ascii?Q?NM0IV2WuSrxKun1n80ZAPkGou9LmBTygZ55UtF+IgCMvcXEPivgRlFw5K/nu?=
 =?us-ascii?Q?TWx/XSCK+wYYzybEl40zHy2frOL0B3e6mzA61z8ov1mZ97P33jReD2UECLXl?=
 =?us-ascii?Q?PgtezUkucRJXiO5VSvEHiRlg7GDofVFcDJyIWO6+MRYIgLjc9463ax7/wQdo?=
 =?us-ascii?Q?dEe3u4VJDnVxXJA90V+25gdsjfg+A5DExUeMjvth/YZpAnbk7ILTpWF8tppn?=
 =?us-ascii?Q?4lvQd679V5GRBFKEvLgW+iXhULF/V+Pf2vxnp5g3swXVlXMELVDIS1iAMpPJ?=
 =?us-ascii?Q?me7S6GbUVe1b1mg2w5uEJuTgVqXGHfBtEHkksUd8/J/Dw5QjSdDzZkLKx2uf?=
 =?us-ascii?Q?y7MeE9gi/EGrqJdohAKCMtS4H6uPz76YB5KRJM+q8GRqFH1INlS42YA+tbT1?=
 =?us-ascii?Q?NLaT5jG0z5BQmCVATjXJ3S8tnJrGwMHmX//4Bkj94xOeBGFlWrR+HU5qqwFr?=
 =?us-ascii?Q?j4OT0/TyK1UH3EJzMqmelCebWgbzwbOcoQX+djhc5CVFR7E2TCqslOB20vJn?=
 =?us-ascii?Q?x3fYJEuMH4VAoTNhTsV8N5kP3KFB5kl5b7BiXOrm4avXMR1UrCJ3iTze+3JC?=
 =?us-ascii?Q?aO0dwb2LqDy2iMHcCKbxawIcxHobY2b1/M3nXgNr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3684bd01-5c0c-4750-01fd-08dcc67c99be
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:43.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KOexM5VaI16l2iA0YCn+NYlXjux3aEEUDL9dq7DK0/NXEt83YWrUvFeXCezYg44mPFymegkhqnHsanel18dzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta_bm.c | 16 +++++-----------
 drivers/net/ethernet/marvell/mvneta_bm.h |  1 -
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta_bm.c b/drivers/net/ethernet/marvell/mvneta_bm.c
index 3f46a0fed048..bfd1ed12d98c 100644
--- a/drivers/net/ethernet/marvell/mvneta_bm.c
+++ b/drivers/net/ethernet/marvell/mvneta_bm.c
@@ -411,6 +411,7 @@ static int mvneta_bm_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
 	struct mvneta_bm *priv;
+	struct clk *clk;
 	int err;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct mvneta_bm), GFP_KERNEL);
@@ -421,17 +422,14 @@ static int mvneta_bm_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->reg_base))
 		return PTR_ERR(priv->reg_base);
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-	err = clk_prepare_enable(priv->clk);
-	if (err < 0)
-		return err;
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	err = mvneta_bm_get_sram(dn, priv);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to allocate internal memory\n");
-		goto err_clk;
+		return err;
 	}
 
 	priv->pdev = pdev;
@@ -452,8 +450,6 @@ static int mvneta_bm_probe(struct platform_device *pdev)
 
 err_sram:
 	mvneta_bm_put_sram(priv);
-err_clk:
-	clk_disable_unprepare(priv->clk);
 	return err;
 }
 
@@ -473,8 +469,6 @@ static void mvneta_bm_remove(struct platform_device *pdev)
 
 	/* Dectivate BM unit */
 	mvneta_bm_write(priv, MVNETA_BM_COMMAND_REG, MVNETA_BM_STOP_MASK);
-
-	clk_disable_unprepare(priv->clk);
 }
 
 static const struct of_device_id mvneta_bm_match[] = {
diff --git a/drivers/net/ethernet/marvell/mvneta_bm.h b/drivers/net/ethernet/marvell/mvneta_bm.h
index e47783ce77e0..396dced914aa 100644
--- a/drivers/net/ethernet/marvell/mvneta_bm.h
+++ b/drivers/net/ethernet/marvell/mvneta_bm.h
@@ -94,7 +94,6 @@ enum mvneta_bm_type {
 
 struct mvneta_bm {
 	void __iomem *reg_base;
-	struct clk *clk;
 	struct platform_device *pdev;
 
 	struct gen_pool *bppi_pool;
-- 
2.39.0



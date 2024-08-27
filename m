Return-Path: <linux-renesas-soc+bounces-8335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65F9605E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCE171C20D5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28BF19AA46;
	Tue, 27 Aug 2024 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="agZPeJY9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2067.outbound.protection.outlook.com [40.107.255.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965501990CF;
	Tue, 27 Aug 2024 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751738; cv=fail; b=cXObVgtCtdPgKRW3H0sRF4MxPLhQn7mwWM6RkPQXpfqMNnJiysp51D9FKihAvxZ0DRalJaxq5tIOqhoWr1+DgNwQFzJova/mhTmJbbEYLTsMUxpXfg87bMNdh9l0wOKZ+MbhR6am1PDHeK+F/18R4DoHOMJBmF/MgStEbdZysG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751738; c=relaxed/simple;
	bh=qzX90cQ3dgn1FKIhGuALoZ2Cd/qZjTfSgbkVLjIK7ok=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mKE01l+ck4mkmp4WJz/f/qFrLPV8dGZnwprvfNH60GHRA7iruJcmpyAYoFgQqhswH7ZZpE8ly2W6jHg4QzVVvjpopg0U6QTp0Gh5Ym2rrCOFq6m9+sckHq68RSmA53OMGnH0eBR4uhKae6hrTCginMCxkwkDJflzP2hmwr1md9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=agZPeJY9; arc=fail smtp.client-ip=40.107.255.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LA73LjIKX4iZ3EkHzQM5Nt9wW9d8eB8bWhhYy32pQDNoIEa/A3rKs0W2fe9uZ69C+dyxZ/2h9wcWWy/bwcWZrhvzEj4Tn6rYh9uMxcbgcz+bGSVX6He4nqd4e8nb7c7c19WHxtWAVVOkY307itO9etDKZVfzXxuddZgi0shynXrisHsmqD5sCZRu0ugz0o3btsvFAwhKjkgQ8597yKu9MPvUsDkIMaRpaRFUW5Zf2fzIc9gwPfPyx4haKGDNt55A+meprCxGIVMccIkAjbhdYKsZ62N76rQ0OVsodhUkJ/o383eS3L4hMBYEG+UylczWCEtW3csEJwsZ11EToDDPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1Un8rgKPePWZwa/WNPkPYY+kfWETV595zTSzgM90YA=;
 b=vFVaJ3JsKDyoSVMxeVEb6VX64xFiccXK/va+ebbfnnhWToQX4PjSKB/5hPboVe7uPZ0ChEk50/PwoN4vSRxoiX2L7T8ry8eNExhBZLebA5sZCZ37vbXZGlYcmlNdtcXhqYl+8Qf1bq5S0jgqbv1blkJdhGVfqZx6PBRaaTzYszOHCzm7s2+LWT7a+u9HI/vZN6jq9vRTzM2IDgqsrl13vseMmTtz2sHxvJlQektm6cT15Bhjz7J2DZTLJtK2vtZcJD4r8wZ6o/RvrO5cRYkJL2LLk40qEno17ExN0glGtK6WZ3TJu1FTG74scy8JcqFI5WK1vI3itWMpGuBAIGVkcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1Un8rgKPePWZwa/WNPkPYY+kfWETV595zTSzgM90YA=;
 b=agZPeJY9FhT+e/7845BXlEb1hv0tHA11mc2CQHMHaJ0TUdBlUfeOrntXw5nBw15JEOGh+GDG/qFD6lTdlhXjCkXxijJLgccDdq3uC4OEoyRrrTH+7pwCUgPDzaHMN/t3iJ8XH3O/mGLaen/GlyddNAcquWqgP/YhIbRX9W9MeRLeicyNSOcCn7LSZRuNvJmgPtiL1BbzKiQ3Ciwx57aV9NgMsFT7lbPCei9oM3AxptyRDQzMg2ci5IBacCmmykMpAW+hwZ4Use9LeRWM/cc6aV2fMGdQafoV+N0NqkXfRFKOmv8A3rT+NQVsW1t5UKAzP7dsjJc1YiTRaaS0uSJY/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:11 +0000
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
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next v3 0/9] net: convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Tue, 27 Aug 2024 03:57:03 -0600
Message-Id: <20240827095712.2672820-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 1b812c2d-fcb2-4904-8ac5-08dcc67c8637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PiUZhVsF8FUr8nx6nU0djoHI8v2vmUb5DX2dq7nYVRnvHK5IYQ07fFmczwBI?=
 =?us-ascii?Q?3I79g54fiRy9kXKbyv0gUXc0LNBJjKpsS9gPJLocbVNEuY0EM5JwiwhR7I5+?=
 =?us-ascii?Q?ga6ofchfMJ6e4oI84Iksr4V0W83qkrImSSSxf5HAkUYMRKrZaSrAGd2MZ/eH?=
 =?us-ascii?Q?NnPyBC7bjnsvLRPUGfu7eyx24Ak6RdlY8lYEV6rbp3FIYGvWDW5Hgavx0E/Q?=
 =?us-ascii?Q?OS4HuQhpGwQQa8qegroBclNoxsABEoyKZY/r7BOOBJ5Lv+E9YXT4xDxdhCGJ?=
 =?us-ascii?Q?Q1V+4X4TVDnv9wpZ/5xkLLFXwLBdi5sGJ7xj4k1LyTnPWKSrzI3VU9UZ7xaN?=
 =?us-ascii?Q?jzf+PO4zDbLtI4oqUjxmcGi8g7Qm2avdCRQ0mm9cDDuXSExV+1FFM4S+3mU8?=
 =?us-ascii?Q?1S5pXYL+s0IGMsLfz10Hycafc0UNLEqVF68pXXaXkEq/f+xHVni6s1YgQV07?=
 =?us-ascii?Q?bxNNZjjHO9BdN7V4+jkkWnT7Ql5/xGJIRBvvMQDzC8EsxpFp809rSCXQtuZK?=
 =?us-ascii?Q?kjWoUrA2ULCXFtu+XtI0EzzhsElqwMxY96iiBOYQtqwlyFt0Rj7uXSgTVPjv?=
 =?us-ascii?Q?l3fncuPFXl5zzR8Gg/OrDz5lp1n4q+xojqNdhYi9KSQQtqRiIh05AUpGzTpn?=
 =?us-ascii?Q?kQnNGvkx89QoxP0C55KMGEG/DFI66OPejt8CwGRFLCV5zJnDNGmd6vwIyRaA?=
 =?us-ascii?Q?p+aS/HbB0uj+9zNCNps4RwsHW4xSQgroHWmiRAciK7zv9Sai3oKT71hOR52S?=
 =?us-ascii?Q?lH1kszAxFluvmUo0a3D5zGTYgEiGJaRnUjWOXDfpWtV8iP7c1Ddej0X6SV4b?=
 =?us-ascii?Q?ArJ+1ewH9qLwE+E8/kzoJCGtpchOY5J5NfZf9dvtq+ikCZwfg38NeE9no9sz?=
 =?us-ascii?Q?Qkl/ABBE6bp/aVbxUlw5naHpe64UtwZVnCHJ1cfh96iXALPOzPFHWXDsWAw6?=
 =?us-ascii?Q?Sh/7t33t4C8K/UVA6gsa1QBo4t4ZbptCcrC0rueK/g0UWjunodNz/XZcOxIx?=
 =?us-ascii?Q?UAl9xIcvYgBtGpcQvkye65LOxAhiNw4cOLXi1ZNoQTyrd12gwvkzOS4oOT+z?=
 =?us-ascii?Q?LA2oUvALFjKmOZXpqKiVdqKpMJGocbIDuUK/fk2d+aqidheEEUJMb9Lcfl3L?=
 =?us-ascii?Q?w3+Q8DHAu9o54wOPeWPd01X2dmkZXavZp9Y/DDgiR1s3uCW3IEqFaM51x/GN?=
 =?us-ascii?Q?NpbHfeyG09bkcMybDotzIXyJh71PXsYuO9kiv5d/vL0fZwf5QkC/KBv5XyEP?=
 =?us-ascii?Q?q/YpbQWlGP4UXJ1UYU/tuEoeJ6csott/d0QBgPjJPPIDqYWokhDeZuXtcDHj?=
 =?us-ascii?Q?fL+t8/rFOG/413v6S6zGGGVAoeLtSk6A3eRxebOVMQPMoh3tJBqWPvDFcnf9?=
 =?us-ascii?Q?oMAS6qHZKeWwYb8hLkCLKpLr9MBbdxSX4EVT7uZzbvx62p20ACZq8XvnfCUb?=
 =?us-ascii?Q?MiCwiqWAcgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Lr87sM9d+4beG91OXDO54mKQy4x+1Sl3+x1fjcl/MrsVLIxoSVyv1jYSU9h?=
 =?us-ascii?Q?uTSl3+tVCNw1FJMt0UqHaiVQaZ/bzSvwoeVqHaoeUOJhUyAb8IWzN+1BCCfI?=
 =?us-ascii?Q?GvcbPezZaDEz5vD7ly8wb9WNIgP8EkM+G68psHmuAJXZyO1ScS3wcKV7tEGM?=
 =?us-ascii?Q?4Gwmfi9mLuzi+xZ6puvosnVtYsncvLjYqyDHln+3bUt4MgJkMR5D2CsmZjft?=
 =?us-ascii?Q?q9ikXf+xgjtEIYctpKztXJmPjxkCFHGjgHqxJu0y2bjZNKvJSD0wtAUFTnSN?=
 =?us-ascii?Q?p18KplEQI7XInf7pjOU5y13ru8K2JFm35zSSZCK283vk5qBx9guMRnc7N42l?=
 =?us-ascii?Q?slNB08vChmBxy73ZjUrpYVWvk1ocmW3utIjZRrZeztYDwPIgnpyjnmdU0PdS?=
 =?us-ascii?Q?flChvBoqxM1qu28CVYPU2arglaOabODjxQzPNKq24NupXj3o9dCPQvunoY/o?=
 =?us-ascii?Q?xY2S46fdgnv/oCLzbFDkMQC5lOQYuC5h+6LBLuOmXEAdtGTUY7to3kFBlQL5?=
 =?us-ascii?Q?+nzE/I0iDkVSszV3zeInt44rYs/bWITV8O50O79tv7PXjk09vRxzvp3kYtlB?=
 =?us-ascii?Q?2lvq8FaFUn2mailtRlb3rb6LKkNlOe3r2v1LlbnvPzS7jXfcRVSLM3Jsru7Y?=
 =?us-ascii?Q?1IsC5Vn752mHWJfpawRDFNMPTJrp79dik4Zl8HTpU9aJJdvHZmlOmrNVgRMW?=
 =?us-ascii?Q?CN+3z49Q6Cpwb0Wde6jkH/Pc2IADxio9jILKIZ/II6d7M1l4fgZSx52+tH5H?=
 =?us-ascii?Q?8KtLJt950A60IOpVGg8R14c6MLlqyvCRKG25ylnCM/sxF4ntIN5XZsASCyLL?=
 =?us-ascii?Q?NbNe4Z1c661EqRuKKB9AdS7KkTsXfXuQkhGBrpr7O6ko/67Bua+k/jAgeZ3B?=
 =?us-ascii?Q?6VbHLLXEmLkHv8hrEDdbAoNlR2OgUJUSWIAkNIJru8+zBFt9SKSukDKn2Zdr?=
 =?us-ascii?Q?M/xSLrtCwwPFpd3zcz5Avl2gmp1lhBhBTvrUHzKoB2E9v3p3qq/4nXNvlc8p?=
 =?us-ascii?Q?eOZlC5BmA5Erlxyh3FPhebDhU/1MIGAWNdakpCHerI56tIF4J8+k9jusJ5cA?=
 =?us-ascii?Q?6bRWU3G7KNB3hrYkbJ+lAcS+/eOYbDF0czsVv5qo9Aayj+irJUXzxmVmJZ1E?=
 =?us-ascii?Q?vEvyreN0j7LF08xfhO9e3IpO0LTZUSQUgYcz8E+tbnz1QGWrGg48ZcU1KUXX?=
 =?us-ascii?Q?Hzl69L1iYWGjpzJJ0UcsFZmVbsgc+QrlYaXy2RpssHKfV/IZluBOcGcPzcy1?=
 =?us-ascii?Q?Xq6XR1xpWiFgb/d5ARigytLczVY8uwGybHb32azPfDQETCLwhbA0Esjpj0pb?=
 =?us-ascii?Q?tBLTkdoKcRVAHuHJlGzoaLd9hskz+KwZlm02TY56CTkq/yvrOvPfTJWh3TDQ?=
 =?us-ascii?Q?85wY5K630zwvHS5fW7CQJUdqsk6/dJe/1hihPbFQJoqrOyyqLOLhhZ98Xd+2?=
 =?us-ascii?Q?ALaVhelGye3phR+rFU8iOlSRWtcpcAEVso/qGSxpG89JOlftWKdNfgd/Z045?=
 =?us-ascii?Q?51sZCpnFlqRi/HhR75B19br6UhbFoHAiUcJ/7dIrh5PJw7jDf59e2bLTeuid?=
 =?us-ascii?Q?N+5W/QDj1MZ/teF+d0UWgg8krKP/m473SZb2kQPq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b812c2d-fcb2-4904-8ac5-08dcc67c8637
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:11.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSxrNo/IzMnaGs/KonjUBvXs5zWE76465Ct6585GR2jRkG+iTnIEeNOHEky0rEzVZ9vNKjM4D9ZrrnKPfCzNIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

This patchset simplify code w/ devm_clk_get*_enabled() API.

v3:
-convert to ERR_CAST
-move clock variables to keep lines longest to shortest
-Reduce the number of clk variables

v2:
-remove unused 'ret'
-fix incompatible-pointer-types
-get rid of amount of variables used
*** SUBJECT HERE ***

Yangtao Li (9):
  net: stmmac: dwmac-intel-plat: Convert to devm_clk_get_enabled()
  net: stmmac: platform: Convert to devm_clk_get_enabled() and
    devm_clk_get_optional_enabled()
  net: ethernet: cortina: Convert to devm_clk_get_enabled()
  net: mdio: hisi-femac: Convert to devm_clk_get_enabled()
  net: dsa: rzn1_a5psw: Convert to devm_clk_get_enabled()
  net: ethernet: broadcom: bcm63xx_enet: Convert to
    devm_clk_get_enabled()
  net: ethernet: marvell: mvneta: Convert to devm_clk_get_enabled()
  net: mvpp2: Convert to devm_clk_get_enabled() and
    devm_clk_get_optional_enabled()
  net: marvell: pxa168_eth: Convert to devm_clk_get_enabled()

 drivers/net/dsa/rzn1_a5psw.c                  | 22 +----
 drivers/net/ethernet/broadcom/bcm63xx_enet.c  | 47 +++-------
 drivers/net/ethernet/broadcom/bcm63xx_enet.h  |  6 --
 drivers/net/ethernet/cortina/gemini.c         | 25 ++----
 drivers/net/ethernet/marvell/mvneta_bm.c      | 16 ++--
 drivers/net/ethernet/marvell/mvneta_bm.h      |  1 -
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 89 +++++--------------
 drivers/net/ethernet/marvell/pxa168_eth.c     | 17 +---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 11 +--
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 ++------
 drivers/net/mdio/mdio-hisi-femac.c            | 18 ++--
 12 files changed, 73 insertions(+), 221 deletions(-)

-- 
2.39.0



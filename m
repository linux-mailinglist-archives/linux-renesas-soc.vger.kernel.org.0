Return-Path: <linux-renesas-soc+bounces-26219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36601CEB864
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 09:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380B5302E14B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 08:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D4A31281E;
	Wed, 31 Dec 2025 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JeaHWj3b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4132E06D2;
	Wed, 31 Dec 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169427; cv=fail; b=TatO3nYNqnaAkUqTKMKu6mor7FF3A+fteW8T1C58EuawAMQ/95cpc0TjyNvWKKKfXOaTfybCgw8K+jvLnoP3qXXigtcRYZTSqAFOeR6a5B1FGSY+qmVL4vYGX9s4D4gQwRUUwG3ngNkT4NAzzGRd4vpmgIbD6A6nKKyr4MWYNt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169427; c=relaxed/simple;
	bh=UT7KQZcCqdzYP67Um2vblnRjq/KRq8SsaPeA/1m8V0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gcc1CKH+gP0aFCjw9MaFqDkXqhQ+qLewT3TJkCGc3EIfdnPFB7cB+B27Dh9s/VFyf1z6lC5GlghPWOzJwfHBZUUOEdVOAOEBOwTFGBmRwNGNAfcCIbUEP80jLFiWRoyxKNFzjc1lq97iPAu0gRwShlYAPgwxg8Eywm7HJWbqGYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JeaHWj3b; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odNfsoEGwyDnWXXg+hD//SwalVua5O/WeKK+xS7+Ctg6H8LhA8dJMmWWTAwZuY2cqZ7G/DY3IjrzC/5PujEuPkISNm9sudu0F/0DRFlrw14d4eZBfrZ7kQQsakdGeNdFF3CKLPEUhbcTP0YQI4co7e8XKdqIraxNArVi19saZUbuxI2Mn74H/K05LnKnUsteSC14jr0KwBz6MEI2C+8uVGbHQ/oScEI9dJKXBmBdR+v8U/K4U86NEfTgFtmDUii1XEVhMjtN7WcgejTtZrArhuzPaEMeocyjoTsLrdrXOB79m8evcE6YS6IM9cqhtdR/Uch76Ezn670WzysKVcn4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbc4JkgxgyNW+RRczO3u5ssFzTw/tVVjNsAW+2iWqWM=;
 b=FY08WFpWKG0oXZVsyhsgTMbqrmFQjrYxiNMNN0MfKdXa6oYaKHQkduCoJOBv0hUjnZf2PiAtsEMnzAzCDtDcMlKNjgIuAQ13u9tR+iH8OHRzUSbRcOMwjXuHBVlVpUFNdJhFJmWBbPI4tzCHQF6KZ0b1DrrDaMYJyWRgndi6OpIro+qhZdHNxBr9XaL9to8JRsxUl67u17oqdmN3hcCIdyyMZuu0QAUfs8z7bDqgCHhwAaGMptOmRvecEmFmBnBLGWcS1gJaRm5g6ca0ZwhK27KmwvrxB8GXiDSmoZRS7JGw1036SXuCVoeuluBo0pM/Iu88BHFHGhDYkJweo/oqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbc4JkgxgyNW+RRczO3u5ssFzTw/tVVjNsAW+2iWqWM=;
 b=JeaHWj3b8veT7YHLVAszYYYDkHklOUCvp+vlqwN5P80cU5ha/i/Ko30ZWeQzEYwjfI4y8ffnsHSmyJ3Xy4X/SrDeLgBpKV/D1VUQ3vXuXkp1VhxbGPoA2gaS0B50Jl70eRWcMZWU7act4hvqC6UeUp8N0+IdhpqPKCZwwF+xbGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11751.jpnprd01.prod.outlook.com (2603:1096:400:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 08:23:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:23:38 +0000
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
Subject: [PATCH v3 2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
Date: Wed, 31 Dec 2025 09:22:59 +0100
Message-ID: <f0702299ad640c70fd7bf645c29c0fe86da4f2a2.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b11fe013-109b-48da-c799-08de4845e5bf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6doYkir6fFN8y61vzJs9992be6w5V4evTZlw4nEY0p6pR2aBzIwzhNcKZptA?=
 =?us-ascii?Q?AE07BZB/HuqlRtN4GH8TS8R7I+S5/gP3lggsxzui18R/c87NlMIWQ372Qmi1?=
 =?us-ascii?Q?bsUIubwlcy4cCZOH24zTJmfGz1oaE5j3sGh00jAT+sAEZw/MbbB7VRTJNGWP?=
 =?us-ascii?Q?hydlf6T674w9OylMyWiqosoV4nlheHFAtwbgeIusqR6f0M2pUy/biPh/IzX1?=
 =?us-ascii?Q?LYpH5Y7JcrIzWqQ/aRipISMVsVJznvp26BusYm8Z0eMFyhaVDGo0Fb/DOXOU?=
 =?us-ascii?Q?Xs/SbugsFLxzeF9hlIgQQpBcGiPAkSsp1JRd2ndWBEnkG2G1ksWqu2C1i3C1?=
 =?us-ascii?Q?ZifywFQYRBcNQxWKvOaafSm7ruxkAqUVJpasX1D2cX5sEo1pAVWPtk0KskgE?=
 =?us-ascii?Q?tEJTOT7zH7HLIL1cUptK6128WWn/J3CBebRD0plUmykjdw6JUY67FrZzgju9?=
 =?us-ascii?Q?jxAr7Hd5vn2EG+n+fa5vDbhSKpRtnsG7t48WefeX972g9BLNACtXYJ6vXcgG?=
 =?us-ascii?Q?RvxUpsuBEcMH4pc8KmrPZrbofgW2BCxYRxYICSjgZnj29bSuLxFrf45K1Bcq?=
 =?us-ascii?Q?ZAOT+dUykVpCZI7hFj49rNdhv7+9QbSNrR/8XKV0xaLCawlffw0twAYeXx5L?=
 =?us-ascii?Q?vz/YjvizPWMdlpkHlTXwnrRRzG7Qb98OoRa2jSjFbqyl3UZCsOJkzcSavpin?=
 =?us-ascii?Q?ZM5I+Qd1qkjZy+YquN/5vADPGrUUwXZmAtjFRrANxBgIsR0hcwAjt2RH8FUY?=
 =?us-ascii?Q?dpi4QhHCr2D/BuOcefTz+tikzkkCDYOrAehUUJX9EQyHJxecHC30x17FCxAK?=
 =?us-ascii?Q?GoNrCyo0q6qdtZY6gd8aLyhPLgfRlzDSMKyR4B8eKlwIziYrkiw3koVV+a81?=
 =?us-ascii?Q?/iKcP5Zu74eCkV0Ym0Jlwq+WGzQfUpXciUd1z0v/o2kRTexRLMrYBGxzrQay?=
 =?us-ascii?Q?c7ZwTnDpXa/3/BgDt9AKNFcfVoPdBSZy9LfWpIR2HXX2hzK3oexO8NaEvg+W?=
 =?us-ascii?Q?OW0pKvz8aw6+znuWzaQZUSnqsYJf/0L1BNX/eXJ1wzUds8Bm3z/Fltvqe7lA?=
 =?us-ascii?Q?zxEGgHyI4uCPsf7HjOSZ9sg1Z/GErt5pTKxRhv724+C9tWlarMJEcfweygH4?=
 =?us-ascii?Q?LzE1rL25s+S1MHRw8A3IX4aE7J9kYpGy2ovwaYBxfd0K74YIWMz+MLn3nFlU?=
 =?us-ascii?Q?JDlHBzyMsQewL1Kt6CL3sNpXppa5r0VPwAd8VxmizH4zXlEOn+28D8iRGEi2?=
 =?us-ascii?Q?Z3gf9etB8EgpsJPv887H0W/WaKjcJXZbMYEJ9tc4WYBIVkmQuzAT1SSxQhX0?=
 =?us-ascii?Q?1t2ormK3soi0kcyHc//0qXzjdElWS/sJDiqbUruFKq6c0qzsQH284sBDXKxn?=
 =?us-ascii?Q?OIiIiSzXkuLPO3upsOuX8fmhUlFNMC5VnP36HwCvJYdjTjGCFKqsw8IpbQkz?=
 =?us-ascii?Q?KLCBXfHwoGh0qt//ooNCwutICUIM+4PBBJjl3wc7YHxxbC9tffu6Ow+o9xTT?=
 =?us-ascii?Q?/c4qWj0Eblc0YullwN+SiQkZdZ4pijb9A4gM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4YM2U6ri0YU+iPzqWi+P8YDJDDFV0A6t3wmpSL0G4qKppZUe0CEEMP1cMW+U?=
 =?us-ascii?Q?BvXwTbZZ9h+xExpyoXu0eLrMfL8q43b4rKHpfn8OjqtQg2OjSZ5KZZfrDu6A?=
 =?us-ascii?Q?emr1Lw4Q3SB1RhownVAFdML072yIxdKXofE0iTcPBoencEHB1+ZxKA++L7ck?=
 =?us-ascii?Q?+wtYWVTkBG6rcWcLmDDP8K6vtZTRDsEuiwh0Ln+W5knAhSzK4q/+T0b4f21g?=
 =?us-ascii?Q?RAZn6OUFG3WPqYQIp3ZK3nPdew1ZwruQKlscX5JMZ/Mrpoe6RKstAg4Q7u66?=
 =?us-ascii?Q?XhC8+dk2vIaoAITc7jWWLyOOWyBn03bbIvwSBXyh42+1UIfX7A5/95mWnvxw?=
 =?us-ascii?Q?iUjrdcl7ZwoXIJPu/TwlGtaCEMGqEnPXw0purddfGDJE3a9HPGhENJCryFHu?=
 =?us-ascii?Q?mhpiZCCNVuvpt1OiPnxV7rh4bQEM+xsvE7sYrFFe7w54WViTmlMnaImGlcED?=
 =?us-ascii?Q?gWji0BQtKVejhIt4CxdRSkIhaeiGJnPrC0JYADbMfaRe0fgOF9CIlbHIfJ5W?=
 =?us-ascii?Q?uP7RxxfGfS/bja1mUUbfdWch0BeTj+fq+iP5YyH2yOZGiAI5+hDxp8vq0i5V?=
 =?us-ascii?Q?be5Fvd0DVVWaMhZvc6U4sLEST443ALCiF0pqmxIikw9TxZ0rUo5rOQh3ef/B?=
 =?us-ascii?Q?eqNCp3MjokgC357DmA4+/TUF4TG4fcpwPOuZQYg/zIMjfiMUNt/BIMh/qH9S?=
 =?us-ascii?Q?ca2VHD1Lgcje+HHu0uV5lLX4Fv+286+CRYW9F1cE0e0pSX3Ed6Lq4vsBkv4v?=
 =?us-ascii?Q?XdR35HcEYZazqmLRjz4pIFTMMULALH/Ijw0Ksnr1AMVVgxWbyBvlbiY2rfnQ?=
 =?us-ascii?Q?LYBnAtelo0Ypnsk04R0ciPK105IiuE0aIr/5Q9vqoRYr87g1yYwpXKRghqgu?=
 =?us-ascii?Q?bsFEzBVha7D61vGrtsiVhBNrmRymuNnXHUnwVb4Nk0gtTacIJ2HK/4fR7C5V?=
 =?us-ascii?Q?SWuzknkbiZtmexiFUQmZmiuus4AZn9mZ7uJXCRt/GYsvi7FTf4z6nL/MIjwP?=
 =?us-ascii?Q?JnvBuzN6uQzrnez6Zq7H11biDz1figRpadeYGLT6eEe0P6BIFxPik/Rvi1gN?=
 =?us-ascii?Q?usq7gQH1jTg4VT86+tVOZgFkzDFYX6ZWKOQKS0KTyJFX332nNmhIVHFMYHD/?=
 =?us-ascii?Q?o7YNHufhpsUExJdZtvtLuC+0TG6Nu+CXq+u+ENUnnQdENw2Gn5N1qtBQRPVA?=
 =?us-ascii?Q?cZwLJcZ4Ie5LSK+ThvQ3oSfnrWsH20XSelbztpRpgKMsaaCko9+Rf+uz9ZOD?=
 =?us-ascii?Q?I8EHcBNm3xkMPJd46fW5rJ+rdeWHU3tD62l0yVQ4rciU01sN+Bm/5mjXlNBw?=
 =?us-ascii?Q?HMt0SoxhfN7dcF65YcGf1B99GfyEx+GEN1DSN/RBLA48aJWB4REbYQnFINdi?=
 =?us-ascii?Q?+RNQ9iXaG8hF3d9rjZLWG0IAkeQCvsBWwxDM/ng2/W7SBNbvbWmJAR5FC4Ly?=
 =?us-ascii?Q?bRSIgHyOASLqR6VCClLeCpfivGHVEUn6+G0Ilty12E3uQ3upN7y+EF68VWRf?=
 =?us-ascii?Q?xZmzgJhNQrUwhlUD7ys6MSyvplcw2m/SMC1zqCVW1bJhf0NUFFV1ZUrpU1NG?=
 =?us-ascii?Q?lvckqGdz4cmbdzWOfKxUciVZhBSNjMEWpM4CJMXrikuSNEnrzi4DxVzT7J3D?=
 =?us-ascii?Q?obhsl/z2DNATRF98YDyn3h9Fb/epmfxvZKG+Lc03WGEF/xC9UKiNbDiFkKuh?=
 =?us-ascii?Q?aEjlkIQEHR1blA1h96Xl+XgZIzL486GW0oqw+Yd5u33CboR5kfB3/rmrpArv?=
 =?us-ascii?Q?Um3BteUnYTUUMqcK/nVOEEJftF1ic4r8v9aUeQ0n5XOoTQeDOOfT?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11fe013-109b-48da-c799-08de4845e5bf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:23:38.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjDvU8M212oSnkGvsho7ymy9QqMEiycTBfsT6xtidhX+slO+KQgTBftRhel4UcWjU9oKVLmgzpsQD/qSda68arsADZduQpzbEQ3ZHi66JNURHWXdSuAlzQnSq9k+3GgY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11751

Update the struct renesas_i3c to store the clock rate, presetn and
tresetn handlers. Replace local usage of the clock rate and reset
controls with these structure fields.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Collected FLi tag.
 - Improved commit body.

v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 39 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 1b8f4be9ad67..7359f71f78dd 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -258,11 +258,14 @@ struct renesas_i3c {
 	u32 free_pos;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
+	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
 	struct clk_bulk_data *clks;
 	u8 num_clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -482,22 +485,21 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	unsigned long rate;
 	u32 double_SBR, val;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
-	if (!rate)
+	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	if (!i3c->rate)
 		return -EINVAL;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		return ret;
 
-	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
-	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
+	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
+	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
 	i2c_parse_fw_timings(&m->dev, &t, true);
 
@@ -510,7 +512,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
 		else
 			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
-						     NSEC_PER_SEC / rate);
+						     NSEC_PER_SEC / i3c->rate);
 		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
 
 		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
@@ -518,7 +520,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 		i2c_total_ticks /= 2;
 		i3c_total_ticks /= 2;
-		rate /= 2;
+		i3c->rate /= 2;
 	}
 
 	/* SCL clock period calculation in Open-drain mode */
@@ -539,8 +541,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
 
-	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
-	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
+	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
+	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
 	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
 			STDBR_SBRLO(double_SBR, od_low_ticks) |
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
@@ -591,13 +593,13 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
 
 	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
 
 	ret = i3c_master_get_free_addr(m, 0);
@@ -1300,7 +1302,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
-	struct reset_control *reset;
 	int ret, i;
 
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
@@ -1317,14 +1318,14 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 
 	i3c->num_clks = ret;
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
+	if (IS_ERR(i3c->tresetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
 				     "Error: missing tresetn ctrl\n");
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
+	if (IS_ERR(i3c->presetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
 				     "Error: missing presetn ctrl\n");
 
 	spin_lock_init(&i3c->xferqueue.lock);
-- 
2.43.0



Return-Path: <linux-renesas-soc+bounces-21241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B34EB4187F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 10:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C38C1541E04
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 08:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29E82EC56D;
	Wed,  3 Sep 2025 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="U5fG+QHK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8B2EC54D;
	Wed,  3 Sep 2025 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888129; cv=fail; b=kt6ilVJq6w6lHFm0nISMC0tZmahJ+xAHoUg8CrLvPCK+AZ9sK36ol7Ul5JIYVP4g0by6ZFBhSPI6c2c4ZUa8tlAieYbsJLN82PCnCbY75MW89GFGm9Q5lGdsKPdabmyU/7Ywgzf1Zm6fWryAa7Mc9FIupQI0ul268/Fbh96B8Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888129; c=relaxed/simple;
	bh=rTYyKhrhdDNJGrg00+d/G1x8aYSyR9uB0OJnBtbbE5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FAXjcn/S6oJ6z78PQsFRVinkN/ORbWUegfhDZ5JP0ZXzwvdtrsjRUDTn7yKVx4qAFUC+i8f2J/Ckq7W++7924G5hMgEGQRvnNe5Tkm1KhWiJdZEZtYmmKXnBlZH6Ou9w95vA7a0xeGvVljMouvCd7494MXNMF6sII2CWp1KsM5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=U5fG+QHK; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+sGWLMPUDI3dozjGI0XfigTJ+c+kApATEVfsJViBZr52g/F8SiOKkXVODWdHb5dguIe7MVL/+3hz/VwPRM3H9EgjG1pc0Y9EurrAJ6rEoKJ86S1sNGPSJQI/YCOoTwRyLJkrFlAW6LIiOGn1ZtyZU5CTne5ujQr8pm1Xvkc0x/Z6IYlRk08R6Taolmsb4kWgtpRbVGw5Hhw3YVGKgwSFogfJg+kZyTBRXLusDBpZnVZayZu1naglD6ixNIRe9E2ILAh8VfM+LZFVDiQnDf7SMACdOuG0TK1TO5PKVdoSedeBKdQGA0moq+hWFKam3sGroozcWwnRTSxwu7zs6dmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JjmwcyjMiTrHYB50QeCDiq20/ad31AA4JAZ0Bn0NME=;
 b=hiNA+6rG7Ch6SNo3CBPZJgJaGjB8iUCuvj1HFnus348Y7bIFYWsYorxoqt/P0oDwC6tN6H7SguMohfS8LAOVAeobaCBYwq+cks2UqEAtXLL2pGiF32iY55H/NV6v6t5ylxQL9JhT0GfuryyUHtdiylp/QP6XElCXEo2R3BXsbpr5ceSZJ2I79rJecN3yVA0UZHAjZlvfUE6h7k6PRlKGBPf224ClOejHCCjpO+YQO9ckLfAKFkgAlwt693bUXu/6Qgnyj/iwKtP9uLAS9GKsWefOpgS5p0hGbRQKMDK85bG/CeGN/6diBYNiroIrp1e2O4A/ds0+WBVfNtEUrNOUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JjmwcyjMiTrHYB50QeCDiq20/ad31AA4JAZ0Bn0NME=;
 b=U5fG+QHKQzm6pq+5weiMsywmt/D8QE0ET75xpqFfpQ7UDgPb+LM2VLYj0D8Zn1RTywrivQDUvqelVuWwt23TqfL9B79BNOnNnqPRcr/F0fvK8Wp0PjzzGAR2gi849mABrQ+9cD6HTovhKHe88HirxHbBkntAfvUtpYLhVfUpAf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8530.jpnprd01.prod.outlook.com (2603:1096:604:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 08:28:45 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:28:45 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] clk: renesas: rzv2h: Simplify polling condition in __rzv2h_cpg_assert()
Date: Wed,  3 Sep 2025 10:27:53 +0200
Message-ID: <20250903082757.115778-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: d2840342-4dac-4416-2e29-08ddeac3e594
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CYgGSnjsBR8SGo5xhT+Tz36vEXIceKhAAQQ19pNyP5NbyMJanCo0JXqalMGF?=
 =?us-ascii?Q?dA+Yeo/V5W9MMZGIWaRFlnlq2a34bBCRsHd1Yzb9rEMR9HVxDR8yet87fK/9?=
 =?us-ascii?Q?dxorZz+M+XPASD0+IRqMPXGB0DFwXpRgqmrK6KfXfiSVJUAM1jVkZF8YOl1q?=
 =?us-ascii?Q?6zidaQ10J4/tNGg7PLD8aFl0siE6aqOheqLW2ffxp4RACtEr5Pqi8Y5Yt8/g?=
 =?us-ascii?Q?zcKo8RgyXZ5vjjDQQ/SF8yLp+19czMcNnybBt9Yt1Z33jCs/ff0m8MsCBLB2?=
 =?us-ascii?Q?8Ah218g9r2edlqZJmrqOPZvnNAhwfGBXpoJg2x99H5S47ePNqAZ0V4HewwvX?=
 =?us-ascii?Q?Cni+MvdJdC65Bo3Gb8yFHWLcLo1sTmAmLhhYwBa1r5c5Tqlx16ABVVr/0n1E?=
 =?us-ascii?Q?Vkc4+F81AkICRGeaIhLhihzPrGPDbmFsKcBs4HNDCaB+5875bcppescTwqf3?=
 =?us-ascii?Q?7CuLUwkLfjCHoifU0ZAuL+5y7DOyjmeWNSsmXyaiBNYu80KsLcKRMPzAmknp?=
 =?us-ascii?Q?eQaVICnlffQLN7094myuVqd5l1m1peET2zZUgwMk6L2M5f1TIr4JqOR2RPup?=
 =?us-ascii?Q?R/aLTvDOY4uw48cVk6+lGUpE9A5lpwFrOAx/7bPrkqhpTxJsj2g0V0PK53XJ?=
 =?us-ascii?Q?2SDvyxgZGUwgMAYn8m+0NWXqoNyHqD2mBMZoMSR6aMhL/YnRpUvF760+l8/W?=
 =?us-ascii?Q?1Tt3nhbiaqxrw0ZJiO3UKr7a9gls4h/zOQHZgZxh/WrUJO2ODyebG9QYbeTx?=
 =?us-ascii?Q?ebA42L7OT9Kf8/YAkOd155QJzh2pU5P/KaG6fs7jZazCD8dXHYZRfOrRxCWe?=
 =?us-ascii?Q?5iVOgJnk8nu0x16wsvQikHGJDJkEO0djNta4xZSnD8Ip5HnWq81gvjqawTly?=
 =?us-ascii?Q?gi4Ao4UiYSo64agqJYmkN8R2+JtFYEKNkladtK8VL5YXIb2S4DIwyZpBf735?=
 =?us-ascii?Q?7ObOQagMnCnWlun7GVbERXgZYOw2w4Jh9UIcGzjU6lAglkPr5JkuMJCuGmyc?=
 =?us-ascii?Q?jGvxEz+vEpl8fMuyt1V22XtC45qiCDCHpf1y9zSorUvByy6P6X/BGuFL2Uia?=
 =?us-ascii?Q?4Z5IvBXrp58CfqRg5MB22wnRC9woBz9CFGbTzSpQsUgy2OKJ0GMDwiNAlcr9?=
 =?us-ascii?Q?n9PjGfAoAKx7APgF3qbd4gyYY6v0KgJQBKScf5QyfIZjAhHBOumfjmHMduDN?=
 =?us-ascii?Q?u0ghbX/tm5krAMaFM36CXhwV3Oy2hhKRlD7+r6CrL4ZU2LzLO4j8taQHhEpo?=
 =?us-ascii?Q?lNrBlXqlDICDjIWIuAVSdowhiNcmAqyN5/zRqUUXGwy2nGpwXJbNujbg5FxJ?=
 =?us-ascii?Q?wXVCWiHoFw9mMqGaJ7xl2DwqdUwvBGw1nDWqdW3NDvCN+OOrs7Xd3reeW+Jb?=
 =?us-ascii?Q?KT9AIUGiuBJvR70yxOfN27Vhkt8/u368d0QAyVJGpEilTZudFmApGOzsOeU2?=
 =?us-ascii?Q?DSINMlZF3mezA1DGwZpDYJjKQcTt5hcfK1n3r6EbWOzXrUL55gHlyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bzn0Ui2Sfst8pwJM+uEh0siOjjv/cOZ1Cx0lC3HSm7AUen4N2OI2tM5PVcTM?=
 =?us-ascii?Q?ZDMxS/oF4s6QijnpzjWYF3lPLTZvhwLy+/UbdhfCB9beWU5/ecvOAYHEfO1E?=
 =?us-ascii?Q?JM7hAwBRLnPMX/qsFXFNtT3BfWE4A2PRWyu/dURONq90V6IjMA2QACfwWKJx?=
 =?us-ascii?Q?RpPsY9HoVM57mcQvIKspWsU2sHNrZZ1+WtB6w51kc/jRKgNHlL5CDIeWocMo?=
 =?us-ascii?Q?vIf352lNNcGiANDJotJVNCsz7Pr7Y/oWcpuHN2mR/ycuOyDj4Uo3Zjkq/loM?=
 =?us-ascii?Q?XXOQt9S/Rqqw5d1YvygbVVfSqiEXONaMv+BRCu4Wt4k4bWYGzn35gSVuHSpf?=
 =?us-ascii?Q?f+gAT6aVX0w0jx0ZvKc8G5pkhYaY58RjvvF/lucN7S+RDk86RVuTD7BnPS88?=
 =?us-ascii?Q?jdncrX+JAEzyZG2nM0sw09yCOzKDjQWEjMunjiYGUxW9SNGShZIy6OY4tgJu?=
 =?us-ascii?Q?k0IkG3OAk67MdW6HQ00gSku+Je/BQlW9HhFBwJXdDYJakbwZBDSqTo+1dFRj?=
 =?us-ascii?Q?MgzcuukXmtn1+WaOn6F5IgdNo8qxyYPi7rToYYKOJufBOHJgyxKUVIlG1iAY?=
 =?us-ascii?Q?nFg+rANJNk+lKWVSZvxtLu6TZQ2MBmiTRM7eDmJT7PeTH4jqxrrItXYWy0G+?=
 =?us-ascii?Q?N34f7G58vn452C46lyesJ1Pde4wG9O3ti9bDA+PxwrQ/gRSaNu9hUi9y/auw?=
 =?us-ascii?Q?TBTe9QEAw+B2lnpl7tGAkA4jWAZXcPm1KdB/gz6Pppk4cxOppqJqN/+9EqW2?=
 =?us-ascii?Q?V5gbwy+D1r749paR4daDptyUuyU1N0SMA0AJUvKY+GAYHl0O2T29nDZ/rH+8?=
 =?us-ascii?Q?TXlo4VSrom+dfKB4zEGQpDFaFhUGmzcDZ7BKLM1DrjYBCXan1Fmoi+c2y1YQ?=
 =?us-ascii?Q?WmOf/Aa1gAJEAs+fznCJQFFcHzgr+F7Y2Lp0PY8QqqGkAyj4PJxiR6JdALNO?=
 =?us-ascii?Q?pu1Wb7khWUd0JIAtSb95l7FjgpiyS3nVVbmsBJRuqILRrUYsNzmbqfEJPXg4?=
 =?us-ascii?Q?1YLUPsjU4ORB4ZbKarFqHY6JoIugVV6Fjbu/w9NlduXc5uxghDWSKJRxqrBB?=
 =?us-ascii?Q?PaZIsbFfDEDD1inXEYpKKDgPYYeGWb06Nyn0IjCHLtRkyENApHLodQoR6ShJ?=
 =?us-ascii?Q?nOnzyQngUFVVL5jzvFjE1JYttBl7PUwVDl0Xmn27WgjpoNJXXoAPy3zwa+0B?=
 =?us-ascii?Q?UM3P5ou3e1cpa8T1syTJFcYSbuWTQRPgqZ7IdCb9am5ezx7KO9Heq4YKVB8l?=
 =?us-ascii?Q?NRcAFLbdTv46Fq+IEdOEk+/WZWXBA+nbjF4BpEHLNISjzeAM+d4jidG5X4+d?=
 =?us-ascii?Q?8XtNUDq6V/zDaCy0VhnyD7Bm2xHx/HYSWW/oXuk77qp7/hRAaM9wtwZU+2An?=
 =?us-ascii?Q?AijmCqybLs2nGrEsxBKK0NXxvxrIKWMowH2KGigy7GvElxvmVsbaa81KqZxg?=
 =?us-ascii?Q?i5KEkgzssT3QrltplfmTQ/M+XJlpi7lKa0Y1DcwVbJxgDXjtusTj6dLXuzpz?=
 =?us-ascii?Q?zeg6N5sidMwys9nCI+k8iZ38Y4RjfVQhFsfGo6kso8n9NSVobzMnbNCC8K+A?=
 =?us-ascii?Q?C/W1ulE23laT3holASlgfalHmVvIBit35Ng0lDxR59Fs8Fuk2b82A1bOtaBJ?=
 =?us-ascii?Q?yCBd61u2jl2TpRQovYoxBuw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2840342-4dac-4416-2e29-08ddeac3e594
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:28:45.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYYTrX7423RJzvwWcin1xtbpI+HdjfqgUdD1Eb9bMSNZQBY9j2L38lviJUbc1aPYoCT25M/87iGq20C203a+ZxWhdywblF7xKIKJuyLDFAUA/N49t41yWt42iVZaxRr+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8530

Replace the ternary operator with a direct boolean comparison to improve
code readability and maintainability. The logic remains unchanged.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 drivers/clk/renesas/rzv2h-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 35c5ff38e231e..0e8800906b89e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -867,7 +867,7 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	mask = BIT(monbit);
 
 	ret = readl_poll_timeout_atomic(priv->base + reg, value,
-					assert ? (value & mask) : !(value & mask),
+					assert == !!(value & mask),
 					10, 200);
 	if (ret && !assert) {
 		value = mask << 16;
-- 
2.43.0



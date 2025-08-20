Return-Path: <linux-renesas-soc+bounces-20756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B746B2D9BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3469B1C452E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2662E2670;
	Wed, 20 Aug 2025 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Th5JDQCs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE002E2292;
	Wed, 20 Aug 2025 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755684314; cv=fail; b=pK20zZoIQ4guN357w42Rs0xaaJATl4Zq8Ab02IdU1MQ5XpP9pvi7LQWWdTUTeiCdg7bCUxmarwqgKfmoi5vizsaKkTEFAvTthe0dXbq5n2Dv4nCj1YcTQy5tbc5g2YMR6MS4RkMXzPdntcAicmB1LuUkWdoTQzENPgafOt6US3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755684314; c=relaxed/simple;
	bh=wAuGmUkVQAmpaG74cA/6HchSbouFYIBn2BZNnzsxg6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eUXnp+OL7f0o6286MlmcIjLD2aZQ8WMs7bHMC7KOwAGEz4kM46b9P7z+R8WSHvublxUC+q4Mp2KgW3urMUSThCn/q+L5mxgtegYvvEmGtP2v44OlxuOehSvnTsykYHhuVHgryP3kTVhxykziRcise5EaVY7G3SkV7bd8Ch8UDFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Th5JDQCs; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNfyJKnJSkJ9W/L2eE94f28B7o0CMZaXaSF7SUG9SevyhNn+qNyhfOw1gLuCxHDX3xOqUkFof+TOMNjZ9q52ZD6/fKacBy+M/lM+TWaJWaHRWBzzstSkf47bwcXzlqH1tleO0qkBki7Hui9x8t4YVyu6AYlVusz34AN6JIGJ1oZ1oiq9GqGElGiZlE0JcYL8Vs7IhTVdqkhSeVBkdyde7OeflBrIp1wYiFOAttHJp+UyAhSzqAKrA4LBXpUl0cZCOuLFG8R0K0r/5DHZ6nOwe1HXnRlc+Ekyav7y8UjDbyBdJlgruzeK42wz3AO1Y4PgaMEFIK7yFiOCmZSf7d8ZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvMLIYrntD5js8ow0Xq2jAv5aA3Bd5Tys4SK454Q/Mc=;
 b=iUJG1TKVRbPSN8H0dIyXyuF3Mn9Bcj2MdYQppBKtmJqUS0rozDx20EqwRK+oF7DQc2sBuS8+OXcmahv0CEcMI+GEMkigHCT3VIsRI5JevjM7lPTHc3i31VmJOblfgaMujF5Fbi0JSaU8GQJ6Fnj4YnZJOH8fqVwDy437u6fNLTWChViQF6iLsQ9Lv4/owvidxRAQexoPtSZ9EY2e6f2/l261ZRlA/3BIiRI2axZxmSjQzEejUoNicHtvVaeCL3CfPZKEW3G8EZ97WJD2WDUO0zoI08kLm0gLJO0UErmQTC1SGR/QNTgBS5Kmu4AwHgYcMdkoYu1V4ucxXBsWFV3/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvMLIYrntD5js8ow0Xq2jAv5aA3Bd5Tys4SK454Q/Mc=;
 b=Th5JDQCs/rXYM8E3rSYHWrSH49VXZ3VeKhTPRzJHsFe8U0d618lL7ovlcg0XJnuI5mGSGOQ+NfduszKc3obRFnXKNzdKQHsrggNHzU7OknIlqqZFIz+RUkERNHO5NCbfi03mKliaRQ9AZ36dsRBdk/aEzprB/wPzx0bxD/K04OU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB12004.jpnprd01.prod.outlook.com (2603:1096:400:3fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 10:05:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 10:05:09 +0000
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
Subject: [PATCH 3/4] clk: renesas: rzv2h: Re-assert reset on deassert timeout
Date: Wed, 20 Aug 2025 12:04:24 +0200
Message-ID: <20250820100428.233913-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB12004:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ade8d09-4a82-487d-69c9-08dddfd10b6d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H0qF1CQOXUxAx7sFBMjpNPHL6/azmWL9gVHUs9G5bafKHaBLpHKA8B6kXw0v?=
 =?us-ascii?Q?QJB118wxGuO8zAlcgvO1g3J4l6mU84hVwPM2sems989BXvWfxf6OChuQfsjg?=
 =?us-ascii?Q?8QP0wrEc4wUnGxyztt/W+n4g0jXlkfTpsoQwMK7CkCLymqZBJANYpeQ9bfAD?=
 =?us-ascii?Q?Qboa5j/uTsppaXhkBLdbBwU8bK8NZnSCh/+GguCh6UK2jCRhFpzhrarAHpGM?=
 =?us-ascii?Q?cyzP8QOlrEfNk2eTICgRRfeGdYJghRNByN3CV2QsDRZ26vgDrpwS8D0FAbDv?=
 =?us-ascii?Q?/T9Q5cFXpRtwTX3tEygvot2sVmLUhRjFG9ks1iOAofnRiWCYxlOvk8FCZv+q?=
 =?us-ascii?Q?uSA8YFBFrJKh3HzPqmezyBUhVtCPVkUjau6COcyoxkAr+3sCY/eVxsVscbAj?=
 =?us-ascii?Q?/m8NVuiGFDKN6ayc8AeFtVUbGJSPsSFF637PBaQysGgL999Apywl3koiMNL5?=
 =?us-ascii?Q?xSO+4MA2vlRnG2GkNYBcj6XtXUJnSrJGCxyM4MzG3fq+JjCXROliHhxgNS6p?=
 =?us-ascii?Q?3JPscosVMGe3hmFUX7LyuQDyRsoiaB9KPvs9GRu1y4w1il9unylpWo4toTZI?=
 =?us-ascii?Q?NMwuAwFny7IOoPDfY68ZrohsCvVXqgGlzCR3WYS+wBXteoS5ygSHL244/nFz?=
 =?us-ascii?Q?v/U6nvDkiFyMO8pg0adGvNucPPh8lJ1OqC+3Ak0FlswQMxJrAr9MQxWPEJ/h?=
 =?us-ascii?Q?MjIrzuxbSNyC93ci1n7P4T8RXA7ut9yrQW+1XK5ypoCFLzdNlGTYx7Kcwclk?=
 =?us-ascii?Q?148ESggEuvUD5cypyL3vqIFq2WPg9uv/OX3lDVcJLH3e5a5Xl/Kk7CnfotDj?=
 =?us-ascii?Q?NFOANwDnpiuNQiuQ7BK9ocDSlb8figDvBGs+V05gVx6xstqPA4aPef04RCt+?=
 =?us-ascii?Q?7AuX57oO6Itgz4HVkSDQMf7YaoceFwcMtGLX4o+jG54EkrKeGmX7CKppBvn0?=
 =?us-ascii?Q?UjU0lXixihB0P2JUAhBQMnafese91+3UTcZxeP/NqUiWcrEt4/Q/wE8frB3S?=
 =?us-ascii?Q?zltprLVVFzNmOvGWK6/qJwXtyjfQnezBQPkzq49eM9xXbSOCGuWaGOxm3Zx0?=
 =?us-ascii?Q?VAlNhMnJUGBzdKx4Dk+4C3tGn1Bggmbt64zgctIX1xQunF8GmdQrlv22I8YJ?=
 =?us-ascii?Q?JFarLNZ3AjY7EqG1JOUrsEFhON4QuYjUpcwK0oxASdBPB3Y5H1GvYW2XH2lL?=
 =?us-ascii?Q?JjlPc/SB7KpUptm19d/LaMnl7d60YtX24HGcdBneBKdo0k3f6OGZToV8kRB8?=
 =?us-ascii?Q?MQHzO8dfjv/QAddm1HUaEaTyGT4JtdEWgsi6GZ2ca3pWhIMwm/TbMmoq1+WY?=
 =?us-ascii?Q?6GAMVWyadI6uZXAZ2lS6jWYX/Dv/nt2W4GOKGa3WCpFpm3pCBMm+9B6nOCkG?=
 =?us-ascii?Q?zUsqpyHvy7ZYyt8x60WeO4pYcFInPFuiFHV9omdzEDki2K98MerlvJ3Va2dI?=
 =?us-ascii?Q?3z/c/g7EOiHQptYC9qJRUAOQhIdqj20f+hn2O6hajF/Xh3vzDx862A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jmZopGWJccRA+VOuGKl179XsTeHQHQwopJWGCr4qUmtKIxl4PCjzEPMgtQHt?=
 =?us-ascii?Q?mNfbsx692hQIoHIEPzdpsJ1gRzKAUHzYT2gRr520qkQxwO+VM2tBt/hQp3uH?=
 =?us-ascii?Q?mDOWDcEA5oyV0+GB5iFpo+4RZDdasKsIytCB4K1rrf6FGoV3QULcL/bq0JV3?=
 =?us-ascii?Q?1daZbPJpI4SPRZbvtu6cnXY4bHXie50TDNpAkkKnSJvvKGqmB28/dQesMjcm?=
 =?us-ascii?Q?rgUThuoP39h9OM5NCPdRjBQMWXUNWvfQAJbCFec+tXteNB/5Y0J1r7sFG0JL?=
 =?us-ascii?Q?l8b9GXLqDuzBPPTLo7Mu+e4olZBB/dPrlRAgAtJwzYeoachXqNz7hBT0ARmV?=
 =?us-ascii?Q?2rKzWhFXtbanKaX6VAiCgEEjA4fDfLRp9eQndyFMXwnTPnzZjEwOjxFnCk3X?=
 =?us-ascii?Q?azQyjbMwBJc34UQEOB8yMGoiA1ffgROpna4/Y00qSnJgeKbQ1cUfR4BvwQE7?=
 =?us-ascii?Q?zkMof9gdeQIRVfze5kztKrwsFhpttsTf7+VuTD9sJBjY7rEQDlrk82cAm0BR?=
 =?us-ascii?Q?X5qTVFoUdYVCIoQPQmwrQSEULpWYItKWmvfAFkCm/r37i2qdWLBLia+2A/rT?=
 =?us-ascii?Q?DbF8oUCvkOSb55PpfkEXMZQgodxEB4AeSImTzGvMJ7RZrptu4vEkOcs3KXqz?=
 =?us-ascii?Q?d3y7sgZrKXfCrXF6VAD3qpzdy0biciBNKCRA0vRTBrDR8NnfRxFjuMEEn9tW?=
 =?us-ascii?Q?193pfbzdqVutSCWODykI6Y39xuwG3CBuLVWaKRA7nflJU3DGabl2emFheweT?=
 =?us-ascii?Q?ogh7kYLv9uBXNLEYgIzGjRTyqvPRtxQXW4iX9aTbP+oFYV6Vk+AETlJrRyr4?=
 =?us-ascii?Q?s6p4q36zw5UoseLHaLBnOIrGvvRJ/ufULy0T1DKA3k9l/GFuJHMHLTCX6nzy?=
 =?us-ascii?Q?UxP263P1e1VVDNDaofg4+59T/C80wFJQjJflWBEMCQJOGPnwZJ9D42qLIkRc?=
 =?us-ascii?Q?gLt/+8FMWlwBptxc0fM1pQqDIUjsjyBvd2rVI1okOm4rgAIHci23bABlfBJc?=
 =?us-ascii?Q?LE/gCYAU/09/ZzpYN2mZSdH268kx3KMmhJ/F6YWO2cEprgN1DdXRkZDdmFfU?=
 =?us-ascii?Q?6/0qlHAMXoGb9wrJ2z4A1Ot/ZJzjhXO3trxINtDxcYFdmvZvGQqPNxV6km96?=
 =?us-ascii?Q?vmDOvj1bPRy8VQ6FXloPlIXRah0PDzI9xWz0x7la0zr/Q3DsFUTL65vgdT5j?=
 =?us-ascii?Q?aActmKjWuHVi+Uuq0zpj82gXRXZBfULEivPjAQTOrQA1vrRhQ05F/aL0a0vt?=
 =?us-ascii?Q?7+aQOhuXS6myaZH6gdd7AV+o1E4sPjD0mZvhsDmNPbhIr+A6DDqcjag+RLwO?=
 =?us-ascii?Q?aM7M8SMpT+119QIvw9qRfVk0FqOnpu+IlOUPRuXAfwj7Irqz/dCJLNfrq9y9?=
 =?us-ascii?Q?+OBn04gvnJbYLlLj93/h2YkuztzMFf5w9dx6vXDh6alvoK316ufjyBX0EvjE?=
 =?us-ascii?Q?EIpbv2JtS6zkLSqHb5wou8GqXQRiBTqfGImKu4xKZ6MW9Qm3T7VdL11Xd3Kp?=
 =?us-ascii?Q?UKetJCDPHUNUBZp4/ZT6fkbVCUovfYHd8Acpz+TBmwpeahv3vt6Wz+jz1NIU?=
 =?us-ascii?Q?pu07p8GWi+hA4qB/57VkwrFO/owyT5rFPTaM/UuH4GmbKlWIwHlJ7qnVfIG3?=
 =?us-ascii?Q?WD8GF8msXxPr0boWD+zcCf0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ade8d09-4a82-487d-69c9-08dddfd10b6d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:05:09.0565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNtq3TzIYmgdgM3e5F64s4WNGTRMLJP5KQW504tq+SQhCHelpYiMDXzbeGzekUUyKJ2NlthIsWbRPOY+EX3LfxHVeDIJ9B2SSVSyalQLBkyg1ttCHoJ1CVbeSkgQrfuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12004

Prevent issues during reset deassertion by re-asserting the reset if a
timeout occurs when trying to deassert. This ensures the reset line is in a
known state and improves reliability for hardware that may not immediately
clear the reset monitor bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 58ccbae0f904..469f40894c43 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -854,6 +854,7 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(priv->resets[id].reset_bit);
 	u8 monbit = priv->resets[id].mon_bit;
 	u32 value = mask << 16;
+	int ret;
 
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, reg);
@@ -865,9 +866,16 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
 	mask = BIT(monbit);
 
-	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 assert ? (value & mask) : !(value & mask),
-					 10, 200);
+	ret = readl_poll_timeout_atomic(priv->base + reg, value,
+					assert ? (value & mask) : !(value & mask),
+					10, 200);
+	if (ret && !assert) {
+		dev_warn(rcdev->dev, "deassert timeout, re-asserting reset id %ld\n", id);
+		value = mask << 16;
+		writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
+	}
+
+	return ret;
 }
 
 static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
-- 
2.43.0



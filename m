Return-Path: <linux-renesas-soc+bounces-22543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C605BB1D2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C2D4C18DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD01031281F;
	Wed,  1 Oct 2025 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gYmvSRv6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED5311C13;
	Wed,  1 Oct 2025 21:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354108; cv=fail; b=hLWJGGGpnkmS7BymoEZXNzx4NYGlZyDcn5fmx5f0NQOM8cFjh8b9VloBTxpFoAykB44LjaxgUAOLXAKdXkFDi22fYOAiEZNLKvMSn5Ehol41Mi38W7Gz+EjiDJc9/27Td93hoDc1K6bfd1RicYB8TP4V8HlQp73Eov/sQ7z4bvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354108; c=relaxed/simple;
	bh=71hcA/DpWCQ7NpiTixIic9L+0EArUZx4dF7kMxa5iGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t3nTbUaTacmx8BOjPhl9hDRXnMd7IcQCa9mK/+H4KdvliPVeqYLtLtIUcSUdjij3FFhQQVPp1s387W+4x+5VjHbMfw4lDEIu1K1XwcqULGSc73k8ld9wzQEMgSsGo7TNsy8unCQ7LpIYgvkzq+XjKlRTogiKK/H1st7cOecEsGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gYmvSRv6; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GirVpn0Gq25VtKsz0unSfMKxFi2+Z/C/PiDyT2CA23FPdCLV+8ozrVdKxARw2wUoh8togRoIFXfMALcqSM1oCaMTL5IYjoENPjPyiMEKF01xuSaohOARyIograd4oUsViqjSdE0HimrOGQsH/p54G8xjKz9q+citJecivi1INBQ+AAOQG5BsHsgFssFXSOC/qBMBXEkOyGLe3uDuanTemvS7/26gub7mNOunOvUAudNugYHE7O1nQtrmvMNP2+hSyhZ8CSBbko7YOsDVbR14vcW004XRs1C5DFVlcnZdNYQP9qLDKsYl9bNwDuooQ98gJ9MuOPrDtggTWgZnfkPsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0mbWa/V2MBOSc4rzUG8m46fl2lPpwOahWZKfHg8ixE=;
 b=Xppilsrv599esRDIXRfnYf0z5DEVwA2CJkmyqX5sFE0FLWnS3jf+LAUdRhkMgbyTN5tuT8+MsbE6aWALApNw1LMuEyqV2FPhZykZMo0xwxSfdUFMCq/IAByKkOq7QHJcMvw40E3GHlN5QUvB8VgSIhBDt15ABBRWCTNYNid1NGMXwqOqO84mB/c8p1uHCqXNMFby+CsxK+fftG5EoYHDTR4w5qEF0odWrf92bGWZtUJNG3S6rTUshC4Ws8dMvC/pwmTxzfzkeT2p8u+M+rGXwsJpbMoEhVHOXPuKaJsGfrA25Unqkv4tKOO7mtJiLVpQ7NeyiNpU8Pmxkvf1H3a7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0mbWa/V2MBOSc4rzUG8m46fl2lPpwOahWZKfHg8ixE=;
 b=gYmvSRv69g4MhR6NsPS/tRReeeuqUd4Lq9y6VRh386NicNiMtt/Bdg0n4tyMsUtr3+cpvlj9JcN4LHkNzbXa4S2pJD6VPO0nGCNYOgu80ECg6Afy2IFvVAhcs9iuhU3SUy1SuE4Z97ffiIWIy6KEf3aQBDDfWlGt/1N/O/uh3jA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:24 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:24 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/18] regulator: devres: Disable exclusive regulator before releasing
Date: Wed,  1 Oct 2025 23:26:51 +0200
Message-ID: <20251001212709.579080-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 0373d6d1-10de-4456-9e45-08de013173d2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sSjFGXqy17ZlWS3kPA4uH+7n9wFnzwM7QKbx++jE/TZJkr9tDMw7WTswU3JT?=
 =?us-ascii?Q?36JSBpuxrwC4lUsEycepUEvapsGiUxzWVtckLQ6hnmep7V2NlpNVzRvoaPYr?=
 =?us-ascii?Q?/qbBs4xUcYl2oyv31xllL6TzGFC4cEFUCLmAuHEbKPT7jQE396YcuMBix038?=
 =?us-ascii?Q?NvaIY4BThRWZjbfUSN6Tvv35pVas65w/x1JAk3oupif3fcd0NGclKcNJbqP8?=
 =?us-ascii?Q?yRu/EYHyFP5jlJxvxBWx33tJfMG6/WVgxMkJpIgm/I5bbyB93clwccWYOBQV?=
 =?us-ascii?Q?DuKSLb734jrV47+NObZT+gX7+Lai/sd89z75ygJ1u9ThYfaU2nTZsaz3WYOe?=
 =?us-ascii?Q?96TD33miAOVF5Ujb55nP7GMAsnCyQLhTacf07/HY5euNT5bxmoEZYIlzVC0C?=
 =?us-ascii?Q?W6p2umIpTiEYhaguHm20UGNj0jaeEXWse/yt2itUiBrM8rL+EKybllSTpwt9?=
 =?us-ascii?Q?bCHzk6k8cSNf1svYN3ZifLJM76qMZtAfvsV2RQM3/iIX8iV5S0m+0DIV0mRC?=
 =?us-ascii?Q?foONtTETPmf61J8KGgXj1lLN3iATEXEzhEOUz+uNbL3qly/tX7YcQalItyYn?=
 =?us-ascii?Q?ffWu/v1C6OZtoraET263OMYOqH6XegpdhTgwdb+BHapJf+N4syzLkZ15CUzq?=
 =?us-ascii?Q?pmhHrWP0bi17A5vUa0Kar0ocq0BI/8m7QG7LJNemSqePGKEzITdmlEPOx2ys?=
 =?us-ascii?Q?4TUzKRYiB4jEpoqHYqTEw49p38CbitOocU4sazugMns3PXBkF3FmjrtaFnnt?=
 =?us-ascii?Q?bkyNd2HbioUFTmKpzN++Nu2CbBqNEoiam+An8HH3mOrYy9mpEODV+Sc1lEVM?=
 =?us-ascii?Q?1gUHzbz89jq1E5c+NqdxGjlqlm59nPxFOv5ZaI0XAz59i7KovGk9rbRgrxxM?=
 =?us-ascii?Q?+DIcZzLem2oKdRjFL3CgEPQIxLP0D50ZgbLqX0jpNiDdgBQSvbnrBjMKGi9S?=
 =?us-ascii?Q?5Nqcy+99SR5J99akHTo2VfiMqSantpLt0tQvCP18Yd9HgCLRCH/sT5u3GeHe?=
 =?us-ascii?Q?1CYLBJNtKC6XMxzobMzXA/Z5YCL1imxxM8vJqQiLyxB33DHLLLzYMAXrHpM1?=
 =?us-ascii?Q?5dgCKCuZm4c+SBM+SQFgo3GTbSwRjhR7gwpozeObO1s4Phu+BH9emwFaL4Q5?=
 =?us-ascii?Q?46NiKeBlLhtfq/T4Kmu24zJUquMHBeGRDMG75uXema7iCKjnsqCsKacZavO0?=
 =?us-ascii?Q?woZBJAFhBOOkgFgX99Qn2pB5TmQe2bJaWf/H1x7pnWson9rfdLLb1AK7Ilev?=
 =?us-ascii?Q?vMLKLHlWoOYjR+o/vNTn4iCt970vhipX1mShqrcjewezdpZvt2aJpOrFrAcb?=
 =?us-ascii?Q?ntz5V3re6jfK3hiziUlJ62xL/h3q/ll48WNaDD3YpuVh4CfEIDDVgMbtDBSz?=
 =?us-ascii?Q?w/91LIOtpVFp4ORLVg315Bd8OBeENEdpXu/E3+Ol4UpKfHd3JdUYFCO8QAPV?=
 =?us-ascii?Q?vBQQRIpyaI1Cw9Y1TBdIoi11pqtOcJPahsJRmtMRO7g20jGb4uvZkxHIkKwe?=
 =?us-ascii?Q?5PQEtXlzU0sy1PSSB22K/v23FJHj3Ro4j9V7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eijUo4u7o8wAaEA6b5EQkI0HsvMvNnoU4JxRrezbaO0xC/UCnZ7F3oewdRxX?=
 =?us-ascii?Q?XjlHQbR4xhYCTUL/ZC8L77gqa3ch6kTyDccgHtuRUk6jOB778R204++F0d7k?=
 =?us-ascii?Q?Y96a0evKzocw/gIqmdtJZ643p/8WJxsy1Z+mfVLXi5wysc+hkawLsFPHu76+?=
 =?us-ascii?Q?HGmjBYVzcA3kJhhFH9CPqSPFKt5klCRetWUCdMI2Lvk8xZLusKwLBdKC3N6E?=
 =?us-ascii?Q?gs6+YLEbN0UfpObUltqkE5vqpWi3hvd9Gi7dJaZuc76BPpoeoZ0nLZkiku1z?=
 =?us-ascii?Q?omnXXLtyWvHgFovpN12bF+GPW0ijZ+6V5BjowpwImcSdjdrPl5S+qqmeazAg?=
 =?us-ascii?Q?PkqdJZAF/E6FJCIGfhlN5JyvSXrkwkZ+gecZ20jM9F95PWPAv7a91o0jSvNv?=
 =?us-ascii?Q?8bFwAs+AQunvmdvoWwXyN8PiDozE+FICSyHtccKFdoMwHchPt5ZhYDIie2Iq?=
 =?us-ascii?Q?AsM5AZUWXGqFzLt1tzAbFwg46cJkMRmDSCuIlnBtSknqeaqYeer2+2+lgVbe?=
 =?us-ascii?Q?mh5fhBEPbNKkQgw1AFWJGCNQ4LaV5VcQP/BJR0/c+FZPfMI4GKzGj0tn1RCO?=
 =?us-ascii?Q?QeZrjoGHZM+J9RH7xNhGklim5BC0XM93z5IBw8hpZtW5TL8LKe7NhBGrSqUD?=
 =?us-ascii?Q?gMaqbdNRU90IeE7GUG8MecEKjVZeNm3JBLtb8+sDPIV5THSpkkqX9HPxoMil?=
 =?us-ascii?Q?chX4GuB6gm9BRp6ebXgWctQzDvaGMchA/R92OIY2GDyE10xdOk3p3uYJ+6dD?=
 =?us-ascii?Q?uUa6hO0ssnRs2XHWldShKYspUqhOl8dasHJmMBcYhJgSFLAO8h7YHXFGq75p?=
 =?us-ascii?Q?Qjcmmchumew5eyWXRzHl1PGpGlHmYJQwrgIqnxveR1DRwrIw4PFtfoIppZoo?=
 =?us-ascii?Q?UCo2QWlzVVR9vL5CDRYDtruJ0Oprklbjv2W6Wde6YzgxCROb9dOPoBU7YkWh?=
 =?us-ascii?Q?sNItE9ijpDVa0qV3LGYdbTNH/QHFZbtb1xZxPijdURs6ZQh8RGp+JLrqd2vN?=
 =?us-ascii?Q?poIcJZSyqxpdkz31EJZDq2R+q8+qjh8GePTquKJKhlhVb1Dvr2YxdnE1+dNb?=
 =?us-ascii?Q?g/Ocl6tCS4Ou9FFOlBQhEWrW1uCqJKedFtefscc/xQ6RIPG3YiAM1EJ5KczB?=
 =?us-ascii?Q?VRzpXUuhCs5f9wYuUgsa6QoMog5zy33tMgnSzkNaCebe6FqtHhZBpsjzvLKO?=
 =?us-ascii?Q?LGZ+4SylOCYZUh75ODUYM0CwMIUoCCIeNxgJkzKHxLTZxBTonjWkdAKgceqZ?=
 =?us-ascii?Q?I9DMNaUNwciHuSqF1X9hxwbEzoXEMpr8R45bu4sV921e/pQcpjWiXTzpNgWP?=
 =?us-ascii?Q?jwxciWs97HXYCqzhh5NuMCgoHsBowfl95YoHascS4wmefaGTFSwpwACbIKSu?=
 =?us-ascii?Q?T1onSMljvOzNQ11c5weocGvm0g551m0f/+cqJVL7FCP1Re9RJMAFhp+jzfG9?=
 =?us-ascii?Q?tdr2RQW3dMemohMMRP5BfpXjV5U87L+4NqJUAgu8K04719t8TkwoZQpYWT2d?=
 =?us-ascii?Q?OLtxJH5Nw1mIkJM1bKnl8w+LB2dQ/RmkieimX6KHu8DHZYU4IxUi6mQPKB4j?=
 =?us-ascii?Q?8Cxi0voEkrLgKRbVMBKmsVfy7E/UJGaZ2NtaUjejY78uQ5W4tW6oI/bxyo0l?=
 =?us-ascii?Q?luLCbNJ1qEKXD04Ilr6Yyko=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0373d6d1-10de-4456-9e45-08de013173d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:24.5189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ca7OUCX2Xr/Fuby/Q6hPKfom/tBdfn+wmheCxofQ5jf5UVi/6DTqPcO7OzESSyTWvpGAOtfkSv/vsCi51GmuAbooje4EaiKGHAtuL+gN2LijtTjyx2kvxr9HjLEMA8W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Ensure that exclusive regulators are properly disabled when their reference
count drops to one before they are released. This prevents possible issues
where exclusive regulators may remain enabled unintentionally after being
put.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/regulator/devres.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 2cf03042fddf..48da9823ce2f 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -16,7 +16,13 @@
 
 static void devm_regulator_release(struct device *dev, void *res)
 {
-	regulator_put(*(struct regulator **)res);
+	struct regulator *regulator = *(struct regulator **)res;
+	struct regulator_dev *rdev = regulator->rdev;
+
+	if (rdev->exclusive && regulator->enable_count == 1)
+		regulator_disable(regulator);
+
+	regulator_put(regulator);
 }
 
 static struct regulator *_devm_regulator_get(struct device *dev, const char *id,
-- 
2.43.0



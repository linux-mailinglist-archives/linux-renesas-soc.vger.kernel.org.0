Return-Path: <linux-renesas-soc+bounces-21239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07901B41876
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 10:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA55D20284E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 08:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91C72EBDC2;
	Wed,  3 Sep 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="loTN2pUp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CE2EBBBC;
	Wed,  3 Sep 2025 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888125; cv=fail; b=kG+rwGEB0vta5d9n9qaxDhyZCoTS/g/VKsvQUGf22/RVUFFcMFzkM6iYqtqxmTzcQxZGPsQ4QOLrLCtV+jb36DUPMcrwKx23/2EW5kka3rNDzwIKgYegih5nJz41GgQGoVYoLVUdhj8Q9XvAZtAdg+TgfMeC8/ZPdlaMDKiZhf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888125; c=relaxed/simple;
	bh=VlSDBVZXQtOXbMnB2gErEIvA4Wx74SSrasKP9VzzvgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jfw0Gh/6zImGw/ftxh6nn1CZxZN5kG+fIA1mAY8IIwBpP7ewwO7HXp2x6BsRSMV5yeZwhT/yAafLjaPPMlO0IYzuGbecYLsbKHu2LLen8IRRqJBLsSV5N5Dpg5pb2l+CwGTEwxQXBz7ETVMm9C5LYzzqFCmsrFAPDR+3ky9f3AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=loTN2pUp; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysRn3gkew5NgcH/euzEv7Mx/8R4xROWDpGXLJ8tSt7/ZCAy+SB0JK9/rUv+w9sOacgCPhI1O9nR3+FS3OHaNY66LrUyYYlVeU2dLx3uNZwu+Iy1OXdn6ekdWWcLeG7gw61k3bmiojEm+emMnOARk5UataK2rq7B4uesXeb9OI/WryRVb0EGAs7uxmu9bXU29ZzczsqiZhnIClNso5y2wIvWcx8HBtube/LRkNnkP+B0Wv5QDYiBiz1oVZJlfN6/LhviEni97pmH1pIfAa5N0osvWN8LkHC4vyj2JWfekAvmVlTgZDi0Ti8ik+e0xcuJwo+xhcpphdiauEZPYlKz/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TUMm7+HiU3+cilrRoEHS4p2qr6fWj11XDXtMnNCgNY=;
 b=N1w5dLTDlR2p7uWX0bMv9XntHI6Q/OzU8erBwH05E6apqE800kEPSzZjvCNox/ZdnLF0EksfgDuo4h9/h+ouuNqmmIlarMuk3Dmlux6LzwKoC9cb9cH8zVHR0DuSCbEiojMKuQQAgy6hnEJDXlvd41g4N7wrgTboOycnvWtYrWMcadHU0b5yZYEg6nq++4wf8XOS1tehlZP3WzDrvNAh1djS3sVnt0GTM0pkZOYBKBcCLEGASrlhNSuV8smhHUCTni0nIYHFrFMu/uyPnT9OFxW7sF+cjxkqrvhForLAnInSNu6q3ES2MTGjvsuQ137N6Tpp7uuyCStBKIsF96eWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TUMm7+HiU3+cilrRoEHS4p2qr6fWj11XDXtMnNCgNY=;
 b=loTN2pUpyGyUK1WLz75fDIZAr/K25/NReMQFhyzUZqYYJ2AHvqRVsbrEV4HStr0vhfr9qKLYW1WAFiKAlJHVR5C01davJApSg/dmXF0/EU3KBS/Y8FblMSicDzby9zs7c3iQU0IfH5E5kVtls7c+fPyNHVyh4x5jAVj/ZWlqE8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8530.jpnprd01.prod.outlook.com (2603:1096:604:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 08:28:40 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:28:36 +0000
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
Subject: [PATCH v2 2/5] clk: renesas: rzg2l: Re-assert reset on deassert timeout
Date: Wed,  3 Sep 2025 10:27:51 +0200
Message-ID: <20250903082757.115778-3-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: cbff585d-0c7b-4ed1-245a-08ddeac3e06d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m6MU7hfdIQAerrYT/n19epihaDjw3X76720TnwPX1Uk7r289ldtECE+RmZJc?=
 =?us-ascii?Q?037O7+5hnD3ONLgSi4BaahbUeutfbFhFtEpWIFRHH6bVf9oQF2PUxbyiwU12?=
 =?us-ascii?Q?NeN8pvhdXZE9Hg1WaTi3ezcLAtX8idVKAzxGuaHT5Vas9BoIPL8dVHq1TTjV?=
 =?us-ascii?Q?okNCIanJfhSJ88fSlbkYudqAt9LTYkKRtlTfUT7ksyqlzg8SlwtQtgQSYBvC?=
 =?us-ascii?Q?5yfpQAAEbcoTJe3vN05UUeRkdR8fxEKxYbfQeWjX17tX1ZEaYMzHS9p5NXRc?=
 =?us-ascii?Q?fb4MNYTOrjxjICVLcDy3C2i7dDeSqxvhF6NUF0RHHaj69V5bHAThi4xZr9NF?=
 =?us-ascii?Q?7W/JvwSEoFa3zp71oGiOw35yc89tjdb8wZ8wf2vy36nWefR3olBW8sAPKvFa?=
 =?us-ascii?Q?Cf93lkSmNMUFwmCfxBn690AQJG5XRlxNcCNSAmUkMsw669PahpgGLx2DvKSQ?=
 =?us-ascii?Q?nWtNQF9h105wlXSxLlj7+y71SVQq/gjrxgMq38JQpcMQEJcNObMSrz+fUhv2?=
 =?us-ascii?Q?Oukn1219sC9qS8/2lQiEEinzfV5L6QUme5n0nH5j8TVQQsTjMvhHCSb4/os7?=
 =?us-ascii?Q?Q4DHHye5Glr4YrJlNibwiQEU6J4SNt6F7odsBD/FarGcPGPOltBxZLrpMHBr?=
 =?us-ascii?Q?TVJdgn8iLJWy2dYK6tYMMm17+IjiAsoYcTwhyc1jZAEWirIIOkb+xnARYJ4s?=
 =?us-ascii?Q?TnYUHo0+yLwtERM6Fg7fdlB0Mpm3n88FHAQFLE6RZWYckScsk3h03wE7qHLD?=
 =?us-ascii?Q?A08CNTi73DW8E53KuxJGS3GrpSLMHSFGcTKC4pc8m17cmFmgaOKO9hMGryqc?=
 =?us-ascii?Q?47MC8JnGUYaY8wxrgfEKBFNqCJZo4NrJR+qzsfOaXtzZ16xJqcxSPZKxO5fu?=
 =?us-ascii?Q?D3raXiGPEWmoRawcHcwbBQDpRVTJIYeEvPHKzZv6OYwZRCv6a1HATMBzHTFu?=
 =?us-ascii?Q?9KC9k0/iuFBaR7Isy4e+zMCHvmbgs3LMlVYnn7Mh1DWxHzbu1H/EovQbnduf?=
 =?us-ascii?Q?2ItASzuE/dMAmMFnzEoVLJWhx/Y8t3dWahg0aZ1Fn8ykbyjd+27Af/aLIxnn?=
 =?us-ascii?Q?HS86fdN0SIbkUCFqFPnCSBPRj7PF5VlXQaQs0LAHUnDWWJdoEfwnwXR8iBGc?=
 =?us-ascii?Q?K0JpYKYNK+HL2dmo2cohqo7EOJpyQJtbjOlx78Y/ZALHXsppbvdvUIyY9abJ?=
 =?us-ascii?Q?fgyKtVtVi0yMREAhHc/w/lu/JnNUhp6/rOhO6l7ByMJtgxuL9C3gBWvdRIZ5?=
 =?us-ascii?Q?Pldv8rf3Zrl0V7skpJ+v0drpYxecfAVsSv6JUwWfffYsRXKSxhm4yCnL07vO?=
 =?us-ascii?Q?EFbJ3pjVChHokwWiYoevGeT/StW3If5fwiwAGp5b99Rin2ZyHsAXWIilFv7s?=
 =?us-ascii?Q?vOTcjl4Npr3OY7lZ3XHb0QR7a0ys7PUmq/PaDUtCKJEwUtz4PfG0ASc9BItA?=
 =?us-ascii?Q?Q2Q5zjbDWwXNEiBPr2f7XL/5O3zI5I4pRYVrn/5w9qb+yiHw2SQ2EA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NS0qSE0bR23aD0OlLRQhf2oPiglHtSd3LjATlyV/N5mMcGtuSUN/sn60wJnp?=
 =?us-ascii?Q?seSvkpq2LfT2EJEoSyee9PN840bH1FcHzz38SOq/Sux7IZHzhXqZAm47jB61?=
 =?us-ascii?Q?swRjwf91BDMYF8iIJaL06lRLBURoUjEqPFyjAEHRHZie/jDE8+NeyqDrE7C7?=
 =?us-ascii?Q?nz8fXymQJHKdbWwQp0D9256g//8vrwwhErDpn0LFYNm4/lHoeL2E8Yz0/l6A?=
 =?us-ascii?Q?iQbbPE46VVgySBnpNaAVbRJ/cZ2DIaiypcN9uqMinkQdkG3/NRs7t4WqYzfG?=
 =?us-ascii?Q?5sDRJEBeL7GhIMmUUahyv/uIYktGsA7f9vOdQeege0Pk3YZicJ9jVFJK59BB?=
 =?us-ascii?Q?DkA7EPRbpcT82S3BmWnl49F8ibQDbldylc9Cb1MSzQtg+x+rzdpDzr4WsiYZ?=
 =?us-ascii?Q?MYO8gmFlkEHnUdxvRchz/eOAVv/O6WIU8vKnsVOnPR/en+XqDQDeSJJEGV74?=
 =?us-ascii?Q?apx7BJ5RB/HJj5WlViEzBOXHny0uu3bkOljSYJahnM+3sqWvJG6FL208qXJI?=
 =?us-ascii?Q?xNBPUoyDer2qjAAAHbDb/pAuD7sFATOLcHMiMnseLsnk8l20Os9tLmFEp+BA?=
 =?us-ascii?Q?aQ5iyjRnmKVkvcOHVmOH5elvO+gkfQeFAEkB/vtwtbOffqCrJMh27NXjd122?=
 =?us-ascii?Q?ucdXJHUxeX9eBrq5j7watc5N/XraqmL4oajS0bSqg9bFXpdOZd/eVZgTZbCu?=
 =?us-ascii?Q?Khaa12Sid0U/Ug0sCc/rm6QBmmIYjR7nae30JV4TgGgbsFnlipVRttfIVZQr?=
 =?us-ascii?Q?C2yMDLDykFPR9JX88genEaufy0mz0vvE5OF7Iv2MbUt1zNWBS4zvTJt6PmF2?=
 =?us-ascii?Q?8f6QaA9R4kEj1pQBzQ2VSC2f6Ex7Vn8d35OiySCWxGCv1p6KvEReGGZRm9A/?=
 =?us-ascii?Q?HmVehqpV2iRB6dshz1nXoGKPP17aAVsxBzowwSx0vjpnOkAsv7q5Ki+jr6Wc?=
 =?us-ascii?Q?3QGehkpDuoaMFIVHLvvwdmHjeLDcJ7c8a13sSXCuyAHEWV58OzaCx7w5hBkO?=
 =?us-ascii?Q?UJs73elhNdSJ6XWOW9586uF+AhmHV4g3oepdvVb9k95fmy7sQqu98ziFuntg?=
 =?us-ascii?Q?c6q+FccUYWXa8nGp/3UFSh1lT2h9vrDJtJYVU4CnyyOemHr4UZOAbfm8eTwF?=
 =?us-ascii?Q?reMK5uCdNm/XW0Czw4wihc0BcWaJyb0KDpsQnEHG/ZoVfbjx3DlArqrwTWHC?=
 =?us-ascii?Q?kmPTPLYHUgYb4WsUInTR2OTbVSetoLxCBiDtzJdx9IoQOzd5XhWijQEqK6gm?=
 =?us-ascii?Q?DqoCFpiFVf54yjbvpBkfC54fFaveJWByaWauLGwaH/3u8ybQ9FbZl9KbAMNp?=
 =?us-ascii?Q?RnDU66pgrmBh3uorAAYAf9VxbKq2n0h7ZA+AAPj4pxAN+UCechRMU9WEb8hX?=
 =?us-ascii?Q?/vN/Ldj6clLdDoQum9tcMJC2dbXK1VAnSisp4ziE7FSLe4+NRgPEWTTB3UE7?=
 =?us-ascii?Q?92go4gm6/fRqNWc6Q/693g1UWuM+MVRLSYrtpRrG0JkHx6iVBEGVva053us2?=
 =?us-ascii?Q?4VtvmtYDXwrTIL8L5afN6Inav6OOYFJaYBVYbUsP+IejzNUK5N2UHQuewD5A?=
 =?us-ascii?Q?vJ/rMwyRR3i6x4W/sWdzVAr7WEnxXchYL8vsdhLtEjwxw6Sk8+XDxeyz91vS?=
 =?us-ascii?Q?xNLsIAl3wrL+5+RqGG/Yqp4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbff585d-0c7b-4ed1-245a-08ddeac3e06d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:28:36.5287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG6jFU1iVTINmrpREPUVM8a41Kq2I0OAMFGcdJ8vELSA+hgPL0ADIhGUlr6sYXmsGurRIMJ36NyVopEOjlK4/1Lfva8bKr3A83aY7hmyteVDRfcLSZmukV0HVSiLrJGf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8530

Prevent issues during reset deassertion by re-asserting the reset if a
timeout occurs when trying to deassert. This ensures the reset line is in a
known state and improves reliability for hardware that may not immediately
clear the reset monitor bit.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag
 - Removed dev_warn() in __rzg2l_cpg_assert()

 drivers/clk/renesas/rzg2l-cpg.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 1143ce0afed47..8e9fea7f7dccb 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1667,9 +1667,15 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 		return 0;
 	}
 
-	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 assert == !!(value & mask),
-					 10, 200);
+	ret = readl_poll_timeout_atomic(priv->base + reg, value,
+					assert == !!(value & mask),
+					10, 200);
+	if (ret && !assert) {
+		value = mask << 16;
+		writel(value, priv->base + CLK_RST_R(info->resets[id].off));
+	}
+
+	return ret;
 }
 
 static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
-- 
2.43.0



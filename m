Return-Path: <linux-renesas-soc+bounces-22539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4641BB1CF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83D571C2CB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9171311961;
	Wed,  1 Oct 2025 21:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IUv/WjE4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A59031195A;
	Wed,  1 Oct 2025 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354090; cv=fail; b=i8TeVd++AYX8UTk9ye5CWXgG8Le7OBwjRb5awuiqwl9lueyuARiqTej1tQYMoUQgQnERgrlwNOJYz7XpsNvMqsJGOpNrD5tkBgGSxM1lBt9Maxokgeb8s20GC7suMEauwaJ9nKKr12PPrXf/S9ikkQbQ44j39YhVzYmbY5eDpuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354090; c=relaxed/simple;
	bh=69T3Yuwn00cVukcv3UwiPaitipcwfGPOH6b/OEBrraM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TFFdoELyhvMSZmGG7MBKmXH48tmWV+/f1Vmfdu6nwAcXhja+Zekf0FW0uM4YDqZhWW92HI1w7GCOWZAl+sZiBNASoaUjUgiUJ/t/B55exU0WDNWL4HsCb4odxsdC3X3+N8hNabhJedn7F9McIHDTSpKCncD5wGtk7Cq5Wx+JSzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IUv/WjE4; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJxwrDqw5NpM0UfITwAVjdPzceZM684ZpwIfQi8s7VHBE5zmTB1SNcd3YLSiAznDyvdgF3AUMwPyuKvcpPeGQBlPK/zMe70xkCi0nm1Vr1pduqKucyqxBorEIVpe0j3jm2cYnlSlv22uYDcNl2B6Mo+YfzBvtKgV3jJdZy44BfKp2ZAd43hvdDrQLAhJQ5IT/DMeqd8EaAlkknX5c0dhaPRuiYX1qrIgof3xtBd9pxbLVZS9Kptpq67vy6dJ9D6JpemxoX1Kg5U+vbJ7NNthyzv0P5uDRscg5aO6q26tOFCTgNTQ7icCubM7MB2XELnhdvNREjh8Peq8M/GXN9IYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bpCVef1RRSY5B1Ir3ECM1eZEQrQkk0YyvZMmcvwitM=;
 b=CCperl/hUyQRNZSrJrLDGMPtrUM5l4qfZtykOh6jOUKRlSlyP71IMrHbwh4EEl+5XfEpHZHMnQuwdalE/+9Ts1VxyPfqKXyDBMZu9bsS9OdLxl+N5kY9+KpbWvaWMuXHiFUdQzyiri8/dqhx25ZKXyZxCcIfE+NdvVzB5v5ko6U6XIEb1Xe/WxEQxJtNxWUSoi6T9kPBLzLlooIwj1ZBsqwUIF7JVutFZ4Gx3PwI02q2ALnyeBBA8pgYJD1vm9wU4OYG/7XtVTou8aVLB0yIvbPrjn3GyeOCMfBiVuk3hk73Um4HzN3NZhO03ckpSQBdjoKTrnpslyqBR67anvSZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bpCVef1RRSY5B1Ir3ECM1eZEQrQkk0YyvZMmcvwitM=;
 b=IUv/WjE442gJWQBlrbs/N/U5UvKLosbBCVrHRUH47C2N+4IJnakEgDhR/qNZyHSoYEuyx9lS04fFPFucPlJ6HFYzj9vARVB7XM7X8uzAPAVG9YT3QvH0uBiyhu0rRdTPyz96NGaWLyeYmNODRVoI8xs1CRH8Kvoem5KgU9Cs6m4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:02 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:02 +0000
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/18] reset: rzv2h-usb2phy: Simplify pm_runtime driver handling
Date: Wed,  1 Oct 2025 23:26:47 +0200
Message-ID: <20251001212709.579080-4-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8353168-cfad-4787-f72c-08de013166c9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1CsN20pj2Fl3MgvMz6/9LRG2uldVbj09lSDTJ/7t7c8anzqi9RTFe3lBWBQq?=
 =?us-ascii?Q?IgpEsm4cn4kZaHXGGO7GHQljyK6Dk8B1kE40NfunOcxjyu3PI0wsYH85V/vB?=
 =?us-ascii?Q?BxVSKsU68F0cxQX+ZiL5EP8kF9g2k4nns8CBoNnWq1JMRXyC5gwJZo+HKCtt?=
 =?us-ascii?Q?bkngj2dIXZXZDgSZFvJ9mInajnHFW9SfHAL6TeWaGycb4Z37L1fyW8av66NK?=
 =?us-ascii?Q?eK9tPeYOtnJyd1U50SVCJh7gK8QUsNEiQgLx4BFVpPejnqtqAEDMMDHN5nWI?=
 =?us-ascii?Q?9dJpk6nOVxGxR7x+vZD3Q/a8taru03ngrTzRPHdGjkxn4lMn3vpU+/TJ0bs1?=
 =?us-ascii?Q?IY3iq4OcgZHHW0qRh/VFzdUWH+cIhKQjcEfoxKJ3O7YHiUJceOpEMiPlmxIf?=
 =?us-ascii?Q?CX9+p6snJ6BsC/L/sPz82GJO95MnzwPLQfHWVbE57Azzkklu92HGFoiOcmgW?=
 =?us-ascii?Q?da78/6CU34JIFX5CG6FLABc15+JbFw4qmwM8wcAUnBJj1frJSZw6qhm+6LyS?=
 =?us-ascii?Q?R3E/4gBC0iIqb10JFzkxTf1otjVYJltcaZEyL4veKxF2BaWIO6U/cdDZ/eKM?=
 =?us-ascii?Q?aEAuMamYrYkqxK7j8dEPGmSCj9jDLJs0M/iAfQTRFzvfXnwguDtzlCGwVkb7?=
 =?us-ascii?Q?eZJC/4ZPtmqX8Wm8sRudQ5M7z8Pxk94tzUoJo5aGW62/kAdyWP1hQguznbau?=
 =?us-ascii?Q?xCW/wz7VSePBxPltxswixguykIXfNJRwSvGRrar/55YDr/frD5c9uJ+WiCtO?=
 =?us-ascii?Q?laR7qAJ3aIRvf7oUPbSe1nr5SMEf9b1BG2IHbEdHk9ROqgDhycPGr1CMKGBk?=
 =?us-ascii?Q?zHwmpwyqE7G5/iHdXee8AysT2c+fDCkyWSrTUtrnYhi4L6UFctKPsTG25pzH?=
 =?us-ascii?Q?gh/Emh7P4352MMyWCCRES5Jw8ZaAtXAYl5Ea2k6aJ0e/GtEshfjklR0vsQH5?=
 =?us-ascii?Q?lWSsvLwlheZ+95eFQ2VHYfq5CheBP093gSHOGlUMxm314uDZSyfL0j6DL8yt?=
 =?us-ascii?Q?Hh4lCLDrgGa/nUBykquOne5nsbGtfFUQFx2OU6uHAySCaOTn3BvE+VhoKsZT?=
 =?us-ascii?Q?vmG0DVawTMNoJ2gNNxuHapn6T7CaFq9HwhYUOe7D/NYjZxrGH+6kObnSXqZG?=
 =?us-ascii?Q?SGnCj61dH7T3YEKbmQtqcHiQYPPSRcqF4O9ix6joprVCM6/K5dgVaWLw0U9f?=
 =?us-ascii?Q?Z7xE6OVefxzwrxfYeNjEsR0tAAprPKrZfCZoxB0yNgyOVmdaOQ20gUtRpi4s?=
 =?us-ascii?Q?Jd3C1Hi+4/+UPjvGyoo9+WPekomS3q/xu1RNo/PwxYqJm7Qu4yI98tfme8jb?=
 =?us-ascii?Q?czHXO/8+VIK8lVe7XEfI00R58u6tHJgQWspYLCqHQBO3VA0DLKdAGzd7WNuk?=
 =?us-ascii?Q?s35NqDgZuekG8KSg4iasD3h8YAMUXvDGukHPYaQRjOQZ2ya1A1pomHCzkPCp?=
 =?us-ascii?Q?fQbynN6iRbaCG6Jsd3/fqw1Q14u1YHk7xJdL5YanAfJtl9Ce5XtlBHomIG31?=
 =?us-ascii?Q?PlS3m3RPG0JTSUCwch+ofH6kTZvOJuXglu01?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V6xPI0B0tny0Q8v2bewJJYrDthro/GEt2JiyKUuGhCehmbxdzx7t0eBKpR+y?=
 =?us-ascii?Q?riPsH0CPgtACcTyVX8C9bJGU8Gip0gQc6OBCWUjcYbWgsX7aEj0tgTRKJINR?=
 =?us-ascii?Q?8YVbQqkxHDdcXVQ1hhqQJxJteDepAJ3JvKh7ZyM078c7BIwIFw75GO69TYht?=
 =?us-ascii?Q?ZIehzNI/1J8g/dvF09gpl/hZIKPkXL+hqT1mhg6a0qj2RAzpp5gGwRwFdWsj?=
 =?us-ascii?Q?FfWWYuUSz/Nc0Fvt3uCQvYuK9VJ4tLk5HBT8NoO70TNBx7EiUXFABT0NDb7L?=
 =?us-ascii?Q?SWZu4QQ6sxge0WUghNCquHq8HaJrnJVBoL7sEV6QGyd3EK8nD8ozHGaJ41+1?=
 =?us-ascii?Q?gqJH7Ir/vdUIoIinonJG38xA9szkN44K8J0kFQQUuRfdrwUUTPQqwK5DYrMR?=
 =?us-ascii?Q?fysixh0MVDvn8mQ/7KW0+v2kd4Be/m/Acx6mgpa7S8diJFiH4uTmmvVMeQD0?=
 =?us-ascii?Q?HYliYENnpRZqpyaW7Ao/x0IoPUthDOEyZxAvKQ7rd+Z6BNOSI2Zpq7m8EnJI?=
 =?us-ascii?Q?KgME82qNq53GTFqmDQLzaOy9w/ZhFRbPBDJYYym0Ysq0ZkwgI61LJxwNaD2Y?=
 =?us-ascii?Q?yNBav3yt+yl0juGxu+WNZ6matZaDAISbdUES3zJHT0+tLQUwfjFPSBaW0z8r?=
 =?us-ascii?Q?UE+05MTVkzNntR9C3xG/tZhuJ7YituSLnewmhoTshMdsvHin/Yad3w6pjIDN?=
 =?us-ascii?Q?1qwxukH2PdPgIyR3RdjZmCU5l5TDx98nCHVagOyqoVBdWVUo0HlEO8XhQxNz?=
 =?us-ascii?Q?eF9BBgyEAAxCWNNBUsLzLYHqvDeRbUhluUZvMcw1GJB1c8wCil2YaCsu9ZkZ?=
 =?us-ascii?Q?16P2oBDZlCbDzaqGNfbe+5/9peJb7lb/M46/9B9d4tMfTgfDTJ1ofETkNkZk?=
 =?us-ascii?Q?8cbqap92SV6xc7R4DRxgIug2YbBmmpe12jSs+FYffKya0A9vBPkBi0SMlHy3?=
 =?us-ascii?Q?FwEJjRWA3VaMq1g7ytJK6pLaPZiSqKJOWM2UH3sM+X2eBtpsd9VP7sIOI8Xr?=
 =?us-ascii?Q?FgQvLA/nLdRhGL5sgv9wNtQtHaLpfFzWCT9uRS8xhyHjghhFsQ63epIiDNgi?=
 =?us-ascii?Q?PVzpBxzkzjSTwakE1cJw/foYA53g1b4uxBg9U58wjaKO5AM4lMMR7QdDnaMY?=
 =?us-ascii?Q?VshY4nLvXMFnYFwfv545RSBjzsYfiknr1HmqZS6XnTbCSJLafaJTMHIg6KA1?=
 =?us-ascii?Q?LPYPll1C7V1rzk65yQek7HzyQ1rEYr2vL7cBx2w9UrAfMMAfV9xsEhgaosnR?=
 =?us-ascii?Q?uvE/ZBqBGKetjHIfEj94PAzwv9inkwHtqRi8DWjuMPFHpmchgUCOsuYBJ+Ky?=
 =?us-ascii?Q?8wrmkpztLnWf3Fc9fd7bXZdTY9fy1MkiXoC4lK4kwc6Xtx5sq1JAoWhtZos9?=
 =?us-ascii?Q?iA/Tv4dt/4nnxNxlX5qdkLYfum7FcREpYlT3LVQwj9GneIMQQ8HEqOZaQwGU?=
 =?us-ascii?Q?IAlwHcNbg6L0KmDKnGi7h6juh41KIuBQzCjz/DB1BluEw8H6/iYFea1YCLvL?=
 =?us-ascii?Q?v8vcfFgOHkUMaFgQt7U+M898gmlcOh4P8QhzCrYsZeNCt5/bQVv6ilBnxIOf?=
 =?us-ascii?Q?gjXYIcqjNkfFbfOBb6jHwYsV0DhN0pj3L0XwtEwFO6kgkfiku3c0lSF157ay?=
 =?us-ascii?Q?g25trDZvZ0WE/lbjihCQkAk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8353168-cfad-4787-f72c-08de013166c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:02.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujOeoJcaddKobFu2RWucVhreDIYwIo/ioYF45j+RLFHeRdcqPrpu02SS//5R6YeYCnfiBHlV1YQdI2R+mFFIlopT+zMZEcpyXLSo7RbPHGtq6Gd6jlmo564bEUgRWfXg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Remove redundant pm_runtime_resume_and_get() and pm_runtime_put() calls
from the reset assert, deassert, and status paths.

These paths do not require runtime PM handling, as power management is
already taken care of during probe and remove.

Additionally, the IP is active only when its clock is enabled.
Previously, the clock was being turned off immediately after register
configuration, which is incorrect. The code may have appeared to work
if another module had incremented the clock usage count, but this
behavior is unreliable.

This change streamlines the code and prevents unnecessary PM and
clock state changes.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/reset/reset-rzv2h-usb2phy.c | 48 +++++++++--------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..7cd559bc52aa 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -66,19 +66,9 @@ static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	rzv2h_usbphy_assert_helper(priv);
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -87,14 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
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
@@ -102,8 +84,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +91,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
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
 
@@ -141,6 +111,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
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
@@ -175,14 +150,17 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
 	/* keep usb2phy in asserted state */
 	rzv2h_usbphy_assert_helper(priv);
 
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +168,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
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



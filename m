Return-Path: <linux-renesas-soc+bounces-22540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A5BB1D05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529354A8628
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9853126A0;
	Wed,  1 Oct 2025 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Dw0BDpar"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013D311963;
	Wed,  1 Oct 2025 21:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354093; cv=fail; b=IqJNo2A0b0fpzViuUOzApS5oRnoPsPsu9F1Z5y6zMgeqjblxSPCzkJN4nyIujOHb8OoN5ga1cSRSScd1sekiU5M6CAbLAOkSIjI+ZaRmSyQlOiQNzKtFzeF2OBtak01NQp6rZ4nbbAvSW32lse8vkvNQRWbIuMTuNG92G9FrTwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354093; c=relaxed/simple;
	bh=vbXIdQoYyfXKCqAfYy4o4UcivT1bBtx7hC9tXfCuOrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bZsHuCak0fetMVzDQet7yG5bvTBsJe+hibIcjhl9EoyqiMcvGP4Z84zsvX95fZ5pFsYWk7Oo+QtMv9QTxWe7wQXztPjSexRt6CNyO0y/7UOKx0+ImrybOTJ5WLo3QUT7OF9sSJw9Rgk6zqqi4+DS93j1mFIgBSMFS+64s/7zKVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Dw0BDpar; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OklwGmuXeKcp33ejps6k2kt+GYY8etqbBwjK17iUFbx50mPmCpCkyvDfCJLhH5czmW0XAm7FofztfdP/z4T+9nLECLZ9xtVsc8bchNYcKxGYdJeuIXeTqClmUW1G7uzpyV95AFcEzxynHdV6V13Kng8O/xS2LQsTYhGrrhrxeqAKidG2kLItkzIxx8AO1676cjbqz6e8ZfZ8c6/rVve0utvJGzZYUYSw5qFbG4qBPEbNYuuI7ke+/PbrzYrf/zZJdrFxUNfILKFAQbe/FicN1qdbgwQkzlvNXBKwpPKCqzwuI/6NlkBB1kLBDSRW4T5bURzUtu2RUxBtZGOsuZLtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j67QRxmjnkWHU/pJNnoNfc6NmFrb6M1ThQAcMSv89Ic=;
 b=rl6Tf/gAa6dl6REI2GEN34q4ph9sajYnEzo+0dNr1UeEtdB12LwHkXM2bvwraQOqv61Dhj9l+uha/rMOibD9sVMQuhhl1fK2H96o08AiPktUpJlWOLo9Rfte3M9qIlbxgyK98hYyTviO770Nbn1fS7pimSQmtRgiGiURYBtfjhgYko5yWEFoL4qOnWB3YVe/+b2PwleJgkcpfa19oXO0Yb987U0ooUhLNKr17RynxuWPwQMF+eD0qTmXry1ThUnkLmHrbqoRL6ShXvs/Sx/jLkASM2Kud6hlAxeFg0YslXb121Os7e1mMJDHTpvh/VsAsGA3jxSHYAJZLl/EWr5klA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j67QRxmjnkWHU/pJNnoNfc6NmFrb6M1ThQAcMSv89Ic=;
 b=Dw0BDparqWUG0wb+3NyuMU1DzI74l+Rcd4U8toE/DYytxN2IxVKNB9Wy0HvdAcrMuaYVyKD1mkqlHrfwo4Myiw+DdpY8MFpF16yTEgoj/oEhdRlz7qBfFiZeeGlbBQJN3s96k9ps7cdxynsTUEQK/IdHarqd/DQqh+vUjE/8+Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:08 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:08 +0000
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
Subject: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register for OTG mode
Date: Wed,  1 Oct 2025 23:26:48 +0200
Message-ID: <20251001212709.579080-5-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0a77b197-1708-4bdb-efec-08de01316a20
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5JVnYfsTisULhc8eLXfbI+4D2esy7qZPTRGvVOwPscKANboVMJ9TvNnMnUEr?=
 =?us-ascii?Q?ho4Fz91YY2lFhothLcNYyL3dE814J/n0AsxHcqZkbd+Wfj3ZZtWx6IPKrLx/?=
 =?us-ascii?Q?7wKT5dEBHgcrlLx1jbixEgmssMhicIJGlK9eqElsxggKQYRJYqJ1S2UFUuha?=
 =?us-ascii?Q?7Y+ZREt8eiwIHGlP9J8il0pU/FKgRGJqB6zKaxW3Qgyk7+pDzCCCM9DacrDu?=
 =?us-ascii?Q?6yE3mpe6vtnUbPsqQRcG4zbSMjSvGbjdAZtR5NUzTa4r5sFKlyhNh0fig1L1?=
 =?us-ascii?Q?I32q8MImrFaSGMoLgBSEcTH5Qnfz1qnFREOtjwnDreFv3MggrY8tww/1x2Sp?=
 =?us-ascii?Q?QZipbkqVq3ABNaPeeUajXsrBaNazskFIGiBovz/SfKbfq7xKyhttLgmMucNp?=
 =?us-ascii?Q?lRZgjj/nPiEAGUjEEuE1kk6t6yYftyFz4aLTYKnaNN4eSR0lj6anTBQWgeKd?=
 =?us-ascii?Q?4XTfW0Rco24P8izJTJEpPIHJTJAJBXlDiAlq2S00zgUT15zVu/SD7mLpvSwX?=
 =?us-ascii?Q?DVQxbSzDYn07L1ezcrQNFxEZRX3ObLamzOYhuD8VqY+VPiNRO4FU0/fa4BlD?=
 =?us-ascii?Q?LSfNOwdMQsagJY70NsHGxNTbwrGiEyyZfBG5BZ0dXHpOCWAlgCc/SHUtXV/o?=
 =?us-ascii?Q?/kb05+fRX3N+9aWPsdPvXNv4DrhCvCxThfcH4BilzLfJzFnG0YGo717Er4/q?=
 =?us-ascii?Q?tkTpZJNXnsCWpnbiYRgvxYcdfoG9Rhs5l0nL4idOZrdLaUHIM+tM0u2Xv6wa?=
 =?us-ascii?Q?dCiMXqtJGoMFhlYcsPaE8AziwmLwB2sEmmPu4TExJcRUzMT+YqjfYhDwMaKC?=
 =?us-ascii?Q?V7tgV6x+JkyLXkP/bqFDCA/lJUgToiOXHambvsWLABA4V197FHditk53YLO+?=
 =?us-ascii?Q?8LquKD0UabEU/izQ5bEcdAbnM0XYeWuXPloPfjE7DOsyynMXwY+WCdruJ84I?=
 =?us-ascii?Q?7ZrU3YLl3D6I3Ej7o5UdLnBhApiFDIKynMq3zfj8/gnuroBZIrWOW//E64cb?=
 =?us-ascii?Q?DmZji+jl+WlNHTGRQ7b1cG0g/lQioCuzX2WcgRqlyp2A80naM/J7QpHtufsj?=
 =?us-ascii?Q?ybYzzisrpkgCwzLm2pxYR2go4mX9+mE9DpfTBPIvJuccW6PjJHzboWJNykGr?=
 =?us-ascii?Q?SL90g2NqXROTlVjSz5U+t5qt8bN+ENVHUu6hA2nyRqk4J7DqYLryHGAMUYLu?=
 =?us-ascii?Q?5qL2VtkScSeoCIfWGyxBfatmEaLt5h9mKq1NNb6VHe0Wmd5NGF8JPATBw9hQ?=
 =?us-ascii?Q?XAVbgYr71WLElnP7qF44LXE7y/S/NCO1/quHdcrlW0KFoXTvACRe5WbMOlhd?=
 =?us-ascii?Q?vhsZW5FcPI44vb1G02fWat2WM6Gaghoj7firQlw6mJvJ1nMbtZuQeCTy3DvM?=
 =?us-ascii?Q?1ExjUlKoBdAVe28+m9AJPqYsX/LJ2dkgVewpiX4Kqe/QbGPxHEmEp9qDmNOf?=
 =?us-ascii?Q?MFlMpfL8rSXLKs72JE/zyAsoAdcHZJShTTpq/CbrhGdIYI9PJUHb/j8joGTn?=
 =?us-ascii?Q?qI2/rNeCa92WO7gjd6w+V0wHmL0RbNWv+X49?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xF3UgOvw20F/gP6gsJ03U68LtXbxCgeMyjFJFqOv1jiwUNpNckZBbgugViYk?=
 =?us-ascii?Q?hPj6ADFNc956lVpCydJUfkbUZzDmxKJqIVf16+zk6zZiSv7ijw+BKd3wLoe9?=
 =?us-ascii?Q?FfMs1wVHMr3ZskeknMX9ThyVL/jr8I0phOsSERiQJumJBV/LpoAzBg7Guhc4?=
 =?us-ascii?Q?kJhFWp5DqMaLf/aWZNjR4hku6LU/fClM2UoKTYJHkEKRAeHmx/TdIq6Siqdf?=
 =?us-ascii?Q?VFea3SGBeWq2603SclTbRSR9xQK8wG7aQKTNOTrWUTSQSn2r/3l7pzm/s0Wh?=
 =?us-ascii?Q?L8BzeXLHF4AYwm5PDlDmTp202X6lA2kCQ4KSn745x8eDnEwsMfJaB3MxZiDl?=
 =?us-ascii?Q?yVoE7kRHs4Y2aNwwHkgBbp8CCUxGVzl79ymjo3vCEFCv6nkLoiFgx0RI80Tk?=
 =?us-ascii?Q?bOGctCD9CgshZRRDgMtMsvnIt9R2/NvMSLrMVJPig9OAQpEnce1NbunNfukl?=
 =?us-ascii?Q?t5IIkRT22NwJzUDRKbaR45kFj2suukGP+dqqRF72+aeeDxEonaXPai/z4zVS?=
 =?us-ascii?Q?nqmfTubpGVjFFwsTmuUydwqmTzJU2CTUciLarg9FmnyNKUxAAxqvm3IP95NM?=
 =?us-ascii?Q?aHDN09iG69Nf7USvJFUxAqogQ04gAKENUf+4wtjQgDiWh+VLIuUPOlqiora4?=
 =?us-ascii?Q?swTtLT4f53LJSdtVZkl4IBWDapDS78k3vJDed0sJwGuT46PfvqKNOCEAEmNt?=
 =?us-ascii?Q?1XzewibNqUfO9KG/CKee0qXJEmiyDkxkLakGgn+Dc5n1VcfsoIo7NpP24ZsA?=
 =?us-ascii?Q?Ln8kxGe9OqXpGmASA006CdWbJtTPXc/KDsFXau7pmyU5Hy6wQCvg6WxP7Nf/?=
 =?us-ascii?Q?Xv+58vCPa3lAXXMrHTYry6+iQOKeKlhag0tL/ldn9RiNauX3mjrbiBMDFeDr?=
 =?us-ascii?Q?fge83xE+0IBcc2JqiViHx/FlQQqOHIZHYkOug8yHWNixpoFjI2OLab5UCBfF?=
 =?us-ascii?Q?D88ZDgnzJd8Vbojl8XBE16Q4QBxQwE0wzZ808mDWp2P2UOHBwrLkTsDQLjyj?=
 =?us-ascii?Q?XcGcnWFspllwTrYpG2UN96KJoNkKEk8GW8kvbSMjORhD6T0zy5vs64yY/slP?=
 =?us-ascii?Q?vB6k3RzaCMS7fC00oCzo6vFp3DmHLWO+X21+99E2AiECBceS20PpsxxmXcCg?=
 =?us-ascii?Q?KZA2aldU2DehcaIYei88qoCA9OvlmUYjBRmPXTpAJpCPlVC5KU739aola/7A?=
 =?us-ascii?Q?D2elXWQrJZBeqS6If8RgURNo0mGXXfQ/wQBeMuWCaZslCGarA0zS91JPd/PZ?=
 =?us-ascii?Q?l2DE0sOoHABo8myfIRCuuK4eluZeU3Pwytqc3ACWO6QM+Y8UegFGW+9+hU7F?=
 =?us-ascii?Q?8zMaOxUK0eNEF55hXjXvuocAduvgVV5y5GFuK4rRb82nXadUr18q7hkMIhgP?=
 =?us-ascii?Q?Z7/qwm3k7v0OkxqAVjqlB61c4ZtjEwiyDV4BWMkGQYbg8Ju4wlO7fRoJwN42?=
 =?us-ascii?Q?P3/iGWrzi9XJCnLwpooLZhCfJtg7n1EQLnbb6GI9i9dQyKJPCgI6xGxVPldm?=
 =?us-ascii?Q?flhgSlOb0DjDSQGxCqzJXqFEhqb/+1fL+c7TigAU2mYy1WTBmKx2WVErwsnJ?=
 =?us-ascii?Q?YNTajEiVoChNaLULbQP97LOLYdZBpUp0Wm3HvhpA3f4xiYyokEUKrSoJ/w4P?=
 =?us-ascii?Q?QHHTHTkqSJ5z5GsPmQI+yjw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a77b197-1708-4bdb-efec-08de01316a20
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:08.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLwBXg864EZ7dFxtn6I0pWMzNnpEJ5EaM3GdGFbNieLr+YB0+IFkjwuN5McDbwdijtL2Ap/f6o0ygG0A9DwfTVTgcuOsTjEk02IgGJ681Z7gEdcIUMnM4KTOfaWgBOUp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Add logic to set the VBENCTL register when the USB controller operates in
OTG mode. This is required to ensure proper USB transceiver behavior when
the device is configured as OTG.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/reset/reset-rzv2h-usb2phy.c | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 7cd559bc52aa..059915cbace5 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -10,10 +10,14 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/usb/of.h>
+
+#define VBENCTL		0xf0c
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -111,6 +115,57 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static enum usb_dr_mode
+rzv2h_usb2phy_reset_of_usb_get_dr_mode_by_reset(struct device_node *np)
+{
+	struct device_node *controller;
+	struct of_phandle_args args;
+	struct platform_device *pd;
+	const char *dr_mode_str;
+	enum usb_dr_mode dr_mode;
+	int index;
+
+	for_each_node_with_property(controller, "dr_mode") {
+		index = 0;
+		while (!of_parse_phandle_with_args(controller, "resets",
+						   "#reset-cells", index++,
+						    &args)) {
+			if (args.np == np) {
+				of_node_put(args.np);
+
+				if (!of_property_read_string(controller,
+							     "dr_mode",
+							     &dr_mode_str)) {
+					pd = of_find_device_by_node(controller);
+					dr_mode = usb_get_dr_mode(&pd->dev);
+					of_node_put(controller);
+					put_device(&pd->dev);
+					return dr_mode;
+				}
+
+				of_node_put(controller);
+				break;
+			}
+			of_node_put(args.np);
+		}
+		of_node_put(controller);
+	}
+
+	return USB_DR_MODE_UNKNOWN;
+}
+
+static void rzv2h_usb2phy_reset_setup_vbenctl(struct rzv2h_usb2phy_reset_priv *priv)
+{
+	struct device *dev = priv->rcdev.dev;
+	enum usb_dr_mode dr_mode;
+
+	dr_mode = rzv2h_usb2phy_reset_of_usb_get_dr_mode_by_reset(dev->of_node);
+	dev_dbg(priv->rcdev.dev, "dr_mode: %d\n", dr_mode);
+
+	if (dr_mode == USB_DR_MODE_OTG)
+		writel(BIT(0), priv->base + VBENCTL);
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -172,6 +227,8 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	rzv2h_usb2phy_reset_setup_vbenctl(priv);
+
 	return 0;
 }
 
-- 
2.43.0



Return-Path: <linux-renesas-soc+bounces-24389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2974EC467DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 344D0348635
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651E230EF87;
	Mon, 10 Nov 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aNWVPD1J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6230DD01;
	Mon, 10 Nov 2025 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776609; cv=fail; b=hWVodT2kL1oA5RkDVd5nL2fRGkbO/tUhiSf9In7obgSEnF5zEjYFDUIhvmRNRTFwsXqMjaYuCmrJ2z2Fl3ySJx5IWdwhElpvo5ZeUy6bhRXQMOIlbVO0yL5NXA3027WMrGEUVmBSsSn0kXZVdZiRCZ6Xzf5CFZpEh1Ge1strRhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776609; c=relaxed/simple;
	bh=Sdw7kMKs0JzBGyzIpi1JkXsV4uNhqxYkloD59GPYmOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OmNl7LMxBrDzY/MbA/kyI3CVYfIrZx+WqML7bYjVIP9zc1MlyN1bTXZuc+bhSMp2tQfEb1Me2WDUnPCYHoyuOiJKC2hDVRbGfbowUPNkLEFT2WgVxdpw3oO4kDrWghvIQCPDZU6tDo6kK3OTZN0sLebX5NfONqlUMlJ+Ty7TdPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aNWVPD1J; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m11OTDFsNS1n4e+DKrYmULECMth3Qx4Mc+P2duerA0iVAqAhmuAnpspSZ32yVlKHfOYtqpQGZwQZL3yAZXQbeu7D5rVqRZzvy30pD3Ggrb40odSt4zthWk5vdvpqX2GBk1s/atWINICT/aiykl1SEoDS7LBhBueGkj+ql7WCGP+QJ+dAHMCK6SBDR5K5pOL4FG57iKQUQDjemod2ms6zJY1CX7Df9Qv5qDAD2PpnwsFeGHn4hvJV7eOue7ZiiaIok+3AqUK/fGsomJnXPAOgRndbNZU39hx3Uh2epsTJoB4e0qe1Xv/nxWAYDlm47qJOGJKmlYNL6+7bbvpvrFWQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EqOhh75m8NaGd2q3/oQcjixr7y6oB+0wSmNoTP2BK8=;
 b=bkg7JuR3VKRPl8O1cudm/v5qCnU3I30eEabyCuqOJgke7PEVHQL0P76Gn6X0nJysnTa3pYuNCXMQ2IrF6TSD8mKXCVO+z3zN1xTy9X/kFNISoMgEE4nHto6U2ZfC9th2TyCpuydLoL0ppSTmow4o2wGxPGhr9WvwhF8v3rqtIdnUszRbPH0nU5qDfCWHxnnSfOkehEG5N4SegGfhj0UkY9ddZo3aO0vzSE6lTN9s2Hl8d+DD5sAw2HeWF+ywGAdL4gG+3khz8VgkxYE5cW/GiP2lYl6J16OnUp23htowv6dqzTfHtbIiI8GITVYI5GRSrnk76EiGGL5eLs7o/mbBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EqOhh75m8NaGd2q3/oQcjixr7y6oB+0wSmNoTP2BK8=;
 b=aNWVPD1JBnnaIcyYofb7OuMeqMEU8Z+7vi0+lgR3AIZdQZ+RZ6qKnXJSaTCVgEx1jpkvRZ7ahwSdulPZ1DTepFD5kIh8nq/nzKH1nz4okxCEZ9c+TUdP/vICYdz9B1g1RDMCuPImxrWs2YGeV6ri+STlWneuXEsH62CxhLf3cDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:10:02 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:10:02 +0000
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
Subject: [PATCH v3 09/21] phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
Date: Mon, 10 Nov 2025 13:08:09 +0100
Message-ID: <961d80f1d09e190e9deea6b230ba153480d54ca9.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: ed90667e-2441-4da6-4edd-08de2052136a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SxYa44lXs6wrt3GPEhdV7vTwEDZAMf7t8fxiQ8H9dFFHcVRg/PHytyrIKtJQ?=
 =?us-ascii?Q?OeDvk7TwYwgCJo4wu+/z7kE5sHp3op+AFQJWmKTHgQUqFJ4vsbjLd5zzgWWq?=
 =?us-ascii?Q?cWfZi5Gb1NzR4UvLnJcF20m8x8J/gqLpc5gHGAfC6BujL6YipAQL6Drfrfdk?=
 =?us-ascii?Q?+4GscTLDt6aRCjB8XPn6qfFdvsFw5rBMhFE99qtNT4z88r3SVfkm7bbSsOit?=
 =?us-ascii?Q?+IKIPdmXNPfmwt64sVVhci+CYO+nl3xlRLz2UutuOXcrML/eoyX1J6H5vQ45?=
 =?us-ascii?Q?O215pHmSl1iVxWbSlAAaVCBXznTQ7fYDtRPFO+pYLRtX3t75vd4jRq+6asj2?=
 =?us-ascii?Q?Kq3Yiu28W96n745ccdUwkCkc/SdhF8ghQlVcaaL1X5D1vW8ovNg2tqDY+F2/?=
 =?us-ascii?Q?MamCk5vJTwaZhxFJZJ1DWporwZl99aJZAt6aE0PvlA0zlCkK7CRQZsLXlOfN?=
 =?us-ascii?Q?Cedqvx49LJd+iTnnD59NJkZ+znazHsiNf73t+w+CXO7vbfp2flwzHtI4KP6A?=
 =?us-ascii?Q?KxesmZU27StUJqVZS+xAFnrmVDqHgOJxkHQWYYODc0K8vB3XQIYrxzVodkHD?=
 =?us-ascii?Q?CWZfsqnWujS7Ro5GkeU0JNUSns06UmiJwAAZV1MJ1mpbPC0og1NXv7e4fkbE?=
 =?us-ascii?Q?O14XaU/CP7lCwbCQfUuy23HnnztHuLD/oQj/s1Lo0vuY8N3MOHkIFXeb8mMO?=
 =?us-ascii?Q?CzhALFVSrbKQMep9IK5H9nZFImN7MtOt359BbRofKa17/px0vnIaD/ORvaN9?=
 =?us-ascii?Q?ldI5lhUy7FSeuQCoXJYgYgw/3JK6Febm2MIKB+5UpHa9WUdJHJV7dss+eMBV?=
 =?us-ascii?Q?yYaIRaFRHeY45gAT+rKi2zQ/0Y8lALCHBKiGPwMyTCtvpFbS0inSyu4MDfVT?=
 =?us-ascii?Q?Uco8oFtBFz+m/tTXUrKXispaN3767EyBh+HNhovNvSr9A/4zZx6F5IC0P5/W?=
 =?us-ascii?Q?VOGCOCFdtO6Mo9laU3hoHI0kBagJXFcFBe9cOFxG1cyVYic1y7SUrZ2eqMbO?=
 =?us-ascii?Q?Iwgr1LIFWsMoE9mfSZyZMmpc9Ok4ApQcp02dr6GBdSGlvQElI3r0BLcPP22j?=
 =?us-ascii?Q?ZqrsOr70TC0xPQ4eI2uyWkSZ2rdhLJ1RSPNQHYOBXieSA6xBGJlqfHLeK4xU?=
 =?us-ascii?Q?MU3/xgGnCenVC59KtLDrnaOOW6l9XXm8DEJM6HqTTi4pl7voqwxban1psCuY?=
 =?us-ascii?Q?uQZSwlchyQ7oyqyFfjn1lFQJDFmVbRzud8Jjato41PULH0AD6QnBKBQVB96H?=
 =?us-ascii?Q?2BqsaicCYrR7X/H1x81oTQu5Vmqx7d4OjRBnSXPe+wZ//hClP4datHZ/GunC?=
 =?us-ascii?Q?qaGZlKoxaIlmeszgh+r4sAEQZ4GI2IV35HrQ08MAUvEEUA7o5mP4dPfJPgxB?=
 =?us-ascii?Q?kPRlkzItCNeDO+4ILOPSXJGYZd7CNRf1Xx9C466Acshv052nDSVb44PNRflQ?=
 =?us-ascii?Q?0BG4P44rXvtZ9J+Voealz7YrBvtaqEj1wJ/0Nz7ylC9XLfMWx8LmslpUsXqb?=
 =?us-ascii?Q?vYYk8AKs4KQ00QK/DKWXZkEYiBSaZnr/GAsP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EyeaMlXsGs+IO877sSlCj/YuXgkn9lptbY9MtZ8mYbT5W0Y6G/ZfuAfbzoiR?=
 =?us-ascii?Q?k3vvP52IvgJ9FeRBmEIXir1wnZLr7TeXrjsf5oNOKXJJ4GBYjrXYPlehCsNn?=
 =?us-ascii?Q?GBGPXjtwCXiph4G645AGpJmPaX+qa3MHkeQYEiOptHN+Y7hMMluT66tKU08V?=
 =?us-ascii?Q?nFdkKANOiV3/w067WYYRTlDauLJmEGCl5Cmla35lFdhj9JQEfXjfDkxSOZ4K?=
 =?us-ascii?Q?+rxz3w+73mcGTajoeoyXIn0cSerKs98NIpAvZZUC9AALu9YYG845tRM93cFp?=
 =?us-ascii?Q?Iaw0wk8OA0aamgy6+3uUgMHbkbwHx+ElSF3ZuIP/hcO1ONTXk5zzzMtMfYUg?=
 =?us-ascii?Q?IRx0pRZM0+mqTCSs6jMJGdcSCPJqbGrp9TWabTaIzQzUh4JNi4n5VE0kz9HF?=
 =?us-ascii?Q?ActFHSRsYakI9BK8loXBb+Ixj6jTdA2rqKdj99sePZP6AOxDXj6jioH7RIrz?=
 =?us-ascii?Q?Pynq3KtMSqDBlft3r89s1TjAfynrHCpxG9I8u0Z9RFQbctIZv/vYAsPrth/I?=
 =?us-ascii?Q?Rgot7jb5BmpinEDwl8sVAkUjy0hdNt9v9Q5XGkOeRav05KjH1/m6la6J2xpP?=
 =?us-ascii?Q?aP0sQTes/oU3fkWOSyQseSsWzJQwD21s6N7Q9ZQ3gBYo6FJn4rhBtt3r2v20?=
 =?us-ascii?Q?QvlswisAdiurmxO5WBr9po8xc7IJuQwBabg/z490wkblWAGsu0rSS9X1Tf9b?=
 =?us-ascii?Q?+b1Zkhfm6ejw9oX7tkeQ2bCkxphAL3zxyETw3dSGiS9SKUggRNTtveqwyNm5?=
 =?us-ascii?Q?OyOBSsG3xpd7OHK1xEIlQBPryVji2EZXNrM+Ja488h2upRhWT7VnqrK2mpN9?=
 =?us-ascii?Q?+hL8ZKVYcA/25jj+9J4ZhsmnM1geKQjCMq0O7CYp7KKvGs0jIBL1uCpb024Y?=
 =?us-ascii?Q?PeNLRt1lY8EiY0P/foEO6oJ1/i50HwliBFXKKg1VfshsWW5M6dYqGyzDOItu?=
 =?us-ascii?Q?ETKd3FQjQ1VpLSdsrYEJACiZAiFwA3r+E+KwtOijvMERsTe7rsNB6Oe6kQmb?=
 =?us-ascii?Q?RxT+mxXW6JZXA2saXQlmKZ5zNY+1tyEblPwJppg4sbbTl93P2cIofA1iMiOu?=
 =?us-ascii?Q?cDLq6W5YbRj6g96TxnhllQ5qfZZ9BLos360sOaSR7hHg7o0yyEdQU1nYLlwr?=
 =?us-ascii?Q?JtfOxDoAJH5p0SsxVzR2TMt8QIMQiFuelakxDr4EZyutrotlLwXDWOS44MiJ?=
 =?us-ascii?Q?3qM+WtIDhNBXdcLajN94dWCKOy8TUszc67ZCfxGsi96PdKBXmgiq9VN+IwRG?=
 =?us-ascii?Q?P2GlwuaTiRJ42odk7ShZ+EsfL4agqGM1jSKfxDY2tc5jvzVlUPJ89lTDP924?=
 =?us-ascii?Q?U26+k112bfoaEXWAF7oAqOmbuRZabTfWcN1A9rc19DRC5hkk74EtS0OitT6J?=
 =?us-ascii?Q?Afm764LXMU43a+Id7GgCzP3w6JYnHMf0bQx4vJfxk/6y/VozdFqsPV7Oz1AQ?=
 =?us-ascii?Q?SYUljAedOgmqi/TnBe+MbFLUxEM9hZMDAVWNkJe2YFqZnONG991uiijQe5kL?=
 =?us-ascii?Q?VkNKCA3q1gnpTksJvQExTH8laCKVct0SjgO/gcLcJNe0b2T5Tziv2rbNBpp+?=
 =?us-ascii?Q?qOEZLqER7eYIu4JfMB2J2cbczpExp1t+l4Lq5AKKvNRltkcLCCLjq0VRjmmr?=
 =?us-ascii?Q?fo+egBBPrvUj/17h5GVZSp4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed90667e-2441-4da6-4edd-08de2052136a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:10:02.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCA5Hf5utezhdGAy0+Ed7jSKH8FSALAs4WQ+EUk0Hxb9nBI8Gy4Yp8/nJJJkpcrp38L+BSkWqrbqPLoyg1NW1bw0348N9zOcrPK1QrfldNB4rWroonXEaOf5JlX7lt5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Enable OTG VBUS control on R-Car Gen3 USB2 PHY by registering a regulator
driver that manages the VBOUT line. This change allows the controller to
handle VBUS output for OTG ports using the regulator framework when the
platform requires hardware-based VBUS control.

Without this, some platforms cannot properly manage VBUS power on OTG-
capable ports, leading to potential USB functionality issues.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 142 ++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index f6026b3b95e3..6424fce18705 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
@@ -140,6 +141,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool otg_internal_reg;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -224,6 +226,11 @@ static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
 
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
+	if (ch->otg_internal_reg) {
+		regulator_hardware_enable(ch->vbus, vbus);
+		return;
+	}
+
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -592,7 +599,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	u32 val;
 	int ret = 0;
 
-	if (channel->vbus) {
+	if (channel->vbus && !channel->otg_internal_reg) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
@@ -633,7 +640,7 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 		}
 	}
 
-	if (channel->vbus)
+	if (channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -819,6 +826,128 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return ret;
 }
 
+static int rcar_gen3_phy_usb2_regulator_endisable(struct regulator_dev *rdev,
+						  bool enable)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	struct device *dev = channel->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	rcar_gen3_phy_usb2_set_vbus(channel, USB2_VBCTRL,
+				    USB2_VBCTRL_VBOUT, enable);
+	pm_runtime_put_noidle(dev);
+
+	return ret;
+}
+
+static int rcar_gen3_phy_usb2_regulator_enable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, true);
+}
+
+static int rcar_gen3_phy_usb2_regulator_disable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, false);
+}
+
+static int rcar_gen3_phy_usb2_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	void __iomem *usb2_base = channel->base;
+	struct device *dev = channel->dev;
+	u32 vbus_ctrl_reg = USB2_VBCTRL;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	val = readl(usb2_base + vbus_ctrl_reg);
+
+	pm_runtime_put_noidle(dev);
+	dev_dbg(channel->dev, "%s: %08x\n", __func__, val);
+
+	return (val & USB2_VBCTRL_VBOUT) ? 1 : 0;
+}
+
+static const struct regulator_ops rcar_gen3_phy_usb2_regulator_ops = {
+	.enable = rcar_gen3_phy_usb2_regulator_enable,
+	.disable = rcar_gen3_phy_usb2_regulator_disable,
+	.is_enabled = rcar_gen3_phy_usb2_regulator_is_enabled,
+};
+
+static const struct regulator_desc rcar_gen3_phy_usb2_regulator = {
+	.name = "otg-vbus-regulator",
+	.of_match = of_match_ptr("vbus-regulator"),
+	.ops = &rcar_gen3_phy_usb2_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.fixed_uV = 5000000,
+	.n_voltages = 1,
+};
+
+static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
+{
+	struct regulator *vbus = data;
+
+	regulator_disable(vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
+								  bool enable)
+{
+	struct device *dev = channel->dev;
+	int ret;
+
+	channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
+	if (IS_ERR(channel->vbus))
+		return PTR_ERR(channel->vbus);
+
+	if (!enable)
+		return 0;
+
+	ret = regulator_enable(channel->vbus);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+					channel->vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct regulator_config rcfg = { .dev = dev, };
+	struct regulator_dev *rdev;
+	bool enable = false;
+
+	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
+						      "vbus-regulator");
+	if (rcfg.of_node) {
+		rcfg.driver_data = channel;
+		rdev = devm_regulator_register(dev, &rcar_gen3_phy_usb2_regulator,
+					       &rcfg);
+		of_node_put(rcfg.of_node);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to create vbus-regulator\n");
+
+		channel->otg_internal_reg = true;
+		enable = true;
+	}
+
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,10 +1019,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel)
-		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
-	else
+	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
+		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
+		if (ret)
+			return ret;
+	} else {
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
+	}
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
 			return PTR_ERR(channel->vbus);
-- 
2.43.0



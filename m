Return-Path: <linux-renesas-soc+bounces-19537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A021B03391
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jul 2025 02:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 924D11896979
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jul 2025 00:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8410360;
	Mon, 14 Jul 2025 00:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l+wuzABU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC15B184
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jul 2025 00:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752451618; cv=fail; b=PdNsuFVhzpQ5PEt77+43TEKkK0XoZRZFkghWuTxlqPjG3Et0K8bubgq9IiFcmmHdFpfpg17KyUm7HtIDZ/u1F3y5zzwp7ELgOfekF8maz6v1ABxQp47+qKwiNrVInH7DDBalREnbaORZzUPcgj2QC8XkLZDzx2phIcPypiXZTmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752451618; c=relaxed/simple;
	bh=X1TncONbzgJlpzkVGkGQz2vW6nAxSlf17CLn6T/4T1Q=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=N825F/49jlOSYa9jQBcmJTsiAeqCTt2JL01Zd6krFM7+/w5hoMXvVZrEE5gIYHTdkW/FgGsdAiukUFfTp1r5eu80gwvUI3dCe8BvIHPF/J3B7QFJlukveIqDAA1O0L2eyfa91mELLkOPJRHXNDC14VJsmLOinZ6Phge/42fqwGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l+wuzABU; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrDQNVVx4Ht7xX90TFeGSdzLTMtXaLzrmkOX0wA014mdF0AP2UO5eIxI7nq0gnERFCO8WUQE/n3SPl3v8mW1PpxBJncXls2HwpQdEkjf62XnaK91JS4Z0/CuTya+tb8IfkRaWlwVFiWsujnkz8ViAgFmnhOkGds5XaUXacRkn0owdT3mcWGBJCtRZxOjsHsN8czT1ewbgT/IWO1IyVJgEp68ugahMqaelK+jXr8U7Afr0XMEB+wMpPSYZh6QFB8AJCkMwxb3NKH+5E5PZkCMnzOqiDr3FuVt9ZnvnQHHJYCqBR+qmruFx0qX8LiKCEKzN0Bjwxlm15C3mAoaf7vCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtNf47PDxiNSB7GMxKaojMmiWBNc6nG3GFk0JEcHTDg=;
 b=RNCT4VQxIAJ9kogBgGELEw0ELwWbuibDh8ZMLXPRCL3AZ/AjXdcOJbjxydjsrz3gL8lvuZM0qjsWQnn4CVAWrkox+bGWwBmMuR60h1VwHQBCPa8VfM1w878BM1CX0D5y7Wz+7Knso43pEn3d4mqoEzY3Ci4AKxX2fuZjOhC3Emc5OFMD31ucw7LM0ez+e1Q0C3L8Vk5cb6C2MIABuufcJvyunQlWRI1SPExcaHrGjorTB8BH51nxNmKB9VglXn5NyDltMumpzOYf430pdB4H9hc67BKxoKifqTqh4al1Li8hOsrb7F/LcTGeewCjJfc8Juq5GiHpH7jcgSrhxSv03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtNf47PDxiNSB7GMxKaojMmiWBNc6nG3GFk0JEcHTDg=;
 b=l+wuzABUIZ9aL6ePA5p2tARX5Zc96B0AZiric/5NRCruPk7UIcxXqXp5z+yyv0uzc3olM9aGb1dIlp+HU+QnboidkKSPBEPb5xQN68Po77Xo72Q/tF2ZF8m4yTP8xuQUdzRPA+gzMdb3Sjav0qGFjKAUPZBktsJrPsn4ffSmwDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 00:06:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 00:06:52 +0000
Message-ID: <87ple33aar.wl-kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org
Cc: Duy Nguyen <duy.nguyen.rh@renesas.com>, Huy Bui <huy.bui.wm@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] soc: renesas: Identify R-Car X5H
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Jul 2025 00:06:52 +0000
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c4afc9-a7db-440b-4ac0-08ddc26a5642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tKqFFNBWgUT8GgTDuB1KzidyoxC7uvfZP0frt9eOVgFP6kCmmQhR9QfxqZG9?=
 =?us-ascii?Q?iO+yQyqasBFTu0Y0jUFWD0rUWtfVVB4kKP6G4HUbW89h28u6iK+yEfaw3uvL?=
 =?us-ascii?Q?G7omwSAh/VHlAGI+MMN1mwJlmWoqBkFcus1u1/xrG/EF2gT1jdr5A/4brYJH?=
 =?us-ascii?Q?Wo4EV52X/fy+3TO0VNqazW/pA1rKEF+WdchexQychivFnKubEriWd/mCBgrW?=
 =?us-ascii?Q?FHvdq83/KeHkqbVwUY8jgmyzvQKRDkDLNCoeSlhlD06z2tcaFmacHRqsMJA/?=
 =?us-ascii?Q?JGXlhOzG6cq85pK1sjS8AvMdxYZdGjkyVCxJYccZAK1n2ZjjJshiEmWoXufo?=
 =?us-ascii?Q?TOXuvxGCJWIotwlpESv8GH8t30OqY5n3nefbjkCPly50Ar/m+rlVoTpr47a2?=
 =?us-ascii?Q?O70sFtHKVf1e7ZqyWRDETFBNa6HU6bVeZ4iCdpu+4nWIGn+PqvHKdU5sqBW1?=
 =?us-ascii?Q?YJrgdxxkwV1CHjGjsqsFC5Qmz7C3J6EUnZRHSYqZYziEpbGcAqSkh1SXN5n9?=
 =?us-ascii?Q?c3WjVC05TLvutoucAgBmKoveLsiaUc01jj6zdpXj4xa2kDBaalqhEKWNGQF6?=
 =?us-ascii?Q?2E1sVI86hPRpjUfuOLoZv9HrjU03Y3PHWaA+G4hOkqv2GKF8N1VuuRZBmOMQ?=
 =?us-ascii?Q?l0TKMqQp+uUGWhS565I8Vra9ccRBIcIRB3mkYaEZ8vxmdzGG7854x/M9QfO1?=
 =?us-ascii?Q?k9AeZ/dvqbQCn+HmVw+aVT9wSmgtYFQkW6MrjHlcrMk/fpoNAK5K2fjNeobH?=
 =?us-ascii?Q?leLK85y/nnsLud/TgJdm9ZyaP/8ujeotQoZxdAAQHUzv0BtcwnlBrp63UXvN?=
 =?us-ascii?Q?TEjY9kL0othEEl1vT+yinqiWgnGr4esvRLP1+GS0W6r/emRdWz5EEDtl0Rt6?=
 =?us-ascii?Q?JXSF/jZAFsDNujZRu3wG7DIGIhjLdynGbGtS9gJxpkMsU7UwtxahMSARIpaC?=
 =?us-ascii?Q?5uy0G/7e6nlq6HFwo2Qlax9U/WRd1xqTdr+Q6zHSya8k7EsTkHlNcbF6/Pu4?=
 =?us-ascii?Q?YRWAHwVR9rT4O8yFZHLw0yf7ppN6EGvuEw+STZoKOWDpASdpcxFtPv5BBcsv?=
 =?us-ascii?Q?tXxh7uYloPRpOSUMrXvMjWIIw+JZ9RLhCwGeHiMLUxyTV/GNp+Bew2vcavrL?=
 =?us-ascii?Q?ViDCFolnVtG4DcRFrx6MJqj+1fCMXFT2gyQCmleCZxpgOvu7qC9mnfTXtCAh?=
 =?us-ascii?Q?/LUDgXTbE4DTiSOuSAq1hivBhTAmN6erauufh2LNYn4EeAJ97iuBtdTrJcKK?=
 =?us-ascii?Q?GOW1V31RZP3ppcaeRSaZQcJleNJVglOIireLk/gevG9iXrt64hefr6hbFW0b?=
 =?us-ascii?Q?ndfMd8qWQdnGT3K50HYqwl0fLOBPvwQrEd79hU+MHl/G+f5SRyx2/jtBAIeS?=
 =?us-ascii?Q?VFIak9nXOX9gIxx6GPmnNasEi6nApKKqTCvcg3YJvKW9k+1SQi2QNUx2Y4mG?=
 =?us-ascii?Q?wvryUL4y1mnYrH5J5UKQn8jbHBzTvaEpV/O0v/vt9tzaAFDks3gnVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7pOQZ43Quoo5ozdCscT6W2oGwm0HH5z+6Vnnh83UAdVhGzSSX7wwEx5HUtfU?=
 =?us-ascii?Q?1xz269Y4XqK3BWBXIOkMSAfcJuzb8Y4FELaUCnk0h4fKc+vfLdZwmfxEZdEr?=
 =?us-ascii?Q?oA42GwZJMayBXPVS4GF+a2SMNZZyjHRmoBs7hmlHHWSPB3fEQHEtXPXzcaIX?=
 =?us-ascii?Q?drgrhinB+P9xGbfPwEGK4bU2yhaO/tDr2llhtMCXBijhhaCs84oQ9vmjFH2q?=
 =?us-ascii?Q?3hSghUh9MROb/Mvxq0seZ84kldT4zwcXNh7Wxajf87/TvCtosI/ADK//ALMx?=
 =?us-ascii?Q?TtA4s2jUQ1I3fWo8zd1A7pes3v3PSGluXZ5vLLQhVrw+bORh3wYxVGGNNkH8?=
 =?us-ascii?Q?2nM/dVQ5CW2/IymwxHeMuiPEgDW5Vgflfn29BP6WNssS0aMCikwRtcTU0QLW?=
 =?us-ascii?Q?8fn9x1L0igpp8IidKdr4Cv8/8GDwH8+w5Zw7yj2hx3GXuduUIgTMmT47fz7c?=
 =?us-ascii?Q?oSpBCvN8GlKoCSl703f/RfF6Evj86ju+zacw+YLUzZPoO5gPmqE7Txak+DHY?=
 =?us-ascii?Q?LMPJ9/9XLw1nqq0eb+ktKsyZbmsG3eJVKitwpCgpzGAGpBf+BLsV/ruYm8rk?=
 =?us-ascii?Q?jw+3d87bzx/8+zjyzf5MaPg+4c+WjTWQdVxMqGxscP4fhSZnZjRg2P3XGdsD?=
 =?us-ascii?Q?WzkJtoAb5e2c9YnXV4oGeo7Ry0lZyRWbawbutFPwt+9dxKRCUfaS9SXGShZp?=
 =?us-ascii?Q?XW1lxRj7Ps4yM5EaovilTU0aBcToWzckE8FuyY7Is+TFOThfKnhU9oK5KF/X?=
 =?us-ascii?Q?OGqHqhz3r8jMcgDFx8IY0LTrJ5Q+vljzEPO0i5DGBkLsDCkhztiLLKkPwSCG?=
 =?us-ascii?Q?/zl98UkHi5lAHkiFWB5ymDgWU+6uw4ExWQvbGg2vr6Q8YeDVm0V2ERYCFobn?=
 =?us-ascii?Q?Py8qat+ALbNEolXDqYQ1B0GJJDeKx7NxzNWnmjEMlvYV5DlOHZPfy+cw+lwD?=
 =?us-ascii?Q?kdiLECMd8hHp3BSReC/yXUeOvIGg9r75ifPAN27pAfORNwIGleYosxcy7PJB?=
 =?us-ascii?Q?ZOmuvqVYlsC/NBm64/ebfMjL2JdCw5b2Q2G1Gzo04AgRbzzePSsJJyp+HEea?=
 =?us-ascii?Q?H4GjzPlkMF/KOp58PlBsWTLEMRvLh8rJrznjMTukxadreZj/niGbIwEharzL?=
 =?us-ascii?Q?i5dtWkYVsiqE21mrxxaDHkIiIZDEEWjn6QPEFxeACua2FtxXooD1ER/IBdrY?=
 =?us-ascii?Q?cAPjjW/ykyzFQvzHcxuRokT/WxX0KLiS+9MtkTpo32XibpEOSWfuuVG6IRzz?=
 =?us-ascii?Q?jQS7wVlGCtEb9HNsPQEBDLbW3o9e9icytLJmOvL3a6b7i99g44hBg16MUGAv?=
 =?us-ascii?Q?8WPWaarw82+KCbInZIffrlknGXQsfIOX/c2yQ2xVksX/S5J1W84kWGJ+ODXj?=
 =?us-ascii?Q?BzW9MDKOGI/IhPY/V2rGjepKZISu3wH6TxXTaFYJzP9kUV3R81u8dGtMQkdn?=
 =?us-ascii?Q?or3L63f3ZSsUwXHvOnrQF2qgsu66XehBOxWR4zawaZ9zkVSWw1OBQ4wf1LCC?=
 =?us-ascii?Q?zHzPqNiy6qRevUChc6nO0TdcCn3d6uQVj5DGAPfUHV9EnxJ8qm6joAHyBU2c?=
 =?us-ascii?Q?Hgwc5m5OjDIEAprga79sTyJzkxo7A3buQak4KFh4wcELC6Z/0JY2WIj0MKQ3?=
 =?us-ascii?Q?ibtuxxXjbmLdcMHi7gIj210=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c4afc9-a7db-440b-4ac0-08ddc26a5642
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 00:06:52.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrcUsERs/ILgTvIfqbJFK3CdiixjgJDK7u1yyCr7c1CIFdQ8oZmf46oEtWepp/Kxmd2rcoAgUDaOkVyeYSAu5fRSHsjnjlJ8nrhe9QYdEx5RUyVFHU6QxMqQawzZqJ58
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add support for identifying the R-Car X5H SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2

	- Based on latest linux-next/master

 drivers/soc/renesas/Kconfig       | 11 +++++++++++
 drivers/soc/renesas/renesas-soc.c | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 719b7f4f376f..96d1d342f0b0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -39,6 +39,10 @@ config ARCH_RCAR_GEN4
 	bool
 	select ARCH_RCAR_GEN3
 
+config ARCH_RCAR_GEN5
+	bool
+	select ARCH_RCAR_GEN4
+
 config ARCH_RMOBILE
 	bool
 	select PM
@@ -348,6 +352,13 @@ config ARCH_R8A779H0
 	help
 	  This enables support for the Renesas R-Car V4M SoC.
 
+config ARCH_R8A78000
+	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
+	default ARCH_RENESAS
+	select ARCH_RCAR_GEN5
+	help
+	  This enables support for the Renesas R-Car X5H SoC.
+
 config ARCH_R9A07G043
 	bool "ARM64 Platform support for R9A07G043U (RZ/G2UL)"
 	default y if ARCH_RENESAS
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index df2b38417b80..5b78388bafcf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -36,6 +36,11 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
 	.name	= "R-Car Gen4",
 };
 
+static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
+	.name   = "R-Car Gen5",
+	.reg    = 0xfff00044,		/* PRR (Product Register) */
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -266,6 +271,11 @@ static const struct renesas_soc soc_rcar_v4m __initconst __maybe_unused = {
 	.id     = 0x5d,
 };
 
+static const struct renesas_soc soc_rcar_x5h __initconst __maybe_unused = {
+	.family = &fam_rcar_gen5,
+	.id     = 0x60,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -378,6 +388,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R8A779H0
 	{ .compatible = "renesas,r8a779h0",	.data = &soc_rcar_v4m },
 #endif
+#ifdef CONFIG_ARCH_R8A78000
+	{ .compatible = "renesas,r8a78000",	.data = &soc_rcar_x5h },
+#endif
 #ifdef CONFIG_ARCH_R9A07G043
 #ifdef CONFIG_RISCV
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_five },
-- 
2.43.0



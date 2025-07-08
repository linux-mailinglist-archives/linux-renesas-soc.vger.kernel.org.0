Return-Path: <linux-renesas-soc+bounces-19361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75881AFBF1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 02:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B755A42377C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 00:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0BA5383;
	Tue,  8 Jul 2025 00:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bubIWW8o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E7611712
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 00:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751933470; cv=fail; b=aEWGLBUvRVoh7sJQC2WS2riZkbDnSUoQ1IfRJY733A9WooxFwGywBhDKhbUTJX84vSa05HsBQxQwn4rOhM1ID77GwvRjR0axYdtnYpTk9dvfRhgbN6PGQ0Etpsv3J0qXv5gdP5rkGQBQ7TARDGLRJ56cpLSszE9Vj2KQdlH0vsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751933470; c=relaxed/simple;
	bh=nySNgr2uEQMuEWqb1jHvax4lwIsGCErJuO+7h57ZL4M=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=QFHxfGlj9Ie5Bq4r/NUrqUDpJDfrTXr4lUbbSC0xjljQWw6rtTkhHS2ZS/0LIsiQ8dDinyk8mr5EJLQDrpumJZXz0v7pSxPzhFfMtOZwCwTSYaskwuudsegMoBJJ69uBTGvF4LAx0qHbA+Wi0c7p0IRsECbUMrG1L/Nx1UKzZmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bubIWW8o; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXUR5yGwsIGLdw9m4MfWIv96IKYDZ9WrHP6Vr44MmqTQpcrKCGPXi1RP/5K8jzHxWxmfv99QnEOsSHrGnsfrPuR4FjswC9qSXh0289UX70Dbrm9xRfKqkU2oQS6t8+mn303zu+G6pnz2OwLovpf4AHSGOnTbvZ5zqu2hTswJwehBUy/dZpT0/Lmjwujm8Iee4LVjOG4T+ppnt6fFoW//CcCP/+7/plEqmJ+UU0Fs6OwsEsvtATXF1oJMH/5lKDjyldp4iruRttCJH0AsczQ9RndQQyA37OylygdCSpC4fmXt4NimgxMtnpXfdB7QO0L+81/9nftcisqSHoGI8TNkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9BL+DS8JEY5IrD2HYLYuOLSt6nShfI6pq/2G9LcBPg=;
 b=Wjg526ZLpUtaCm0jW6oulUovs5O7T+aLlYNAt83eFV+5IIbN2uBaN+ufh64KSYXm3m7bTOE5+JS3vXnzkybx/ploh73f/xAQuOQN9A8a3nmQQQaFNuHv8/EFCGI38oozE6I6CuGmu5IWh/aYVoW5cK3cAkGQbsFWdtiaRGkjCNl1SF7qpaG5YSpn5x1oeIbPqwqOYVI4yn7+q4aKtiTTrcX8y/RIDnHnnQOiRmmDbKVACxYk8DRl5ympd/uGlmrhwkB6XES7vRB0ryelZTrIyR+48FPt5sqssYbWK2TviIRANaZDmaeHBBGSTARu6sqDxMFvuGynA95komQGBfdKjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9BL+DS8JEY5IrD2HYLYuOLSt6nShfI6pq/2G9LcBPg=;
 b=bubIWW8oXSWdu4FLusYM6Blc01V+NbZkYRiGTBMuM6cr7+bQeX3Y3aHz8MLgTWOmSlBChRGrzmELBo4Zg4HgMjK1SguLSID4hb46LfquZUcT5i+2/WDZe6OHMx0VgxMok3c9doHzIvJ8yTdmrLaxB9Acpc3a+qFMRF4/tgZ5uW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12020.jpnprd01.prod.outlook.com
 (2603:1096:400:37c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 00:11:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 00:11:03 +0000
Message-ID: <87v7o3mtig.wl-kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] soc: renesas: Identify R-Car X5H
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Jul 2025 00:11:03 +0000
X-ClientProxiedBy: TYCP286CA0367.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12020:EE_
X-MS-Office365-Filtering-Correlation-Id: 810ec5f7-267e-4074-450c-08ddbdb3ed54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ODQnPxST8BKUve03ojEL2n4vV+cCtG4LwlBfbHmCUpxbjDc9jNa2OWK6Sq4?=
 =?us-ascii?Q?jiX+DtSAUjMd96R16QOIT5TIQ8nlHSwHNWN0EXNItLCwAySO0juDFtGj25fG?=
 =?us-ascii?Q?qRsuy0fzbde/DSI08H6U85v2nLVfxeinXLcng0AQDmRfkg1uf2wcPEHZEwWd?=
 =?us-ascii?Q?z+1SovLGmhp+8MVV3u7HGGlV3Pp3rPh131YGGhdTPTlox5wEZQqFOdHNF9dr?=
 =?us-ascii?Q?JZ2P2KefNjPRcGu0OUoUh2FjsT1wUhaIBW+6kzOFerUArOde0dpbuBepIX53?=
 =?us-ascii?Q?AQMifF2AveYCKCQXi65HbapSphgDyOPiE8mGrsaQE8IdjoSWHStptwsj4n86?=
 =?us-ascii?Q?Jp3lw5yp4qlo04hd0g7M7f4RJCzMIYWa1HPEarqX1W9lLhb9Ya/Jmwr5IBWW?=
 =?us-ascii?Q?aFqO7LSAWBjvbSgkyEJJd9c1GkczdTxy7tNPgFHDGRvd+q5O+rm6X6pmTBOW?=
 =?us-ascii?Q?eryaQ7saK4NGA40fBECwd2NCZDO0GztRS6SyYA2p8bv9Zt1UA95S/RLgkIss?=
 =?us-ascii?Q?4vdIKk3oDS1I2jl/i5AEhvIVyC4xHLqAr3Ji68mwZC2pnUpf2KgXe+jglqf7?=
 =?us-ascii?Q?voIqAzrUrcf3d2XVS9LmSlgX8+SVQc+BN3n4qvbmiN0D/+B0BFpSRATXp23u?=
 =?us-ascii?Q?2tF2Rqk0meC4mp9gPziitCdbqZVCYWYjDbUIwytAEQ7XX1qweIpl0LDx+Fri?=
 =?us-ascii?Q?aozL1HOdUQBc6BmrLlVCEmlpI7fnWHKFsenccxLmdEBW4VUq/QctQPnn1mPC?=
 =?us-ascii?Q?NwmxIDfaibZFhecH1xN3hBD87xxulZEjOk0kExDT08ost6D8aZsRtdTgeF3e?=
 =?us-ascii?Q?aZ/0Pylidy7D2tdnCzqfb+NBA5lzQffbH3P1ryk7wYOXrmgYzfbZIJ4OaOpH?=
 =?us-ascii?Q?KyJ4ahpl6y6kvVaMZOlpNxWgKRGdixbi95KvYGq/l2z3APV8FjqyRD6xxW6J?=
 =?us-ascii?Q?L12HfwYk1alklaXs5jqlN3slG/x7aegaKv5UCB7cYtZVzIZKIQuU5EeeOwlt?=
 =?us-ascii?Q?0nHjp9Yfwg0m4pYWYByJl3VTMZagit1PhEoiMBD/LlW2WnvIC91TLyXGCEit?=
 =?us-ascii?Q?m/uwBIgoz0EADq14tGxwUay85uSU7/rMxIb97wIYv4zF8pqxCjk6aE1Aa6xy?=
 =?us-ascii?Q?2/lAjTUASdMFzDFKFkqQJuaeVUo4/DWQscAbKiLpOj9jiNQPxosTqqVIFgT2?=
 =?us-ascii?Q?zDQOzEk9ktbsT+176doqpgtSdonW9oldpbcgMJXYcS/DDf01b1mlUVtR5SJS?=
 =?us-ascii?Q?GrWgc1foFgJL5eeIshqH2Xu2jycCkmply53Obk0I+Cx4VUjv8cmG74kajFAL?=
 =?us-ascii?Q?4qlfhjllNxrj03c7Fpq6BhkJw1N79QioIhHysg5nMNmmu8P1pn4iBbBrEEAC?=
 =?us-ascii?Q?nEAtNC2ecHHj6ZnFqLaAF/JjU/x3cNI4+tjq26wGHireh5sKKGx+ZouIsZFj?=
 =?us-ascii?Q?MWlevLUrp1npd8uB797kZifeWvlLzAVrBS+vqaS3mJbKH0UOyRj7bA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Ib0jjPyVxPzUJCP4sWP4skDJ5fMyqoFLuhlFbLFz9cdVhCOmkgcB5/LAFSF?=
 =?us-ascii?Q?CGYLvc68abnOxMQNYg1+Et4V2zizrb73Qgvvz9DJU96tqwYfZ3odmk6Ggeev?=
 =?us-ascii?Q?Wldbe8wHHIkAFxT3jO8qGBuqai4G9tVlbUdXWOuJ4stKdoCkiEnY6wUoM/8Z?=
 =?us-ascii?Q?1bEZRvpWo5UWqdDgyNBuLNM/0f5UWaqVbuuERn3o4veDSaeinVDN6NBWwcDG?=
 =?us-ascii?Q?8F1tLzv4bkX7ZbvVsP5LGa1ODvVfr9Vv1pfeZvmaVSxBVAfgYBytwE0oNou6?=
 =?us-ascii?Q?zzBsyGuZkIbhyO1mLQF7HxoNvR7uKxaqsp1wDU+IWzQUD7YTDq0hfBMNcgna?=
 =?us-ascii?Q?bEUff4IQns5Q6pAPvICFvpl8Gt8eohaFF2yddSC8RwOCWLvg4hHR/Zju40Ne?=
 =?us-ascii?Q?FADy0BT1R6dGPqzFPZAD6E1qloKKWAVfc/Kck+qudoXrJi+OYFEgUsBtvTcy?=
 =?us-ascii?Q?1XeYxVoPffOAUpVy99QI92LU1VhmKUVhPj4gSnFXNmmmQmMq4qrPNKnXe4G+?=
 =?us-ascii?Q?FhxIRG1gsb+YtxLKwZ/rwOYREyDacOs2vxlWxbVVVaoLP0sSu8hrdMh75B/q?=
 =?us-ascii?Q?XtDxust6qFOBLosh1vrZ2hOtiK2zaDZoOkok4QZu0shVAqr4mjAvIcWHnKae?=
 =?us-ascii?Q?PEAHuRfiMrlNgOvN4Ozc9vk142gWd4PDMC2O6rX+99kLBeQ8EREhL9INr3Vk?=
 =?us-ascii?Q?j27ipITbWFmRbDnHhHn9LxNY4YdPFLq0K6wAj7Dd6NlxhdNggaD+yxwy1ffz?=
 =?us-ascii?Q?P275xDPBG03sufAO08wdfUyWFeIMCXuAhPGYC/dxmaC9sHQAzeCunqzfO1PZ?=
 =?us-ascii?Q?OsI/FXamB1326TZxBEbzKcHy27g5kX6Nti26e9cO0VyLSOS1fSKImVfke41S?=
 =?us-ascii?Q?iAeVXhnOZlbMpALTxYgEjHq91v614XCcz5Y7YUBBTv/Z63zPcKqbsgd11Gs7?=
 =?us-ascii?Q?wBY/EsA7Uj1tPf4YHhJo73bYM1mgQeYiEqOsY75wCSF24BbaL6qmkx6/NArB?=
 =?us-ascii?Q?1hrM9gV9SJT3mQ1U/Fu7VuK7tt2A7vhnewiNN+3mKFDeLmLs15vX/m5tXDmA?=
 =?us-ascii?Q?+JvRdHd3sw5VxRcYP1uf87NFIcPxQrBYtwcrYXE6/CK/FLCRkY8yFR9ASxRA?=
 =?us-ascii?Q?8HqycJfeRiushjs12l370SrdVl/bfzwkiCVu/zVQXVDFbIIJ6s//2LP/UX6b?=
 =?us-ascii?Q?XGHh1gglUDT3LjYJdMV/gy7mXwSyu9pTnfS+xMIY5BTZqeva0X1cKQxEXXaL?=
 =?us-ascii?Q?D4+um+BU3X2QwAsjmCU5s2WUgjZ//AkpxUCdQc4xC49qU3rFZUR0OE7MZsG5?=
 =?us-ascii?Q?iLMcl4V9CJf8ipNvX906Tb+SSWhiG2UsQCdVW0SO9kuUWGDTX7JQXX0FcYwe?=
 =?us-ascii?Q?rMp/0NhA+egsubXFsYenDpbDaYHFkjfdom86OJwZctV0+O0kSzjRQ+5jU+XU?=
 =?us-ascii?Q?/smz0IHBgI7ZAkWRzkzLTELf/z3/xrgM9VcZH403wGKwZYC34I92OFlA8QVK?=
 =?us-ascii?Q?tt7eMz16TaK5MxvRkIlAVsT0bZGPO9O4jmmwgHtZSSwYPnSY/n1EIml4rdA2?=
 =?us-ascii?Q?U4mzh2+RU3Xs0du4DUCTVoXcOnCt4UGh0Uz3YZzie8n/Qkcjh+/ZwObUu8X+?=
 =?us-ascii?Q?xkPnDrLvnheeik+fKx2qCZU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810ec5f7-267e-4074-450c-08ddbdb3ed54
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 00:11:03.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ig/W6+0aa1acWmuWo+HbvnkzZodvr+SEtw3E1KjNtJXp2NN4oy8BAhV1ueU8t+/ikAKfOABybMNx9ru4vdSh9Uopvb2ItW1lVcKp0gXTepXGG5kyeZOYNxe9l3OXscOj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12020

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add support for identifying the R-Car X5H SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
SYSC will be handled via SCP/SCMI on Gen5, it doesn't have SYSC_R8A78000.

 drivers/soc/renesas/Kconfig       |  9 +++++++++
 drivers/soc/renesas/renesas-soc.c | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fbc3b69d21a7d..f6bf9afdf8408 100644
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
@@ -316,6 +320,11 @@ config ARCH_R8A779H0
 	help
 	  This enables support for the Renesas R-Car V4M SoC.
 
+config ARCH_R8A78000
+	bool "ARM64 Platform support for R-Car X5H"
+	default ARCH_RENESAS
+	select ARCH_RCAR_GEN5
+
 config ARCH_R8A774C0
 	bool "ARM64 Platform support for RZ/G2E"
 	default y if ARCH_RENESAS
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index df2b38417b804..5b78388bafcfe 100644
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



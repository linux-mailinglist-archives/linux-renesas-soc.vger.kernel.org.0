Return-Path: <linux-renesas-soc+bounces-32636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP7oJ7v2BWpVdwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 18:22:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3354496C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 18:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0C033025DAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 16:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90352344020;
	Thu, 14 May 2026 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qWbfUAR1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D7031E835;
	Thu, 14 May 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775706; cv=fail; b=CAQnaPt7IyI8iVABfLf1iUXZdVyZoDys67/VlbKTr/FI/6E3AqVHIbLYjJ+amDL7kcIjGOynfIizuuQoATuNNkd95ckGZ8olkpoBSbo2xddc2Y5UYReZnHxWgG8K06oPblo26KagVTYoZd4Pa4V/gWMSHxDv1BWib37itci444k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775706; c=relaxed/simple;
	bh=jIEFWV8bQ5xTrRT1hX1ToJdHfD1YxKr+LI7h7Qck49E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JMp9YzT87peTjaRbDznlpOk1IlZIYBxyu4Ye3qmBq3czILThb8YpK+I0ufP47YIBH+ygvdbysuSlKF/hXHifdtO3QBFx8mZS3xMuUp0bOVbWwxWg2OBpQfqIS54abcSrZCye67rD+K8Lue8OwPTrR9Rjx/EQ35yI/HobU43LfO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qWbfUAR1; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZABSdCNAdbpkzkQ13lXqCUtfmef+a45x0g0qrGs1ZYftIEKaawwHgwZzmc7tjCZMeeE8j/wpWIBGRCkcO+a6+5cIk4MpCc8QVRFr/F5RI++9gbDLSOydClnMA6HklqnTq0iUxWFmr7UX6xbfOZ1Wyr9T7cMnVAtBiXFGEUImnGXC5DRyKip1Qjirr+acWWGGXLCDAtiSA5Udri9pJLwYED9wH13Kd7PS/CzVlmi7dMRE/MgaWqzOZSd0EFgXXnedy1HPj76qwOJWZXvFhvwpvOkYNqUu60doN6jfoMuOHfDVvOOT2GMAG+7ELV9sJM6yZ3m4s3aEM9KA2DVviO1VXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAlaUC+C7TO70Q5/EhBX948/0Dkd+NkfiadMk2VWktA=;
 b=GpiaAqYjMXi7xZ0sMevirc6+NQksDRAY1WEM1GirpTpPbAmdEOfOqgURE+wuPiv1JycW5SyFQNP5qlQ8OJzKo5ho1+ut/J8GE8AM2ozgSmpK300YYX3NQTux8OpGAGTBu+MXFnzKK4uK41+ZHeD4flehC1CzegtWnhbmyQXZW7CQJRQh5U9ynoZHHNH2EfphYQ2AsEu0Oswa1JRNqIzOLHFve9wX7reQ/zzJrA3nd3D7XQ8ZeeZfAMLmH0YIr7QCxlgV9TiGLDHWGYqyYwoVZybMgfJE0Bfat9WO+4dzhoy5C35ktYwl6qWg1ES4w+D+f2/Q3xK34OClJnbKKWmQkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAlaUC+C7TO70Q5/EhBX948/0Dkd+NkfiadMk2VWktA=;
 b=qWbfUAR1sRRd/Y2x4ntmCLOrSbgmDINzpj87+eie8Zehi6JCylZgAaPoIDAdPudh7SscNIoyVgn46XgToAoOPQv4edRqmGTiB9jcNMAr0Qy3c5mzoPR/T3uEndMtP3wWxlj6I0/BcOPlZnVz9Sm2AbVrj90SZHsHxpx7wbqfGvI=
Received: from CH5PR03CA0021.namprd03.prod.outlook.com (2603:10b6:610:1f1::15)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Thu, 14 May
 2026 16:21:34 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::1a) by CH5PR03CA0021.outlook.office365.com
 (2603:10b6:610:1f1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Thu,
 14 May 2026 16:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 14 May
 2026 11:21:33 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 May
 2026 11:21:33 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:32 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<patrice.chotard@foss.st.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
	<daniel.baluta@nxp.com>, <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 2/5] remoteproc: switch exact-match drivers to wc-ioremap callbacks
Date: Thu, 14 May 2026 09:21:26 -0700
Message-ID: <20260514162129.1504162-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 235cb102-1fdb-4574-8c74-08deb1d4dd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	2fTWhFuJHZMR8Eyzjed/0dAniZaYDIrLYELLg0AMjsGwpUyWvjMbi0vtbn92YkerVpcxteNM+5WRG2nMaKiLHf4qPKQuYUzXvCHrT5cNyBQteWCzS+gHKxihP+JmwPSXP3mdOE94YfEhM0L1pPdWgAlI5j/bev7UPKT4MW9WygLMktQmU20yrgU4U/D78QiSw1erRNu960ORJmGCUwOq6AQ9D0XCh9qfc6GFwat4XUlFcnBMDScCJyBzOAQUr6poaj+nNgl14D67+deeyxpTgQ4Wx65HNR4AMkx02Cd6PV02HGZDu9YhbgReMR8Loe/NLDUfctDrLn7Wk7Xlu6IyqybDK1l6GfM6bE4zwpec3NTtD8fsV7bb3V9+KmiFClz5X9QqVMiYsO+V7nfaKWXz6yffNdksVeMpEcfaMg0ShHCUHT7K/EW3GACm0ARDhs4EWgs1tb762HYlXPoUcywfc30SaoLkbh4e2P3ak+AghjK3EkPD8v84yDqY9YZgN/w1USSuAJv8GRkfvDyw1wSonQ/M8zj3rwgRHCeZKvyp/pGd7B2xH3+qi5MpB7rqgNhAYtW7J8twhmzFVyOQLpJJ6nxXtu4aTCIWSlmCJu/DrNLDApblnCs6LgO8/EZRA9X1L4gutg3YU6KBaUaYuBxrg5ReLG6t3w8syTruvv/ZLOB+cGRvNK/JcddrjSzZIATYd9y7+kSWjpGcyAnPTHCTGJUUQIuYGTio3cypVP8xJZ4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tARKXJ3ElxrQXgfEPDtpaw0TubPCtrppVtLnpevGm4I5ZsA2gUf0sS9Oz8SXi0JJM+TLgBlWb4GKqMzFzZrEGjkpEaEbXRUYdcrohKSVkLK4+WJYuO5A/Wm8jHHSgTjEY0WnU1vtthz7cXndSjDlIf9woGqjp5npr7UM5elhm5Q7Hdh3BL6yC9DRTOwmmck9qkna5FPksXwYedxwQJKJ0hsefufTZGlT6JqQN1IpA+JIhxCGZUiCzOsUs66pthekWcTkz1xbQktjReZ5eyVLol0/orknwB0d9aIuITNWqVYlDnZYdLm2csLaoulPW1SRgHMP3Q10uU68HqHITxltUsggHqUn1rXofITUytFA2hjZZYLiyw9NOygPR7Jp26KC0sPp290zb70tEfMe0GkFBgJFiN1c3gQX2pJ0Oa2ZcnfnO9Av6U01VBvU25lAHnfL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:33.8323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235cb102-1fdb-4574-8c74-08deb1d4dd66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269
X-Rspamd-Queue-Id: 52B3354496C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-32636-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Replace the exact-match carveout map and unmap callbacks in the
existing remoteproc drivers with the common wc-ioremap helpers. This
covers xlnx_r5_remoteproc, rcar_rproc, st_remoteproc, stm32_rproc,
imx_rproc, and imx_dsp_rproc.

Leave the zynqmp R5 TCM callbacks alone because they also clear the
mapped memory and are therefore not exact matches for the shared
helpers.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
---
 drivers/remoteproc/imx_dsp_rproc.c      | 36 ++++---------------
 drivers/remoteproc/imx_rproc.c          | 32 ++---------------
 drivers/remoteproc/rcar_rproc.c         | 33 ++---------------
 drivers/remoteproc/st_remoteproc.c      | 31 ++--------------
 drivers/remoteproc/stm32_rproc.c        | 34 ++----------------
 drivers/remoteproc/xlnx_r5_remoteproc.c | 47 +++----------------------
 6 files changed, 18 insertions(+), 195 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 008741af9f11..2d9f14fbef1d 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -644,32 +644,6 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
 	mbox_free_channel(priv->rxdb_ch);
 }
 
-static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
-				   struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	va = ioremap_wc(mem->dma, mem->len);
-	if (!va) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	mem->va = va;
-
-	return 0;
-}
-
-static int imx_dsp_rproc_mem_release(struct rproc *rproc,
-				     struct rproc_mem_entry *mem)
-{
-	iounmap(mem->va);
-
-	return 0;
-}
-
 /**
  * imx_dsp_rproc_add_carveout() - request mailbox channels
  * @priv: private data pointer
@@ -700,8 +674,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 
 		/* Register memory region */
 		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
-					   att->size, da, imx_dsp_rproc_mem_alloc,
-					   imx_dsp_rproc_mem_release, "dsp_mem");
+					   att->size, da,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
+					   "dsp_mem");
 
 		if (mem)
 			rproc_coredump_add_segment(rproc, da, att->size);
@@ -732,8 +708,8 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		/* Register memory region */
 		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
 					   resource_size(&res), da,
-					    imx_dsp_rproc_mem_alloc,
-					    imx_dsp_rproc_mem_release,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
 					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
 		if (!mem)
 			return -ENOMEM;
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244ac..6249815b54d8 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -600,35 +600,6 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	return va;
 }
 
-static int imx_rproc_mem_alloc(struct rproc *rproc,
-			       struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
-	va = ioremap_wc(mem->dma, mem->len);
-	if (IS_ERR_OR_NULL(va)) {
-		dev_err(dev, "Unable to map memory region: %p+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int imx_rproc_mem_release(struct rproc *rproc,
-				 struct rproc_mem_entry *mem)
-{
-	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
-	iounmap(mem->va);
-
-	return 0;
-}
-
 static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -692,7 +663,8 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		/* Register memory region */
 		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
 					   resource_size(&res), da,
-					   imx_rproc_mem_alloc, imx_rproc_mem_release,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
 					   "%.*s", strchrnul(res.name, '@') - res.name,
 					   res.name);
 		if (!mem)
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index 3c25625f966d..e3121fadd292 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -19,35 +19,6 @@ struct rcar_rproc {
 	struct reset_control *rst;
 };
 
-static int rcar_rproc_mem_alloc(struct rproc *rproc,
-				 struct rproc_mem_entry *mem)
-{
-	struct device *dev = &rproc->dev;
-	void *va;
-
-	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
-	va = ioremap_wc(mem->dma, mem->len);
-	if (!va) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int rcar_rproc_mem_release(struct rproc *rproc,
-				   struct rproc_mem_entry *mem)
-{
-	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
-	iounmap(mem->va);
-
-	return 0;
-}
-
 static int rcar_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
@@ -73,8 +44,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 		mem = rproc_mem_entry_init(dev, NULL,
 					   res.start,
 					   resource_size(&res), da,
-					   rcar_rproc_mem_alloc,
-					   rcar_rproc_mem_release,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
 					   res.name);
 
 		if (!mem)
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index a07edf7217d2..486180cdccb4 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -88,33 +88,6 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
 		dev_err(dev, "failed to send message via mbox: %d\n", ret);
 }
 
-static int st_rproc_mem_alloc(struct rproc *rproc,
-			      struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	va = ioremap_wc(mem->dma, mem->len);
-	if (!va) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int st_rproc_mem_release(struct rproc *rproc,
-				struct rproc_mem_entry *mem)
-{
-	iounmap(mem->va);
-
-	return 0;
-}
-
 static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
 	struct device *dev = rproc->dev.parent;
@@ -138,8 +111,8 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 			mem = rproc_mem_entry_init(dev, NULL,
 						   (dma_addr_t)res.start,
 						   resource_size(&res), res.start,
-						   st_rproc_mem_alloc,
-						   st_rproc_mem_release,
+						   rproc_mem_entry_ioremap_wc,
+						   rproc_mem_entry_iounmap,
 						   "%.*s",
 						   strchrnul(res.name, '@') - res.name,
 						   res.name);
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 632614013dc6..7ac8265b60ac 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -113,35 +113,6 @@ static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
 	return -EINVAL;
 }
 
-static int stm32_rproc_mem_alloc(struct rproc *rproc,
-				 struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
-	va = (__force void *)ioremap_wc(mem->dma, mem->len);
-	if (IS_ERR_OR_NULL(va)) {
-		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int stm32_rproc_mem_release(struct rproc *rproc,
-				   struct rproc_mem_entry *mem)
-{
-	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
-	iounmap((__force __iomem void *)mem->va);
-
-	return 0;
-}
-
 static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
 					      struct stm32_rproc *ddata)
 {
@@ -237,8 +208,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 			mem = rproc_mem_entry_init(dev, NULL,
 						   (dma_addr_t)res.start,
 						   resource_size(&res), da,
-						   stm32_rproc_mem_alloc,
-						   stm32_rproc_mem_release,
+						   rproc_mem_entry_ioremap_wc,
+						   rproc_mem_entry_iounmap,
 						   "%.*s", strchrnul(res.name, '@') - res.name,
 						   res.name);
 			if (mem)
@@ -957,4 +928,3 @@ MODULE_DESCRIPTION("STM32 Remote Processor Control Driver");
 MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
 MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
 MODULE_LICENSE("GPL v2");
-
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 45a62cb98072..e5d1903c9636 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -447,45 +447,6 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * zynqmp_r5_mem_region_map()
- * @rproc: single R5 core's corresponding rproc instance
- * @mem: mem descriptor to map reserved memory-regions
- *
- * Callback to map va for memory-region's carveout.
- *
- * return 0 on success, otherwise non-zero value on failure
- */
-static int zynqmp_r5_mem_region_map(struct rproc *rproc,
-				    struct rproc_mem_entry *mem)
-{
-	void __iomem *va;
-
-	va = ioremap_wc(mem->dma, mem->len);
-	if (IS_ERR_OR_NULL(va))
-		return -ENOMEM;
-
-	mem->va = (void *)va;
-
-	return 0;
-}
-
-/*
- * zynqmp_r5_rproc_mem_unmap
- * @rproc: single R5 core's corresponding rproc instance
- * @mem: mem entry to unmap
- *
- * Unmap memory-region carveout
- *
- * return: always returns 0
- */
-static int zynqmp_r5_mem_region_unmap(struct rproc *rproc,
-				      struct rproc_mem_entry *mem)
-{
-	iounmap((void __iomem *)mem->va);
-	return 0;
-}
-
 /*
  * add_mem_regions_carveout()
  * @rproc: single R5 core's corresponding rproc instance
@@ -522,8 +483,8 @@ static int add_mem_regions_carveout(struct rproc *rproc)
 			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
 							 (dma_addr_t)res.start,
 							 resource_size(&res), res.start,
-							 zynqmp_r5_mem_region_map,
-							 zynqmp_r5_mem_region_unmap,
+							 rproc_mem_entry_ioremap_wc,
+							 rproc_mem_entry_iounmap,
 							 "%.*s",
 							 strchrnul(res.name, '@') - res.name,
 							 res.name);
@@ -560,8 +521,8 @@ static int add_sram_carveouts(struct rproc *rproc)
 		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
 						 dma_addr,
 						 len, da,
-						 zynqmp_r5_mem_region_map,
-						 zynqmp_r5_mem_region_unmap,
+						 rproc_mem_entry_ioremap_wc,
+						 rproc_mem_entry_iounmap,
 						 sram->sram_res.name);
 		if (!rproc_mem) {
 			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
-- 
2.34.1



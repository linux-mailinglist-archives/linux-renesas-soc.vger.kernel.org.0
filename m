Return-Path: <linux-renesas-soc+bounces-33314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP+3Hl73GGqvpQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 04:18:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B3D5FC4DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 04:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E27ED3054F43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 02:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12C0243964;
	Fri, 29 May 2026 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4YrKUWHz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CA267B07;
	Fri, 29 May 2026 02:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021023; cv=fail; b=m9lfBW3Jaj/9vBL/HjRpOlqN7IeEVvUJnCReuyPYPw+wuqjmYYZ+l4TfnWVNADkxgBrdKzCSbHdcyBp0CmhRGw1qv+6jErGQXHNO6yCargiFl/d9NkPu3zDnH32Pr4gHW4UtCwuyUaiu+nKBp9wo94ERlolpXplkbqrs245ObDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021023; c=relaxed/simple;
	bh=hsDklYZpnEYlrhraSXKv00uTxCtlDp4VaL8a3CA7TI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDCoHUiodWg2rJIUFi2S6Lx2xy8xVT+uZ2Imp0UtzyqaeXjjBV+RgYgbxfr/mbA8G6+kT+LpHEOj6UYBmV/IYZHpBJ0VvxlJYlqUL8jBR3aNxv7PAoQSlWAXgSWP2GuS89MoNu37+0SPAk2CYuDmJsz9vew7rW4jg0Vx6DlBKz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4YrKUWHz; arc=fail smtp.client-ip=52.101.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPa/Yt73kG2/ZKnYVS6X7cQVoPjPUIMBDAPfXj0CtoyESI9JW9WVu/TfUWvPK1btjvQmqJ9QbZAyfueyCZchzgVu0Y7tUEUA1qoI26BT2huTJKRV1+6/fSK62amAEV7r0IC4+Cyw8nisNkcfzd5ewWXbHeB0QrR493OsM0Up7KD/+La1REkPMrPUWlGaplh5l1kCwBQ45q34sRYNStL2pEnnBzZsJTzLmb4FQQxbem8Tg06+Dm2cTGQv7Y80B10BxNkWKIukFd5dMGAmjfkiutfddHWzCdvPrw880Jd1zx6KfSajAtThV7sZKW4tSOTalclnkD6lPagyQeBUQivNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TLv4UTDq/8PZ81NKG6ACg0RJajFAepYr+Aph0das5I=;
 b=NDGVls9X4bPpIWEPSlwlq1AMHTj1Eqj2mPTqIbUi0o4c4JZ2qJJpw04KVwSG8qOoLrpbxPuDDy/Su0RnwwqfRSWNX6GfBQEWKncyyejgd+PlWumMBIpssnQ9SosKnx4p8T58ZzzNbqa2ZVGcwXFzYCYqVazuef04lWiSgDZ3/nDOIHHwE8iXvKgGjWFLvZN1lttD7nQHFKyzmPu04sRHzxLxHLKUB0KCt8LWd8Jmrlz3elxO/S3TSUy1HE1r1k9XZwS38KGv2PWuk6uwn/BdBnXWi2cm3pWjdbcXgDqVFiw50rvQ+fju5P2LNKjlFwcj24NihfhYLLK6oiBg0PXE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TLv4UTDq/8PZ81NKG6ACg0RJajFAepYr+Aph0das5I=;
 b=4YrKUWHzJLBOGqvH7rcTBSqaHwfEFvePjLiu02fgAVvDaK/FdZ3uEQegkXyVWXVYogO06h93vAJbGqvc2aPa2824E+FjOz4+DwR7yLiLvPQtpU3ICX/GLMROVIYA0z/+3eGU6d8Ugu0JacjI85+DSrdv/lheQFkgIxZcakuVzIQ=
Received: from DS2PEPF00004560.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50e) by DSSPR12MB999236.namprd12.prod.outlook.com
 (2603:10b6:8:374::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 02:16:57 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:61f:fc00::374) by DS2PEPF00004560.outlook.office365.com
 (2603:10b6:f:fc00::50e) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Fri, 29
 May 2026 02:16:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:16:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:16:57 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 21:16:56 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<ben.levinsky@amd.com>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Tanmay Shah" <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v3 2/5] remoteproc: switch exact-match drivers to wc-ioremap callbacks
Date: Thu, 28 May 2026 19:16:34 -0700
Message-ID: <20260529021637.2077602-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DSSPR12MB999236:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7172c3-9af7-44e2-b1c5-08debd285c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|7416014|82310400026|22082099003|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ajs3ucBvGC8A3OUbFhLgsgJuZSUVCgElsStHzfx4W2ojEsSA1JqA1qQtJZPTWYfSuffNC5jemQDFM7qbSADUFPZc8LTISXJJTkQwNJo2BwpdOmuV8oKtdoSn1lbLTGJRaf0mfx+B70Gzc9qPpIrjQYQvhWEtQUS0mbR2toQBvdg2vqmG66P0dBcwNdrc0CSIIy5h9bT33+w2NBf+kWslhbMlHcWIGvG4UJbNY5bCQeoaNELeJ/NkyKu1rq3Cq4UI6zmffqreX7rSpI4KREOKK/8i/FS+Xk6P0yhzDaA250jWKMz/DHdddXsjMkPXxI6TI8K/W/TntjVyCoOd6s17VLLgwO1TAI68Edwf4K89Ga/guXnXn1d8vhLQYnF18l1HsAPPOCtfw7m8hagRZBwsoLHyq35xn9P5EAcnglSh1edTpdrFp9c7+dMAwEc2UTGHkVOrO+jNG5rB0rRs3QksO5eFlkoCBwvuqB98WuWI6rlEQVZiboNnvyBm/qFMmhjsJD7CEgjfxENadbfmmIL/OtsolVDDOJG7cPL2Kn/Ew8yr5RCwXc9icfH25WAcH1Tv0pviR/DyH/kRl+Rg+xfow/E/XSdyKnfa8i9Fy57GBMDfmfrydZTDwS6JMMNFhqyndtAHQ9DtPdu5HtOSYwTRRXQQgPkYl6YhRM1EpOURWowT5lWjVuXLjHIVKwnO/rOj2iC060fau9T4COpU9OuQUL2ya0Scb2GGqXy1uLYg2i4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(7416014)(82310400026)(22082099003)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wUY7Ca5cZEI3CUYcL15Y/gnrWO7BRYsyP3GYMAas//54j+qYGZuPN7vWaWKyMV5hLHAR8Uqa7ql/b0Bjo7MnXzI5cGdzno/pTq4KX3buevhpDquFCEZrNCoGk8qVD7jJqDuNPQ8nezKHcKAGGfk6Xs6R7pUIouf9Vok2mBYvOFF1CBVSwiL+BST7uzDsS/RoZ0pLzwdFdp0JbgkquKinfy+mPD2z51xHwJljon91eQapHIUUSIIiSGGy+IXn1Dg/gZahmxF6SlYzdPVr3UF3IF2jEedegja01r6B53J/KmK8RKOdGWKuCdo+YcZohFVwrg5LAjh5QsHrkyS6t4pvUcCu5bYpQota/eGtdJTC5MK0zuzjsugBvTtOf6tb/8g8xB97VWEDQfpcndh0zlnH2IdN/n0HXbhufeSzwFfeGuV3tptKGRYaKuF7BXpYaEC9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:16:57.7106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7172c3-9af7-44e2-b1c5-08debd285c46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999236
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33314-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,res.name:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E9B3D5FC4DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/remoteproc/stm32_rproc.c        | 33 ++---------------
 drivers/remoteproc/xlnx_r5_remoteproc.c | 47 +++----------------------
 6 files changed, 18 insertions(+), 194 deletions(-)

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
index 632614013dc6..a6e36a11627d 100644
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



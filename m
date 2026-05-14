Return-Path: <linux-renesas-soc+bounces-32631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNO8Dsr3BWpVdwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 18:26:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E499544A95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 18:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 414533024A6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 16:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C7533688C;
	Thu, 14 May 2026 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gjN60ilo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69783016F5;
	Thu, 14 May 2026 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775699; cv=fail; b=IvJsom2SNzR0DwrDycwYDhPf5gMv+mj6s8TYaEWU/rGetCPJ9d5srUwl4yC2DmIPDb0bMb2gcUK7zfALAJ6cvdAJV4Np0btq65GIhIS97Yha5NPi8cfCk9DAwYr+n188RrsO72PIGkCNi/O31ydM2TLhQ3qGU/twyBa+r+y/Gvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775699; c=relaxed/simple;
	bh=dYDZ9M8XcE01j2LeKMQOynY/EZpPTERcpe48iKLGbkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CH4TMCe4252fE8uK/ZmxVaP5oRz8RvmvvuS71tyNr2Y7WuNQ1a9ax7NvMnqJy4iVRG8PSvQX2dqlGKtYAnRMfhQjSe9jNLzlTW3gIR7SQmctkfobFW+BHWntGQYQJosggJrMRqmdnWR9iuVCMnRKuX10F3nFuiacjgg1wO5BrZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gjN60ilo; arc=fail smtp.client-ip=52.101.53.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcQcQUMm/FDGhhxJuooEcRZrGXjudt9qIBom/qbCu5KRIXAafYNauqwk4Esr6cyyFqftPy97KiIkxcpmXkMso4+GIpJLqJXDh85RUAaVlLNXvL9S85U0Tr4mMS75vUzWDdkfQoAel1AiUwIiyVWye6a6QzjokPrqcbuNQbSdhIwabxUNp3sbbblJObTF4xQ/dHU3DBGO9DxPNPNz31dSRR7SyXTb+TbB2cErqMKqJrSeeCbDJXTm64smq16NxcoJHz1yOxuI/+GBFq50hEZ/KnwcT5Ks6HRc2rdyCBZ5ep4iwua6Gb4xWEu9rcgjd3vtGX5DV3FRhb6e1EzZcpu5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh1oD2+ykH7kcALwhihEY//FhU0wQarqHnzOAFPeB7s=;
 b=X7o3pUFW78rgTQOuVju5sREn73245o0ECqVQF4xitDN8h1A72l4E4v7WM9woPokS5aVLb76ABE9dUrk8FEnk1eJxwwqwt7nfHlJosW3jlrnmkuj7NYYtN1ZuEgnovlLkaH8NUkX9KT2D6MYg3az4yexmWsQaKbWBMzJ5d0RHN+JLxSyCxuqLRmShV8O/pOL/oEoQGcdiZxh0qiiN3ZnZi/IgbCt6+uWq6K7kSBySPT06k4ayLORx4AyTlLHp5z6780Nh0IWPNzGm4CsVnPrGCPK74C3psPzFTwVHotog00MyZesFKMJJ8k/tJsS7JDXo502S9P6xbMT3i8OQWbpvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh1oD2+ykH7kcALwhihEY//FhU0wQarqHnzOAFPeB7s=;
 b=gjN60ilolQLl0eUlIYm3TTsWeKo9N1iiKyGILXU6lxATs156FaHl+YTl4xL83sE1l1xVIO+0Nxk/YpmDDcQf1tEKs4po46cjkJ7XXWOY0qihYytPcIGCP0K1wopc+EgBb5+mwrYnMPhrDYqJ2C1vnN1cmFh9varvH/i5eZ2hSnI=
Received: from BN9P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::28)
 by DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:21:33 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::11) by BN9P223CA0023.outlook.office365.com
 (2603:10b6:408:10b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 16:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 14 May
 2026 11:21:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 May
 2026 11:21:31 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:30 -0500
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
Subject: [PATCH v2 1/5] remoteproc: add common wc-ioremap carveout callbacks
Date: Thu, 14 May 2026 09:21:25 -0700
Message-ID: <20260514162129.1504162-2-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|DM6PR12MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0c7210-ca67-46be-4485-08deb1d4dcd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	5StWfwwZ300GB5CUWeeU2PHNpIxBRCZglgtjnESscZtUojviK5X9D2N/dN6tq4lJSf/z3dnn3pIcaRhciCaKOceAmwI3HJh7GV6xHdILYNf4FYFx07YU9nehOrlqceqmhFWr+PA09Me0uwsxmZUFTlInkbLUgMxP3EMcpP0K4CpHEccSB07WOk23vpdIuuTNMLNpC2enpqehkXvUkM41bcH++UymeefA+RG6Hqer7QvcLSYTGUq+TINUx8AkQktNGEQcJj5fZGm6Yk62roPqiHbtiXHT9gTMKTGXxuBiWDqWkkkGtYXpk5RhSxuVJT31tEmprfW9sBdNty1gtmStkwphBGE6f5MJMMSIt9AtvazFPr8K1h7CiN1ws+J3dpiC1G4lNHJgjsfTuY9tty7pa3Y4w6tlIGApBrGU5MwrY4byBeefUWKQt1VevF3mbvclkudhX8q9U3NUk5+m6YE3QFhOKHZDHKRUHAw8gIFEQyhbVAJo8gEUx/3gbUByuYtLQ+7LqP0PMDxxkFXr9+2X0RZk23lsq02exTlGPV7D51mJOUuSI2b4fJDLH7403ec/vStNnotLidVsTqiEOJG4RsDTgnRMaIEcJZjsL//3jhNSQPZqOvsci79EJSqUlmzy/+kkBuFhT6Qu6iKQZJW2f1gGlAyxAfzhXtj/LFQf49JCEpiBlwXiXOIrsbtzhuUQXv3Y9R/qmEqpBMxlYSua03kfwlC+mn17u6t4jDFOT5g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jsf6j40qEBgZdBvDTbeLT5fWqbHcLEOOWOd4oDksEedUxwm5xiQBjWWljdFExcl2eEvrB+q50RQbC68GjzVf1qoXO5Hu3FawAQ+5Wyc8MOIViMd8VHGtiMEmjn4AZQGUILB/7iBJONjp4uZ6Elk+Qpd1NcXO7jMSp4E25X5/ENnzsw3BxEX8abY85Z8h6mQkUDpdIJnLLpe7UpMPE+zLFEiFR09549wG3BI0SNT/tI65dQoO8cqZ7JY1IHqKG+7m1Ug8qUUbRYjB7JURodTeG3pm60Lyj6Skn31JOZMnR9eo/YGFEJwENoDluAtLHwz/q6jVz94Wk094qYSXb/MKlF6aHBgxOXUGt9Nk4L1VRgSA4yksSD7YI8/8izMXZ1paxmvBg7TO2M0OhnWW5zj6m3+klORV5JBDotLzff3RYor9SXcPVniGvknTDrp6ahFn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:32.8776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0c7210-ca67-46be-4485-08deb1d4dcd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387
X-Rspamd-Queue-Id: 9E499544A95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-32631-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Several remoteproc drivers open-code the same ioremap_wc() and
iounmap() callbacks for carveout mappings. Add subsystem-private
helpers in remoteproc_internal.h so those drivers can share the same
implementation.

Keep this change behavior-neutral. The helper now emits a common error
message on ioremap_wc() failure, but leaves mem->is_iomem handling to a
follow-on patch so that the behavioral change can be justified
separately.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 28 +++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0a5e15744b1d..f5b34aabed5b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -12,8 +12,9 @@
 #ifndef REMOTEPROC_INTERNAL_H
 #define REMOTEPROC_INTERNAL_H
 
-#include <linux/irqreturn.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
+#include <linux/irqreturn.h>
 
 struct rproc;
 
@@ -122,6 +123,31 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
 void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
 void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
+static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
+					     struct rproc_mem_entry *mem)
+{
+	void __iomem *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (!va) {
+		dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	mem->va = (__force void *)va;
+
+	return 0;
+}
+
+static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
+					  struct rproc_mem_entry *mem)
+{
+	iounmap((__force __iomem void *)mem->va);
+
+	return 0;
+}
+
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
 	if (rproc->ops->prepare)
-- 
2.34.1



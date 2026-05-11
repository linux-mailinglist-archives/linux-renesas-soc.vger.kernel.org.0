Return-Path: <linux-renesas-soc+bounces-32415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EMcDM5HAmqPpwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:19:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 319EF516387
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CFAB300FB1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5B14D8DA8;
	Mon, 11 May 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZapK+lun"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302194D8D97;
	Mon, 11 May 2026 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534332; cv=fail; b=lVibs+wJiHTQRX3eD/qX3wD4wBU1WPvKOlqHz7seiQZ1MGUew7hBvJpuQTqNI5jDt3jO9B5PxlIxHrkfvFEzePdQwyTzzrtMPry27ljmPwZIAk0Lyt3d7Wxo8W3oagVLYDz6ezHOZLrrgROAXKBOditNF4DU8x68I+odvu/NZaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534332; c=relaxed/simple;
	bh=lFwp04Nz+9J0igI1aATVyNx4Qa3PcGsusqaBTAvm98g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/efK3iTTOYbuOreBd+KtYsCNPcvI3k0f3asXc390z9Osqz1w2WJioWHHHy67zkMsk6IwQgX51wBE8wcsfrsZVbVbBkEi1Hsn6BPfDjVOjsLSBFjsNWikHYDP2hV6mu5/evxXI6zu90qkOHX9wFeNHnaOhBcWjCTs7E3x9HAlho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZapK+lun; arc=fail smtp.client-ip=52.101.61.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSz7p/9QgzZ8vjrdKuqRAbVd43mTWlSvEtbvMWnexdYcEELSPbhgTBaqOW5xzJiG6XEDGlvZmDx1yKzcJOZhzvinshgyqkGl5JArdzEhhg/T0uKFpc26QVCE5Y7C6rkBX6fR1jsY/G4W0AL68xYa8RUgnLiui+izYD6Yj2LVC/7PmV6xON+pVOcd5lZAdsh+uyNfDR+oSeR84eQq/7a2hKu8gNq962pusSM8VsEjA/5bwsmduu6InOIeNgzi6jDnLHCiT/QaNfayT4VZmCGagU+h741li7z8tvgS5mPTLgBFhcZ/dXEY4znX8SFwuGxVFysTupR/9h3xlmCxFn2ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D8QcQ2CFAE+h5a9tLotUgMYH26FH223QTRqGXKAQ2s=;
 b=qaAJHk/OvT6sNkgVakeaYZFVl7xOSZDBuUfjpHwSWACm6N0hqa280zCJ+Cidd+YEiJeG6AJXbHLOg0Tp8c57tbQDA3y142+f/OT1CFyuinm8JNTZF91smaN9ZUaDQGA7sG9J75gzSP5PsXqZM+nsQ1lBwOGdOtlJkmibfDENiPUHp0K3EYIj9tzVV3+TbmK+00k3XnnUE905dyior1qAwx/Ab84Rkq3XGhXRDSSt4X5Huy/ItNU+OSWzK2A/GO/gAfML81848at2orl5re+lAZ8a8MFMxhL7F5JfqKc3zkjWEV4DxweuKMxDxYnn+I9sdcVSP3ZMgMfucr2Md7l0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D8QcQ2CFAE+h5a9tLotUgMYH26FH223QTRqGXKAQ2s=;
 b=ZapK+luntPJVTvb8trebvHw1OsWRM5V77n8ihGrJf4vmqu/fnZUSvlKpLx4vrAJYA0y6Nqgm8EdxgUBkxii1LzwEoWEDD0Vt21t1cUY8jLs31YunlbaI1+l+iUn7AYQdsrTy5rQ0jDGQhdo5Ky+h3913mIGWJ/6IFcYK1kKYaPc=
Received: from PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::21)
 by IA0PR12MB7673.namprd12.prod.outlook.com (2603:10b6:208:435::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:18:44 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::ff) by PH7P220CA0147.outlook.office365.com
 (2603:10b6:510:327::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 21:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 21:18:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 16:18:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 16:18:43 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 16:18:42 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <tanmay.shah@amd.com>
Subject: [PATCH 1/4] remoteproc: add common wc-ioremap carveout callbacks
Date: Mon, 11 May 2026 14:18:38 -0700
Message-ID: <20260511211841.284809-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511211841.284809-1-ben.levinsky@amd.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|IA0PR12MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dffdab-199a-4559-aac6-08deafa2e1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	FCAf9HbgiRj3akBMVvL62ZwuWcujpyIVUA4bxe9ncpqM5WfcSymexKVxUqpQ7AC6NBY0nxop0YfZMgSZkpmRQiqFAIoTFAzFyhJOCyw9ZD+E8UxLTbExpKReD559uexJdceEtOAm/IZp4IQ8di1Zq+1MgeXrViRIpVgezUVihG/pMEsasU1kPncG4MC4hBe2CTq/NTtnZzIG3prTodHjhWtRjO6R+fXKzibb3D7jtRnE+TAEz1M6NbUJKDxSYcaTuyFp+pMq7Aj37AoESDKfA0V2gl1FCR3qZntR4wvht7UzPebJUDUudWE2m+Lxz4OiWq0w6jWtAba9Li45cti+Ad+ve4LBP67RWhjOiOX+sAgd0eOid+ru/Irero5iUReeLIDqTNPPWMMHBjNaa5xXRIxoz72CaqRZ34anX/fhwhs0Xp/mxWgbWdhe8CVimmoi0wdjz5lyQBC/NcSr86kzIGuU/iMIJB/YN0DDKNmxx0nXaYMaxWK8uz6KSA1c7TC+j7l+G3cS0wuI/88SP0ybBKJRIjKHrURgs6FJspkGYK0KzzfOdOBeV79Q3aRwK/Pud/pFxfwBVXB85yY4XraCTYGe91ei+hXMeC9ZxhqqoD85RRf4vmzXuFC60bcpt5sm587f4kBQ8K/3wQsu+1XwT451mPR4GWW/0y6mLY+nK43tiv+XOi9qcAsvh2SxRfxtgBGbwVka3Gw8ynFPIpOs7u62M8yz35RM3kNE8X8PSh0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h/O8M5BMQdGXJ8NjqbLooOppX1SUftYfl5rUouVlAvsjXlHXDayHppEAVA3mNxHHiJIedTRvXk3htphukPiuhdHlfP2Hiua57zjEE/NXidvxqKiu006yFsDkjKPhRXeg+wqiDP75lw58YfLzflbpJjbxGuiyc47DluYJuoibZ6dwgqCPCCHmDuTalIkA97bz+SGN9FSVbizfD+/pgajKGbTxJgBaY/3MLi1GLGsKX89r/fhvhIQpQJgMKjSI8Fwibl2DQ80tgSyG/XbNKadY1ZCIhAUo4bBaq3KoUAi6VDW+MMv58xSZ7++LdtH4e+nxO+I+NIjkD2gd+L0HJ7F+WkADeYMFLZWx+00r1V9HXKFdfAMihDn5te6zoFFLAIZm9QqqmmtRes+qRYrI/7wdKuIVuDhUZWjq8qieop/F2eVCXzpHuIGgSf2Hprx65jFb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:18:44.1197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dffdab-199a-4559-aac6-08deafa2e1dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7673
X-Rspamd-Queue-Id: 319EF516387
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32415-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Several remoteproc drivers open-code the same ioremap_wc() and
iounmap() callbacks for carveout mappings. Add subsystem-private
helpers in remoteproc_internal.h so those drivers can share the same
implementation.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0a5e15744b1d..3724a47a9748 100644
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
 
@@ -122,6 +123,29 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
 void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
 void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
+static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
+					     struct rproc_mem_entry *mem)
+{
+	void __iomem *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (!va)
+		return -ENOMEM;
+
+	mem->va = (__force void *)va;
+	mem->is_iomem = true;
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



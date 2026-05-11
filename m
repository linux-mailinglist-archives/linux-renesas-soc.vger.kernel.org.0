Return-Path: <linux-renesas-soc+bounces-32417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG8KIdVHAmrBpwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:19:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC3516396
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E90230471F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A094D8DBA;
	Mon, 11 May 2026 21:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aRYgsQXr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5C4D8DA2;
	Mon, 11 May 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534334; cv=fail; b=rVPfYD8XxH2hohCXtwSWSWvTaPrJ/RTQgtt3d8dIDLcb1poTqW9NnsMg39xs/+D9GK63aD7LzePVXwg1uH3IuMeFUhFJHmAXmzCt4B2Uq+zzTOHVUaKFIBR3vgRJWJVGB+ZOTwtgtm5HJgPZwyxgXfP+4deQHUb1L2BOgLYT8L0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534334; c=relaxed/simple;
	bh=p/mA4phiWvbU/0vF1YcxsVK9wK3noKqa+IyyYLZKCT0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vtw8EzW1/xtVbymhhMARbfYvoeYB8SuZKF7L6wTZtkPTMm3x+UH/T2WVotNE/qh7m+3y1uq1mFYINqQGoORKZq3Hyi3ewIJcoD8Fg+Q8oQ8WlBl1Lbi2xdRA6ifIylS8CBUjXbCEpgC7Nje4hpOzhUxx8GfpgF+5v9PCHvu3zf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aRYgsQXr; arc=fail smtp.client-ip=52.101.193.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fwcq5nx/Qcnd5lep+py62O7h3cp2JaLTzsjEnxew6Aos4u49riaymfLuStmd/g/FPBGchdPHgEtBkRIwmvTdwXIzu7SCcnMLz+f0d2h7HRyIoluRdfd+bQpKt3JcpiO/hhI8PBknFj+MEJsOrfJ6XEectiVpx7cq6KFvjwqe0IyPSreOvTDNh6QE4QJiAHT/ySQftfdMg9jXfrJ1FvAvj33EOiUCT8XZZ9/Iv49Ae0a9s47vGhXdfYz6vM1MWsT/awopzlMXB1KYAWa1h5oepDmjmNo6mwIyeFFDU+agBXV44qjfPeDjuOK3LLaUtG0QE1Xqrdqy9JYbzvDkL5p5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woeT7VU8Hjkb7K57SLCyIj0RlWrZOv5LgSO4QQP10cs=;
 b=M0xVtsGfqGeFIDjdKGqWwQH0GVDSJo8cbz3ND0A5IZh3MLRGwlJWc2nVdHgacLSPFN5D/uSht47amvypa5AYv4I1U9dUGIL6e0ZCfmUPA8InmMzcOMoa7gZbYsDfl92zz5/dY0D/dLSKJ5aded51SNVd7u0QBYVJu2KeN5gUVBbjm5lVp4ptE69Baa+Zbmb1HdBPD4DKuopF+fc0bAXswNo14gwCQD2S69ZnAvHqMvU8diuNQ/VYCmGvsYPS3JZSr/7q6jUJ5+cG3p9lVqCLeMvehZXLY51x96UgL+xFKn/EqFP0MbbppzbSf8UMmNnPGFP9z3qhWaFGZqpQAP3AbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woeT7VU8Hjkb7K57SLCyIj0RlWrZOv5LgSO4QQP10cs=;
 b=aRYgsQXrqA/by08gv/DsidmubamWQSM3Jfxmr6f118LJmXma9QHGYU6g5uDXVx4GEC00z9Wrrjw2Wa+6CKlnbG3zD6MpDw+Eu+/46AX72suPBmmyLP2sRHsE/Z5qUqqPkeCD9tzRgYbHJa06QAxABoXn9vKZVDBw0eYMsTG4ibc=
Received: from PH7P220CA0146.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::32)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:18:48 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::cd) by PH7P220CA0146.outlook.office365.com
 (2603:10b6:510:327::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 21:18:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 21:18:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 16:18:47 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 16:18:46 -0500
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
Subject: [PATCH 4/4] remoteproc: switch drivers to optional resource-table helper
Date: Mon, 11 May 2026 14:18:41 -0700
Message-ID: <20260511211841.284809-5-ben.levinsky@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 48faee58-e905-4689-fde9-08deafa2e40a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	gRAtMP5vcLp0y4xyzIzNFqsULmkolI9p3M4TlYTsg2cQXaKZW9e/sIuB5WcGRmi4GqF7ky4oJS7UK2hflvQo0WVTyyluKTlOajjyUPuO/cHloshD+7F372BhlK9CYMFhLLXWfIpaCc287bUSsbtaAdAEG5rQo/jlaKB8j9iyysrJpUJVpqBRXm1zlQk3LEjnBYlQt+knBOxg8Jip2zQ2NytplufgugxIJdp9E4Zo2ooxubFUFO2MBIlM5NK3Cp7C8l8ccW/7xzef8iR4VIOgZdQolMGNOCvKNpD+yLpxOvpIanbFt/ab9XxrB/nCoyDttbAmfiiTw6MlvwEGh5dqd7MhL+hhFJfGdIg/F0ElNSmTwaCgwg73sPv/9be3VkTUj0DjNxCA3qlI8m8pmCXlAAM32Gul19Nd0Ucs5AnZaz9Ryla650xYEZVtWAXzSGFujKYA+IRoa8gZehSbvF/hrNOlOmzNvQqxRBuqTaLX9upd57iskKDom7RzhyGNHVaN/sjyl/z74jM9CiRjXHd8PVeb4TxQhBjX4EGlOjqp3+mCggkrVw+RV37bFUtX8RTduQsu5KUv0f/l1t13vVZUw7EiCxmGUwS1kf6+UaPPjBskB+dIpLUPMyrGDq+FKRLlJP5u0uxmd5uIXKDk5/SM7xyeG7kCfguxLKM6QjvbztoLHO7Xnduh6BUm4Ld13TGIWwuvB8k+abztubWxYSqf/Za4y+sL/pzas9u4iP6TbIw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A7pd9nnxIAUzo19PEwmsAStbum6d/dF4YGVT9J794k5bcen7zSbCyBa0eHQrNTBQMeJbe+bSkDDrXDLVNLmISMYSgJ6nzU+IupOvQf9iMk2puQXwA0OnobEnOlla826G1x+sXT9kqtmM4zTFQFN0zZyo0Ofp12tEPLK3MbBCWtL+jAtKjGonVF7Z+Rt/xTsyGDZLyvv84kLNFZTXjgdAJ/yHyUpS+vf1V81aKM5yrMaXvJfU39b7tm4N7dRifjAVFhLfS0BIkZoC+vgSWTabsNZAyo09OZiPQJXpRBoLtqZhQqn69Hyzvvw9bM6kml9P1EJeNK3LtYGyDDdzUOKJUvMXcCVddYQ6xiDvWq7nsaDX9a8rW6cJQ9X73goJ3h8Ore+/7P86HqahjewO8Qgl0KaZr1jkIcztsh86uMG1W/wyqk0S18TXh56vmPouxKPd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:18:47.7788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48faee58-e905-4689-fde9-08deafa2e40a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142
X-Rspamd-Queue-Id: 37CC3516396
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32417-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Use the shared optional resource-table helper in the remoteproc
drivers that currently ignore a missing table. This keeps the missing
resource-table case non-fatal while letting other parsing failures
propagate to the caller.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/imx_dsp_rproc.c      | 10 +--------
 drivers/remoteproc/imx_rproc.c          | 13 +----------
 drivers/remoteproc/rcar_rproc.c         | 13 +----------
 drivers/remoteproc/stm32_rproc.c        | 10 +--------
 drivers/remoteproc/xlnx_r5_remoteproc.c | 29 +------------------------
 5 files changed, 5 insertions(+), 70 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 2d9f14fbef1d..3e96e7978cd2 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
 	return ret;
 }
 
-static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
-	return 0;
-}
-
 static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -997,7 +989,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
 	.load		= imx_dsp_rproc_load,
-	.parse_fw	= imx_dsp_rproc_parse_fw,
+	.parse_fw	= rproc_elf_load_rsc_table_optional,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6249815b54d8..5509048f7e19 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -680,17 +680,6 @@ static int imx_rproc_prepare(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
-	return 0;
-}
-
 static void imx_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -777,7 +766,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.kick		= imx_rproc_kick,
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= rproc_elf_load_segments,
-	.parse_fw	= imx_rproc_parse_fw,
+	.parse_fw	= rproc_elf_load_rsc_table_optional,
 	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index e3121fadd292..7adaa6d37b82 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -55,17 +55,6 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 	}
 }
 
-static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
-	return 0;
-}
-
 static int rcar_rproc_start(struct rproc *rproc)
 {
 	struct rcar_rproc *priv = rproc->priv;
@@ -104,7 +93,7 @@ static struct rproc_ops rcar_rproc_ops = {
 	.start		= rcar_rproc_start,
 	.stop		= rcar_rproc_stop,
 	.load		= rproc_elf_load_segments,
-	.parse_fw	= rcar_rproc_parse_fw,
+	.parse_fw	= rproc_elf_load_rsc_table_optional,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7ac8265b60ac..007175dcd7af 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 	}
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
-	return 0;
-}
-
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -631,7 +623,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.detach		= stm32_rproc_detach,
 	.kick		= stm32_rproc_kick,
 	.load		= rproc_elf_load_segments,
-	.parse_fw	= stm32_rproc_parse_fw,
+	.parse_fw	= rproc_elf_load_rsc_table_optional,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index e5d1903c9636..92c1f8972551 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -664,33 +664,6 @@ static int add_tcm_banks(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * zynqmp_r5_parse_fw()
- * @rproc: single R5 core's corresponding rproc instance
- * @fw: ptr to firmware to be loaded onto r5 core
- *
- * get resource table if available
- *
- * return 0 on success, otherwise non-zero value on failure
- */
-static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret == -EINVAL) {
-		/*
-		 * resource table only required for IPC.
-		 * if not present, this is not necessarily an error;
-		 * for example, loading r5 hello world application
-		 * so simply inform user and keep going.
-		 */
-		dev_info(&rproc->dev, "no resource table found.\n");
-		ret = 0;
-	}
-	return ret;
-}
-
 /**
  * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
  * adds carveouts for TCM bank and reserved memory regions
@@ -849,7 +822,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.start		= zynqmp_r5_rproc_start,
 	.stop		= zynqmp_r5_rproc_stop,
 	.load		= rproc_elf_load_segments,
-	.parse_fw	= zynqmp_r5_parse_fw,
+	.parse_fw	= rproc_elf_load_rsc_table_optional,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-- 
2.34.1



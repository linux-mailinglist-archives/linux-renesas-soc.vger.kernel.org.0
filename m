Return-Path: <linux-renesas-soc+bounces-32632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKpgEpj2BWpVdwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 18:21:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B1B54492A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 18:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 465BF301A2B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 16:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575F3339705;
	Thu, 14 May 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="egCeF6TM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011070.outbound.protection.outlook.com [52.101.62.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D103290C8;
	Thu, 14 May 2026 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775700; cv=fail; b=aLIuAb2FimIUJSwcpLwsgyHqU3wG1q5HqIpjFsA9AnPaEVgsvPph6/aHDAFmbzYL9J9ZwA1n0nrUbQwoX22+lV+FKsRRv6wlSyyAtJFqMP8mVoTrd2d0ExsQwBrnfsQlw4/gPI8pdH8gyhN5MCph2XdDkMGjWPB/SCiL8F6pLaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775700; c=relaxed/simple;
	bh=I2flfyW4lAlHdzwAiOG0flEd8BbWtjptcgPwvvWP6ns=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qSppEr0CyNDF8F5+bR28C/zjsNzRMtyIfNT8BtkQsyLaBZf3zDoETNOF/S0geVibsiyP7wfGz/KA2Yy+dfkHVP+4LlBcOiibNUPj8VorrfLn0qbJG3nfhsKTDCELSwmtNNe1hXJlgK61eGd0JJDQPVsOH+4WuJbgtr7O8nE5OrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=egCeF6TM; arc=fail smtp.client-ip=52.101.62.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVh9jGE+mepg4e5JGPYLT0gVknz8MJniOU6ekPZ6ec5EHcrMZGWPEYMSXUfkZaxihqofZt1g+EdFD1aUFT2yS6mA+4NPlj6vTzaArZXWQrQ+PWWz9CRvY8SSI8duSgBfPqOYvRATjdK0a0kHOnY3Ga13EEGM6R2a/OFzpciVRL0O21JIb3KGeuWPOaXmpnFJ0EClNU6QYtWss77LtiAcrmuMze6KTePD8P+zNKh+bokWCShU6DhZqm0MoFFyZwcVCbV7vcI1ijwclO4wlkpBiLKwUSxI0ZSe8ZzwB2IKaYQSplWd8z5dhrgLF/WMp8vvhlCgaWZtHCgEEm7TfxS11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmL9ydYaXo6jAUmuZThRTKiTfD+zGRfKFBSWjQKSpO0=;
 b=XiQIwhvJlKpb4of6/B/z781zuveGwEi/hRa+HLIRqD5qW3PHDiDZXRAK5IZ89gNXefV1SJd6wrTlhW9Ix0/IAlqc6caKogleVqQTf/mkKND5nI776ZtDChhg7qbKkAqNi7v/nX+xFg5O2f6uHp0+0+uJDibdx6T5kad6m9U5+EV0xZzqDWWlAE6GNKDQWGQWLVhxLWaxn28K9XxFBS2IXSG20YoyqAAHqV8EJXk41FOKxpQ8lP8vAQFmu5Z0NtYQ6VTsLyC6y+rEcnceUUMJNDheL8NUi3JJ+uchJM77+/5YlBa8KLqrafhc+PrRl+xyB9Px9ZvsNwSBluUPvnbYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmL9ydYaXo6jAUmuZThRTKiTfD+zGRfKFBSWjQKSpO0=;
 b=egCeF6TMuhGW7Dp1I6/1J9gGzlkqBtfqBr143hx3suE0n+O2aq2hYbuKDYZuetaJ146t2nlOOmGapeVzI12re7cl42ByPXzWzX1nLzhnzwYKBlgcaY0i5IHnHBKdwWZqo5jKJ1EzsxqoH6lvsw/QQzohizLR8oSj14MzmE0hitM=
Received: from BN9P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::18)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 16:21:32 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::32) by BN9P223CA0013.outlook.office365.com
 (2603:10b6:408:10b::18) with Microsoft SMTP Server (version=TLS1_3,
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
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:30 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:29 -0500
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
Subject: [PATCH v2 0/5] remoteproc: cleanup shared carveout and resource-table helpers
Date: Thu, 14 May 2026 09:21:24 -0700
Message-ID: <20260514162129.1504162-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b838e92-d09f-4879-6846-08deb1d4dc4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	GGRQ3aAXNQmK1cNS/V36xc7K2s8hKRjGxzctWvXziyfuGRaa1vLSLbniHS9uz69JIEUzuR+GTP4lXlcc9B7fgWqUk4rq6Vda4kZrKCg5TcowjWNLmTZlZS5LGN3t8uADXQWm6rdPrdo8HPEOBZIsuEBAV3pI43DApMQCm+hYRxFlvODs6Vv3JqMcbeKUK2bCAlob80mUBSI3zuJD1yP9wDUT9QD1NNSu6hrz/9o/2+/4h84rwbsI9oN/bwsrIFH5Y5at/U0SNPNOpwKoXDdGjnYjqHl0eLd3LxMHvoO5o4VVigswtN7tWfod30vNJ2Oo7vaZwqyxLuBYAbsKgppToinNd8hyr9BFWfHoQJR6naMnuKGkzqV0uSiQwwBT2ncPkTRcE/5l4fP3DfrhNcksM5tf/e4chKgcvyi2rqH0uK27BseQyW70a2xIJUUQmBuOVg93lcMs99hAMMoYYdAJX+l1fY26agoCLEMLTQZZHj3uBuQh2qPoxaKtY4Xc/68lAdCCU+evXlD3tTbSMFebUiUIgR/4L0mxFbnmASm0LDyomxP8XogcsSMvAwjzCklYgvjGOLWQ183RbgtO2F3MujLKKSxiKEmv/A1TACC5+jrJn5puPDLiHBMYskQJTLsq7QLUO6UiekdXoDf7hOApD9Z50vSfx8Ry6AVn7/c56Wmo37yE2KiZhGp4P49P8gCIeg/G9ufK872ILIZhWRZ02D4aU6sQgU8rFRMS1/hrvwA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	poQoye5bSNuGo8Ci9fURJb1mqrZbgca91oXQi+DvWMAkOJJDTRAiUz7MiWJpE4W/u1S3vLTxkbeXMiOiWY/Geqy6aHDZufWG50vMvRpOe1GkboDknaOa58Z/D8r5p6e5gVM+roccGIv3DM2kVtcCAdw5PUZqAzlgNO8fy+zJ4XVU5IbOP9q3xnW2AsfnWle6ad8xEwodOk5pMzS64bUnd+ixwvyWwhKxjlPqGYt4GsRiC96P+U1lGzLHEGptIa1NVs1/SFIRpUinZgdT3Ws/9g8d/UEnWZNa5WIBzUz3giU+Nm+rZm0nEknTbzAYNyS3ulDKxkV4sXjUOap657IHqr534JTTnTIIBWZp9CAjlTTxt0etdJYHWMuW5a1SzW4j0evTOfF6uI5+30sMKSx8hMNe0e3Esxug1vS0tGImtEa2Ni3lMEWAtsdpbfrk/lQK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:31.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b838e92-d09f-4879-6846-08deb1d4dc4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909
X-Rspamd-Queue-Id: D1B1B54492A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-32632-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

This series is a preparatory remoteproc cleanup split out from review of
the AMD BRAM-based remoteproc series.

During review, there was a request to move the duplicated plain
ioremap_wc()/iounmap() carveout callbacks into common code and to
factor the "missing resource table is OK" ELF parsing path into a
common helper as well. There was also a request to send that cleanup as
its own patchset first, with the AMD BRAM series respun afterwards on
top once this cleanup is merged.

This version keeps the same overall cleanup goals as v1, but reworks
the series based on review:

  - keep the shared wc-ioremap callback addition behavior-neutral
  - add the common ioremap failure message in the shared helper
  - split mem->is_iomem handling into its own follow-up patch with
    framework-level justification
  - keep logging policy out of the optional resource-table helper
  - retain thin driver-local parse_fw() wrappers so each platform keeps
    control over whether the missing-table case is logged and at what
    level

This series now does that in five patches:

  1. add common subsystem-private callbacks for the exact-match
     wc-ioremap carveout case
  2. switch the in-tree exact-match users over to those callbacks
  3. mark carveouts mapped through the shared wc-ioremap helper as
     iomem so the framework uses the proper I/O accessors
  4. add a common helper for drivers that treat a missing ELF resource
     table as optional, returning success on -EINVAL and propagating
     other errors unchanged
  5. switch the matching in-tree drivers over to that helper while
     keeping per-driver logging decisions local

For the carveout map/unmap cleanup, this series covers the exact-match
users called out in review: xlnx_r5_remoteproc, rcar_rproc,
st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
TCM mapping path is left alone because it also clears the mapped memory
and is not an exact match.

For the optional resource-table handling, this series converts
xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
parse_fw() callback also builds carveouts and is therefore not a direct
match for the helper introduced here.

Changes in v2:
  - split the mem->is_iomem change out into a separate patch
  - add a common error message on ioremap_wc() failure
  - drop logging from the optional resource-table helper
  - keep driver-local parse_fw() wrappers to preserve per-platform
    missing-resource-table logging policy

Ben Levinsky (5):
  remoteproc: add common wc-ioremap carveout callbacks
  remoteproc: switch exact-match drivers to wc-ioremap callbacks
  remoteproc: mark wc-ioremap carveouts as iomem
  remoteproc: add helper for optional ELF resource tables
  remoteproc: switch drivers to optional resource-table helper

 drivers/remoteproc/imx_dsp_rproc.c       | 60 ++++++----------
 drivers/remoteproc/imx_rproc.c           | 57 +++++----------
 drivers/remoteproc/rcar_rproc.c          | 58 +++++-----------
 drivers/remoteproc/remoteproc_internal.h | 38 +++++++++-
 drivers/remoteproc/st_remoteproc.c       | 31 +--------
 drivers/remoteproc/stm32_rproc.c         | 57 +++++----------
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 88 +++++-------------------
 7 files changed, 128 insertions(+), 261 deletions(-)

-- 
2.34.1


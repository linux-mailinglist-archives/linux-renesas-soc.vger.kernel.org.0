Return-Path: <linux-renesas-soc+bounces-33312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEc3FJr3GGqvpQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 04:19:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CD5FC4F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 04:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACF0430CBC9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 02:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940F0264FBD;
	Fri, 29 May 2026 02:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fuusZ4gK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21F12F585;
	Fri, 29 May 2026 02:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021016; cv=fail; b=MqVfZ8tij2WkOAPeV+uoEsR73540q2ItrYmj+bv1VhhqO+0FsLK7fEkUL4uR4PcDgEFhYFl6pTvPJ/C72q75r6gxY2WuPL14J02FIARvD8mg3k9smXAXd68TRXJd+KK6nuWtRJplQ09cQ4KkPGRN2XCLgz/raYE69nv17h4r6l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021016; c=relaxed/simple;
	bh=OkeGWMgrg+lcKosEBcVwvjGtaycwJqXdD61AxGpF8K4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PAxBZPSKWrVYCwqwBPXGHD93pfllNtWrpno1AzNXubdDaO/TxA9jitp2jYAjTm32WCCtclyDBJ9at1jrvfmkWsSHaq70k4HI/pJ8NAyxg6tbkR4V/DhYYUQOSu3biREKXR68P5fWgBmEE8tVG9aregGG6ihjAO9v0aVTa1CVpdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fuusZ4gK; arc=fail smtp.client-ip=40.93.198.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywirGU4oKPcXWDoer7ak6POKi8gpDVlbveVrPHypPgnqPzJI+pwbtjMyJRYYlky2SAVGQPUsC1aY0IYP6F12JQtyk9HRiSzS7qL9Xw80OddD/5gMOYYFReu2S4QsbwYIOZr/4zzbbzyMsfkjBQMloBt44GKFsvi/XTgBIP3oJ3lwex+CgG8yRv2i/CEppPr/S0mvsj+oY9MnpjhxyP0Q0ujhszBXdQD/tC/Mp+ypKRXCEYkCvo2DZ9JX983S5OQmm/gYjriEWxUzsI9+PO+FYwj79VVnc/YHMGNq4sipuEb/vgq58vJZnh0sLSImWd3PJ9vNd7qYlpSw8qTaDAUBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOyBFhSSNMbaIW+cOVRW1MwQk5POdPbeF/sApCr12aM=;
 b=goRF5ccQI7Cxxq3bS9ZJ+N99MGZ+SjWuxydE45tWiVLW1SAD51PvM7SP7UcbVni5Y+YzZTc0EdLcbjQnDKHS6vDlXKBcQIYC2ooHocAWvXaKuRBlJWgnRobi0Y/XKIa04a9hSXDu++gySeLA8RlLxRix3X4JfLQSufz+5sEINzkq/pXXfyVxSvRAxb/9nbdfP1NQSJDala3aOZWcwqf0MScIpmKqivhWY+ZzO2/DXby1TGdct19Is8Z2D/GZBkOANvMvtDnSgRHNyYBlMVzsjvQzkwPctFC0te056icMJ/Dt/iCSDaqUq5+PuNfoMQWBl3HQVjXm0WVdlKllVUct5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOyBFhSSNMbaIW+cOVRW1MwQk5POdPbeF/sApCr12aM=;
 b=fuusZ4gKqNBFjATmZ674kgs7hPHEOElmb6vuW0OkGehwFbtkwjUav7OfoAyTZOLMVUrZ5Nxcd+U7yxSJuyaBZ39Dfp8etGt4PM3TDGn9tui0AgajqM0HVtbNNEA7tOKzULMCJ2jucwJ3Y7IIf0VScd0l8RGu62p+8a57RDDVuNk=
Received: from CH2PR08CA0003.namprd08.prod.outlook.com (2603:10b6:610:5a::13)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 02:16:48 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:5a:cafe::2) by CH2PR08CA0003.outlook.office365.com
 (2603:10b6:610:5a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 02:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:16:48 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:16:48 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 21:16:47 -0500
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
Subject: [PATCH v3 0/5] remoteproc: cleanup shared carveout and resource-table helpers
Date: Thu, 28 May 2026 19:16:32 -0700
Message-ID: <20260529021637.2077602-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 43601021-a797-416e-1074-08debd2856e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	TAKx7kjDXKtJIKMGl74gJwpgKJRHrtdys74sqk3r578CaJuk2rPDmZt6H57L1kSE6JOwAYO5kbjm5Q/Oj65dxWf1cC2JPKPeH72leSSFtkxgn+50j93nvFpqmfLNqlO1VXIgNdlPRTXS06gP1no0WipQ23/aOxApS+Ka+lerVFc1SbIy4f+uWgudziq8JobLTEtPHegd6NCHsBnPiENs60Fh5O39vEHZb6MNFJnPCXbc99VLQWnNteK+/LkizrXH/8MGKlV3FE1QsmbpbUU+f/Ai/YMhQqNoVh2g4dVt7FFTTDH+6kb/MgXu5nPuCCSO6syRm/LiGlUFzBA2Ztst1WTuWEIdsFlfSzdrX+fazwy3056BYRO6mjKSYBYA1uy1gsF0mXKhxV7vhLQWtor+/H6zfQR1tofkPISwcUfjfIoh+lgxK3PAvpHFoPNrM6RJ+jjF+Z29AOyZe6KwWFz11n2SkiSQbWCkDBogJKPkquc3U6En3HJ3dutEDc8R7iwzYKHCCU72uMccW5FqQrNrIrNOR8sFeQSKnm0aLvqr62eCGR0Xm4qUr8W9sKgx/r50C9uKxtlk73gK7J3vfpP839PuZHRsWBFPV9rAKGP3Kuz3u6WuxVohFnHQg/G+yCF5l+yqnBna4jN3IoNSuA9I6TVimDQgTpwH4cZnWBbJNtLAwaHBrDesnfKOr9wit1rbfltcqYD5SM6YcAXeO/sCJ6YiqYdId8akUzH6gMnzmSY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YgpkeqJMyc6hQ8dpnH63lMlr7TKnED7DW5zkzWFTeoDD0HqlZL6ZCgyx6O11EVjuNRng8p6IMPRhl+LRL4oDW3iXTZymb+RBzxS0vl4Fww5ChVK+w4026Ez1XgloGchSsUqkaexSbtlegG87S/ro3KTEoQv+KUEVdou/3Zcd15Fsfyz8S+lUqpHlbTihPbYqC7RNDjCxTa87fjjza7fs7RffMZlae4j6CWQtjbdZ2vJZNfDCDjjis0S+R+TpsQqqOCUPVdFqvq48nlLQ1y8UGUUnumOQ75TvD6tZrXYuaVkjwBVZXuqhqT8e1NeVwAHbM3g89Zg5JIqahl4jrX8WJ0ZE+erwDqCKt+EpHXOqbAv6Dq20AWwRJNMhDhI/TY7PyeekyCI9hSYyEAYVBnyZwrphv+1Xv813vDfrVDY+D9aiLhEl0Lk/xvhkdhVpscBr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:16:48.6749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43601021-a797-416e-1074-08debd2856e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33312-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AA1CD5FC4F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series is a preparatory remoteproc cleanup split out from review of
the AMD BRAM-based remoteproc series.

During review, there was a request to move the duplicated plain
ioremap_wc()/iounmap() carveout callbacks into common code and to
factor the "missing resource table is OK" ELF parsing path into a
common helper as well. There was also a request to send that cleanup as
its own patchset first, with the AMD BRAM series respun afterwards on
top once this cleanup is merged.

This version keeps the same overall cleanup goals as v2, but reworks
the optional resource-table pieces based on follow-up review:

  - reshape the optional resource-table helper in patch 4 into the thin
    parse_fw() wrapper form suggested on the thread
  - switch the patch 5 clients over to that helper shape directly,
    without post-helper rproc->table_ptr checks
  - keep the driver-local parse_fw() wrappers and their existing log
    messages and severity choices
  - retain as much of the existing per-driver parse_fw() logic and code
    placement as possible while moving the missing-table handling
    through the shared helper

This series now does that in five patches:

  1. add common subsystem-private callbacks for the exact-match
     wc-ioremap carveout case
  2. switch the in-tree exact-match users over to those callbacks
  3. mark carveouts mapped through the shared wc-ioremap helper as
     iomem so the framework uses the proper I/O accessors
  4. add a common helper for drivers that treat a missing ELF resource
     table as optional while keeping per-driver logging decisions local
  5. switch the matching in-tree drivers over to that helper while
     keeping thin local parse_fw() wrappers

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

Changes in v3:
  - rework patch 4 so the optional resource-table helper matches the
    thin-wrapper form suggested in review
  - note that patch 4 still triggers a checkpatch --strict warning for
    the flow-control macro form, but that implementation follows the
    maintainer's review suggestion for the thin parse_fw() wrapper shape
  - update patch 5 to use that helper shape directly in the client
    parse_fw() callbacks
  - drop the post-helper rproc->table_ptr checks from the converted
    drivers
  - keep the converted parse_fw() wrappers otherwise close to their
    existing structure and placement
  - test xlnx_r5_remoteproc on the latest tree with firmware images
    both with and without an ELF resource table

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

 drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
 drivers/remoteproc/imx_rproc.c           | 40 ++------------
 drivers/remoteproc/rcar_rproc.c          | 41 ++------------
 drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
 drivers/remoteproc/st_remoteproc.c       | 31 +----------
 drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------
 7 files changed, 73 insertions(+), 227 deletions(-)

-- 
2.34.1


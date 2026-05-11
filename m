Return-Path: <linux-renesas-soc+bounces-32414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JKbBr1HAmqPpwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:18:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9F051635A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74411302F7FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F654D8D80;
	Mon, 11 May 2026 21:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eVm70cS7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BFA22D7B9;
	Mon, 11 May 2026 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534329; cv=fail; b=XmM2K1OAr+abdwVArVoahnTVgvXI1ycoe76+QHNhdiYIdMyrpDKi+9M4W+i+HzILRH8rRiv/bUAJjk7wLBL0TkdUPMJTyOmIqm7lO5bUH+ABY8FHeNR6fP9KZCvdLidFpL44Aahs/eY//H3A3jSyX7Xqok/x0QL8Y2uMI+ByKd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534329; c=relaxed/simple;
	bh=WaqnJ0SI0Ij+neVHy5khTKNuDVAMwlnPw/0oSH6XOWM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RWpxNbpCgJ4DkZCdEgOaLjfcdtACv73OgMtpuNmT6Vls0I62SJBxn7VrfZ9vniaFLqjl28digsojguC5nACbdJqriDRF1PwAicNq/JdDul9ucIRSs3IduCypI966estczkOu1vF90+/X0G7oTcOzC5vyfwMdVUFJYHZdcIwcMoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eVm70cS7; arc=fail smtp.client-ip=40.93.194.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx15Yro/e938xOHheUupdSccP+1eK/WSQuRI5CQFvYmA0/4kxaAUKBvAqZZ/Q2oiFHcclw/POQLVeUDHSpBV8sDyLnOLRBcavtkfyp6DhbjtSeyf/Qb8d4ZKm+ZTw1l5ox5QUGTvERiUs0pdVW/VKv91ILCIUBmXo7q4n8Xpnxk9Ib75ox2Y1sDSJgXWr1XguH6cage+pi2XzZK6ZJnz3uvHmD1t+OYNAEKC2V2YFhKHe1vG3CULR2xRpASHaofREp3gL8E0akvSpmjiR25wnXBPpP85z8jtKFzv5ORffG1bOmHEObQ+h8KisewOjtHIZdnb5GsXV9hOZtQT9yYY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hX2neu3NHufsNJB1jyj+MLov8FQRt2+V9eSNT5YdsI=;
 b=g33bpsphNBpZCNiCG17u4AKMlvPEEIcsEcTQ2vwcVuCrlj92rk8fKZr5s+911ECShUk5SnaS6Ly0aBUE46Zv5Y/jxpQifd0NCLC4sAfqe6j0sbVVSZ8GkBIjHxuZ0i4a7cdBQiIUmXkNDnmvdvsrtvHBMdfCOdOybWnvCsoZ8eb38Bioa21vQvtzw3ErrXT9ePdxjxsJHPI5K+hpGmhZkJP+YHaRw2UsCDDeyUM4IGLEdV0IvllCBidk8ObVIPyfcXptlX6AklBc8QgZGN5eFMhny8RX3C/rJdYcBqioZIxU5L0ni2RIgCjNnyhaPySsUCkYQnbyUR4Km/riXfS7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hX2neu3NHufsNJB1jyj+MLov8FQRt2+V9eSNT5YdsI=;
 b=eVm70cS7muIM7ezcODuIvjZC4D7w2Q6PyNeiKQon6H07UoZgo+yRDRsK48XDfdTRNuGfomEWFoB0icCiTBzcX0zW/9xdagH6Wcfm0A6kugs1fxiLIhlRAtxW/Hk9k0A/0JN7qw99+EOtzuAAEwkhIgQwO28K8wIRvnCySO2tVAA=
Received: from PH7P220CA0123.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::26)
 by DSWPR12MB999130.namprd12.prod.outlook.com (2603:10b6:8:36d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 21:18:43 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::56) by PH7P220CA0123.outlook.office365.com
 (2603:10b6:510:327::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 21:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 21:18:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 16:18:42 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 16:18:41 -0500
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
Subject: [PATCH 0/4] remoteproc: cleanup shared carveout and resource-table helpers
Date: Mon, 11 May 2026 14:18:37 -0700
Message-ID: <20260511211841.284809-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DSWPR12MB999130:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c62e2e-5e45-43df-66e1-08deafa2e121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	zam02IVYasQhRVNQ/kBuJEjMcLrWZLRRkaMx5pfEt4mY+4SDeCAPsndNZm2i+tbB5FijfqF6D7SirEqtGYASa2vJy2YqLIC1UBVoqxJOef2kgM4Z0XYowvMdf5e9T7kvHmbvs3wFOjQfkTuot1f/m9YUhKMgeFi0zpZIbbgHLM6+EhQ16KKWCp1BzfnzdUoENlklqyS+eJ2+cN4lOiqZvS4g1mgzyKLED2EZvPOf49Q3BkHuq7cHwr4oC4xnCyT+2Ah9hmYij6xnl3Gp0uZ149RdCLjmblypf88mE4utzM4OTAw0fgkEBJZNreqCBRfJl5xgbs2j4tH8PIVw1U93Ike3DybZ4N+StWhT3+foT8tvOh9ySbt3RkT+0JcOlDPw5TTOcUD+EppRqxzTZggyn6cioj6GtJ8cFmA5gcLHyDP21Uye9UUIqcTSoPR+LXLFQAi4sydkNSVUQ9DrID9pkifIIXmoxlT53a4eHBj1Oava/vGgRn8/wFeNtO+jIWePMd4/1Y5KhCvttOs/ZutVzS2VXlbHuD+WXl6WNECyvSo3DJGczGG/DLHlRwp07J5Twu6fVTwVR1F4+Mnnls79mHbdP3+YVHMYGGGCnclLH2xpnxD8f8U5p0v30H2MUYvSk9GaPXzXraAnQC4uLwADTk9SjYXDY/2/01cnEn7JfDqXkPdcFzNpOxlgs6iJOAGCuUhU1/31CyTh3Rjyt8XkHqvj4CNkHP2SQZTRqVcfnHA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iHHkAaCw9qD/3J7chpnwzvg2BJ3pGq/1PRQz6Lo46my7hQOExihNkyiLKHw/VL1Ao8VjwI37gOhK8BKZ7GH2ZG6H481To5gs5ExkIWFUsu7J12hpPhX/lMMkyiXvAttxs7j3n8Vh12j1mYqn6NsH3OpSoeORMMcGQjWo2lxKWM2zFSn9eYVx0I95+7dBa2jWppo5rpg4dduMtBtZeNJSCmlGgjAXJqeYJqorZaFc/4QJxPrp5oq/zf6TGC9oJ9JFIIcoGeF8U7LKyQnz1seAo/cY9zxw+rMLjlp6UmQqxHhcvxA35/s5pq6iPw/eMpniQaEHVWMPWHAKYeD9G9kmkBIEu/nUSuB5cFkgfZ6DNLCmnvfGvzCuL9V8wHhk0LZVz32GJKwmYhQK1h4oZgF5oS0QUz6bNobggDKVDELzDP6H0ZFFxMie7nTs0qJ8Lj2N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:18:42.8940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c62e2e-5e45-43df-66e1-08deafa2e121
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999130
X-Rspamd-Queue-Id: 8C9F051635A
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32414-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This series is a preparatory remoteproc cleanup split out from review of
the AMD BRAM-based remoteproc series.

During review, there was a request to move the duplicated plain
ioremap_wc()/iounmap() carveout callbacks into common code and to
factor the "missing resource table is OK" ELF parsing path into a
common helper as well. There was also a request to send that cleanup as
its own patchset first, with the AMD BRAM series respun afterwards on
top once this cleanup is merged.

This series does that in four patches:

  1. add common subsystem-private callbacks for the exact-match
     wc-ioremap carveout case
  2. switch the in-tree exact-match users over to those callbacks
  3. add a common helper for drivers that treat a missing ELF resource
     table as optional, returning success on -EINVAL and propagating
     other errors unchanged
  4. switch the matching in-tree drivers over to that helper

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

Ben Levinsky (4):
  remoteproc: add common wc-ioremap carveout callbacks
  remoteproc: switch exact-match drivers to wc-ioremap callbacks
  remoteproc: add helper for optional ELF resource tables
  remoteproc: switch drivers to optional resource-table helper

 drivers/remoteproc/imx_dsp_rproc.c       | 46 +++-----------
 drivers/remoteproc/imx_rproc.c           | 45 +-------------
 drivers/remoteproc/rcar_rproc.c          | 46 +-------------
 drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++-
 drivers/remoteproc/st_remoteproc.c       | 31 +---------
 drivers/remoteproc/stm32_rproc.c         | 44 +-------------
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 76 ++----------------------
 7 files changed, 60 insertions(+), 266 deletions(-)

-- 
2.34.1


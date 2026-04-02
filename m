Return-Path: <linux-renesas-soc+bounces-30802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO+EM262zmmApgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 20:33:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321738D288
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 20:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03F1E304D168
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 18:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D0D37AA6C;
	Thu,  2 Apr 2026 18:33:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C230A248896;
	Thu,  2 Apr 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154787; cv=none; b=HQA73tZVeTCEwMhc5ND0OFIi9TVU52c+0dE906IDIV/xv+sxsCbOZ4fm/5vQDlMX/ITFZaUUW0kBP9E5OGykDkd/vWm6GZMirWrS/pDGoqJMbF0sT0vtMV8M/mMTTym0DI4s6iWf6u+e7s5NZO/rdtt/q6Q8Iu+4Wo3TecS87RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154787; c=relaxed/simple;
	bh=+h1S6IY/LtS6nxa6y8su80IJrFMDgvebuxUTacdGUDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YuihQxFf4g1MXEwPqSyD8xGYzwW2usTzYTgLGrFMixAHwvOvvwvLdTltHcVMyg4mTk8jEV2OckfIewdixh1OT1hA3cUSrHzEkNDzH2zIsNQ2hr1ihgQK05GroCc+YU9DhlQaUjhBRhPetyva8QVcNApk7U2/5P3Vduh/8qtI3+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jFfU/CcpTiu7OpgY2IVAaQ==
X-CSE-MsgGUID: yDG8MbmLSH+gGNnoJiOQLA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 03:33:04 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.32])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 19AB7400068F;
	Fri,  3 Apr 2026 03:33:00 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: robh@kernel.org,
	john.madieu@gmail.com,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2] PCI: rzg3s-host: Treat link-down as -ENODEV instead of error
Date: Thu,  2 Apr 2026 20:23:53 +0200
Message-ID: <20260402182354.12515-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30802-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6321738D288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rzg3s_pcie_host_init() failing to establish a PCIe link does not
necessarily indicate a hardware or driver error; it may simply mean no
card is inserted. Demote the message from dev_err_probe() to dev_info()
and return -ENODEV so the driver defers gracefully rather than printing
a spurious error.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes in v2:
 - Dropped Rb tag from Geert as patch structure changed
 - Moved link-down handling into rzg3s_pcie_host_init() instead of
   masking all errors in rzg3s_pcie_host_setup() (Claudiu)
 - Kept dev_err_probe() for real init failures, only suppress for
   -ENODEV (link down)

v1:
  - https://lore.kernel.org/all/20260401143347.8463-1-john.madieu.xa@bp.renesas.com/

 drivers/pci/controller/pcie-rzg3s-host.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..0acc21981ee9 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1384,8 +1384,11 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 				 PCIE_LINK_WAIT_SLEEP_MS * MILLI,
 				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
 				 PCIE_LINK_WAIT_MAX_RETRIES);
-	if (ret)
+	if (ret) {
+		dev_info(host->dev, "PCIe link down!\n");
+		ret = -ENODEV;
 		goto config_deinit_post;
+	}
 
 	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
@@ -1655,7 +1658,9 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
 
 	ret = rzg3s_pcie_host_init(host);
 	if (ret) {
-		dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
+		if (ret != -ENODEV)
+			dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
+
 		goto teardown_irqdomain;
 	}
 
-- 
2.25.1



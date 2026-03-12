Return-Path: <linux-renesas-soc+bounces-29306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHD7Gj/tsmnAQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:43:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDAA275CFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAF4B30D031A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7953B3FB06B;
	Thu, 12 Mar 2026 16:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RVkOivPL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8E0390992;
	Thu, 12 Mar 2026 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333506; cv=none; b=Tzz514OpIkBLWPzoku1Tr/7hXFXoycXZb5jrdZLFWaCYeMy4oG8hyDyTl5CFeqoMcaqLCpbrpN/AyiPAnPenwDGsXsU8tK16IWyN9L/vCdBWHj+UMFfPYX/1c3v12pNQrPvf9wIm/cHKvX9ZwPPepVR211TQiTTKgyHK+67WSwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333506; c=relaxed/simple;
	bh=dLBK1diKeZlLb7ErFd5QdJ4eb2kSmDhcrwFtiWopAxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZJCa7UANFqehf3hYgd3GFilJVqqYlQx4s+HmaixoAy9Y/BAs3Irym/CU4p89e0F/OCjDRWB74zBNUSCYHRyi/g9r1xmtw10+gnZusGni+i32hfp4yb2lHBc8CZHS8cGsmb/Ajh/TYSKPdUQJQf8/OqmWLnfbh2Fjc1fHq4IzSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RVkOivPL; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=q8
	94oIJ4bYAg9Q9C0Fcsffh5Nho2Uop1nYGfUhyAYk8=; b=RVkOivPLF2oYlKsoob
	P2TTQrKWrtIY8AWtdHGOKmIFQ9Xd0hP8UhOn5PkVq8pnTqmphsbqFr1qkT8ZfZMs
	VVEphoq6HJmOjkFghoK3j6OdMWYMUW/BrUFmpQHehmcnMAJVe8RGRni5cWucza6A
	aOV65GcMc6Eqrw4cVf0Ju4toc=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S4;
	Fri, 13 Mar 2026 00:37:00 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v8 2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
Date: Fri, 13 Mar 2026 00:36:49 +0800
Message-Id: <20260312163652.113228-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312163652.113228-1-18255117159@163.com>
References: <20260312163652.113228-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnN1Gl67JpMC_OAQ--.12929S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFWrCFW8Jr4UXw15GF4UArb_yoW7KFWUpa
	y5tFyIyF18JF45ur4Yyas5ZFyYqFnxCrW7GwsxW3Z29FyakrZxKa48tFWftryfKFsFvry3
	Kr17t3W7CF13tr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zidHUfUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wwt0Gmy66zEeQAA37
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-29306-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,163.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2CDAA275CFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace direct indexing of pcie_link_speed[] with the new helper
pcie_get_link_speed() in all DesignWare core and glue drivers. This
ensures that out-of-range generation numbers do not cause out-of-bounds
accesses when the helper returns PCI_SPEED_UNKNOWN, and prepares for
the removal of the range check in of_pci_get_max_link_speed().

The actual validation of the "max-link-speed" DT property (e.g., fallback
to a safe default and warning) is added in subsequent patches for each
driver that reads the property.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 drivers/pci/controller/dwc/pcie-designware.c      | 2 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c     | 2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 4 ++--
 drivers/pci/controller/dwc/pcie-qcom.c            | 6 +++---
 drivers/pci/controller/dwc/pcie-tegra194.c        | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a..0e05c5280344 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1081,7 +1081,7 @@ static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed sp
 static void dw_pcie_config_presets(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	enum pci_bus_speed speed = pcie_link_speed[pci->max_link_speed];
+	enum pci_bus_speed speed = pcie_get_link_speed(pci->max_link_speed);
 
 	/*
 	 * Lane equalization settings need to be applied for all data rates the
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 5741c09dde7f..06792ba92aa7 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -861,7 +861,7 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 	ctrl2 = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCTL2);
 	ctrl2 &= ~PCI_EXP_LNKCTL2_TLS;
 
-	switch (pcie_link_speed[pci->max_link_speed]) {
+	switch (pcie_get_link_speed(pci->max_link_speed)) {
 	case PCIE_SPEED_2_5GT:
 		link_speed = PCI_EXP_LNKCTL2_TLS_2_5GT;
 		break;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.c b/drivers/pci/controller/dwc/pcie-qcom-common.c
index 01c5387e53bf..5aa73c628737 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-common.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-common.c
@@ -22,7 +22,7 @@ void qcom_pcie_common_set_equalization(struct dw_pcie *pci)
 	 * applied.
 	 */
 
-	for (speed = PCIE_SPEED_8_0GT; speed <= pcie_link_speed[pci->max_link_speed]; speed++) {
+	for (speed = PCIE_SPEED_8_0GT; speed <= pcie_get_link_speed(pci->max_link_speed); speed++) {
 		if (speed > PCIE_SPEED_32_0GT) {
 			dev_warn(dev, "Skipped equalization settings for unsupported data rate\n");
 			break;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 18460f01b2c6..4b7184d4a6fa 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -152,7 +152,7 @@
 #define WAKE_DELAY_US				2000 /* 2 ms */
 
 #define QCOM_PCIE_LINK_SPEED_TO_BW(speed) \
-		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]))
+		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed)))
 
 #define to_pcie_ep(x)				dev_get_drvdata((x)->dev)
 
@@ -531,7 +531,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 
 	qcom_pcie_common_set_equalization(pci);
 
-	if (pcie_link_speed[pci->max_link_speed] == PCIE_SPEED_16_0GT)
+	if (pcie_get_link_speed(pci->max_link_speed) == PCIE_SPEED_16_0GT)
 		qcom_pcie_common_set_16gt_lane_margining(pci);
 
 	/*
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc..5c7c105bb745 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -170,7 +170,7 @@
 #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
 
 #define QCOM_PCIE_LINK_SPEED_TO_BW(speed) \
-		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]))
+		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed)))
 
 struct qcom_pcie_resources_1_0_0 {
 	struct clk_bulk_data *clks;
@@ -320,7 +320,7 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
 
 	qcom_pcie_common_set_equalization(pci);
 
-	if (pcie_link_speed[pci->max_link_speed] == PCIE_SPEED_16_0GT)
+	if (pcie_get_link_speed(pci->max_link_speed) == PCIE_SPEED_16_0GT)
 		qcom_pcie_common_set_16gt_lane_margining(pci);
 
 	/* Enable Link Training state machine */
@@ -1579,7 +1579,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 				ret);
 		}
 	} else if (pcie->use_pm_opp) {
-		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
+		freq_mbps = pcie_dev_speed_mbps(pcie_get_link_speed(speed));
 		if (freq_mbps < 0)
 			return;
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..47f08adfbd79 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -310,7 +310,7 @@ static void tegra_pcie_icc_set(struct tegra_pcie_dw *pcie)
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, val);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val);
 
-	val = width * PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]);
+	val = width * PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed));
 
 	if (icc_set_bw(pcie->icc_path, Mbps_to_icc(val), 0))
 		dev_err(pcie->dev, "can't set bw[%u]\n", val);
-- 
2.34.1



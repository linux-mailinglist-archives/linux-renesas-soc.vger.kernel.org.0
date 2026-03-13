Return-Path: <linux-renesas-soc+bounces-29373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHdvCatDtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:04:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90E287C8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29B5030E18F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC903CAE6F;
	Fri, 13 Mar 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m2cjwkog"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D253C73FD;
	Fri, 13 Mar 2026 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421023; cv=none; b=TsS2c82h9rjf3thvKkPFZiCZd8pdTA6qmkgkIt/ynqib/UM9vnuU7zfp+C8djZ+aOsrsOv8ggErOP9N8fo5DSPGQ3KECe65oDlawe0FuziZCl9mWrytbv+m7ZN/Dq3aKdsErmhK7RZlvXT63M/ZGrO47JG19NbPOiedxKRRysRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421023; c=relaxed/simple;
	bh=dLBK1diKeZlLb7ErFd5QdJ4eb2kSmDhcrwFtiWopAxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hj+nMHw2ho7FdVSGbViL7juOnmbobFu5wpXD8EUw+Ah/mMVQREH5dLsc1kqY3zIYObi+xtF2qAO7UMlrZjTgyjbhWl2Y4MvONMptnHgpHOLi3623FGVH9ppQHPYFady7VrAvfijqVOG9W4lzqKQZQ+znxmwp/ciBk8e/qm0Co3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m2cjwkog; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=q8
	94oIJ4bYAg9Q9C0Fcsffh5Nho2Uop1nYGfUhyAYk8=; b=m2cjwkogHtHe/O5pqd
	kWiwyVGQ8lSJ/meJz2zbEGfPfBRorzSQ4FlJsI3+6O/rr4YMXjNgzb+OU8j3mEXG
	EKjoClLTg3FD4cNd3b0B2Z52Mm7Pba82yphj+Kw1VRw5RhG8x527BTL8+3u6s43U
	pGElVMECG/vRE0mB8nSMlWq+8=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S4;
	Sat, 14 Mar 2026 00:55:27 +0800 (CST)
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
	shawn.lin@rock-chips.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
Date: Sat, 14 Mar 2026 00:55:19 +0800
Message-Id: <20260313165522.123518-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX2JV7QbRpTApJAw--.54345S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFWrCFW8Jr4UXw15GF4UArb_yoW7KFWUpa
	y5tFyIyF18JF45ur4Yyas5ZFyYqFnxCrW7GwsxW3Z29FyakrZxKa48tFWftryfKFsFvry3
	Kr17t3W7CF13tr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziksqXUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7B-2mmm0QX8AsgAA3O
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-29373-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,rock-chips.com,163.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F90E287C8F
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



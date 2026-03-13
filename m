Return-Path: <linux-renesas-soc+bounces-29370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIcDKIhEtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:08:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB7287D4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F571333405B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1FD3CB2E6;
	Fri, 13 Mar 2026 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Lwvqmfx2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D83CAE68;
	Fri, 13 Mar 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421010; cv=none; b=ZhHCfiSpZkAD4fmlliQUjrMI/S4gYsf+KqukGZGiNjLpKwd7CGIul5R5g5obV9O8JBeSBwpA+E17b+1JJeWX9Qn4R87tgCmAencc8jxL9/g8XIX6eoi1GGGV4BpWkCOm9Q3KPTpe/NcG4TRYvegv5kKX4/q3ftBWnQvV8DY8hn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421010; c=relaxed/simple;
	bh=Dcw+sstqEEl+GfJmTNCmY4ECojIpOSogXcJzVcb1fR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NHmrvyVrEi6x6pdmF55rRo+ggn46MgeBZoNSLodlYeZ8gqL3odBEHax57WRG0i2m+7DVaKs+0cLEQ04TwggLpdT1rCv77jVMgBmA7m7onNu74gbGgdanOs9yJpUzhwuWDf1/dEHpxrT+32lu+HOJdDj28QRft0zS1V5/heBhhxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Lwvqmfx2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ok
	paxYlsToPKG5PCwsUr7hGf9f4Il4PfIr73LI8TjoI=; b=Lwvqmfx2r7vzhzKL86
	cNaSlDoz6WFzRjorwb3MWnR/mt1beOAiAe1yvOdjyQbUAoXCFPwcG97T8r6nHxIr
	km+dPDoNHlO2N4A6fGms7XRADi+LLPkt0PzUTN7qPd/OmEIM+UO0v4wO5pmHezmT
	lrPjPklTVnyLQdt/1eUXjifQM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S6;
	Sat, 14 Mar 2026 00:55:29 +0800 (CST)
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
Subject: [PATCH v9 4/5] PCI: controller: Validate max-link-speed
Date: Sat, 14 Mar 2026 00:55:21 +0800
Message-Id: <20260313165522.123518-5-18255117159@163.com>
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
X-CM-TRANSID:_____wAX2JV7QbRpTApJAw--.54345S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1rGryftF1rKryUGFyDKFg_yoW5Zr18pa
	9rA3WIyF1UJF45ur4Dt3Z8WF1Yq3ZxZrWDJ3s3W3W7uFnxGFZ8GFyj9FyftF97KFs7ur17
	X3W7tF47GanFyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pim9aLUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAH3m2m0QYHKAAAA3+
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-29370-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,rock-chips.com,163.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47FB7287D4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add validation for the "max-link-speed" DT property in three more
drivers, using the pcie_get_link_speed() helper.

- brcmstb: If the value is missing or invalid, fall back to no
  limitation (pcie->gen = 0).  Fix the previous incorrect logic.
- mediatek-gen3: If the value is missing or invalid, use the maximum
  speed supported by the controller.
- rzg3s-host: If the value is missing or invalid, fall back to Gen2.

This ensures that all users of of_pci_get_max_link_speed() are ready
for the removal of the central range check.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-brcmstb.c       | 5 +++--
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 drivers/pci/controller/pcie-rzg3s-host.c    | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 062f55690012..714bcab97b60 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1442,7 +1442,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
 	nlw = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
 	dev_info(dev, "link up, %s x%u %s\n",
-		 pci_speed_string(pcie_link_speed[cls]), nlw,
+		 pci_speed_string(pcie_get_link_speed(cls)), nlw,
 		 ssc_good ? "(SSC)" : "(!SSC)");
 
 	return 0;
@@ -2072,7 +2072,8 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(pcie->clk);
 
 	ret = of_pci_get_max_link_speed(np);
-	pcie->gen = (ret < 0) ? 0 : ret;
+	if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
+		pcie->gen = 0;
 
 	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
 
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..3b903ef7d3cf 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1150,7 +1150,7 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 		return err;
 
 	err = of_pci_get_max_link_speed(pcie->dev->of_node);
-	if (err) {
+	if (pcie_get_link_speed(err) != PCI_SPEED_UNKNOWN) {
 		/* Get the maximum speed supported by the controller */
 		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
 
diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 2809112e6317..00a11f986117 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -966,7 +966,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 	ls = readw_relaxed(host->pcie + pcie_cap + PCI_EXP_LNKSTA);
 	cs2 = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 
-	switch (pcie_link_speed[host->max_link_speed]) {
+	switch (pcie_get_link_speed(host->max_link_speed)) {
 	case PCIE_SPEED_5_0GT:
 		max_supported_link_speeds = GENMASK(PCI_EXP_LNKSTA_CLS_5_0GB - 1, 0);
 		link_speed = PCI_EXP_LNKCTL2_TLS_5_0GT;
-- 
2.34.1



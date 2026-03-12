Return-Path: <linux-renesas-soc+bounces-29303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJBzMPLssmnAQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:42:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2D275C66
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 552113103A9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B69B39151C;
	Thu, 12 Mar 2026 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eQpOfdy+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E9390225;
	Thu, 12 Mar 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333502; cv=none; b=ovYQV5HKSG3JwtPiQPPDTUzLdC1a4Ddsl7qi0ZI63D9JuvA4js4H2ossYwTLbAYlNMqoZ6DSEgtx60tNLtn7757WY83rvFR2lBVXaSiE2lTQ9pqoZ2A61VYgouIoxehl9ZXx3GEigOOItQA4RiICMGXvE+P16gmQ64jU6lBZbJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333502; c=relaxed/simple;
	bh=Dcw+sstqEEl+GfJmTNCmY4ECojIpOSogXcJzVcb1fR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kIdAhhX+9sz+cQ056phRaSLbIsmmkpb/oWF0rAwpC10Fhfm+02TqjmREDE9wbSqS4emPEt/MLDMojdJeCBg1PVJ9mM8d/4pcAJbwKUxfu6BzMT/wTPxv473frZBqw/h0rgcyFrjynqHPsb+ZSHLv6MjpyUSuCVWAidwhVvwQSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eQpOfdy+; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ok
	paxYlsToPKG5PCwsUr7hGf9f4Il4PfIr73LI8TjoI=; b=eQpOfdy+f+3rEs3ayp
	FFmg+oe9VhQ3UaTIEtJHMFqD2J11J7uJDGqT3O8mqbS5EMx1SV9iS8pw1NSyp9sV
	VbyBj0KSBU/yDfCijZroSmu8kGdORGgLCYOpkIga+NuvRuln8eeWRq1+67iHhVpn
	1fiqSRB8KcMquhbnxU9p2D25Q=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S6;
	Fri, 13 Mar 2026 00:37:02 +0800 (CST)
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
Subject: [PATCH v8 4/5] PCI: controller: Validate max-link-speed
Date: Fri, 13 Mar 2026 00:36:51 +0800
Message-Id: <20260312163652.113228-5-18255117159@163.com>
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
X-CM-TRANSID:_____wDnN1Gl67JpMC_OAQ--.12929S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1rGryftF1rKryUGFyDKFg_yoW5Zr18pa
	9rA3WIyF1UJF45ur4Dt3Z8WF1Yq3ZxZrWDJ3s3W3W7uFnxGFZ8GFyj9FyftF97KFs7ur17
	X3W7tF47GanFyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piqg43UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxA4t0Gmy665RnQAA3l
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-29303-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,163.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4CD2D275C66
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



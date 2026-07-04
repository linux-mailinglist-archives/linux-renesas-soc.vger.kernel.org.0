Return-Path: <linux-renesas-soc+bounces-34721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sEMZMIdtSWr61gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:31:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DD70870A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:31:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="ciX0H/56";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="QaG/dJhA";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41200302979A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 20:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBE735BDAA;
	Sat,  4 Jul 2026 20:28:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B0301471;
	Sat,  4 Jul 2026 20:28:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196905; cv=none; b=jICfjY5ZYPdo0BMYGMfmHnH35YkoZgMU3Xj9ue0tVKgzTBaKqPHtKga/L0KjdV6+jdpM2UrNj99FIfPtyvMrkAvGgh/CpAwBNoTy/Zv5UYKvl2Jga//M8Auu0qN8G3mE5eM7SJ+qFx51yz+NlLIozYpBt5gUV14Pczn2ENT4WZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196905; c=relaxed/simple;
	bh=1lkB7+1Trnr5UGpQP00QgoQwV1YztjZcXuv6sF+kAJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVlsgguDnqnU5p3xnx5xpkoP+XUiR2/SbEH99yhbZnl9BugaVCUgyGVmIFh2n8BDN25KXuX9hAAZ9AnJi6OnsJtgfckd9h8FlmLdPaYnKfjZqg+irdHyfKzQnaR+aC4ReLbJP1okTQt1cHCTNqw8ZmykfWdZ9Q7NHlAnyDhdjA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ciX0H/56; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QaG/dJhA; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gt2Hy5YRrz9tN5;
	Sat,  4 Jul 2026 22:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKawrTkNvDnROBLym0oquR1qEV5tI5DualC+BhLUuoU=;
	b=ciX0H/56UGdUFYcJlc/QGxhMnvPnpZZ7f3Z7L6G4+s0OtXgF6YErHzn0+g71oL+uYArBS4
	6pGgKt22YEP0saGb5KOhvaX21QvbNyHpA35naqf76kvMhB05URzKLrRYCS3QDb1XHhJOJu
	iMRWgEySHA5XmGeIuVLkdjmYybdTNdIY7QMkj6ZarvEOYWr2WPvj+QmlQ4FRNzvpz2Abta
	/+b95lPrA3jpWsDA4oEu/nf1x6mdH0bF/vzdvdv59+DCm8Qqfbd89sbErCfFmE+1FwRu2s
	qsDOpMhdUYgloA16dbY+G5GrnbkWg8k8ckFB0vDp8bTMpIopGPGLT7SR5p7YGg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKawrTkNvDnROBLym0oquR1qEV5tI5DualC+BhLUuoU=;
	b=QaG/dJhAP4KEpBQLO4FuBiEKEGLuJJdcL9gvoFwW5fidYsA+vt7O6IGeTJpgIf8iPUtNmu
	w1OpTRil4YenfXRIVu0ysiWFWI3/G4PaEHjcuS484ByhKfWTgXaIufUI9YAWiwll8Eavdp
	njnI4+W3KgYB1EwHC/u2ofyS7oKbSI9bLdQHQqn1Z1sxNY9rDD5MBp+k0HN4/VyTgtfWPh
	nMPq3VvpZTkhdrfxLLxgDlma50dkTmGbm6mN+3cucn9+YjJjDGwxr3L51iaHBtwe+36sYQ
	ms4lyrmXf3GqTInEpqz1xgUXI1BlrtagYZRJRLZ39boL2bcAvwTInHYB1gAZQA==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] PCI: dwc: rcar-gen4: Add support for R-Car X5H PCIe4
Date: Sat,  4 Jul 2026 22:25:04 +0200
Message-ID: <20260704202748.355708-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
References: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1hoet8mdswsn8546yq373dfkbhc6z6rr
X-MBO-RS-ID: eb3c9fb682a62484ad8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34721-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,glider.be:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB6DD70870A

Add support for R8A78000 (R-Car X5H) PCIe4.

This driver previously supported R-Car Gen4 S4/V4H/V4M. PCIe features
of R-Car X5H PCIe4 are almost all the same.

The controller initialization sequence is slightly different and is
factored out into controller specific callbacks, in a manner similar
to previous R-Car Gen4 handling.

The controller does have a PHY attached to it, but the PHY is operated
by a separate PHY driver, the PHY driver instance binding is handled
in rcar_gen4_pcie_get_resources() and controlled in the aforementioned
controller specific callbacks.

The controller driver is deliberately using "renesas,rcar-gen5-pcie4"
DT compatible string to discern R-Car X5H PCIe4 controller supported
by this driver, from R-Car X5H PCIe6 controller which will most likely
use a separate driver.

The R-Car X5H PCIe4 controller embeds HDMA instead of EDMA embedded
in the R-Car Gen4 PCIe controller, "dw-edma" driver supports both
DMA variants.

Endpoint mode is currently not implemented for R-Car Gen5 PCIe4.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 113 +++++++++++++++++++-
 1 file changed, 111 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 186eedb33c27d..55c40424937c1 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -19,6 +19,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/pci.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -36,6 +37,7 @@
 
 /* MSI Capability */
 #define MSICAP0			0x0050
+#define MSICAP0_MMESCAP_MASK	GENMASK(19, 17)
 #define MSICAP0_MSIE		BIT(16)
 
 /* PCIe Interrupt Status 0 */
@@ -74,6 +76,11 @@
 #define PCIEPWRMNGCTRL		0x0070
 #define APP_CLK_REQ_N		BIT(11)
 #define APP_CLK_PM_EN		BIT(10)
+#define APP_READY_ENTR_L23	BIT(6)
+#define APP_REQ_ENTR_L1		BIT(5)
+
+/* PCI Express capability */
+#define EXPCAP(x)		(0x0070 + (x))
 
 #define RCAR_NUM_SPEED_CHANGE_RETRIES	10
 #define RCAR_MAX_LINK_SPEED		4
@@ -97,6 +104,7 @@ struct rcar_gen4_pcie {
 	struct dw_pcie dw;
 	void __iomem *base;
 	void __iomem *phy_base;
+	struct phy *phy;
 	struct platform_device *pdev;
 	struct reset_control *perst;
 	const struct rcar_gen4_pcie_drvdata *drvdata;
@@ -169,6 +177,35 @@ static int rcar_gen4_pcie_speed_control(struct rcar_gen4_pcie *rcar)
 	return 0;
 }
 
+static int rcar_gen5_pcie_speed_control(struct rcar_gen4_pcie *rcar)
+{
+	struct dw_pcie *dw = &rcar->dw;
+	u32 lnkcap = dw_pcie_readl_dbi(dw, EXPCAP(PCI_EXP_LNKCAP));
+	u32 lnksta = dw_pcie_readw_dbi(dw, EXPCAP(PCI_EXP_LNKSTA));
+	u32 val, retries;
+
+	if ((lnksta & PCI_EXP_LNKSTA_CLS) == (lnkcap & PCI_EXP_LNKCAP_SLS))
+		return 0;
+
+	/* Retrain link */
+	val = dw_pcie_readl_dbi(dw, EXPCAP(PCI_EXP_LNKCTL));
+	val |= PCI_EXP_LNKCTL_RL;
+	dw_pcie_writel_dbi(dw, EXPCAP(PCI_EXP_LNKCTL), val);
+
+	/* Wait for link retrain */
+	for (retries = 0; retries <= 10; retries++) {
+		lnksta = dw_pcie_readw_dbi(dw, EXPCAP(PCI_EXP_LNKSTA));
+
+		/* Check retrain flag */
+		if (!(lnksta & PCI_EXP_LNKSTA_LT))
+			break;
+
+		usleep_range(1000, 1100);
+	}
+
+	return 0;
+}
+
 /*
  * Enable LTSSM of this controller and manually initiate the speed change.
  * Always return 0.
@@ -304,8 +341,11 @@ static int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar)
 	struct reset_control *perst;
 
 	rcar->phy_base = devm_platform_ioremap_resource_byname(rcar->pdev, "phy");
-	if (IS_ERR(rcar->phy_base))
-		return PTR_ERR(rcar->phy_base);
+	if (IS_ERR(rcar->phy_base)) {
+		rcar->phy = devm_phy_get(dev, NULL);
+		if (IS_ERR(rcar->phy))
+			return PTR_ERR(rcar->phy);
+	}
 
 	rcar->perst = NULL;
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
@@ -731,6 +771,28 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
 	return 0;
 }
 
+static int rcar_gen5_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
+{
+	u32 val;
+
+	val = readl(rcar->base + PCIERSTCTRL1);
+	if (enable) {
+		val |= APP_LTSSM_ENABLE;
+		val &= ~APP_HOLD_PHY_RST;
+	} else {
+		val &= ~APP_LTSSM_ENABLE;
+		val |= APP_HOLD_PHY_RST;
+	}
+	writel(val, rcar->base + PCIERSTCTRL1);
+
+	if (enable)
+		phy_power_on(rcar->phy);
+	else
+		phy_power_off(rcar->phy);
+
+	return 0;
+}
+
 static int rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
 {
 	struct dw_pcie *dw = &rcar->dw;
@@ -749,6 +811,42 @@ static int rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
 	return 0;
 }
 
+static int rcar_gen5_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
+{
+	struct dw_pcie *dw = &rcar->dw;
+	int ret;
+	u32 val;
+
+	ret = phy_set_mode(rcar->phy, PHY_MODE_PCIE);
+	if (ret)
+		return ret;
+
+	ret = phy_init(rcar->phy);
+	if (ret)
+		return ret;
+
+	dw_pcie_dbi_ro_wr_en(dw);
+
+	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
+	val &= ~PORT_LANE_SKEW_INSERT_MASK;
+	if (dw->num_lanes < 8)
+		val |= BIT(6);
+	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
+
+	val = dw_pcie_readl_dbi(dw, MSICAP0);
+	FIELD_MODIFY(MSICAP0_MMESCAP_MASK, &val, 4);
+	dw_pcie_writel_dbi(dw, MSICAP0, val);
+
+	dw_pcie_dbi_ro_wr_dis(dw);
+
+	val = readl(rcar->base + PCIEPWRMNGCTRL);
+	val |= APP_CLK_REQ_N | APP_CLK_PM_EN |
+	       APP_READY_ENTR_L23 | APP_REQ_ENTR_L1;
+	writel(val, rcar->base + PCIEPWRMNGCTRL);
+
+	return 0;
+}
+
 static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
 					       u32 offset, u32 mask, u32 val)
 {
@@ -925,6 +1023,13 @@ static struct rcar_gen4_pcie_drvdata drvdata_rcar_gen4_pcie_ep = {
 	.mode = DW_PCIE_EP_TYPE,
 };
 
+static struct rcar_gen4_pcie_drvdata drvdata_rcar_gen5_pcie = {
+	.additional_common_init = rcar_gen5_pcie_additional_common_init,
+	.ltssm_control = rcar_gen5_pcie_ltssm_control,
+	.speed_control = rcar_gen5_pcie_speed_control,
+	.mode = DW_PCIE_RC_TYPE,
+};
+
 static const struct of_device_id rcar_gen4_pcie_of_match[] = {
 	{
 		.compatible = "renesas,r8a779f0-pcie",
@@ -942,6 +1047,10 @@ static const struct of_device_id rcar_gen4_pcie_of_match[] = {
 		.compatible = "renesas,rcar-gen4-pcie-ep",
 		.data = &drvdata_rcar_gen4_pcie_ep,
 	},
+	{
+		.compatible = "renesas,rcar-gen5-pcie4",
+		.data = &drvdata_rcar_gen5_pcie,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_gen4_pcie_of_match);
-- 
2.53.0



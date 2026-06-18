Return-Path: <linux-renesas-soc+bounces-34220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iWxZA+ZrNGoVXwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:06:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9416A2E2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=plfmKmP5;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Pkmkf5v+;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D93A307B5B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 22:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3784346769;
	Thu, 18 Jun 2026 22:05:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DE34CFCF;
	Thu, 18 Jun 2026 22:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820302; cv=none; b=LjqUxn64K54LxF4EpVh6dzRKvS6TPad4bx6IzefSnmHvOp2jXUZ2NXRDFQNYWxAxczJSlTATLqJXqy+BfVc3hSDYllw4NQWvzaYS0b3B/qQTTo4+29DtpKPLMF2sbIca3JFP3Dmdqw0oqIFoDferYZHiu2l2JNeX7N+X83dpv5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820302; c=relaxed/simple;
	bh=YlFBLW0ZmcxHzq7QzW0dBuKeRymaimP6KWEesvwMfPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zq+fsUO2tpDxv/HuXgs0qDwBFxiJc6Q25XbBdDiooHegzRZtUs5JlfKx+KrfO0yDbhaykIE3xjXOyB6uhoElgIZBBXylI5hYSNr/tVj4rZEdlZ6qIZXDurvpErmpa/MvTaiLC2kgNmle+lV/GO/f9WFU/di3XgeBIVyMa53Vjgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=plfmKmP5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Pkmkf5v+; arc=none smtp.client-ip=80.241.56.152
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ghFBk2r95z9v9m;
	Fri, 19 Jun 2026 00:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4A9ZwLjhRh5ZuLtgdZA9Of3IPGy8G7D1YJfP0MiDpBM=;
	b=plfmKmP5L4JvpAb1+0ifDeaYyVa5/rHvXj4AcbLcKRABN7U+9OJQYCp4zDs94B/X9PzEyP
	rPjaNObVepst0pu4b/SQc6pn4Djm91TdPMRguBAynqqFKF/Cr+WXP6tXTcjnmmDf/jlJny
	1AouMXsbHIyizB3uxGbf+uNAgKVpEPp1hygWN1bdJCp8IY1DztJwvqyz7oZeKI0DxLHt1Y
	EiJ3amCiymYen3wVRM2BUVfeNT12Is6qAQGtSAKIuSAhxzIrdXiYVtDSRCJxGrV/zuB1VE
	vRmXSNZN9zrU9KNYqe7VJw6FtaBfyceTaSIKv8vSDqJ/T1R2HQyQCJTGanGURg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4A9ZwLjhRh5ZuLtgdZA9Of3IPGy8G7D1YJfP0MiDpBM=;
	b=Pkmkf5v+SxSuXBvJySsmSfWV0iudVo0nYE/QzHcMCTvrHIAKZxIS4IIXBavaw/0YdTvimB
	29SBq/agpjy1PPag4OEx9CdjlYGuIbVn+NxLvD67Fu9mrWlzG1+Drn0qV7EHdIhvlGANtl
	PRhNt3vGJYXxi/Z/eTJDPtwntBr4B72Z1sUZVxyYDjIC87GTalouukvjnPswAtwfHkaQHX
	rSmFOB8Vz5GZKXYye1HaSbYcn8/02ckxJc8Zzffqa2pT6z+6BVkQewoFRwxIIdcZm+yRHJ
	zXk5KWqEUaOjZ0nUYBrSzLcmVePKDtzYKEkeTLJPOxBbqcisvtdh8xCSadMQUg==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
Date: Fri, 19 Jun 2026 00:01:59 +0200
Message-ID: <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 98122fbd287f7395f5a
X-MBO-RS-META: 9hjr68km9ty47nutmt5i8ghs5as88hkr
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
	TAGGED_FROM(0.00)[bounces-34220-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E9416A2E2E

In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
MSI are handled via GIC ITS. Configure all controller MSI registers
fully.

Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
enable MSI_CTRL_INT bit according to MSI enable state, set both bits
if MSI are enabled, clear both bits if MSI are disabled.

If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
pass through of MSI TLPs onto the AXI bus and then further into
GIC ITS translation registers.

If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
with target address of GIC ITS translation registers, and configure
AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
GIC ITS. This specific configuration allows handling of MSI via the
GIC ITS instead of integrated iMSI-RX.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
NOTE: This would not be possible without prior work from Shimoda-san
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Pull GITS_TRANSLATER address from DT, which also fixes missing +0x40
    offset of the GITS_TRANSLATER register
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 118 +++++++++++++++++++-
 1 file changed, 113 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 8b03c42f8c84c..6300ab4dc38b3 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -13,8 +13,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irqchip/arm-gic-v3.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -31,6 +34,10 @@
 #define DEVICE_TYPE_RC		BIT(4)
 #define BIFUR_MOD_SET_ON	BIT(0)
 
+/* MSI Capability */
+#define MSICAP0			0x0050
+#define MSICAP0_MSIE		BIT(16)
+
 /* PCIe Interrupt Status 0 */
 #define PCIEINTSTS0		0x0084
 
@@ -55,6 +62,14 @@
 #define APP_HOLD_PHY_RST	BIT(16)
 #define APP_LTSSM_ENABLE	BIT(0)
 
+/* INTC address */
+#define AXIINTCADDR		0x0a00
+
+/* INTC control & mask */
+#define AXIINTCCONT		0x0a04
+#define INTC_EN			BIT(31)
+#define INTC_MASK		GENMASK(11, 2)
+
 /* PCIe Power Management Control */
 #define PCIEPWRMNGCTRL		0x0070
 #define APP_CLK_REQ_N		BIT(11)
@@ -305,13 +320,103 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
 	return rcar;
 }
 
+static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
+{
+	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
+	struct device_node *msi_node = NULL;
+	struct device *dev = dw->dev;
+	struct resource res;
+	u64 addr;
+	int ret;
+
+	/*
+	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
+	 * to obtain the MSI node.
+	 */
+	of_msi_xlate(dev, &msi_node, 0);
+	if (!msi_node)
+		return -ENODEV;
+
+	/* Check if "msi-parent" or the "msi-map" points to ARM GICv3 ITS. */
+	if (!of_device_is_compatible(msi_node, "arm,gic-v3-its"))
+		return dev_err_probe(dev, -ENODEV, "Compatible MSI controller not found\n");
+
+	/* Derive GITS_TRANSLATER address from GICv3 */
+	ret = of_address_to_resource(msi_node, 0, &res);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "MSI controller resources not obtained\n");
+
+	addr = res.start + GITS_TRANSLATER;
+	if (addr >= SZ_4G)
+		return dev_err_probe(dev, -EINVAL, "MSI controller address above 32bit range\n");
+
+	*msi_addr = addr;
+	return 0;
+}
+
+static int rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+	u32 val;
+	int ret;
+
+	/* Make sure MSICAP0 MSIE is configured. */
+	val = dw_pcie_readl_dbi(dw, MSICAP0);
+	if (pci_msi_enabled())
+		val |= MSICAP0_MSIE;
+	else
+		val &= ~MSICAP0_MSIE;
+	dw_pcie_writel_dbi(dw, MSICAP0, val);
+
+	if (!pci_msi_enabled() || pp->use_imsi_rx) {
+		/* Clear AXIINTC mapping. */
+		writel(0, rcar->base + AXIINTCADDR);
+		writel(0, rcar->base + AXIINTCCONT);
+	} else {
+		ret = rcar_gen4_pcie_host_msi_addr(pp, &val);
+		if (ret)
+			goto err;
+
+		/* Point AXIINTC to GIC ITS and enable. */
+		writel(val, rcar->base + AXIINTCADDR);
+		writel(INTC_EN | INTC_MASK, rcar->base + AXIINTCCONT);
+	}
+
+	/* Configure MSI interrupt signal */
+	val = readl(rcar->base + PCIEINTSTS0EN);
+	if (pci_msi_enabled())
+		val |= MSI_CTRL_INT;
+	else
+		val &= ~MSI_CTRL_INT;
+	writel(val, rcar->base + PCIEINTSTS0EN);
+
+	return 0;
+
+err:
+	/* Deconfigure MSICAP0 MSIE. */
+	val = dw_pcie_readl_dbi(dw, MSICAP0);
+	val &= ~MSICAP0_MSIE;
+	dw_pcie_writel_dbi(dw, MSICAP0, val);
+
+	/* Clear AXIINTC mapping. */
+	writel(0, rcar->base + AXIINTCADDR);
+	writel(0, rcar->base + AXIINTCCONT);
+
+	/* Deconfigure MSI interrupt signal */
+	val = readl(rcar->base + PCIEINTSTS0EN);
+	val &= ~MSI_CTRL_INT;
+	writel(val, rcar->base + PCIEINTSTS0EN);
+
+	return ret;
+}
+
 /* Host mode */
 static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
 	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
 	int ret;
-	u32 val;
 
 	gpiod_set_value_cansleep(dw->pe_rst, 1);
 
@@ -328,16 +433,19 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_0, 0x0);
 	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_1, 0x0);
 
-	/* Enable MSI interrupt signal */
-	val = readl(rcar->base + PCIEINTSTS0EN);
-	val |= MSI_CTRL_INT;
-	writel(val, rcar->base + PCIEINTSTS0EN);
+	ret = rcar_gen4_pcie_host_msi_init(pp);
+	if (ret)
+		goto err;
 
 	msleep(PCIE_T_PVPERL_MS);	/* pe_rst requires 100msec delay */
 
 	gpiod_set_value_cansleep(dw->pe_rst, 0);
 
 	return 0;
+
+err:
+	rcar_gen4_pcie_common_deinit(rcar);
+	return ret;
 }
 
 static void rcar_gen4_pcie_host_deinit(struct dw_pcie_rp *pp)
-- 
2.53.0



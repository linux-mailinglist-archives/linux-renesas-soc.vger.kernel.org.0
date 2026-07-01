Return-Path: <linux-renesas-soc+bounces-34629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MnUsOLN8RWoXBAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:46:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A06F1942
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:46:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=IuTtskQ0;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hVQVHhG6;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D1923148D77
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 20:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21753B2FCC;
	Wed,  1 Jul 2026 20:39:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70242370AC5;
	Wed,  1 Jul 2026 20:39:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938398; cv=none; b=DG7/lofwYUC16x5d2d1SduWh3mb5TJ7VcyJpCDyYJVoxqTigP7E577OnmmPxA5Dp7c5SPIDkkkX2EgLSiffVAHfJT8OFCL027ANztKIzo/sOTTchdG1qM/a+341fe+FPnIxLc5RmeUKGks3qFEnJhnq3DIvUaIGwzHS2B5y2OYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938398; c=relaxed/simple;
	bh=auhUbqrDDbX1mBnzx8mWlq/lZcfMcC5X0Yy8HidQA9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bx4Vcc+zk0sSUJ6FS9pVRVvoIuF3zacd7QGPckIlhgLLYA0OYTcOGfAMtvMoN0OFciu+75NrG8sBKyijw5GIJgLQooT4J8R1M9CEQFuVR0hnHAVwSVQZuUxGUDih6V8Vy/K19MzhO1FK7sQjZIaRW0B/QtptSACYecD/3SPzGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IuTtskQ0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hVQVHhG6; arc=none smtp.client-ip=80.241.56.151
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4grBhn2x8zz8v1j;
	Wed, 01 Jul 2026 22:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxCI+ZFGciW7BCxU+GARL0yvXXHcAqP80ZUy5VO8tqU=;
	b=IuTtskQ0VybkFRxSYl3hQpEF0k5uqaUObkxytwAeVWAloUOQyvH+1YZ2Dnf4P1p3xifo/n
	iryko7vkMP67nhlKyg/N3JszBik0NS9XAj7AFdLrHjIf42yw1HKF3db5c5M5lNrXmsA8Uu
	3BGBrO0G8/MtaHu+U4JA/gCchrXN9B/3zRYOkWuYXJFcAC90STAFyPvYm8C5oxhK3GyrW5
	lPCTFXeh/jinDNHXDkoN8qx5rl2K9QLVjkImC/fb8cbX51Ko0aB3d8n+hSRsEkYWrqx8tn
	xBaA/fLQ3uEy3O23ZAcNbvc+R8+ktsuHsJSkMh0qexG0AcdccQkLCLFa1wFaIg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxCI+ZFGciW7BCxU+GARL0yvXXHcAqP80ZUy5VO8tqU=;
	b=hVQVHhG6OP6Z5CgXjJTCyPDYcRLUedd8buvvPUeqVcuskSydYs+HhPkunnVkg1YHznQ5CB
	ivGY2CIbMCNSdGPuKDg1kFcslm5XZBg5EpA6eQ2x0T/ttTMSN8rmF1v/fgwrvyX8PNfa89
	yLye+P1phDhA2TOOiYwYw+Nr2NqbNz5Twtng/O8+rkksqIXfMt1AL4Xv7fYxjuZK+breTI
	e/r47ORMpbA9iu8PjWjfnwZGhZzBIoGgL/ye3gqcKAN6dzdWE0q4XFf+rVIFa3rZMniI/W
	ZoM2vDV6jCtKpVm1nLmZRX4TYo12++WowVPWqZ3PJ69Z1RVOV1HRxw5zrO38EQ==
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
Subject: [PATCH v3 2/5] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
Date: Wed,  1 Jul 2026 22:37:45 +0200
Message-ID: <20260701203918.63189-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s6o8nho3nuh71p4retgu5y3hu5qbn7sg
X-MBO-RS-ID: 204e57d2662eefd025e
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34629-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 471A06F1942

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

Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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
V3: Add Co-developed-by to credit Shimoda-san
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



Return-Path: <linux-renesas-soc+bounces-34107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r6dFDugNMmqEuAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 05:00:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D13696384
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 05:00:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=b61+jpky;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=f9po6CAw;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07E6A3094B32
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 03:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF0E30C372;
	Wed, 17 Jun 2026 03:00:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5D197A7D;
	Wed, 17 Jun 2026 03:00:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665233; cv=none; b=ayvStMiB6yG+c4zuhAmok3XKELTc4UseN5WhHSHtTFyl+Y8QRyKi0AsnTmtty4RLZKlYzCVcyesu1FQiEwAWbDL2sbkOD9jnsIhrfnUDqAicFmiSYThWiTNXR6lrD/j0Hh2n7g+gdyDbuy9R+5RY3mCfZw+P+cbH0d54mZkB1wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665233; c=relaxed/simple;
	bh=7OYVKtv/F7oSFBVfrzuQ7bNWko2Rz6OLHweU0dppxeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mVq45/X3LVaVOVDfDlp+KL2OWx3LZgLl0LeaDW1cxhvc+ImPVchW4F2YkXlDIQPyEahVZZ5kqmJN0EcJK7C1XO2GLNfMKHTVpOy7p/vmQmsAZxez7sa4QozTqmjdzyAprf83mlJyhafiKxcHPmsrP3D2fXRGS9iwK+Ejmn1RpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b61+jpky; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f9po6CAw; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gg7rr5CFnz9tsW;
	Wed, 17 Jun 2026 05:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781665228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=755kSzKoGCVo0Cb8/TSXpktU8jUi66NDNw4VHwou0DU=;
	b=b61+jpkyS00DITJ6Dd6gzKSWsbglkfkz5NpkbnBFUhCAwe8xu+6KyQ0e+SYZEJ6KpudBhW
	jfIfBVEGolzmHfUZeA3zRgu9E5lNuPMKz3wCLqJr5edmWs9odft67RA9+GNpmto1QzbBYP
	ikUECIhoAgEo+VdVmWB97uupF2ldhIiIBrBuaqGUJ0NkxASWh7fC5+fDM3nVHhbAKPPYiB
	9rfdzy4O4IZBwZFEBqfq4sToK89gUfAJvNPMosL4AqL4poZm94MjQ+Q9MShWVDs7uYV16h
	Pcq+GHilHuJ6NUjDGyZvXZ0H8dUGMlQOk9D8CVZ6v323f0Bggb+PcruzBAyhnw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781665226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=755kSzKoGCVo0Cb8/TSXpktU8jUi66NDNw4VHwou0DU=;
	b=f9po6CAw/6ZJzzx4IHKkIHCzG7S7g0dKoXo56Ocqw3FiTbPfCRv5gIF1xWSfwueZk+goRr
	JesIQ9a+9SDuzfmAtoho0JZ/ssVjcOOidGectPq6Mt1iATb5BR2NW1Vw4Aac+5W2whMcyW
	kU89brzDPXXTozRhCMFIWjqHr8A8/WC2K+UtpIg6eLzqXW2DG0epzdfUEFiykKeR//dp7G
	NwDdEERMKc+J7oSpesSuw7XsSnPUsreqHzzkhEsElw+PLBasZxKJmzLrxuHiG9RhAdYXUA
	J4L+c2wQJJeZ81NOJTzYbO6HZr2Kv042/wNA5Urry9VVyMlGhYi3svJQ4FnU1Q==
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
Subject: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
Date: Wed, 17 Jun 2026 04:59:44 +0200
Message-ID: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 50660cbd64fe0ecdeeb
X-MBO-RS-META: pfxbqyyscfkyoswjsnjgjm6195nm4mcb
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
	TAGGED_FROM(0.00)[bounces-34107-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9D13696384

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
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 53 +++++++++++++++++++--
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 485cfa8bd9692..ba6e3bedd6d0a 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -31,6 +31,10 @@
 #define DEVICE_TYPE_RC		BIT(4)
 #define BIFUR_MOD_SET_ON	BIT(0)
 
+/* MSI Capability */
+#define MSICAP0			0x0050
+#define MSICAP0_MSIE		BIT(16)
+
 /* PCIe Interrupt Status 0 */
 #define PCIEINTSTS0		0x0084
 
@@ -55,6 +59,16 @@
 #define APP_HOLD_PHY_RST	BIT(16)
 #define APP_LTSSM_ENABLE	BIT(0)
 
+/* INTC address */
+#define AXIINTCADDR		0x0a00
+/* GITS GIC ITS translation register */
+#define AXIINTCADDR_VAL		0xf1050000
+
+/* INTC control & mask */
+#define AXIINTCCONT		0x0a04
+#define INTC_EN			BIT(31)
+#define INTC_MASK		GENMASK(11, 2)
+
 /* PCIe Power Management Control */
 #define PCIEPWRMNGCTRL		0x0070
 #define APP_CLK_REQ_N		BIT(11)
@@ -305,6 +319,39 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
 	return rcar;
 }
 
+static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+	u32 val;
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
+		/* Point AXIINTC to GIC ITS and enable. */
+		writel(AXIINTCADDR_VAL, rcar->base + AXIINTCADDR);
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
+}
+
 static int rcar_gen4_pcie_enable_device(struct pci_host_bridge *bridge,
 					struct pci_dev *dev)
 {
@@ -359,7 +406,6 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
 	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
 	int ret;
-	u32 val;
 
 	if (pp->bridge)
 		pp->bridge->enable_device = rcar_gen4_pcie_enable_device;
@@ -379,10 +425,7 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_0, 0x0);
 	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_1, 0x0);
 
-	/* Enable MSI interrupt signal */
-	val = readl(rcar->base + PCIEINTSTS0EN);
-	val |= MSI_CTRL_INT;
-	writel(val, rcar->base + PCIEINTSTS0EN);
+	rcar_gen4_pcie_host_msi_init(pp);
 
 	msleep(PCIE_T_PVPERL_MS);	/* pe_rst requires 100msec delay */
 
-- 
2.53.0



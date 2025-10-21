Return-Path: <linux-renesas-soc+bounces-23399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6EBF8234
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 20:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C03A6188D060
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 18:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D9B34A3AD;
	Tue, 21 Oct 2025 18:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf4eCt2f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D52E65D;
	Tue, 21 Oct 2025 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072393; cv=none; b=R64HWk9NzJzEWhJ1ZvAFSpnMpRSBuuk3dVmqDte751hXk8+tEp9MG2sry5s7rEIf8f3OPArWWpj/OlYL7eq5vZKKB8X29OAYnWTq/oN7xqhauv3wFpHilEN6fpgdpBt0dccngA3Gm3T1xjPbzQjP0k4HTApGxWslqknCsLCC3LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072393; c=relaxed/simple;
	bh=shnXUaoW8wb8T/DLKvXfDvvO7GZxjBiC7NeFGmueOzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bf6yIDUTtcOyHs3gPWL6Kwx6zlM5/TzYkU39qdYrkSxUS5/WlKvaMrFIqkIPv8bsHwoBXvzufN0NNsr+tn2upiYbHXB5U61x/8GylrybqAbuXkN+8SLHj1sqbrjkYT4an0X6fYMimKz7x8OplfDwB/OVr0rdWBTUC1OtNvffVd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf4eCt2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896F1C4CEF1;
	Tue, 21 Oct 2025 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761072391;
	bh=shnXUaoW8wb8T/DLKvXfDvvO7GZxjBiC7NeFGmueOzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xf4eCt2fkRulM7vNoyvMUvkX3+RR4sU0x0cHaCDvLis01VhUn1mHEtq9RtiSu7Phq
	 fxS5i1g8EI8nitLDBCdq+3mR95CqiBqMe7yQGphXEE8y4Ol9LrMvivDTqkPmytBHDm
	 tiA/bQSKaSbj3NdZchl2xWPppYGlKRaVTyESuS+9dAkXy2OCHGH450uQGY5Q+LOlAV
	 Thk6ixfbzRM1dheF965YufZkURvdRgWZXELSVxcTkwhYF3dGmIInMMFLFbuo/DCu3W
	 +XvxjokmwwTBHpGJ/mBUzyCUKIftx1kMujcgeZXXrL9T6G18n1pA6oTm9VVPxNQqCM
	 JJycpIQPtXGiA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15.y 1/2] PCI: rcar: Finish transition to L1 state in rcar_pcie_config_access()
Date: Tue, 21 Oct 2025 14:46:27 -0400
Message-ID: <20251021184628.2530506-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025101648-abruptly-poncho-afdd@gregkh>
References: <2025101648-abruptly-poncho-afdd@gregkh>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marek.vasut+renesas@gmail.com>

[ Upstream commit 84b576146294c2be702cfcd174eaa74167e276f9 ]

In case the controller is transitioning to L1 in rcar_pcie_config_access(),
any read/write access to PCIECDR triggers asynchronous external abort. This
is because the transition to L1 link state must be manually finished by the
driver. The PCIe IP can transition back from L1 state to L0 on its own.

Avoid triggering the abort in rcar_pcie_config_access() by checking whether
the controller is in the transition state, and if so, finish the transition
right away. This prevents a lot of unnecessary exceptions, although not all
of them.

Link: https://lore.kernel.org/r/20220312212349.781799-1-marek.vasut@gmail.com
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Wilczyński <kw@linux.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Stable-dep-of: 0a8f173d9dad ("PCI: rcar-host: Drop PMSR spinlock")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pcie-rcar-host.c | 76 +++++++++++++++----------
 1 file changed, 45 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index bfb13f358d073..afcfc4218a52c 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -67,6 +67,42 @@ struct rcar_pcie_host {
 	int			(*phy_init_fn)(struct rcar_pcie_host *host);
 };
 
+static DEFINE_SPINLOCK(pmsr_lock);
+
+static int rcar_pcie_wakeup(struct device *pcie_dev, void __iomem *pcie_base)
+{
+	unsigned long flags;
+	u32 pmsr, val;
+	int ret = 0;
+
+	spin_lock_irqsave(&pmsr_lock, flags);
+
+	if (!pcie_base || pm_runtime_suspended(pcie_dev)) {
+		ret = -EINVAL;
+		goto unlock_exit;
+	}
+
+	pmsr = readl(pcie_base + PMSR);
+
+	/*
+	 * Test if the PCIe controller received PM_ENTER_L1 DLLP and
+	 * the PCIe controller is not in L1 link state. If true, apply
+	 * fix, which will put the controller into L1 link state, from
+	 * which it can return to L0s/L0 on its own.
+	 */
+	if ((pmsr & PMEL1RX) && ((pmsr & PMSTATE) != PMSTATE_L1)) {
+		writel(L1IATN, pcie_base + PMCTLR);
+		ret = readl_poll_timeout_atomic(pcie_base + PMSR, val,
+						val & L1FAEG, 10, 1000);
+		WARN(ret, "Timeout waiting for L1 link state, ret=%d\n", ret);
+		writel(L1FAEG | PMEL1RX, pcie_base + PMSR);
+	}
+
+unlock_exit:
+	spin_unlock_irqrestore(&pmsr_lock, flags);
+	return ret;
+}
+
 static struct rcar_pcie_host *msi_to_host(struct rcar_msi *msi)
 {
 	return container_of(msi, struct rcar_pcie_host, msi);
@@ -87,6 +123,14 @@ static int rcar_pcie_config_access(struct rcar_pcie_host *host,
 {
 	struct rcar_pcie *pcie = &host->pcie;
 	unsigned int dev, func, reg, index;
+	int ret;
+
+	/* Wake the bus up in case it is in L1 state. */
+	ret = rcar_pcie_wakeup(pcie->dev, pcie->base);
+	if (ret) {
+		PCI_SET_ERROR_RESPONSE(data);
+		return PCIBIOS_SET_FAILED;
+	}
 
 	dev = PCI_SLOT(devfn);
 	func = PCI_FUNC(devfn);
@@ -1054,40 +1098,10 @@ static struct platform_driver rcar_pcie_driver = {
 };
 
 #ifdef CONFIG_ARM
-static DEFINE_SPINLOCK(pmsr_lock);
 static int rcar_pcie_aarch32_abort_handler(unsigned long addr,
 		unsigned int fsr, struct pt_regs *regs)
 {
-	unsigned long flags;
-	u32 pmsr, val;
-	int ret = 0;
-
-	spin_lock_irqsave(&pmsr_lock, flags);
-
-	if (!pcie_base || pm_runtime_suspended(pcie_dev)) {
-		ret = 1;
-		goto unlock_exit;
-	}
-
-	pmsr = readl(pcie_base + PMSR);
-
-	/*
-	 * Test if the PCIe controller received PM_ENTER_L1 DLLP and
-	 * the PCIe controller is not in L1 link state. If true, apply
-	 * fix, which will put the controller into L1 link state, from
-	 * which it can return to L0s/L0 on its own.
-	 */
-	if ((pmsr & PMEL1RX) && ((pmsr & PMSTATE) != PMSTATE_L1)) {
-		writel(L1IATN, pcie_base + PMCTLR);
-		ret = readl_poll_timeout_atomic(pcie_base + PMSR, val,
-						val & L1FAEG, 10, 1000);
-		WARN(ret, "Timeout waiting for L1 link state, ret=%d\n", ret);
-		writel(L1FAEG | PMEL1RX, pcie_base + PMSR);
-	}
-
-unlock_exit:
-	spin_unlock_irqrestore(&pmsr_lock, flags);
-	return ret;
+	return !!rcar_pcie_wakeup(pcie_dev, pcie_base);
 }
 
 static const struct of_device_id rcar_pcie_abort_handler_of_match[] __initconst = {
-- 
2.51.0



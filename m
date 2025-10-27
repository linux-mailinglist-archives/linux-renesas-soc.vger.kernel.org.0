Return-Path: <linux-renesas-soc+bounces-23699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FFAC10B56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 20:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA6B65044F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 19:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6C62DAFC3;
	Mon, 27 Oct 2025 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="txkk2Y7H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F3A1662E7;
	Mon, 27 Oct 2025 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761592082; cv=none; b=L70JfE1ASv04zONFnMdG2jRHXOw7KfF4ubM3d572py9mVGZL36s/uBCfsyoK/l71D9D809qSSLMBZPdWQZlqCIeze+oXMN9njRzxoysJkON4tT9jfhUB+uBQG1X8nOTE+H2nD2+27VM3YtaA+S/r65iJW5zSm4J8GxAPtFyuvwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761592082; c=relaxed/simple;
	bh=u/E0OqAWtKgcnl1sh5RO7jvaD8pclSNqq+9K9L0hgqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KzHwckSNPA/FsbjsDug+AqhIhzzZo72kF5UsbzmLhRUwfZm9HbrV7PE4HB1mLXECjojaYa5Xv4IyqBEvOJMkxyCbz+KGZ/qgXon0nHWS1YLfT8P40ayDodD3l84TJEtC2o2Tryn7VtzkBGordqciw0tNV4q8d+66KDCX9HlXN04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=txkk2Y7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AFBC4CEF1;
	Mon, 27 Oct 2025 19:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761592082;
	bh=u/E0OqAWtKgcnl1sh5RO7jvaD8pclSNqq+9K9L0hgqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=txkk2Y7HJnh+qa0VKJe8C1x9i1EZX6LpduT6WY7dsx0fAYzXc5XjJw5ARz4R+ENjd
	 6jH0eG3yyqD7Awolmh2khEJhusADZTbr68YKzqVAdgy9ijwMvEqet56ih1+xflgyTg
	 dXvOSSr3LvTmXtwAvVUXPUFcqVMIJiJJUTjZ1Gxs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 111/123] PCI: rcar: Finish transition to L1 state in rcar_pcie_config_access()
Date: Mon, 27 Oct 2025 19:36:31 +0100
Message-ID: <20251027183449.358690519@linuxfoundation.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027183446.381986645@linuxfoundation.org>
References: <20251027183446.381986645@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/pci/controller/pcie-rcar-host.c |   76 ++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 31 deletions(-)

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
@@ -87,6 +123,14 @@ static int rcar_pcie_config_access(struc
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
@@ -1054,40 +1098,10 @@ static struct platform_driver rcar_pcie_
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




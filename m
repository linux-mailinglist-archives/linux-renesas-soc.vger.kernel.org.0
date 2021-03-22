Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D48344EF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 19:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhCVSqo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 14:46:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231442AbhCVSqe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 14:46:34 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9919619A1;
        Mon, 22 Mar 2021 18:46:33 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lOPZQ-0038p5-5r; Mon, 22 Mar 2021 18:46:32 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Michael Kelley <mikelley@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, kernel-team@android.com
Subject: [PATCH v2 09/15] PCI/MSI: Kill default_teardown_msi_irqs()
Date:   Mon, 22 Mar 2021 18:46:08 +0000
Message-Id: <20210322184614.802565-10-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322184614.802565-1-maz@kernel.org>
References: <20210322184614.802565-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, frank-w@public-files.de, treding@nvidia.com, tglx@linutronix.de, robh@kernel.org, will@kernel.org, kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, mikelley@microsoft.com, wei.liu@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, ryder.lee@mediatek.com, marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, michal.simek@xilinx.com, paul.walmsley@sifive.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It doesn't have any caller left.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/msi.c   | 11 +----------
 include/linux/msi.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 79b5a995bd02..d9c73c173c14 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -94,11 +94,7 @@ int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 	return 0;
 }
 
-/*
- * We have a default implementation available as a separate non-weak
- * function, as it is used by the Xen x86 PCI code
- */
-void default_teardown_msi_irqs(struct pci_dev *dev)
+void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
 {
 	int i;
 	struct msi_desc *entry;
@@ -108,11 +104,6 @@ void default_teardown_msi_irqs(struct pci_dev *dev)
 			for (i = 0; i < entry->nvec_used; i++)
 				arch_teardown_msi_irq(entry->irq + i);
 }
-
-void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
-{
-	return default_teardown_msi_irqs(dev);
-}
 #endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
 
 static void default_restore_msi_irq(struct pci_dev *dev, int irq)
diff --git a/include/linux/msi.h b/include/linux/msi.h
index 3f21e77b57b7..6aff469e511d 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -250,7 +250,6 @@ int arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc);
 void arch_teardown_msi_irq(unsigned int irq);
 int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
 void arch_teardown_msi_irqs(struct pci_dev *dev);
-void default_teardown_msi_irqs(struct pci_dev *dev);
 #else
 static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
-- 
2.29.2


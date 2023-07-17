Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D48E975640E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 15:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjGQNOu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 09:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjGQNOs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 09:14:48 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0288411C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 06:14:46 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
        by albert.telenet-ops.be with bizsmtp
        id NDEk2A00R0ucMBo06DEkUj; Mon, 17 Jul 2023 15:14:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO3f-001fpN-Ln;
        Mon, 17 Jul 2023 15:14:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO3o-007Ql3-I1;
        Mon, 17 Jul 2023 15:14:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4] iommu/ipmmu-vmsa: Convert to read_poll_timeout_atomic()
Date:   Mon, 17 Jul 2023 15:14:40 +0200
Message-Id: <649c7e09841b998c5c8d7fc274884a85e4b5bfe9.1689599528.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use read_poll_timeout_atomic() instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Split off from series [1], as all dependencies and other patches
    from that series are now in v6.5-rc1,

v3:
  - New.

[1] "[PATCH v3 0/7] iopoll: Busy loop and timeout improvements + conversions"
    https://lore.kernel.org/r/dd0ba3ebc63a4b2ef1b59b798a0a7ef445af4b3b.1685692810.git.geert+renesas@glider.be
---
 drivers/iommu/ipmmu-vmsa.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f64c5c9f5b90ace..3b58a8ea3bdef190 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
 #include <linux/of.h>
@@ -253,17 +254,13 @@ static void ipmmu_imuctr_write(struct ipmmu_vmsa_device *mmu,
 /* Wait for any pending TLB invalidations to complete */
 static void ipmmu_tlb_sync(struct ipmmu_vmsa_domain *domain)
 {
-	unsigned int count = 0;
+	u32 val;
 
-	while (ipmmu_ctx_read_root(domain, IMCTR) & IMCTR_FLUSH) {
-		cpu_relax();
-		if (++count == TLB_LOOP_TIMEOUT) {
-			dev_err_ratelimited(domain->mmu->dev,
+	if (read_poll_timeout_atomic(ipmmu_ctx_read_root, val,
+				     !(val & IMCTR_FLUSH), 1, TLB_LOOP_TIMEOUT,
+				     false, domain, IMCTR))
+		dev_err_ratelimited(domain->mmu->dev,
 			"TLB sync timed out -- MMU may be deadlocked\n");
-			return;
-		}
-		udelay(1);
-	}
 }
 
 static void ipmmu_tlb_invalidate(struct ipmmu_vmsa_domain *domain)
-- 
2.34.1


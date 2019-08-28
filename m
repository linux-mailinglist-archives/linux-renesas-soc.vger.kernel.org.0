Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82ADBA0123
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 13:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfH1L6r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 07:58:47 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:50260 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbfH1L6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:58:47 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id ubyi2000e05gfCL01byipu; Wed, 28 Aug 2019 13:58:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wb4-0008As-Ef; Wed, 28 Aug 2019 13:58:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wFQ-0001kV-7N; Wed, 28 Aug 2019 13:36:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/7] soc: renesas: rcar-sysc: Prepare for fixing power request conflicts
Date:   Wed, 28 Aug 2019 13:36:12 +0200
Message-Id: <20190828113618.6672-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828113618.6672-1-geert+renesas@glider.be>
References: <20190828113618.6672-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Recent R-Car Gen3 SoCs added an External Request Mask Register to the
System Controller (SYSC).  This register allows to mask external power
requests for CPU or 3DG domains, to prevent conflicts between powering
off CPU cores or the 3D Graphics Engine, and changing the state of
another power domain through SYSC, which could lead to CPG state machine
lock-ups.

Add support for making use of this register.  Take into account that the
register is optional, and that its location and contents are
SoC-specific.

Note that the issue fixed by this cannot happen in the upstream kernel,
as upstream has no support for graphics acceleration yet.  SoCs lacking
the External Request Mask Register may need a different mitigation in
the future.

Inspired by a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Improve patch description.
---
 drivers/soc/renesas/rcar-sysc.c | 16 ++++++++++++++++
 drivers/soc/renesas/rcar-sysc.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 59b5e6b102722a6d..176de145f4230fbd 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -63,6 +63,7 @@ struct rcar_sysc_ch {
 
 static void __iomem *rcar_sysc_base;
 static DEFINE_SPINLOCK(rcar_sysc_lock); /* SMP CPUs + I/O devices */
+static u32 rcar_sysc_extmask_offs, rcar_sysc_extmask_val;
 
 static int rcar_sysc_pwr_on_off(const struct rcar_sysc_ch *sysc_ch, bool on)
 {
@@ -105,6 +106,14 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 
 	spin_lock_irqsave(&rcar_sysc_lock, flags);
 
+	/*
+	 * Mask external power requests for CPU or 3DG domains
+	 */
+	if (rcar_sysc_extmask_val) {
+		iowrite32(rcar_sysc_extmask_val,
+			  rcar_sysc_base + rcar_sysc_extmask_offs);
+	}
+
 	/*
 	 * The interrupt source needs to be enabled, but masked, to prevent the
 	 * CPU from receiving it.
@@ -148,6 +157,9 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 	iowrite32(isr_mask, rcar_sysc_base + SYSCISCR);
 
  out:
+	if (rcar_sysc_extmask_val)
+		iowrite32(0, rcar_sysc_base + rcar_sysc_extmask_offs);
+
 	spin_unlock_irqrestore(&rcar_sysc_lock, flags);
 
 	pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
@@ -360,6 +372,10 @@ static int __init rcar_sysc_pd_init(void)
 
 	rcar_sysc_base = base;
 
+	/* Optional External Request Mask Register */
+	rcar_sysc_extmask_offs = info->extmask_offs;
+	rcar_sysc_extmask_val = info->extmask_val;
+
 	domains = kzalloc(sizeof(*domains), GFP_KERNEL);
 	if (!domains) {
 		error = -ENOMEM;
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 485520a5b295c13e..21ee3ff8620bbafe 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -44,6 +44,9 @@ struct rcar_sysc_info {
 	int (*init)(void);	/* Optional */
 	const struct rcar_sysc_area *areas;
 	unsigned int num_areas;
+	/* Optional External Request Mask Register */
+	u32 extmask_offs;	/* SYSCEXTMASK register offset */
+	u32 extmask_val;	/* SYSCEXTMASK register mask value */
 };
 
 extern const struct rcar_sysc_info r8a7743_sysc_info;
-- 
2.17.1


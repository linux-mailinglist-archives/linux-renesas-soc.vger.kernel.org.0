Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7329265D56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 12:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgIKKEs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 06:04:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:54730 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725816AbgIKKEr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 06:04:47 -0400
X-IronPort-AV: E=Sophos;i="5.76,414,1592838000"; 
   d="scan'208";a="57030687"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Sep 2020 19:04:46 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 877E0400D4F3;
        Fri, 11 Sep 2020 19:04:44 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] irqchip: Kconfig: Update description for RENESAS_IRQC config
Date:   Fri, 11 Sep 2020 11:04:39 +0100
Message-Id: <20200911100439.19878-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

irq-renesas-irqc driver is also used on Renesas RZ/G{1,2} SoC's, update
the same to reflect the description for RENESAS_IRQC config.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 drivers/irqchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index bfc9719dbcdc..cdb769383a50 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -232,12 +232,12 @@ config RENESAS_INTC_IRQPIN
 	  interrupt pins, as found on SH/R-Mobile and R-Car Gen1 SoCs.
 
 config RENESAS_IRQC
-	bool "Renesas R-Mobile APE6 and R-Car IRQC support" if COMPILE_TEST
+	bool "Renesas R-Mobile APE6, R-Car Gen{2,3} and RZ/G{1,2} IRQC support" if COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 	help
 	  Enable support for the Renesas Interrupt Controller for external
-	  devices, as found on R-Mobile APE6, R-Car Gen2, and R-Car Gen3 SoCs.
+	  devices, as found on R-Mobile APE6, R-Car Gen{2,3} and RZ/G{1,2} SoCs.
 
 config RENESAS_RZA1_IRQC
 	bool "Renesas RZ/A1 IRQC support" if COMPILE_TEST
-- 
2.17.1


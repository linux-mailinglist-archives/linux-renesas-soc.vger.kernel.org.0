Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31DF44ECC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 19:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235618AbhKLSrW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 13:47:22 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:46808 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229892AbhKLSrW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 13:47:22 -0500
X-IronPort-AV: E=Sophos;i="5.87,230,1631545200"; 
   d="scan'208";a="100101582"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2021 03:44:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2B08840D8E11;
        Sat, 13 Nov 2021 03:44:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 4/4] clocksource/drivers/renesas,ostm: Make RENESAS_OSTM symbol visible
Date:   Fri, 12 Nov 2021 18:44:13 +0000
Message-Id: <20211112184413.4391-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As RZ/G2L uses the ARM Architected Timer as system timer, enabling
the OSTM is not mandatory.

Make RENESAS_OSTM symbol visible, so that user can enable it
when needed.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clocksource/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 0f5e3983951a..b4e7f7be3c10 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -507,7 +507,8 @@ config SH_TIMER_MTU2
 	  This hardware comes with 16-bit timer registers.
 
 config RENESAS_OSTM
-	bool "Renesas OSTM timer driver" if COMPILE_TEST
+	bool "Renesas OSTM timer driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select CLKSRC_MMIO
 	select TIMER_OF
 	help
-- 
2.17.1


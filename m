Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9471C12CD79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Dec 2019 09:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbfL3IJF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Dec 2019 03:09:05 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41876 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfL3IJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Dec 2019 03:09:05 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id k8932100N5USYZQ01893gb; Mon, 30 Dec 2019 09:09:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilq6p-0006bH-IQ; Mon, 30 Dec 2019 09:09:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilq6p-0000zc-G7; Mon, 30 Dec 2019 09:09:03 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Prepare for split of R-Car H3 config symbol
Date:   Mon, 30 Dec 2019 09:09:02 +0100
Message-Id: <20191230080902.2832-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Despite using the same compatible values ("r8a7795"-based) because of
historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
(R8A77951) are really different SoCs, with different part numbers.
Hence the SoC configuration symbol will be split in two separate config
symbols.

As the Clock Pulse Generator / Module Standby and Software Reset blocks
in both SoCs are very similar, they will keep on sharing a driver.
Extend the dependency of CONFIG_CLK_R8A7795, to prepare for the split.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.6.

This complements, but has no dependencies on "[PATCH 0/5] arm64:
renesas: Split/rename R-Car H3 support"
https://lore.kernel.org/linux-renesas-soc/20191217183841.432-1-geert+renesas@glider.be/T/
---
 drivers/clk/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 94ef2bac289fb45a..250d8165167aa013 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -20,7 +20,7 @@ config CLK_RENESAS
 	select CLK_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
 	select CLK_R8A7792 if ARCH_R8A7792
 	select CLK_R8A7794 if ARCH_R8A7794
-	select CLK_R8A7795 if ARCH_R8A7795
+	select CLK_R8A7795 if ARCH_R8A77950 || ARCH_R8A77951 || ARCH_R8A7795
 	select CLK_R8A77960 if ARCH_R8A77960
 	select CLK_R8A77961 if ARCH_R8A77961
 	select CLK_R8A77965 if ARCH_R8A77965
-- 
2.17.1


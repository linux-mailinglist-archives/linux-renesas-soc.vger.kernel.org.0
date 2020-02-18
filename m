Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9CB162578
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 12:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgBRLZ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 06:25:28 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:41194 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgBRLZ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 06:25:27 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 4BRS2200G5USYZQ06BRS3E; Tue, 18 Feb 2020 12:25:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j410I-00043Y-73; Tue, 18 Feb 2020 12:25:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j410I-0001Wp-5P; Tue, 18 Feb 2020 12:25:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Remove use of ARCH_R8A7796
Date:   Tue, 18 Feb 2020 12:25:25 +0100
Message-Id: <20200218112525.5834-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas for v5.7.
---
 drivers/clk/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 250d8165167aa013..879d96ead06b62ff 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -20,7 +20,7 @@ config CLK_RENESAS
 	select CLK_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
 	select CLK_R8A7792 if ARCH_R8A7792
 	select CLK_R8A7794 if ARCH_R8A7794
-	select CLK_R8A7795 if ARCH_R8A77950 || ARCH_R8A77951 || ARCH_R8A7795
+	select CLK_R8A7795 if ARCH_R8A77950 || ARCH_R8A77951
 	select CLK_R8A77960 if ARCH_R8A77960
 	select CLK_R8A77961 if ARCH_R8A77961
 	select CLK_R8A77965 if ARCH_R8A77965
-- 
2.17.1


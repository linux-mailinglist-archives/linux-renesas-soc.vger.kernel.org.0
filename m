Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA8A1BAE10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 21:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgD0Tet (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 15:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbgD0Tet (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 15:34:49 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678C8C0610D5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2020 12:34:49 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:d03f:8af3:4e83:6587])
        by xavier.telenet-ops.be with bizsmtp
        id Xvan2200c27aUyk01vaoLo; Mon, 27 Apr 2020 21:34:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9Wh-0007to-Tj; Mon, 27 Apr 2020 21:34:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9Wh-0007kN-R7; Mon, 27 Apr 2020 21:34:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects
Date:   Mon, 27 Apr 2020 21:34:46 +0200
Message-Id: <20200427193446.29738-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CLK_RENESAS_CPG_MSSR selects CLK_RENESAS_DIV6, and CLK_RCAR_GEN2_CPG
selects CLK_RENESAS_CPG_MSSR, so there is no longer a need for the
individual R-Car Gen2 clock driver options to select CLK_RENESAS_DIV6.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.8.

 drivers/clk/renesas/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 149787b0005d7ad0..9eb79bf906430a9b 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -95,12 +95,10 @@ config CLK_R8A7779
 config CLK_R8A7790
 	bool "R-Car H2 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2_CPG
-	select CLK_RENESAS_DIV6
 
 config CLK_R8A7791
 	bool "R-Car M2-W/N clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2_CPG
-	select CLK_RENESAS_DIV6
 
 config CLK_R8A7792
 	bool "R-Car V2H clock support" if COMPILE_TEST
@@ -109,7 +107,6 @@ config CLK_R8A7792
 config CLK_R8A7794
 	bool "R-Car E2 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2_CPG
-	select CLK_RENESAS_DIV6
 
 config CLK_R8A7795
 	bool "R-Car H3 clock support" if COMPILE_TEST
-- 
2.17.1


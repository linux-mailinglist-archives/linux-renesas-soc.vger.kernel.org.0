Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385103E8CD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 11:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbhHKJHK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 05:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236369AbhHKJHI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 05:07:08 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A978CC061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 02:06:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id g96i2500X1gJxCh0196iBT; Wed, 11 Aug 2021 11:06:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkCA-001yt6-Hr; Wed, 11 Aug 2021 11:06:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkC9-0059bi-Qk; Wed, 11 Aug 2021 11:06:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Make CLK_R9A06G032 invisible
Date:   Wed, 11 Aug 2021 11:06:40 +0200
Message-Id: <4f3d30c730c30546f702715ffc648922a8156703.1628672649.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When configuring a kernel including support for Renesas ARM/ARM64 Socs,
but excluding support for the RZ/N1D SoC, the user is always asked about
the RZ/N1D clock driver.  As this driver is already auto-selected when
building a kernel including support for the RZ/N1D SoC, there is no need
to make the CLK_R9A06G032 symbol visible, unless compile-testing.

Align the symbol description with the other symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.15.

 drivers/clk/renesas/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 7b450650bcaee124..6d0280751bb16e89 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -153,9 +153,7 @@ config CLK_R8A779A0
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_R9A06G032
-	bool "Renesas R9A06G032 clock driver"
-	help
-	  This is a driver for R9A06G032 clocks
+	bool "RZ/N1D clock support" if COMPILE_TEST
 
 config CLK_R9A07G044
 	bool "RZ/G2L clock support" if COMPILE_TEST
-- 
2.25.1


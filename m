Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA1E3C8545
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 15:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhGNN3J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 09:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhGNN3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 09:29:04 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0136C06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 06:26:12 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by baptiste.telenet-ops.be with bizsmtp
        id V1SB250061ccfby011SBKr; Wed, 14 Jul 2021 15:26:11 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3etu-0019B9-U7; Wed, 14 Jul 2021 15:26:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3etu-00AawP-9N; Wed, 14 Jul 2021 15:26:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Rename renesas-rzg2l-cpg.[ch] to rzg2l-cpg.[ch]
Date:   Wed, 14 Jul 2021 15:26:01 +0200
Message-Id: <edc442daaedffcf10e835ff479d906fcae0e59db.1626268821.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename renesas-rzg2l-cpg.c and renesas-rzg2l-cpg.h to rzg2l-cpg.c resp.
rzg2l-cpg.h, for consistency with other (sub)drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.15.

 drivers/clk/renesas/Makefile                             | 2 +-
 drivers/clk/renesas/r9a07g044-cpg.c                      | 2 +-
 drivers/clk/renesas/{renesas-rzg2l-cpg.c => rzg2l-cpg.c} | 2 +-
 drivers/clk/renesas/{renesas-rzg2l-cpg.h => rzg2l-cpg.h} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/clk/renesas/{renesas-rzg2l-cpg.c => rzg2l-cpg.c} (99%)
 rename drivers/clk/renesas/{renesas-rzg2l-cpg.h => rzg2l-cpg.h} (100%)

diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 5c6c5c721d98d827..7d018700d08bd9dc 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -37,7 +37,7 @@ obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+= rcar-cpg-lib.o
 obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+= rcar-gen2-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
-obj-$(CONFIG_CLK_RZG2L)			+= renesas-rzg2l-cpg.o
+obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
 
 # Generic
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index ed5f5c11ac12d925..a71f920f5dfaa7da 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -12,7 +12,7 @@
 
 #include <dt-bindings/clock/r9a07g044-cpg.h>
 
-#include "renesas-rzg2l-cpg.h"
+#include "rzg2l-cpg.h"
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
similarity index 99%
rename from drivers/clk/renesas/renesas-rzg2l-cpg.c
rename to drivers/clk/renesas/rzg2l-cpg.c
index 9addc9dae31ac115..3b3b2c3347f3763f 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -29,7 +29,7 @@
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
-#include "renesas-rzg2l-cpg.h"
+#include "rzg2l-cpg.h"
 
 #ifdef DEBUG
 #define WARN_DEBUG(x)	WARN_ON(x)
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
similarity index 100%
rename from drivers/clk/renesas/renesas-rzg2l-cpg.h
rename to drivers/clk/renesas/rzg2l-cpg.h
-- 
2.25.1


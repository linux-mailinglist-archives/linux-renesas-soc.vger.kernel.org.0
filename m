Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F3F41B807
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 22:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242641AbhI1UKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 16:10:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:60762 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242648AbhI1UJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 16:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=6tiFmHJOKHCjgd
        uCVK4nJNv00hRWu/l7X/LgDQu/ShA=; b=SBk2oI8NJ/O1f2fFWMgWwF7DNC8ftV
        Vi+nLV8m5JOzSdiliRsUAeRmusNbgY+WiwSKXWiNg6owf1o0/H2hR81jr2CFnoLt
        sGc38fVcpVZVnfCWLq0gP3hZud25O7aUt+DWILM8Uii2JALVZWoNkmdze8tSsA3A
        +lTzdyFvEMYok=
Received: (qmail 1377243 invoked from network); 28 Sep 2021 22:08:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 22:08:16 +0200
X-UD-Smtp-Session: l3s3148p1@a3srxhPNdNIgAwDPXxnDADNsFyRXxb9N
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/9] clk: renesas: add SDnH clock to Gen3 SoCs
Date:   Tue, 28 Sep 2021 22:07:57 +0200
Message-Id: <20210928200804.50922-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently a pass-through clock but we will make it a real divider clock
in the next patches.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 12 ++++++++----
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 12 ++++++++----
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  9 ++++++---
 drivers/clk/renesas/r8a774e1-cpg-mssr.c | 12 ++++++++----
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 12 ++++++++----
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 12 ++++++++----
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 12 ++++++++----
 drivers/clk/renesas/r8a77980-cpg-mssr.c |  3 ++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  9 ++++++---
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  3 ++-
 10 files changed, 64 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 39b185d8e957..804f3362763c 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -100,10 +100,14 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A774A1_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A774A1_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A774A1_CLK_SD0,   CLK_SDSRC,     0x074),
-	DEF_GEN3_SD("sd1",      R8A774A1_CLK_SD1,   CLK_SDSRC,     0x078),
-	DEF_GEN3_SD("sd2",      R8A774A1_CLK_SD2,   CLK_SDSRC,     0x268),
-	DEF_GEN3_SD("sd3",      R8A774A1_CLK_SD3,   CLK_SDSRC,     0x26c),
+	DEF_GEN3_SDH("sd0h",    R8A774A1_CLK_SD0H,  CLK_SDSRC,        0x074),
+	DEF_GEN3_SD( "sd0",     R8A774A1_CLK_SD0,   R8A774A1_CLK_SD0H, 0x074),
+	DEF_GEN3_SDH("sd1h",    R8A774A1_CLK_SD1H,  CLK_SDSRC,        0x078),
+	DEF_GEN3_SD( "sd1",     R8A774A1_CLK_SD1,   R8A774A1_CLK_SD1H, 0x078),
+	DEF_GEN3_SDH("sd2h",    R8A774A1_CLK_SD2H,  CLK_SDSRC,        0x268),
+	DEF_GEN3_SD( "sd2",     R8A774A1_CLK_SD2,   R8A774A1_CLK_SD2H, 0x268),
+	DEF_GEN3_SDH("sd3h",    R8A774A1_CLK_SD3H,  CLK_SDSRC,        0x26c),
+	DEF_GEN3_SD( "sd3",     R8A774A1_CLK_SD3,   R8A774A1_CLK_SD3H, 0x26c),
 
 	DEF_FIXED("cl",         R8A774A1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A774A1_CLK_CP,    CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index af602d83c8ce..97fe5d2227fe 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -97,10 +97,14 @@ static const struct cpg_core_clk r8a774b1_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A774B1_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A774B1_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A774B1_CLK_SD0,   CLK_SDSRC,     0x074),
-	DEF_GEN3_SD("sd1",      R8A774B1_CLK_SD1,   CLK_SDSRC,     0x078),
-	DEF_GEN3_SD("sd2",      R8A774B1_CLK_SD2,   CLK_SDSRC,     0x268),
-	DEF_GEN3_SD("sd3",      R8A774B1_CLK_SD3,   CLK_SDSRC,     0x26c),
+	DEF_GEN3_SDH("sd0h",    R8A774B1_CLK_SD0H,  CLK_SDSRC,         0x074),
+	DEF_GEN3_SD( "sd0",     R8A774B1_CLK_SD0,   R8A774B1_CLK_SD0H, 0x074),
+	DEF_GEN3_SDH("sd1h",    R8A774B1_CLK_SD1H,  CLK_SDSRC,         0x078),
+	DEF_GEN3_SD( "sd1",     R8A774B1_CLK_SD1,   R8A774B1_CLK_SD1H, 0x078),
+	DEF_GEN3_SDH("sd2h",    R8A774B1_CLK_SD2H,  CLK_SDSRC,         0x268),
+	DEF_GEN3_SD( "sd2",     R8A774B1_CLK_SD2,   R8A774B1_CLK_SD2H, 0x268),
+	DEF_GEN3_SDH("sd3h",    R8A774B1_CLK_SD3H,  CLK_SDSRC,         0x26c),
+	DEF_GEN3_SD( "sd3",     R8A774B1_CLK_SD3,   R8A774B1_CLK_SD3H, 0x26c),
 
 	DEF_FIXED("cl",         R8A774B1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A774B1_CLK_CP,    CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 5b938eb2df25..611a5bd8f29e 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -108,9 +108,12 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",      R8A774C0_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",      R8A774C0_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",     R8A774C0_CLK_SD0,   CLK_SDSRC,	  0x0074),
-	DEF_GEN3_SD("sd1",     R8A774C0_CLK_SD1,   CLK_SDSRC,	  0x0078),
-	DEF_GEN3_SD("sd3",     R8A774C0_CLK_SD3,   CLK_SDSRC,	  0x026c),
+	DEF_GEN3_SDH("sd0h",   R8A774C0_CLK_SD0H, CLK_SDSRC,   	     0x0074),
+	DEF_GEN3_SD( "sd0",    R8A774C0_CLK_SD0,  R8A774C0_CLK_SD0H, 0x0074),
+	DEF_GEN3_SDH("sd1h",   R8A774C0_CLK_SD1H, CLK_SDSRC,         0x0078),
+	DEF_GEN3_SD( "sd1",    R8A774C0_CLK_SD1,  R8A774C0_CLK_SD1H, 0x0078),
+	DEF_GEN3_SDH("sd3h",   R8A774C0_CLK_SD3H, CLK_SDSRC,         0x026c),
+	DEF_GEN3_SD( "sd3",    R8A774C0_CLK_SD3,  R8A774C0_CLK_SD3H, 0x026c),
 
 	DEF_FIXED("cl",        R8A774C0_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cp",        R8A774C0_CLK_CP,    CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a774e1-cpg-mssr.c b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
index 40c71466df37..98beea6f4f6c 100644
--- a/drivers/clk/renesas/r8a774e1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
@@ -100,10 +100,14 @@ static const struct cpg_core_clk r8a774e1_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A774E1_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A774E1_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A774E1_CLK_SD0,   CLK_SDSRC,     0x074),
-	DEF_GEN3_SD("sd1",      R8A774E1_CLK_SD1,   CLK_SDSRC,     0x078),
-	DEF_GEN3_SD("sd2",      R8A774E1_CLK_SD2,   CLK_SDSRC,     0x268),
-	DEF_GEN3_SD("sd3",      R8A774E1_CLK_SD3,   CLK_SDSRC,     0x26c),
+	DEF_GEN3_SDH("sd0h",    R8A774E1_CLK_SD0H,  CLK_SDSRC,         0x074),
+	DEF_GEN3_SD( "sd0",     R8A774E1_CLK_SD0,   R8A774E1_CLK_SD0H, 0x074),
+	DEF_GEN3_SDH("sd1h",    R8A774E1_CLK_SD1H,  CLK_SDSRC,         0x078),
+	DEF_GEN3_SD( "sd1",     R8A774E1_CLK_SD1,   R8A774E1_CLK_SD1H, 0x078),
+	DEF_GEN3_SDH("sd2h",    R8A774E1_CLK_SD2H,  CLK_SDSRC,         0x268),
+	DEF_GEN3_SD( "sd2",     R8A774E1_CLK_SD2,   R8A774E1_CLK_SD2H, 0x268),
+	DEF_GEN3_SDH("sd3h",    R8A774E1_CLK_SD3H,  CLK_SDSRC,         0x26c),
+	DEF_GEN3_SD( "sd3",     R8A774E1_CLK_SD3,   R8A774E1_CLK_SD3H, 0x26c),
 
 	DEF_FIXED("cl",         R8A774E1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A774E1_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index c32d2c678046..9ca26057e809 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -104,10 +104,14 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_FIXED("s3d2",       R8A7795_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A7795_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_SDSRC,     0x074),
-	DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_SDSRC,     0x078),
-	DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_SDSRC,     0x268),
-	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC,     0x26c),
+	DEF_GEN3_SDH("sd0h",    R8A7795_CLK_SD0H,  CLK_SDSRC,        0x074),
+	DEF_GEN3_SD( "sd0",     R8A7795_CLK_SD0,   R8A7795_CLK_SD0H, 0x074),
+	DEF_GEN3_SDH("sd1h",    R8A7795_CLK_SD1H,  CLK_SDSRC,        0x078),
+	DEF_GEN3_SD( "sd1",     R8A7795_CLK_SD1,   R8A7795_CLK_SD1H, 0x078),
+	DEF_GEN3_SDH("sd2h",    R8A7795_CLK_SD2H,  CLK_SDSRC,        0x268),
+	DEF_GEN3_SD( "sd2",     R8A7795_CLK_SD2,   R8A7795_CLK_SD2H, 0x268),
+	DEF_GEN3_SDH("sd3h",    R8A7795_CLK_SD3H,  CLK_SDSRC,        0x26c),
+	DEF_GEN3_SD( "sd3",     R8A7795_CLK_SD3,   R8A7795_CLK_SD3H, 0x26c),
 
 	DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A7795_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 41593c126faf..0dc0ba349a54 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -106,10 +106,14 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A7796_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A7796_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A7796_CLK_SD0,   CLK_SDSRC,     0x074),
-	DEF_GEN3_SD("sd1",      R8A7796_CLK_SD1,   CLK_SDSRC,     0x078),
-	DEF_GEN3_SD("sd2",      R8A7796_CLK_SD2,   CLK_SDSRC,     0x268),
-	DEF_GEN3_SD("sd3",      R8A7796_CLK_SD3,   CLK_SDSRC,     0x26c),
+	DEF_GEN3_SDH("sd0h",    R8A7796_CLK_SD0H,  CLK_SDSRC,        0x074),
+	DEF_GEN3_SD( "sd0",     R8A7796_CLK_SD0,   R8A7796_CLK_SD0H, 0x074),
+	DEF_GEN3_SDH("sd1h",    R8A7796_CLK_SD1H,  CLK_SDSRC,        0x078),
+	DEF_GEN3_SD( "sd1",     R8A7796_CLK_SD1,   R8A7796_CLK_SD1H, 0x078),
+	DEF_GEN3_SDH("sd2h",    R8A7796_CLK_SD2H,  CLK_SDSRC,        0x268),
+	DEF_GEN3_SD( "sd2",     R8A7796_CLK_SD2,   R8A7796_CLK_SD2H, 0x268),
+	DEF_GEN3_SDH("sd3h",    R8A7796_CLK_SD3H,  CLK_SDSRC,        0x26c),
+	DEF_GEN3_SD( "sd3",     R8A7796_CLK_SD3,   R8A7796_CLK_SD3H, 0x26c),
 
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A7796_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index bc1be8bcbbe4..d85489522b8e 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -101,10 +101,14 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",	R8A77965_CLK_S3D2,	CLK_S3,		2, 1),
 	DEF_FIXED("s3d4",	R8A77965_CLK_S3D4,	CLK_S3,		4, 1),
 
-	DEF_GEN3_SD("sd0",	R8A77965_CLK_SD0,	CLK_SDSRC,	0x074),
-	DEF_GEN3_SD("sd1",	R8A77965_CLK_SD1,	CLK_SDSRC,	0x078),
-	DEF_GEN3_SD("sd2",	R8A77965_CLK_SD2,	CLK_SDSRC,	0x268),
-	DEF_GEN3_SD("sd3",	R8A77965_CLK_SD3,	CLK_SDSRC,	0x26c),
+	DEF_GEN3_SDH("sd0h",	R8A77965_CLK_SD0H,	CLK_SDSRC,   	   0x074),
+	DEF_GEN3_SD( "sd0",	R8A77965_CLK_SD0,	R8A77965_CLK_SD0H, 0x074),
+	DEF_GEN3_SDH("sd1h",	R8A77965_CLK_SD1H,	CLK_SDSRC,   	   0x078),
+	DEF_GEN3_SD( "sd1",	R8A77965_CLK_SD1,	R8A77965_CLK_SD1H, 0x078),
+	DEF_GEN3_SDH("sd2h",	R8A77965_CLK_SD2H,	CLK_SDSRC,   	   0x268),
+	DEF_GEN3_SD( "sd2",	R8A77965_CLK_SD2,	R8A77965_CLK_SD2H, 0x268),
+	DEF_GEN3_SDH("sd3h",	R8A77965_CLK_SD3H,	CLK_SDSRC,   	   0x26c),
+	DEF_GEN3_SD( "sd3",	R8A77965_CLK_SD3,	R8A77965_CLK_SD3H, 0x26c),
 
 	DEF_FIXED("cl",		R8A77965_CLK_CL,	CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A77965_CLK_CR,	CLK_PLL1_DIV4,  2, 1),
diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 9fe372286c1e..4ff2abad1de0 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -96,7 +96,8 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",	R8A77980_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",	R8A77980_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",	R8A77980_CLK_SD0,   CLK_SDSRC,	  0x0074),
+	DEF_GEN3_SDH("sd0h",	R8A77980_CLK_SD0H,  CLK_SDSRC,	       0x0074),
+	DEF_GEN3_SD( "sd0",	R8A77980_CLK_SD0,   R8A77980_CLK_SD0H, 0x0074),
 
 	DEF_FIXED("cl",		R8A77980_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",		R8A77980_CLK_CP,    CLK_EXTAL,	    2, 1),
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index a582f2ec3294..637c3f062fae 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -100,9 +100,12 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",      R8A77990_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",      R8A77990_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",     R8A77990_CLK_SD0,   CLK_SDSRC,	  0x0074),
-	DEF_GEN3_SD("sd1",     R8A77990_CLK_SD1,   CLK_SDSRC,	  0x0078),
-	DEF_GEN3_SD("sd3",     R8A77990_CLK_SD3,   CLK_SDSRC,	  0x026c),
+	DEF_GEN3_SDH("sd0h",   R8A77990_CLK_SD0H,  CLK_SDSRC,         0x0074),
+	DEF_GEN3_SD( "sd0",    R8A77990_CLK_SD0,   R8A77990_CLK_SD0H, 0x0074),
+	DEF_GEN3_SDH("sd1h",   R8A77990_CLK_SD1H,  CLK_SDSRC,         0x0078),
+	DEF_GEN3_SD( "sd1",    R8A77990_CLK_SD1,   R8A77990_CLK_SD1H, 0x0078),
+	DEF_GEN3_SDH("sd3h",   R8A77990_CLK_SD3H,  CLK_SDSRC,         0x026c),
+	DEF_GEN3_SD( "sd3",    R8A77990_CLK_SD3,   R8A77990_CLK_SD3H, 0x026c),
 
 	DEF_FIXED("cl",        R8A77990_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cr",        R8A77990_CLK_CR,    CLK_PLL1D2,     2, 1),
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 81c0bc1e78af..007f6fda1db4 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -103,7 +103,8 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_GEN3_PE("s3d2c",   R8A77995_CLK_S3D2C, CLK_S3, 2, CLK_PE, 2),
 	DEF_GEN3_PE("s3d4c",   R8A77995_CLK_S3D4C, CLK_S3, 4, CLK_PE, 4),
 
-	DEF_GEN3_SD("sd0",     R8A77995_CLK_SD0,   CLK_SDSRC,     0x268),
+	DEF_GEN3_SDH("sd0h",   R8A77995_CLK_SD0H, CLK_SDSRC,         0x268),
+	DEF_GEN3_SD( "sd0",    R8A77995_CLK_SD0,  R8A77995_CLK_SD0H, 0x268),
 
 	DEF_DIV6P1("canfd",    R8A77995_CLK_CANFD, CLK_PLL0D3,    0x244),
 	DEF_DIV6P1("mso",      R8A77995_CLK_MSO,   CLK_PLL1D2,    0x014),
-- 
2.30.2


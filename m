Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7348A1CE08B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 18:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgEKQeP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 12:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729862AbgEKQeO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 12:34:14 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1168FC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2020 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589214852;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=vsDlG6O/AqwVPyBduDP3PaEo9M1KqHJ3ifNZH/Z/XM0=;
        b=XhWZ8oU+3Xc+7FOapApdRm7NOFUks83NS+/4IF73dEUj1hHqSsj7gXvLppxqlFu0lC
        mJjN4Z9gbvzJ11uXSyXpgkzMmn2hwyvYTwhxumLb85Ylhoi03DdFkamDp3UQ/JrXAQAF
        njNSjt/RXGzT1s99ixVl6LmJap7gFhfTW+KVdlxBAD8CfEnY4ZjkFd4FteSs9wyuFpVy
        al2PfDZhjrqAfEaW0HZaP2ZxiXkZlEBbN9Y3PX5ZFg3grInQGfDj+obDn8ngW6wMPUfD
        w+vEpWNhn/6e5PkooG2bKUY3haw1qq2b/1ULbRPuuGV4Y6AwnTBRAHSxgtJMOXpKH7Sk
        1++A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR92REa5ElWg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id Z0acdaw4BGYADFs
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 11 May 2020 18:34:10 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 2/3] clk: renesas: rcar-gen3: mark RWDT clocks as never-disable
Date:   Mon, 11 May 2020 18:33:57 +0200
Message-Id: <1589214838-18075-3-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
References: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ensures RWDT remains alert throughout the boot process if enabled.

This patch applies the change to the following SoCs: r8a7795,
r8a7796, r8a77965, r8a77970, r8a77980, r8a77990 and r8a77995.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 6 +++++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 6 +++++-
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 6 +++++-
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 6 +++++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 6 +++++-
 7 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ff5b302..3d055cb 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -289,7 +289,9 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a7795_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -484,6 +486,8 @@ const struct cpg_mssr_info r8a7795_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a7795_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a7795_crit_mod_clks),
+	.never_disable_mod_clks = r8a7795_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a7795_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a7795_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index e8d466d..77160ba 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -264,7 +264,9 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a7796_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -364,6 +366,8 @@ const struct cpg_mssr_info r8a7796_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a7796_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a7796_crit_mod_clks),
+	.never_disable_mod_clks = r8a7796_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a7796_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a7796_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 7a05a2f..d09ac5e 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -265,6 +265,9 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 static const unsigned int r8a77965_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a77965_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -350,6 +353,8 @@ const struct cpg_mssr_info r8a77965_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks		= r8a77965_crit_mod_clks,
 	.num_crit_mod_clks	= ARRAY_SIZE(r8a77965_crit_mod_clks),
+	.never_disable_mod_clks		= r8a77965_never_disable_mod_clks,
+	.num_never_disable_mod_clks	= ARRAY_SIZE(r8a77965_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init			= r8a77965_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index cbed376..3a18499 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -167,7 +167,9 @@ static const struct mssr_mod_clk r8a77970_mod_clks[] __initconst = {
 static const unsigned int r8a77970_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a77970_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -267,6 +269,8 @@ const struct cpg_mssr_info r8a77970_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77970_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77970_crit_mod_clks),
+	.never_disable_mod_clks = r8a77970_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a77970_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77970_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 7227f67..eeb2377 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -182,7 +182,9 @@ static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
 static const unsigned int r8a77980_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a77980_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -238,6 +240,8 @@ const struct cpg_mssr_info r8a77980_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77980_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77980_crit_mod_clks),
+	.never_disable_mod_clks = r8a77980_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a77980_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77980_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 8eda2e3..daf7d63 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -247,6 +247,9 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 static const unsigned int r8a77990_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a77990_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -296,6 +299,8 @@ const struct cpg_mssr_info r8a77990_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77990_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77990_crit_mod_clks),
+	.never_disable_mod_clks = r8a77990_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a77990_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77990_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 056ebf3..0a3c4d4 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -185,7 +185,9 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 static const unsigned int r8a77995_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a77995_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -235,6 +237,8 @@ const struct cpg_mssr_info r8a77995_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77995_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77995_crit_mod_clks),
+	.never_disable_mod_clks = r8a77995_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a77995_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77995_cpg_mssr_init,
-- 
2.7.4


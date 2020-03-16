Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A937187018
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732100AbgCPQfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:35:02 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:24441 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732021AbgCPQfC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1584376497;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=P9vfFAYFu9nCs3qOpP9b5dF8FQNqSbE10ujC9aiBDG4=;
        b=ALo096GNtQeIweGyFr6d1cbCDUn9GR/5mDKBQrIXovrXqM5p3Uwlf/65CDyDnLVP8P
        iskz+4sTYOs5nO7U397Ho/NrghKbTCIxQWF9TiN7tTs84NA2C60YhTh3Ecdctk0ublqd
        PSS9kfdB3Oa6CuziL7LvUZeUd5i0DWMc4sAFCE+Ar0aJJhV0d0VIAIHdxxhYKGaG1fUw
        oDsLDVBoitNtgQwDUAsKrpFX6Tz4dD359x2PNWKtl+Kcs+/cr4lCuFiagdMfmJaf+xiG
        StN+Sl9Y0Mx4NGhUQzQqfx9IFn0DGoy/6y1pkSo+txtG786iwAZcLHyzFLDLQMLvKjEg
        cVBg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82RYdxOjioM="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id d00eabw2GGYmDtJ
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 16 Mar 2020 17:34:48 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 2/3] clk: renesas: rcar-gen3: mark RWDT clocks as ignore-unused
Date:   Mon, 16 Mar 2020 17:34:38 +0100
Message-Id: <1584376479-25258-3-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
References: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
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
index ff5b302..99db19e 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -289,7 +289,9 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a7795_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -484,6 +486,8 @@ const struct cpg_mssr_info r8a7795_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a7795_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a7795_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a7795_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a7795_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a7795_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index e8d466d..2a81174 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -264,7 +264,9 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a7796_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -364,6 +366,8 @@ const struct cpg_mssr_info r8a7796_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a7796_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a7796_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a7796_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a7796_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a7796_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 7a05a2f..541a932 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -265,6 +265,9 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 static const unsigned int r8a77965_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a77965_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -350,6 +353,8 @@ const struct cpg_mssr_info r8a77965_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks		= r8a77965_crit_mod_clks,
 	.num_crit_mod_clks	= ARRAY_SIZE(r8a77965_crit_mod_clks),
+	.ignore_unused_mod_clks		= r8a77965_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks	= ARRAY_SIZE(r8a77965_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init			= r8a77965_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index cbed376..402aae8 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -167,7 +167,9 @@ static const struct mssr_mod_clk r8a77970_mod_clks[] __initconst = {
 static const unsigned int r8a77970_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a77970_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -267,6 +269,8 @@ const struct cpg_mssr_info r8a77970_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77970_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77970_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a77970_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a77970_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77970_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 7227f67..80f3582 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -182,7 +182,9 @@ static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
 static const unsigned int r8a77980_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a77980_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -238,6 +240,8 @@ const struct cpg_mssr_info r8a77980_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77980_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77980_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a77980_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a77980_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77980_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 8eda2e3..0d5902c 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -247,6 +247,9 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 static const unsigned int r8a77990_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a77990_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -296,6 +299,8 @@ const struct cpg_mssr_info r8a77990_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77990_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77990_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a77990_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a77990_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77990_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 056ebf3..c5277e1 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -185,7 +185,9 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 static const unsigned int r8a77995_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a77995_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -235,6 +237,8 @@ const struct cpg_mssr_info r8a77995_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77995_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77995_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a77995_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a77995_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77995_cpg_mssr_init,
-- 
2.7.4


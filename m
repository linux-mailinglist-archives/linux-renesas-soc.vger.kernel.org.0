Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060231CE08A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 18:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730336AbgEKQeO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 12:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730228AbgEKQeO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 12:34:14 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26455C061A0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2020 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589214852;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=idLjoml/n0aY2mGHF79bsTQJ8OW+5pVkiHz3MYIIFpQ=;
        b=GKs9mKXTA73aypwvfLbIBkx6YidDxfyNPKbTCzswh8mv6OupDynQqNkaIzvLdYakUR
        4fpwy58k2KJFIneN93mYnW8L3gu1wVCnCYVbcCMd6TysRSOXyRZDLUGr8A99H56XBotT
        mQyAybamK+etJzotEFmbus2/I2hmw+5jJg0cGukKZOePeEnJrr7ffDgIpvofqTSEJHnY
        S7gvncNjrt2MYsCvJ/BHo+bbBDGtPOzRc+IlAT0mbbBXD6cnaTN6/qYd9fC+RO3tzUpx
        FfRWAm5DK/7fXFDBgHR5NLkiY87cCdcekXRAi3UcFzk9X3hb0RMFUmkMSyD7SR186otC
        uDmg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR92REa5ElWg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id Z0acdaw4BGYBDFt
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 11 May 2020 18:34:11 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 3/3] clk: renesas: rzg2: mark RWDT clock as never-disable
Date:   Mon, 11 May 2020 18:33:58 +0200
Message-Id: <1589214838-18075-4-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
References: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ensures RWDT remains alert throughout the boot process if enabled.

This patch applies the change to the following SoCs: r8a774a1,
r8a774b1 and r8a774c0.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index e05bfa2..be88403 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -239,6 +239,9 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 static const unsigned int r8a774a1_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a774a1_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -324,6 +327,8 @@ const struct cpg_mssr_info r8a774a1_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a774a1_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a774a1_crit_mod_clks),
+	.never_disable_mod_clks = r8a774a1_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a774a1_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a774a1_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index c9af7091..230a82e 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -235,6 +235,9 @@ static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
 static const unsigned int r8a774b1_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a774b1_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -320,6 +323,8 @@ const struct cpg_mssr_info r8a774b1_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a774b1_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a774b1_crit_mod_clks),
+	.never_disable_mod_clks = r8a774b1_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a774b1_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a774b1_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index f91e7a4..6bd74de 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -240,6 +240,9 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 static const unsigned int r8a774c0_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a774c0_never_disable_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -289,6 +292,8 @@ const struct cpg_mssr_info r8a774c0_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a774c0_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a774c0_crit_mod_clks),
+	.never_disable_mod_clks = r8a774c0_never_disable_mod_clks,
+	.num_never_disable_mod_clks = ARRAY_SIZE(r8a774c0_never_disable_mod_clks),
 
 	/* Callbacks */
 	.init = r8a774c0_cpg_mssr_init,
-- 
2.7.4


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A348187019
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732021AbgCPQfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:35:02 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:13689 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732065AbgCPQfC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1584376498;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=NJPwdZ2C0/nrRzgoRv0Uhf+wjuCfwYJrBaLq5kMFTkA=;
        b=ROTYzmEI1mZkZepSqTrM3+5MJ/mAqDKNHQN93TDZfkPPupVDPyZhasq+aerHVDd2gw
        osNqmVTkNNzq0NUJwqjA6vcpIRjoJswE7sglgYX1V88Wf+m4RHloD9sXkm3+Uvfp5+lA
        HNr6yOVprD8NMNf6GkxpZ9kEl9cWc/MThGjbBAJ0kBEF7Xx81BUNNLJlPa9N8XfSZb0W
        NBrVNPuaY5s2TxA5vJRkvcrZhOx44z+SsPVh/rpdL1nPIHFhrPGsXgEmnCsZHPgyM0gN
        lkIZ6b9kP9eJowWXE/mW/ROKwnDK0lBjVpT+nX8DZsP6/8C4SdZKP3QMfO83pcJB1Dbd
        bkMQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82RYdxOjioM="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id d00eabw2GGYnDtK
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 16 Mar 2020 17:34:49 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 3/3] clk: renesas: rzg2: mark RWDT clock as ignore-unused
Date:   Mon, 16 Mar 2020 17:34:39 +0100
Message-Id: <1584376479-25258-4-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
References: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
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
index e05bfa2..8573828 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -239,6 +239,9 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 static const unsigned int r8a774a1_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a774a1_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -324,6 +327,8 @@ const struct cpg_mssr_info r8a774a1_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a774a1_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a774a1_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a774a1_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a774a1_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a774a1_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index c9af7091..20666ce 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -235,6 +235,9 @@ static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
 static const unsigned int r8a774b1_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a774b1_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -320,6 +323,8 @@ const struct cpg_mssr_info r8a774b1_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a774b1_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a774b1_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a774b1_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a774b1_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a774b1_cpg_mssr_init,
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index f91e7a4..9cc5c50 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -240,6 +240,9 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 static const unsigned int r8a774c0_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a774c0_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -289,6 +292,8 @@ const struct cpg_mssr_info r8a774c0_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a774c0_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a774c0_crit_mod_clks),
+	.ignore_unused_mod_clks = r8a774c0_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a774c0_ignore_unused_mod_clks),
 
 	/* Callbacks */
 	.init = r8a774c0_cpg_mssr_init,
-- 
2.7.4


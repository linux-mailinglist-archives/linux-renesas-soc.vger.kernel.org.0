Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5ED7927FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Sep 2023 18:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237388AbjIEQEO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Sep 2023 12:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354760AbjIEOIV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2023 10:08:21 -0400
X-Greylist: delayed 478 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 07:08:15 PDT
Received: from frontal.iot.bzh (058728349.box.freepro.com [95.178.89.150])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAE61A7;
        Tue,  5 Sep 2023 07:08:15 -0700 (PDT)
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 803BD23370;
        Tue,  5 Sep 2023 16:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=WWkR
        CdGj6MDt6iusMxgyQpCn16QEvU1U9Q6Tc+H/T8Y=; b=WfN49RzvNL6O64FC67z6
        zZf5rDATitsNO5aXfJ7fbjwESRmuKsnREXHG1aKVynSU7AHeVn/UvwdRsyNuUZAr
        86F7ytg54d+sxvuWixoEOeOdPpO+eILMAe60JJRmXf/DfCZU3Bc044KADf3Wq7KW
        JfYTQsOABjNHOSLFlqztrh31Pz6rQQKSWQ9HlioPI9UE9iFR9bDky9Qsa2jbRVO+
        Z1yz8ksmjdj1IgYBfPccON7zdBC79LS2oPoN3klcJeYyHzCL/+vN3sICD9ckdqr0
        C0bdIK6BSsLadn2dfg+WOyAXm+1pbMi7I7CS1hu8gfjjDVlSyjyQ/NIyQe+uBPpV
        hQ==
From:   Aymeric Aillet <aymeric.aillet@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     aymeric.aillet@iot.bzh, geert+renesas@glider.be,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH 1/1] clk: renesas: Mark concerned clocks as "ignore_unused"
Date:   Tue,  5 Sep 2023 16:00:08 +0200
Message-Id: <20230905140008.136263-1-aymeric.aillet@iot.bzh>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In order to avoid Linux from gating clocks that are used by
another OS running at the same time (eg. RTOS), we are adding
the "CLK_IGNORE_UNUSED" flag to the concerned clocks.

As for now, list of clocks to be flagged have been completed
depending of features that are supported by Renesas SoCs/boards
port in Zephyr RTOS.

Signed-off-by: Aymeric Aillet <aymeric.aillet@iot.bzh>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 16 ++++++++++++++++
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 10 ++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |  9 +++++++++
 drivers/clk/renesas/renesas-cpg-mssr.h  |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ad20b3301ef6..82465354b100 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -288,6 +288,18 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("scu-src0",		1031,	MOD_CLK_ID(1017)),
 };
 
+static const unsigned int r8a7795_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(206),	/* SCIF1 */
+	MOD_CLK_ID(303),	/* CMT0 */
+	MOD_CLK_ID(310),	/* SCIF2 */
+	MOD_CLK_ID(523),	/* PWM */
+	MOD_CLK_ID(906),	/* GPIO6 */
+	MOD_CLK_ID(907),	/* GPIO5 */
+	MOD_CLK_ID(916),	/* CAN0 */
+	MOD_CLK_ID(929),	/* I2C2 */
+	MOD_CLK_ID(927),	/* I2C4 */
+};
+
 static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
@@ -388,6 +400,10 @@ const struct cpg_mssr_info r8a7795_cpg_mssr_info __initconst = {
 	.num_mod_clks = ARRAY_SIZE(r8a7795_mod_clks),
 	.num_hw_mod_clks = 12 * 32,
 
+	/* Ignore Unused Module Clocks */
+	.ignore_unused_mod_clks = r8a7795_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a7795_ignore_unused_mod_clks),
+
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a7795_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a7795_crit_mod_clks),
diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index f721835c7e21..ceae94c1c7dc 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -168,6 +168,12 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("ufs",		1514,	R8A779F0_CLK_S0D4_HSC),
 };
 
+static const unsigned int r8a779f0_ignore_unused_mod_clks[] __initconst = {
+	MOD_CLK_ID(702),	/* SCIF0 */
+	MOD_CLK_ID(704),	/* SCIF3 */
+	MOD_CLK_ID(915),	/* PFC0 */
+};
+
 static const unsigned int r8a779f0_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(907),	/* WDT */
 };
@@ -226,6 +232,10 @@ const struct cpg_mssr_info r8a779f0_cpg_mssr_info __initconst = {
 	.num_mod_clks = ARRAY_SIZE(r8a779f0_mod_clks),
 	.num_hw_mod_clks = 28 * 32,
 
+	/* Ignore Unused Module Clocks */
+	.ignore_unused_mod_clks = r8a779f0_ignore_unused_mod_clks,
+	.num_ignore_unused_mod_clks = ARRAY_SIZE(r8a779f0_ignore_unused_mod_clks),
+
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a779f0_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a779f0_crit_mod_clks),
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index cb80d1bf6c7c..8e08a13e6904 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -444,6 +444,15 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	clock->priv = priv;
 	clock->hw.init = &init;
 
+	for (i = 0; i < info->num_ignore_unused_mod_clks; i++) {
+		if (id == info->ignore_unused_mod_clks[i]) {
+			dev_dbg(dev, "MSTP %s setting CLK_IGNORE_UNUSED\n",
+				    mod->name);
+			init.flags |= CLK_IGNORE_UNUSED;
+			break;
+		}
+	}
+
 	for (i = 0; i < info->num_crit_mod_clks; i++)
 		if (id == info->crit_mod_clks[i] &&
 		    cpg_mstp_clock_is_enabled(&clock->hw)) {
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 80c5b462924a..da5e999c23b0 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -140,6 +140,10 @@ struct cpg_mssr_info {
 	unsigned int num_mod_clks;
 	unsigned int num_hw_mod_clks;
 
+	/* Module Clocks that should not be gated */
+	const unsigned int *ignore_unused_mod_clks;
+	unsigned int num_ignore_unused_mod_clks;
+
 	/* Critical Module Clocks that should not be disabled */
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
-- 
2.25.1



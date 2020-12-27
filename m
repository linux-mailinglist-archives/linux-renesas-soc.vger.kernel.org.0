Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E562E3244
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 18:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgL0Rmz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 12:42:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:46760 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgL0Rmy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 12:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=O19QlhRLBG4U13
        bswK9sP+O1g9XQknoP24IjzD0xFno=; b=wjFaGTEOSy7dv28waKTKuU4idlMfcb
        JuiMC7Z+owUizyhys+bNWPfp6XAf58SgDXdHXx/DyVCnbggs1Ww3gvC9EADlArgy
        t8iSUwlR539UCDf/TcLD06AuskZArZbIbdMwyAeUAqVXAAKEkM7wBBDciu/Z+iQV
        5IhgmXpmBvvhM=
Received: (qmail 1557037 invoked from network); 27 Dec 2020 18:42:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 18:42:12 +0100
X-UD-Smtp-Session: l3s3148p1@+dZfrXW3Up5UhsuJ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] clk: renesas: rcar-gen3: remove cpg_quirks access when registering SD clock
Date:   Sun, 27 Dec 2020 18:41:56 +0100
Message-Id: <20201227174202.40834-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We want to reuse SD clock handling for other SoCs and, thus, need to
generalize it. So, don't access cpg_quirks in that realm.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 063b61151488..3b2eb46b7e58 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -375,15 +375,9 @@ static const struct clk_ops cpg_sd_clock_ops = {
 	.set_rate = cpg_sd_clock_set_rate,
 };
 
-static u32 cpg_quirks __initdata;
-
-#define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
-#define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
-#define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
-
 static struct clk * __init cpg_sd_clk_register(const char *name,
 	void __iomem *base, unsigned int offset, const char *parent_name,
-	struct raw_notifier_head *notifiers)
+	struct raw_notifier_head *notifiers, bool skip_first)
 {
 	struct clk_init_data init;
 	struct sd_clock *clock;
@@ -405,7 +399,7 @@ static struct clk * __init cpg_sd_clk_register(const char *name,
 	clock->div_table = cpg_sd_div_table;
 	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
 
-	if (cpg_quirks & SD_SKIP_FIRST) {
+	if (skip_first) {
 		clock->div_table++;
 		clock->div_num--;
 	}
@@ -518,6 +512,12 @@ static struct clk * __init cpg_rpcd2_clk_register(const char *name,
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
+static u32 cpg_quirks __initdata;
+
+#define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
+#define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
+#define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
+
 
 static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 	{
@@ -613,7 +613,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN3_SD:
 		return cpg_sd_clk_register(core->name, base, core->offset,
-					   __clk_get_name(parent), notifiers);
+					   __clk_get_name(parent), notifiers,
+					   cpg_quirks & SD_SKIP_FIRST);
 
 	case CLK_TYPE_GEN3_R:
 		if (cpg_quirks & RCKCR_CKSEL) {
-- 
2.28.0


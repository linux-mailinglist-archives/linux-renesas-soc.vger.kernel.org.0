Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E8A34A5E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 11:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCZKzG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 06:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhCZKys (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 06:54:48 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6C8C0613B1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Mar 2021 03:54:47 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by andre.telenet-ops.be with bizsmtp
        id kyum2400M53vE1T01yumVY; Fri, 26 Mar 2021 11:54:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPk73-00AWZz-T7; Fri, 26 Mar 2021 11:54:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPk73-006bgh-3v; Fri, 26 Mar 2021 11:54:45 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Zero init clk_init_data
Date:   Fri, 26 Mar 2021 11:54:34 +0100
Message-Id: <20210326105434.1574796-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As clk_core_populate_parent_map() checks clk_init_data.num_parents
first, and checks clk_init_data.parent_names[] before
clk_init_data.parent_data[] and clk_init_data.parent_hws[], leaving the
latter uninitialized doesn't do harm for now.  However, it is better to
play it safe, and initialize all clk_init_data structures to zeroes, to
avoid any current and future members containing uninitialized data.

Remove a few explicit zero initializers, which are now superfluous.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.13.

 drivers/clk/renesas/clk-div6.c            | 3 +--
 drivers/clk/renesas/clk-mstp.c            | 2 +-
 drivers/clk/renesas/r9a06g032-clocks.c    | 8 ++++----
 drivers/clk/renesas/rcar-cpg-lib.c        | 2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c       | 3 +--
 drivers/clk/renesas/rcar-gen3-cpg.c       | 2 +-
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 5 +----
 drivers/clk/renesas/renesas-cpg-mssr.c    | 2 +-
 8 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 5ca183e701667b46..8fb68e703a6bab8c 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -216,7 +216,7 @@ struct clk * __init cpg_div6_register(const char *name,
 				      struct raw_notifier_head *notifiers)
 {
 	unsigned int valid_parents;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct div6_clock *clock;
 	struct clk *clk;
 	unsigned int i;
@@ -267,7 +267,6 @@ struct clk * __init cpg_div6_register(const char *name,
 	/* Register the clock. */
 	init.name = name;
 	init.ops = &cpg_div6_clock_ops;
-	init.flags = 0;
 	init.parent_names = parent_names;
 	init.num_parents = valid_parents;
 
diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index a9e91d9b3cdcb135..6e3c4a9c16b07ae9 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -151,7 +151,7 @@ static struct clk * __init cpg_mstp_clock_register(const char *name,
 	const char *parent_name, unsigned int index,
 	struct mstp_clock_group *group)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct mstp_clock *clock;
 	struct clk *clk;
 
diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 892e91b92f2c80f5..77beb876fd7423fd 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -504,7 +504,7 @@ r9a06g032_register_gate(struct r9a06g032_priv *clocks,
 {
 	struct clk *clk;
 	struct r9a06g032_clk_gate *g;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 
 	g = kzalloc(sizeof(*g), GFP_KERNEL);
 	if (!g)
@@ -674,7 +674,7 @@ r9a06g032_register_div(struct r9a06g032_priv *clocks,
 {
 	struct r9a06g032_clk_div *div;
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	unsigned int i;
 
 	div = kzalloc(sizeof(*div), GFP_KERNEL);
@@ -758,7 +758,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *clocks,
 {
 	struct clk *clk;
 	struct r9a06g032_clk_bitsel *g;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *names[2];
 
 	/* allocate the gate */
@@ -849,7 +849,7 @@ r9a06g032_register_dualgate(struct r9a06g032_priv *clocks,
 {
 	struct r9a06g032_clk_dualgate *g;
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 
 	/* allocate the gate */
 	g = kzalloc(sizeof(*g), GFP_KERNEL);
diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index 7e7e5d1341d5e80c..5678768ee1f2ca58 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -226,7 +226,7 @@ struct clk * __init cpg_sd_clk_register(const char *name,
 	void __iomem *base, unsigned int offset, const char *parent_name,
 	struct raw_notifier_head *notifiers, bool skip_first)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sd_clock *clock;
 	struct clk *clk;
 	u32 val;
diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rcar-gen2-cpg.c
index d4fa3dc3e2a2632f..edae874fa2b63369 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.c
+++ b/drivers/clk/renesas/rcar-gen2-cpg.c
@@ -137,7 +137,7 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 					      const char *parent_name,
 					      void __iomem *base)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct cpg_z_clk *zclk;
 	struct clk *clk;
 
@@ -147,7 +147,6 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 
 	init.name = name;
 	init.ops = &cpg_z_clk_ops;
-	init.flags = 0;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 17826599e9dd0e02..caa0f9414e45fe73 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -143,7 +143,7 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 					      unsigned int div,
 					      unsigned int offset)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct cpg_z_clk *zclk;
 	struct clk *clk;
 
diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index 3abafd78f7c8a570..34a85dc95beb87a9 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -144,7 +144,7 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct usb2_clock_sel_priv *priv;
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -188,9 +188,6 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 
 	init.name = "rcar_usb2_clock_sel";
 	init.ops = &usb2_clock_sel_clock_ops;
-	init.flags = 0;
-	init.parent_names = NULL;
-	init.num_parents = 0;
 	priv->hw.init = &init;
 
 	clk = clk_register(NULL, &priv->hw);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index bffbc3d2faf5fa16..fc531d35b269d3cd 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -408,7 +408,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	struct mstp_clock *clock = NULL;
 	struct device *dev = priv->dev;
 	unsigned int id = mod->id;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *parent, *clk;
 	const char *parent_name;
 	unsigned int i;
-- 
2.25.1


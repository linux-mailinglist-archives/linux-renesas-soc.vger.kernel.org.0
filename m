Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4655697E29
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Feb 2023 15:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjBOOR6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 09:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBOOR5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 09:17:57 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A656181
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 06:17:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:2521:459c:4528:7ba9])
        by michel.telenet-ops.be with bizsmtp
        id MSHq2900B4e7GJY06SHq5p; Wed, 15 Feb 2023 15:17:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSIbA-00966q-QN;
        Wed, 15 Feb 2023 15:17:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSIbW-004cmb-Ft;
        Wed, 15 Feb 2023 15:17:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: rsnd: adg: Fix BRG typos
Date:   Wed, 15 Feb 2023 15:17:41 +0100
Message-Id: <ac6365c17861d71fbc89d823089db4aafdb763ed.1676470202.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"BRG" stands for "Baud Rate Generator", but is frequently misspelled as
"RBG".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/sh/rcar/adg.c | 64 ++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 7bc4421835d7261f..0b8926600d900a68 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -39,10 +39,10 @@ struct rsnd_adg {
 	int clkin_size;
 	int clkout_size;
 	u32 ckr;
-	u32 rbga;
-	u32 rbgb;
+	u32 brga;
+	u32 brgb;
 
-	int rbg_rate[ADG_HZ_SIZE]; /* RBGA / RBGB */
+	int brg_rate[ADG_HZ_SIZE]; /* BRGA / BRGB */
 };
 
 #define for_each_rsnd_clkin(pos, adg, i)	\
@@ -75,7 +75,7 @@ static const char * const clkout_name_gen2[] = {
 	[CLKOUT3] = "audio_clkout3",
 };
 
-static u32 rsnd_adg_calculate_rbgx(unsigned long div)
+static u32 rsnd_adg_calculate_brgx(unsigned long div)
 {
 	int i;
 
@@ -131,8 +131,8 @@ static void __rsnd_adg_get_timesel_ratio(struct rsnd_priv *priv,
 		adg->clkin_rate[CLKA],	/* 0000: CLKA */
 		adg->clkin_rate[CLKB],	/* 0001: CLKB */
 		adg->clkin_rate[CLKC],	/* 0010: CLKC */
-		adg->rbg_rate[ADG_HZ_441],	/* 0011: RBGA */
-		adg->rbg_rate[ADG_HZ_48],	/* 0100: RBGB */
+		adg->brg_rate[ADG_HZ_441],	/* 0011: BRGA */
+		adg->brg_rate[ADG_HZ_48],	/* 0100: BRGB */
 	};
 
 	min = ~0;
@@ -323,10 +323,10 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 	/*
 	 * find divided clock from BRGA/BRGB
 	 */
-	if (rate == adg->rbg_rate[ADG_HZ_441])
+	if (rate == adg->brg_rate[ADG_HZ_441])
 		return 0x10;
 
-	if (rate == adg->rbg_rate[ADG_HZ_48])
+	if (rate == adg->brg_rate[ADG_HZ_48])
 		return 0x20;
 
 	return -EIO;
@@ -358,13 +358,13 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		ckr = 0x80000000; /* BRGB output = 48kHz */
 
 	rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr | ckr);
-	rsnd_mod_write(adg_mod, BRRA,  adg->rbga);
-	rsnd_mod_write(adg_mod, BRRB,  adg->rbgb);
+	rsnd_mod_write(adg_mod, BRRA,  adg->brga);
+	rsnd_mod_write(adg_mod, BRRB,  adg->brgb);
 
 	dev_dbg(dev, "CLKOUT is based on BRG%c (= %dHz)\n",
 		(ckr) ? 'B' : 'A',
-		(ckr) ?	adg->rbg_rate[ADG_HZ_48] :
-			adg->rbg_rate[ADG_HZ_441]);
+		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
+			adg->brg_rate[ADG_HZ_441]);
 
 	return 0;
 }
@@ -484,7 +484,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np = dev->of_node;
 	struct property *prop;
-	u32 ckr, rbgx, rbga, rbgb;
+	u32 ckr, brgx, brga, brgb;
 	u32 rate, div;
 	u32 req_rate[ADG_HZ_SIZE] = {};
 	uint32_t count = 0;
@@ -501,8 +501,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	};
 
 	ckr = 0;
-	rbga = 2; /* default 1/6 */
-	rbgb = 2; /* default 1/6 */
+	brga = 2; /* default 1/6 */
+	brgb = 2; /* default 1/6 */
 
 	/*
 	 * ADG supports BRRA/BRRB output only
@@ -543,30 +543,30 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 		if (0 == rate) /* not used */
 			continue;
 
-		/* RBGA */
-		if (!adg->rbg_rate[ADG_HZ_441] && (0 == rate % 44100)) {
+		/* BRGA */
+		if (!adg->brg_rate[ADG_HZ_441] && (0 == rate % 44100)) {
 			div = 6;
 			if (req_Hz[ADG_HZ_441])
 				div = rate / req_Hz[ADG_HZ_441];
-			rbgx = rsnd_adg_calculate_rbgx(div);
-			if (BRRx_MASK(rbgx) == rbgx) {
-				rbga = rbgx;
-				adg->rbg_rate[ADG_HZ_441] = rate / div;
+			brgx = rsnd_adg_calculate_brgx(div);
+			if (BRRx_MASK(brgx) == brgx) {
+				brga = brgx;
+				adg->brg_rate[ADG_HZ_441] = rate / div;
 				ckr |= brg_table[i] << 20;
 				if (req_Hz[ADG_HZ_441])
 					parent_clk_name = __clk_get_name(clk);
 			}
 		}
 
-		/* RBGB */
-		if (!adg->rbg_rate[ADG_HZ_48] && (0 == rate % 48000)) {
+		/* BRGB */
+		if (!adg->brg_rate[ADG_HZ_48] && (0 == rate % 48000)) {
 			div = 6;
 			if (req_Hz[ADG_HZ_48])
 				div = rate / req_Hz[ADG_HZ_48];
-			rbgx = rsnd_adg_calculate_rbgx(div);
-			if (BRRx_MASK(rbgx) == rbgx) {
-				rbgb = rbgx;
-				adg->rbg_rate[ADG_HZ_48] = rate / div;
+			brgx = rsnd_adg_calculate_brgx(div);
+			if (BRRx_MASK(brgx) == brgx) {
+				brgb = brgx;
+				adg->brg_rate[ADG_HZ_48] = rate / div;
 				ckr |= brg_table[i] << 16;
 				if (req_Hz[ADG_HZ_48])
 					parent_clk_name = __clk_get_name(clk);
@@ -620,8 +620,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 
 rsnd_adg_get_clkout_end:
 	adg->ckr = ckr;
-	adg->rbga = rbga;
-	adg->rbgb = rbgb;
+	adg->brga = brga;
+	adg->brgb = brgb;
 
 	return 0;
 
@@ -663,9 +663,9 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 			__clk_get_name(clk), clk, clk_get_rate(clk));
 
 	dbg_msg(dev, m, "BRGCKR = 0x%08x, BRRA/BRRB = 0x%x/0x%x\n",
-		adg->ckr, adg->rbga, adg->rbgb);
-	dbg_msg(dev, m, "BRGA (for 44100 base) = %d\n", adg->rbg_rate[ADG_HZ_441]);
-	dbg_msg(dev, m, "BRGB (for 48000 base) = %d\n", adg->rbg_rate[ADG_HZ_48]);
+		adg->ckr, adg->brga, adg->brgb);
+	dbg_msg(dev, m, "BRGA (for 44100 base) = %d\n", adg->brg_rate[ADG_HZ_441]);
+	dbg_msg(dev, m, "BRGB (for 48000 base) = %d\n", adg->brg_rate[ADG_HZ_48]);
 
 	/*
 	 * Actual CLKOUT will be exchanged in rsnd_adg_ssi_clk_try_start()
-- 
2.34.1


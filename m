Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE8B6D6472
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 16:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235724AbjDDOAR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 10:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbjDDOAB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 10:00:01 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE0E4C2D;
        Tue,  4 Apr 2023 06:59:34 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3E0745821B9;
        Tue,  4 Apr 2023 09:57:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 09:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680616656; x=1680623856; bh=bJqJ0P6+psuWExoI1fA2XVEdZfg1DGPsZI0
        g3ZQ6rmk=; b=lXRiCfm457zCaIcSdgd+NtUR4DjPaQJnJYuV6sWVEjg51E/3bn2
        BCC3QgUItq1wdLbsd5z/6THsK8mAWBfUSSpCi3uNq8h0MwzxziXD1LhoErK7ZfKP
        737IetRiK1GdpGI2ZvMoh4qdsHVC4uQ78lmcGCUkDdLceUodYmPVZ00od7uPNhB0
        MtFojM33p9+wfWl8SkmLyUMzERR79WJjtLuHsDBxYmXudXmOwLIHWNYhBka1BHf9
        2dQ+8VU9ZJ/cHjCyzGAFM/zzl5Yfg715g6t4VSbfHuWxqw5YCjUdo/fp38kF82yL
        9g2JAvfdH07OmA3gI6zySb2DG1oNb2ffEqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680616656; x=1680623856; bh=bJqJ0P6+psuWExoI1fA2XVEdZfg1DGPsZI0
        g3ZQ6rmk=; b=LcWidrLZlhVIRFGSavJIMKf3CZRYGCyQXZLviYSbU7+B5vTXxRt
        zIrCPtEqcDqmq39UYypfUixZFfe8CBPqOn0UlanVNubuy+bKsJu4Dz1n4kJp6xO5
        fnY3wib6omxgl6W2szBIoITzKff2whkmg7fPmcG3TP19GMfl828bUE3LdeDhBRoN
        8hVJH3KpuRpK6kK2RBiAViRMebObJ4rpyAqZweFDDqWjEJIV51FS7ORpFIV3wPCN
        BAVOgCMjdGUkrgTU0RIVs6Bgl6OUhCaluE1URnMWg0UqzQuZYiDLBUp58QBqW87h
        fLV+XEFf5ItQvcss+Axp4tiKyhxcJACzSCw==
X-ME-Sender: <xms:0CwsZAIdIuzkx6_VUTv8gYdO031-XPZqBUSMdWRVN5oNzNUedBW6zw>
    <xme:0CwsZAJCZPK4UDz49abhGzK2ZhMynowjQpBwex1Rdp_TqjVST5pZiy6m-immKwaYK
    Oayi8wCL4CM11EbBAI>
X-ME-Received: <xmr:0CwsZAs_NtVFstCQRMfNpN3WKCGW2EwZGaCnmWe1z6FJ637PjZs8OdkpbfvlzQoeBQqdiflaYtjZc-rc6WlK_CrcbDflA4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0CwsZNYlxHHOQbbWQg3gW7P47hxBXmWxpXXG4WtykYqKh555TLxKoA>
    <xmx:0CwsZHYkDlySN7MLhFgBNYwdVhNYbJ1Bwrtqj4wsGp8zqXvR7Qx1ag>
    <xmx:0CwsZJAmdlgEyNeB1uLt98Rqw9tS5LZ-BtBeZac8J6Z9ZVcctyVb2g>
    <xmx:0CwsZInrZ_rlgUKL0Ggd0Iv-OI-gm6lZLVk8raXOzlv151IfIRXM6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 04 Apr 2023 12:11:50 +0200
Subject: [PATCH v3 60/65] clk: stm32: composite: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-60-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3849; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ZlhaMIDY35fqWgLez9zMe7F3lYqWmSY7jqPK6EAyXso=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37frTnpyI07mcUoQnywz705TOdt3Uo+CRTwPykh61e2Y
 /HtaRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZincHw3+FAsevutmNron2EJG33b0
 y22JHdKZe4o6fw0om38gw7zzL8rw6abyHomV6Z2Hg9TJQzKWmxSayk4ezyFcIpGwz4CnwZAQ==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=0.2 required=5.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The STM32 composite clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/stm32/clk-stm32-core.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 3247539683c9..d5aa09e9fce4 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -426,15 +426,15 @@ static unsigned long clk_stm32_composite_recalc_rate(struct clk_hw *hw,
 				      composite->div_id, parent_rate);
 }
 
-static long clk_stm32_composite_round_rate(struct clk_hw *hw, unsigned long rate,
-					   unsigned long *prate)
+static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
-
 	const struct stm32_div_cfg *divider;
+	unsigned long rate;
 
 	if (composite->div_id == NO_STM32_DIV)
-		return rate;
+		return 0;
 
 	divider = &composite->clock_data->dividers[composite->div_id];
 
@@ -445,14 +445,24 @@ static long clk_stm32_composite_round_rate(struct clk_hw *hw, unsigned long rate
 		val =  readl(composite->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-				divider->width, divider->flags,
-				val);
+		rate = divider_ro_round_rate(hw, req->rate, &req->best_parent_rate,
+					     divider->table, divider->width, divider->flags,
+					     val);
+		if (rate < 0)
+			return rate;
+
+		req->rate = rate;
+		return 0;
 	}
 
-	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 rate, prate, divider->table,
-					 divider->width, divider->flags);
+	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
+					 req->rate, &req->best_parent_rate,
+					 divider->table, divider->width, divider->flags);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static u8 clk_stm32_composite_get_parent(struct clk_hw *hw)
@@ -602,7 +612,7 @@ static void clk_stm32_composite_disable_unused(struct clk_hw *hw)
 const struct clk_ops clk_stm32_composite_ops = {
 	.set_rate	= clk_stm32_composite_set_rate,
 	.recalc_rate	= clk_stm32_composite_recalc_rate,
-	.round_rate	= clk_stm32_composite_round_rate,
+	.determine_rate	= clk_stm32_composite_determine_rate,
 	.get_parent	= clk_stm32_composite_get_parent,
 	.set_parent	= clk_stm32_composite_set_parent,
 	.enable		= clk_stm32_composite_gate_enable,

-- 
2.39.2


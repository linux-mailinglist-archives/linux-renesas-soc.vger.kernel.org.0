Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEB06F820A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 13:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjEEL3U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 07:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjEEL3S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 07:29:18 -0400
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4D019D;
        Fri,  5 May 2023 04:29:17 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 56BF22B067C5;
        Fri,  5 May 2023 07:29:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286151; x=1683293351; bh=ndjQ7HVeSN4i8zABollHrDBZww9ExlgvMkp
        LIBiyWjo=; b=T9Lw9zwl1j4gAchlAqf868n+ONsa8T1Jma6Kie6SQqc1JsZ8+up
        UPSosBn8a0prhr7B3JBHHvepawk7SM4AB0S50m0Z9C02z7dPGSqRReKS+VLkOHOB
        FAPs4SpSsVmTF3+8Ghz1q2Rhj1RpmWNUSZpmMQysHLSIw8WXIZrtTh71obkbsjSH
        xXAPhzeznignXNTp9Fx4tbHnMbWbffu1MCr9w91lyQKR3FITe4l3bYl8bB6ARjRR
        SYOOAUEPGmML0VGXkaomNLjq0zGLu1gJAkaJYA0h1OsbGOMdL91WfJCQZRm/h3ow
        /QukAyMhsUluR/jKby4pprO+Hv1jfHBgwLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286151; x=1683293351; bh=ndjQ7HVeSN4i8zABollHrDBZww9ExlgvMkp
        LIBiyWjo=; b=CF6WSKQYCI3E/jvMvy7zs1RZSdpsH0+IH+yaVCHNcUhncsNcedq
        cATqo/Attv11v0DdvvbcBfJ3OnGALuLFUIl3QgQ7iNo0D1vnIOfzTD0WF/GzKJlQ
        J5qxewihlTYG3fGiei38zNGWwMruRYaoRbBTPHykZEK2a2Si/2im4Msiwxme3Qdq
        A168MT4Bop8kBkgmRsV5K4u1vkuDErr6LrsCg/rdX6ubv2bTwsAPnRF0flo4awo5
        2E48YfpF4ZMmjNwZZklF/sc6h6g75NAtns98uYrlW965X5lN7wlZ3kcG7vD7VJ32
        L+dvZMF95jxVQTg9CV3DeNH0/bmh8wLKB1Q==
X-ME-Sender: <xms:h-hUZHkZbvPknp2uhhk8X9aGi9g2nwtaWY7fgCaXzPks-vfHbPaJXA>
    <xme:h-hUZK2qRUJ9AIN7EFOGhT9O5BPMFq1BXX5ZOalGfbC98TlXOpT9He__fzCru0SNx
    bVWR87jLDTODQ--9ng>
X-ME-Received: <xmr:h-hUZNpx3SN1tVrfCA1jJoyEqrUcIaDUXoJokh5g6QjG63oL9Jf2VjbenVoeey9CFNXkaHZkXPKN18AeqPY1qWzbvxn2xlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:h-hUZPnBbn94NkQEKEvHbnG2dNEDSaWJ3HzWEz6UeZ3oi0Hr2f1wBw>
    <xmx:h-hUZF0RPsBudEBxx_2_QL7vcNG8U86RLpUqgDh4H-Jv8xu81dOidA>
    <xmx:h-hUZOuOqcak98u8Mk2jcNEfbau8KqAAexmRK7VnFIq5AZP85OXh5Q>
    <xmx:h-hUZG_LJv11B8ecbvnvjZu0iT3jsoKOqbg0CYomkb7L4J0dvgDMfjXr3iQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:29:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:10 +0200
Subject: [PATCH v4 68/68] clk: Forbid to register a mux without
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v4-68-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Abel Vesa <abelvesa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        David Lechner <david@lechnology.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jaroslav Kysela <perex@perex.cz>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Peng Fan <peng.fan@nxp.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        patches@opensource.cirrus.com,
        Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4464; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3adLcMXzLNtbtn3jDq9B/uPJX8+PAXTnVm0BAOsWqLs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5f++bpla/KjT+HVHNwH3ZZ43W04aiYltLwmTObeLs9b
 +dfrO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARhmKG/8mm/ZL2RzblvZLa8tXGK5
 PzRLb6I/fSXxkpb5W8WG6VqDD8lRZM8Tofc+S4jfAN7mnZR1sD/rBeip/deyxP567/o2Z1XgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The determine_rate hook allows to select the proper parent and its rate
for a given clock configuration. On another hand, set_parent is there to
change the parent of a mux.

Some clocks provide a set_parent hook but don't implement
determine_rate. In such a case, set_parent is pretty much useless since
the clock framework will always assume the current parent is to be used,
and we will thus never change it.

This situation can be solved in two ways:
  - either we don't need to change the parent, and we thus shouldn't
    implement set_parent;
  - or we don't want to change the parent, in this case we should set
    CLK_SET_RATE_NO_REPARENT;
  - or we're missing a determine_rate implementation.

The latter is probably just an oversight from the driver's author, and
we should thus raise their awareness about the fact that the current
state of the driver is confusing.

All the drivers in-tree have been converted by now, so let's prevent any
clock with set_parent but without determine_rate to register so that it
can't sneak in again in the future.

Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "Andreas Färber" <afaerber@suse.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: David Lechner <david@lechnology.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Miles Chen <miles.chen@mediatek.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-actions@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: patches@opensource.cirrus.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e4a1d5f9694c..c8f9227c29c9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3775,6 +3775,13 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	if (core->ops->set_parent && !core->ops->determine_rate) {
+		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
+			__func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (core->num_parents > 1 && !core->ops->get_parent) {
 		pr_err("%s: %s must implement .get_parent as it has multi parents\n",
 		       __func__, core->name);

-- 
2.40.0


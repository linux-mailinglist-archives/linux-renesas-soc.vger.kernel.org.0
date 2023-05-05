Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 070FF6F81D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 13:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjEEL2J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 07:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjEEL2H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 07:28:07 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A38319938;
        Fri,  5 May 2023 04:27:55 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 0381F3200A7E;
        Fri,  5 May 2023 07:27:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286036; x=1683372436; bh=5gl4lefIAlBEyplk+arePhxAOx0OQI8aykj
        bGmOWegM=; b=YrdCWU+WAZN6KzggMpYMmzZgs9Zk7uiYgobBf0527276ESDqOyD
        K1acLbBjpjAEkDMZJ1vXxhgGXiynf1gHw8XFKZ0VhF2sLybH/R2uJDVnF39NsVSs
        g/W8MhNLbBvaapUUApGTcj9fjkegFNzzT8jNTqTy924DDQS3TNtH7sVfw74Sc31D
        7unoxwSt1lcf4WU7U5d6HhZkU1aWQaYxPfv8mKXeVEZDBb/EEwnZl9Fms2XtLtoV
        j3kVCEvVGRGLZEHiPAkZIODpCW9iFCey+arERKAlQIW9+mLgIWtr6gpHo5d6wpv5
        0sZ6UezIKRrQSlH7if8QqvrDFOSY0dGNM6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286036; x=1683372436; bh=5gl4lefIAlBEyplk+arePhxAOx0OQI8aykj
        bGmOWegM=; b=RoBbAH+vEpzTCF0xiSZaSl761nOOcPYisOqzDXWgnlGmH8xUTmi
        mskHVMI9Uq8i36eq2/4M78RIJmOMVdGL/rgu/iV/49SLQD18KlMGhCsx9uX4On+7
        jSLwT/aAGZUiorBWv/TClJI3YKPPLf0mOCe2x6umQSmmkG6r3EanwDySw+HgvjCZ
        uN7d6migR8gDezmxLR9AGji/y1ulC1LZQVlQ8fxyakSw2WiB0liki+iTkqiVEj+s
        lRAIC/LYk7XXHlLXRD5iBfGw2wH9gvYSNLybkNO2s6OVL3FPDoLKE7RoTW1RO4cA
        4EY8731pjDNRML3nx5PLPttqvDK5cRydU+g==
X-ME-Sender: <xms:FOhUZEoiVC7ubGrkdmmAvvTdmAwuHyvROAG4LnrthVQmw-J-svruQg>
    <xme:FOhUZKoxz2A606x2UcOgtsiMrFfROjVoprO9NnqUEhtFnPiqXcn4VWoqrN1Fggv3V
    6maZbRIxoPz-DjvrYQ>
X-ME-Received: <xmr:FOhUZJM574pPrfpi2rsITpHKwNB2TksIZhfAXOb9tu8109psZiODWWYtXBRsbRDsPjL7jd6onjZETvcOmJLmWVBDVH_71P0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FOhUZL4B_ed1LkTr8Gm7BcgLJ2cwgV-JvXQ8gQ1AaRSrVJfH_i5fLw>
    <xmx:FOhUZD42trH7SS5i2ANGxbX0Lu9CUriY0MVe4Gh1ZJ3qtBBe95i4HA>
    <xmx:FOhUZLhoX6Wi3mDdFBCBy8Ow4yWstHMMbVZ0gX6-q61jyW3Yue9EcA>
    <xmx:FOhUZJQm_-NXGVWeMGMXXoiZcGNwibTIUd1-sJ833DWTirJVgMqmZA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:16 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:33 +0200
Subject: [PATCH v4 31/68] clk: renesas: r9a06g032: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-31-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2367; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Ueh0dTmwRju76UtDYJSPwP9f2l4BHh1Cb+42vROXsMM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fY3NS6HZ+n9O9i2nS5fwJeYid0e6y3rNL5VbVP4tjR
 j1X6HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIjicjw7p3qeUTY8LUcjPWyM6w2e
 nHeeGL42/hVdfrtmQ8tLl5OouR4dkKH7meuRXHTyxTeb2qwDXthJ9KmMu52d0rHt7xzgyT4wYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas r9a06g032 bitselect clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Similarly, it doesn't look like the device tree using that clock driver
uses any of the assigned-clock properties on that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 40828616f723..55db63c7041a 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1121,6 +1121,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_bitselect_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = r9a06g032_clk_mux_get_parent,
 	.set_parent = r9a06g032_clk_mux_set_parent,
 };

-- 
2.40.0


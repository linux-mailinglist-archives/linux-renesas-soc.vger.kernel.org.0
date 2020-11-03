Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4FC2A4B48
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 17:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgKCQZC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 11:25:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:51678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728532AbgKCQZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:25:01 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A57820773;
        Tue,  3 Nov 2020 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604420700;
        bh=qxGUjyAKucLG+05VEGNWglb8mPI0UTja9MiuRVQDnWQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SZbyoJ5pnEf+2XmxMIM4Wz8VfXVkz422bs0tNq1TqfNT7AJ3RhQO56Mja9kGxdzyY
         Iw7uk5fZ9AL6sqennPXEvwVOJ6Jc3MQxwa1075nRhYBGvJSMwcMkcOvEKodk4r2u8s
         4fEdGjJlRddsgT8C75w5oWDwcBdAO8RssCG0zhU8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 6/8] clk: renesas: r8a779a0-cpg-mssr: add static to local function
Date:   Tue,  3 Nov 2020 17:24:33 +0100
Message-Id: <20201103162435.13689-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103162435.13689-1-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The function rcar_r8a779a0_cpg_clk_register() is not used outside of the
unit so it can be made static to fix compilation warning:

    drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:21: warning:
        no previous prototype for ‘rcar_r8a779a0_cpg_clk_register’ [-Wmissing-prototypes]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 17ebbac7ddfb..7e25b3b8945b 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -153,7 +153,7 @@ static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
 
-struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
+static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
 	struct raw_notifier_head *notifiers)
-- 
2.25.1


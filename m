Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F352A4B53
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 17:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgKCQZK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 11:25:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:51826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728209AbgKCQZI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:25:08 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88E22223AB;
        Tue,  3 Nov 2020 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604420707;
        bh=SanVrlJxei82XUzDoQ0j0q/1TrJYAyCBfZoNzZcHYms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZTCkpKFTdy/oHxFi4BqIJvjJASzLH+BQB/2GH2+d3wZA5soSEbxrGQHb4ckVyKwzH
         Rn5Amvc9htrCqAOrFcZmbFY2fKF/3GC5gbW1UwqHWznTR+JHmQEDCiHPosNpp3tvP0
         cMXTHiaJGLCxX522ty4i1VHBe7O/aBrAhR+S6FlQ=
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
Subject: [PATCH 8/8] clk: scpi: mark scpi_clk_match as maybe unused
Date:   Tue,  3 Nov 2020 17:24:35 +0100
Message-Id: <20201103162435.13689-8-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103162435.13689-1-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The scpi_clk_match (struct of_device_id) is referenced only with
CONFIG_OF builds thus mark it as __maybe_unused:

    drivers/clk/clk-scpi.c:132:34: warning:
        ‘scpi_clk_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 5a9b140dd8c8..a39af7616b13 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -129,7 +129,7 @@ static const struct clk_ops scpi_dvfs_ops = {
 	.set_rate = scpi_dvfs_set_rate,
 };
 
-static const struct of_device_id scpi_clk_match[] = {
+static const struct of_device_id scpi_clk_match[] __maybe_unused = {
 	{ .compatible = "arm,scpi-dvfs-clocks", .data = &scpi_dvfs_ops, },
 	{ .compatible = "arm,scpi-variable-clocks", .data = &scpi_clk_ops, },
 	{}
-- 
2.25.1


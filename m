Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD5E2A4B3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 17:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbgKCQYr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 11:24:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:51398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728266AbgKCQYq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:24:46 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2623522280;
        Tue,  3 Nov 2020 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604420686;
        bh=2wimUO+VSXbBzfuTHoe58Y6vRB6mfx+eV7EIjA1pLEM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0R9meRyiVbPBA93PiTRbY++uIv6dBNIgxhqBpRsVD/ZiULjZI4PAEpWU3QMkOrAtT
         GcOlz3xqU7BFW4Ji+m/ZAVhG3/N7VZXyVrStYNJbl9Va9qZjskzD5YYV+PcYjDpPaB
         Xrkhmx4cjWDskBmXNO7EUJoosAWB95UrJsNUnWSA=
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
Subject: [PATCH 2/8] clk: imx8mm: drop of_match_ptr from of_device_id table
Date:   Tue,  3 Nov 2020 17:24:29 +0100
Message-Id: <20201103162435.13689-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103162435.13689-1-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might be not relevant here).  This
fixes compile warning (!CONFIG_OF && !CONFIG_MODULES):

    drivers/clk/imx/clk-imx8mm.c:641:34: warning:
        ‘imx8mm_clk_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/imx/clk-imx8mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 0de0be0cf548..e27890b61fb6 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -653,7 +653,7 @@ static struct platform_driver imx8mm_clk_driver = {
 		 * reloading the driver will crash or break devices.
 		 */
 		.suppress_bind_attrs = true,
-		.of_match_table = of_match_ptr(imx8mm_clk_of_match),
+		.of_match_table = imx8mm_clk_of_match,
 	},
 };
 module_platform_driver(imx8mm_clk_driver);
-- 
2.25.1


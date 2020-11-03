Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B052A4B3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 17:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbgKCQYn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 11:24:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:51332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728266AbgKCQYn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:24:43 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A576B20674;
        Tue,  3 Nov 2020 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604420682;
        bh=oy0BIq1d1q74mC6j3/1prk2IjXyLRHfreCZtGCV8UV4=;
        h=From:To:Cc:Subject:Date:From;
        b=AgC4Zm9HcAnnExuc3aSR7BodaIW9ulmnWxnVFE1LdEdOMjW89BQ6TYPGvf96nbj10
         Lw1DdNRIJsmjCL6FAMI3cw27BvCOD2LVCCvbP9q12EpxfxvDu5sHPykyNTkktnArqh
         FIv8TbgEF4stkwGBaAs2wuQUqC2wxhMdNPuSD1TM=
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
Subject: [PATCH 1/8] clk: pwm: drop of_match_ptr from of_device_id table
Date:   Tue,  3 Nov 2020 17:24:28 +0100
Message-Id: <20201103162435.13689-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
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

    drivers/clk/clk-pwm.c:139:34: warning:
        ‘clk_pwm_dt_ids’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index 86f2e2d3fc02..da2c8eddfd9f 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -147,7 +147,7 @@ static struct platform_driver clk_pwm_driver = {
 	.remove = clk_pwm_remove,
 	.driver = {
 		.name = "pwm-clock",
-		.of_match_table = of_match_ptr(clk_pwm_dt_ids),
+		.of_match_table = clk_pwm_dt_ids,
 	},
 };
 
-- 
2.25.1


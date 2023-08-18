Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF71780DD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 16:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377192AbjHROS7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 10:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377222AbjHROSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 10:18:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2AF5272D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 07:18:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,183,1684767600"; 
   d="scan'208";a="176977884"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Aug 2023 23:18:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.81])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 48D1E401091D;
        Fri, 18 Aug 2023 23:18:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] regulator: raa215300: Update help description
Date:   Fri, 18 Aug 2023 15:18:15 +0100
Message-Id: <20230818141815.314197-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818141815.314197-1-biju.das.jz@bp.renesas.com>
References: <20230818141815.314197-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add module description to the help section and update the existing
help description.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZN3%2FSjL50ls+3dnD@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/regulator/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 086596239356..186b97c5aa16 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1072,7 +1072,11 @@ config REGULATOR_RAA215300
 	depends on COMMON_CLK
 	depends on I2C
 	help
-	  Support for the Renesas RAA215300 PMIC.
+	  If you say yes to this option, support will be included for the
+	  Renesas RAA215300 PMIC.
+
+	  Say M here if you want to include support for Renesas RAA215300 PMIC
+	  as a module. The module will be named "raa215300".
 
 config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	tristate "Raspberry Pi 7-inch touchscreen panel ATTINY regulator"
-- 
2.25.1


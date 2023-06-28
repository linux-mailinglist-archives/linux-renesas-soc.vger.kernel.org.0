Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E8574175D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jun 2023 19:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbjF1RkM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jun 2023 13:40:12 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:9889 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230119AbjF1RkK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2023 13:40:10 -0400
X-IronPort-AV: E=Sophos;i="6.01,166,1684767600"; 
   d="scan'208";a="169531629"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 29 Jun 2023 02:40:09 +0900
Received: from localhost.localdomain (unknown [10.226.93.22])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 546EF406972E;
        Thu, 29 Jun 2023 02:40:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] regulator: raa215300: Add build dependency with COMMON_CLK
Date:   Wed, 28 Jun 2023 18:40:04 +0100
Message-Id: <20230628174004.63984-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The COMMON_CLK config is not enabled in some of the architectures.
This causes build issues. Fix these issues by adding build dependency.

ERROR: modpost: "clk_unregister_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
ERROR: modpost: "clk_register_fixed_rate" [drivers/regulator/raa215300.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306282012.sPQAuAN7-lkp@intel.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/regulator/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 2c2405024ace..a61a1b8a1032 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1036,6 +1036,7 @@ config REGULATOR_QCOM_USB_VBUS
 config REGULATOR_RAA215300
 	tristate "Renesas RAA215300 driver"
 	select REGMAP_I2C
+	depends on COMMON_CLK
 	depends on I2C
 	help
 	  Support for the Renesas RAA215300 PMIC.
-- 
2.25.1


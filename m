Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CC5745D0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jul 2023 15:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGCNXv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jul 2023 09:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjGCNXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jul 2023 09:23:51 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 870D5E5A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jul 2023 06:23:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,178,1684767600"; 
   d="scan'208";a="166613684"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jul 2023 22:23:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DC7A34009BEB;
        Mon,  3 Jul 2023 22:23:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
Date:   Mon,  3 Jul 2023 14:23:43 +0100
Message-Id: <20230703132343.353878-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Modified Kconfig to enable module build support for RZ/G2L MTU3a driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6f5b259a6d6a..fb02a2913d46 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1348,7 +1348,7 @@ config MFD_SC27XX_PMIC
 	  and it also adds the irq_chip parts for handling the PMIC chip events.
 
 config RZ_MTU3
-	bool "Renesas RZ/G2L MTU3a core driver"
+	tristate "Renesas RZ/G2L MTU3a core driver"
 	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
 	help
 	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
-- 
2.25.1


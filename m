Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43FA632BC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 19:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiKUSLa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 13:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKUSL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 13:11:29 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7D9F0A3160
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 10:11:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,182,1665414000"; 
   d="scan'208";a="143437121"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2022 03:11:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.177])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6BE0840A598F;
        Tue, 22 Nov 2022 03:11:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] drm: rcar-du: Fix Kconfig dependency between DRM and RZG2L_MIPI_DSI
Date:   Mon, 21 Nov 2022 18:11:21 +0000
Message-Id: <20221121181121.168278-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When CONFIG_DRM=m and CONFIG_DRM_RZG2L_MIPI_DSI=y, it results in a
build failure. This patch fixes the build issue by adding dependency
to DRM.

Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref:
 * https://lore.kernel.org/linux-renesas-soc/OS0PR01MB592298E75153A52245D789D4860A9@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#u
---
 drivers/gpu/drm/rcar-du/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 1065dca885ef..b2bddbeca878 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -56,7 +56,7 @@ config DRM_RCAR_MIPI_DSI
 
 config DRM_RZG2L_MIPI_DSI
 	tristate "RZ/G2L MIPI DSI Encoder Support"
-	depends on DRM_BRIDGE && OF
+	depends on DRM && DRM_BRIDGE && OF
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_MIPI_DSI
 	help
-- 
2.25.1


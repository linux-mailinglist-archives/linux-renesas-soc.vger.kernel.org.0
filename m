Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198006F4084
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 May 2023 11:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbjEBJ5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 May 2023 05:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjEBJ5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2023 05:57:05 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2937B4C10
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 May 2023 02:57:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,243,1677510000"; 
   d="scan'208";a="161412034"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 May 2023 18:57:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B51B44006DC2;
        Tue,  2 May 2023 18:56:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v9 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Date:   Tue,  2 May 2023 10:56:28 +0100
Message-Id: <20230502095628.141313-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502095628.141313-1-biju.das.jz@bp.renesas.com>
References: <20230502095628.141313-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add my self as maintainer for RZ DU drivers.
While at it, update the entries for common parts, rcar-du and shmobile.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v8->v9:
 * Added Rb tag from Laurent.
 * Updated entries for common parts(Makefile and Kconfig).
v8:
 * New patch
---
 MAINTAINERS | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1218a2ec6d97..cbf9efc7293a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6948,7 +6948,7 @@ F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
-DRM DRIVERS FOR RENESAS
+DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
@@ -6959,9 +6959,19 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
-F:	drivers/gpu/drm/renesas/
+F:	drivers/gpu/drm/renesas/rcar-du/Kconfig
+F:	drivers/gpu/drm/renesas/rcar-du/Makefile
+F:	drivers/gpu/drm/renesas/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
 
+DRM DRIVERS FOR RENESAS RZ
+M:	Biju Das <biju.das.jz@bp.renesas.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+F:	drivers/gpu/drm/renesas/rz-du/
+
 DRM DRIVERS FOR ROCKCHIP
 M:	Sandy Huang <hjc@rock-chips.com>
 M:	Heiko Stübner <heiko@sntech.de>
-- 
2.25.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24CC265D60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 12:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgIKKHv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 06:07:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58032 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725554AbgIKKHt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 06:07:49 -0400
X-IronPort-AV: E=Sophos;i="5.76,414,1592838000"; 
   d="scan'208";a="56813791"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Sep 2020 19:07:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4762C4240D3B;
        Fri, 11 Sep 2020 19:07:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] drm: Kconfig: Update description for DRM_RCAR_DW_HDMI config
Date:   Fri, 11 Sep 2020 11:07:41 +0100
Message-Id: <20200911100741.20013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

rcar_dw_hdmi driver is also used on Renesas RZ/G2 SoC's, update the
same to reflect the description for DRM_RCAR_DW_HDMI config.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index f65d1489dc50..bd8b43fb9753 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -22,11 +22,11 @@ config DRM_RCAR_CMM
 	  Enable support for R-Car Color Management Module (CMM).
 
 config DRM_RCAR_DW_HDMI
-	tristate "R-Car DU Gen3 HDMI Encoder Support"
+	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
 	select DRM_DW_HDMI
 	help
-	  Enable support for R-Car Gen3 internal HDMI encoder.
+	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
 
 config DRM_RCAR_LVDS
 	tristate "R-Car DU LVDS Encoder Support"
-- 
2.17.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A84756427
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 15:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjGQNQg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 09:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbjGQNQH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 09:16:07 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B4E1FFC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 06:15:47 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
        by xavier.telenet-ops.be with bizsmtp
        id NDFl2A00A0ucMBo01DFlJC; Mon, 17 Jul 2023 15:15:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO4e-001frD-FH;
        Mon, 17 Jul 2023 15:15:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO4n-007Qms-Br;
        Mon, 17 Jul 2023 15:15:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3] drm/bridge_connector: Handle drm_connector_init_with_ddc() failures
Date:   Mon, 17 Jul 2023 15:15:44 +0200
Message-Id: <3a7e9540d8dc94298d021aa2fb046ae8616ca4dd.1689599701.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

drm_connector_init_with_ddc() can fail, but the call in
drm_bridge_connector_init() does not check that.  Fix this by adding
the missing error handling.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
v3:
  - Add Reviewed-by,

v2:
  - Move declaration of ret to its own line,
  - Add Reviewed-by.
---
 drivers/gpu/drm/drm_bridge_connector.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index fc6f16e14f367dad..1da93d5a1f614732 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -318,6 +318,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
 	int connector_type;
+	int ret;
 
 	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
@@ -368,8 +369,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	drm_connector_init_with_ddc(drm, connector, &drm_bridge_connector_funcs,
-				    connector_type, ddc);
+	ret = drm_connector_init_with_ddc(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
+	if (ret) {
+		kfree(bridge_connector);
+		return ERR_PTR(ret);
+	}
+
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
 	if (bridge_connector->bridge_hpd)
-- 
2.34.1


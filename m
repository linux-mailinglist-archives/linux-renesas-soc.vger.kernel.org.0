Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F76B756510
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 15:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjGQNeR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 09:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjGQNeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 09:34:16 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3240A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 06:34:15 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
        by laurent.telenet-ops.be with bizsmtp
        id NDaE2A0030ucMBo01DaEsE; Mon, 17 Jul 2023 15:34:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLOMX-001fzk-83;
        Mon, 17 Jul 2023 15:34:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLOMg-007RAi-4y;
        Mon, 17 Jul 2023 15:34:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] drm/panel: simple: Simplify matching using of_device_get_match_data()
Date:   Mon, 17 Jul 2023 15:34:13 +0200
Message-Id: <bca1d6f6a0582988accbb48d709aa9de7ad49ed7.1689600771.git.geert+renesas@glider.be>
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

Both the patform_driver and mipi_dsi_driver structures contain pointers
to the match table used, so the custom code to obtain match and match
data can be replaced by calls to of_device_get_match_data().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/panel/panel-simple.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 241243447b3e5c81..70326f335f44c295 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4457,13 +4457,13 @@ MODULE_DEVICE_TABLE(of, platform_of_match);
 
 static int panel_simple_platform_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *id;
+	const struct panel_desc *desc;
 
-	id = of_match_node(platform_of_match, pdev->dev.of_node);
-	if (!id)
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
 		return -ENODEV;
 
-	return panel_simple_probe(&pdev->dev, id->data);
+	return panel_simple_probe(&pdev->dev, desc);
 }
 
 static void panel_simple_platform_remove(struct platform_device *pdev)
@@ -4734,15 +4734,12 @@ MODULE_DEVICE_TABLE(of, dsi_of_match);
 static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct panel_desc_dsi *desc;
-	const struct of_device_id *id;
 	int err;
 
-	id = of_match_node(dsi_of_match, dsi->dev.of_node);
-	if (!id)
+	desc = of_device_get_match_data(&dsi->dev);
+	if (!desc)
 		return -ENODEV;
 
-	desc = id->data;
-
 	err = panel_simple_probe(&dsi->dev, &desc->desc);
 	if (err < 0)
 		return err;
-- 
2.34.1


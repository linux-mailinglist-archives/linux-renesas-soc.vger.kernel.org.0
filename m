Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D85966DF77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 14:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbjAQNx0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 08:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjAQNxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 08:53:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D933C2A9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 05:52:15 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CDDC471;
        Tue, 17 Jan 2023 14:52:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673963533;
        bh=8LQ0qfaUL2/HC55J0kE1QcsDS6Omt/aY1NupNg5Ximw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g0spKC14+T7Q5SyFt1CeVL9QeeXXwqxZZE3y45iOyomugeBQY3Ncv8AC+EoYtQKK5
         zgpjgLzUwzt7BlDvfX10oiMP/52rz7a5HG9MaMy9GcXcVZV5lzx8ClXIM3PCJkUIid
         Kg+CzsUNkVLbXe3oJCeU9kZw+m0Sa37rV+OfwM4Y=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 1/6] drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
Date:   Tue, 17 Jan 2023 15:51:49 +0200
Message-Id: <20230117135154.387208-2-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RCAR DSI driver uses reset controller, so we should select it in the
Kconfig.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index fd2c2eaee26b..a8f862c68b4f 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -55,6 +55,7 @@ config DRM_RCAR_MIPI_DSI
 	def_tristate DRM_RCAR_DU
 	depends on DRM_RCAR_USE_MIPI_DSI
 	select DRM_MIPI_DSI
+	select RESET_CONTROLLER
 
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
-- 
2.34.1


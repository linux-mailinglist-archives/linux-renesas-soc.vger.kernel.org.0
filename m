Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF70674FC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 09:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjATIur (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 03:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjATIuq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 03:50:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA299891F7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 00:50:32 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 910D692A;
        Fri, 20 Jan 2023 09:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674204631;
        bh=fGbk2qTD7K8gGL74OEeKB2ENTfUWtwJ495CLzjgMrOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dg7cvBDNUU9dADfYpI71fLCaZMm2g+fp+AJk9ZPsMB2kzhPJ4kHWwvBYqQEuAvqG1
         sjNGG1uGS7oiL6BqxGOVtz6G50uInHgP0s8Wn2pRFXs0a8e5EJ973ybg4QjaaNpIFd
         xwG34woX4I0sPolrN3kiJhSbh2sqLN54m+FS2wsE=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 1/7] drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
Date:   Fri, 20 Jan 2023 10:50:03 +0200
Message-Id: <20230120085009.604797-2-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


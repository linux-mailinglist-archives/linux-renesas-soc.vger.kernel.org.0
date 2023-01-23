Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BF9677980
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 11:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbjAWKsJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 05:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjAWKsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:48:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB25213D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:48:02 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2B2F2B3;
        Mon, 23 Jan 2023 11:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674470880;
        bh=fGbk2qTD7K8gGL74OEeKB2ENTfUWtwJ495CLzjgMrOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=npNePKK7G+DSmCTrM1cF3+WmNpbkPiiNRRv+LnXRto1f4xy7z9r2iO/G2FVzGQRee
         anv+xGGkDPCSlM1gz5klAcp+ozzH3eKXrnAeokh3L13fnSppm+9qPB4hzli4/wUhpj
         fAqF6WPqvuTW8wBvlSAxkzzcTPGTQzHfAbRxgpuY=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 1/7] drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
Date:   Mon, 23 Jan 2023 12:47:36 +0200
Message-Id: <20230123104742.227460-2-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
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


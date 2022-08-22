Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC7E59C1AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 16:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbiHVOfJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 10:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbiHVOfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 10:35:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3519B27CE3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 07:35:08 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 705E22B3;
        Mon, 22 Aug 2022 16:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661178906;
        bh=CMR8Dp1YN5eauuu52E5A1UUWFfjio2SLf2OkZTJpvhY=;
        h=From:To:Cc:Subject:Date:From;
        b=YnlULzN293EMizzW3ToHZSOc2kvDGxVJajbA/KEBVj8w0+ZQOTtwRt8CReOX5aIv0
         KPSACkRMOzfYioCeCWNqU0thOvUlEdyZ75RFacwgrA/itTkoTwwiAzNVIfDTPHLoFN
         cMGujVsPxgWORAauddUkryk9D/fwJsRkxWL9FDkM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/5] drm: rcar-du: DSI fixes
Date:   Mon, 22 Aug 2022 17:33:56 +0300
Message-Id: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Changes to v2:

- Move the LVDS patch to the beginning and improve the patch desc.
- Write 0 to registers in rcar_mipi_dsi_shutdown instead of just
  clearing a bit.
- Fix function names in "fix DSI enable & disable sequence" patch desc.
- Add "drm: rcar-du: dsi: Fix VCLKSET write"

 Tomi

Tomi Valkeinen (5):
  drm: rcar-du: lvds: Rename pclk enable/disable functions
  drm: rcar-du: dsi: Properly stop video mode TX
  drm: rcar-du: dsi: Improve DSI shutdown
  drm: rcar-du: fix DSI enable & disable sequence
  drm: rcar-du: dsi: Fix VCLKSET write

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 30 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++
 drivers/gpu/drm/rcar-du/rcar_lvds.c       |  4 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h       | 10 ++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 71 ++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 31 ++++++++++
 7 files changed, 135 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

-- 
2.34.1


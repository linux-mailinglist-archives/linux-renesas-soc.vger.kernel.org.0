Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9385B59FA4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 14:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbiHXMrl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 08:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237044AbiHXMrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 08:47:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A31F915CF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 05:47:39 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FC5E2B3;
        Wed, 24 Aug 2022 14:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661345256;
        bh=jmXMBiW2sAdBb7wHcyIWSm1ZxeHbRx5C7F49bqeOB2I=;
        h=From:To:Cc:Subject:Date:From;
        b=dzNqVvfArpr05Ky8ed9MvCJ+Rxe6iyNwKomWeb3NM559Ot5pUlKvRM5NNfS9i0BZH
         ikE7+Z8+WACR+ouU9EQBSC6kStk/eab/iP9OxO75FJKddmqe3jODRgBvZnxO/8k6SX
         qrjW05EKcHlUVEfIh5gCnw2zC3avMu/iDCEPyzC0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/5] drm: rcar-du: DSI fixes
Date:   Wed, 24 Aug 2022 15:47:21 +0300
Message-Id: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Changes to v3:
- Fix LVDS function renames wrt. export symbol.
- Fix missing static inline
- Use rcar_mipi_dsi_write for VCLKSET writes

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
 drivers/gpu/drm/rcar-du/rcar_lvds.c       |  8 +--
 drivers/gpu/drm/rcar-du/rcar_lvds.h       | 10 ++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 68 ++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 31 +++++++++++
 7 files changed, 135 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

-- 
2.34.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D7459C016
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 15:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbiHVNFc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 09:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234891AbiHVNFb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 09:05:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE7A1CB38
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 06:05:30 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 822532B3;
        Mon, 22 Aug 2022 15:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661173528;
        bh=0PGv8MMlOIqJsZ2E9B/w0UujWVln7N57ylzBjQNYMQc=;
        h=From:To:Cc:Subject:Date:From;
        b=L3XrLD8vP68bR8DUool1MyZAK05i1YL8SdlA4rtzB1sBsqeu20+62gThDgQsN/P91
         rUiA8It0aXgwAh611bsxJKb6NnFMbViDQD/m2MI/G7Kwwad1hH0LNP495TFI+ucxC3
         ideI9QWDX2N1VQzmMVmILk21DkAFfv77FQugAEJE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/4] drm: rcar-du: DSI fixes
Date:   Mon, 22 Aug 2022 16:05:08 +0300
Message-Id: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
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

Hi,

This is v2 of the third patch in an earlier series ("drm: rcar-du: fix
DSI enable & disable sequence"). The first two patches have already been
accepted.

Changes in v2:
- Split the patch into smaller pieces
- Modify the pclk enable function names so that they match between LVDS
  and DSI.
- Cosmetic changes (comments).

 Tomi

Tomi Valkeinen (4):
  drm: rcar-du: dsi: Properly stop video mode TX
  drm: rcar-du: dsi: Improve DSI shutdown
  drm: rcar-du: fix DSI enable & disable sequence
  drm: rcar-du: lvds: Rename pclk enable/disable functions

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 30 ++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++
 drivers/gpu/drm/rcar-du/rcar_lvds.c       |  4 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h       | 10 ++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 64 +++++++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 31 +++++++++++
 7 files changed, 131 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

-- 
2.34.1


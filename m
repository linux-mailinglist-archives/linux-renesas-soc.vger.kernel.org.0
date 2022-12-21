Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20C6652E66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Dec 2022 10:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbiLUJZM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Dec 2022 04:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbiLUJZL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Dec 2022 04:25:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEEB1C12E;
        Wed, 21 Dec 2022 01:25:09 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCA0EFB;
        Wed, 21 Dec 2022 10:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671614707;
        bh=mkDJ6wzQr0V0kQPZuFwuUndLXoJtOm1F+MlvhCynM4c=;
        h=From:To:Cc:Subject:Date:From;
        b=k9Jxi0JyOlrWFw7qjvdLUVyuHWOXSAvgIS66j2w5zmCvdnkGPOqB+ddjkGuI7NyR2
         2lWSjP9scxpmIkj4d5g2sbggfHknc/WcdhYyxm53rdbR92PJqESc2PeUhhKXuWeCjS
         h60r+dGmG2hSLHvrKQZ+CkC4J4hBPduwysxO0wbw=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
Date:   Wed, 21 Dec 2022 11:24:41 +0200
Message-Id: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

These add new pixel formats for Renesas V3U and V4H SoCs.

As the display pipeline is split between DRM and V4L2 components, this
series touches both subsystems. I'm sending all these together to
simplify review. If needed, I can later split this to V4L2 and DRM
parts, of which the V4L2 part needs to be merged first.

Changes in v3:
- Addressed all the review comments
- Added Y212
- Updated the kernel docs for the new formats
- Changed the RGB format names to match the DRM's format names
- Updated RPF register field macros according to the comments

 Tomi

Tomi Valkeinen (7):
  media: Add 2-10-10-10 RGB formats
  media: Add Y210, Y212 and Y216 formats
  media: renesas: vsp1: Change V3U to be gen4
  media: renesas: vsp1: Add V4H SoC version
  media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
  drm: rcar-du: Bump V3U to gen 4
  drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)

 .../media/v4l/pixfmt-packed-yuv.rst           |  49 ++++-
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  30 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  50 ++++-
 .../media/platform/renesas/vsp1/vsp1_drv.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  18 ++
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  26 ++-
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  64 +++++-
 .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |   4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   6 +
 include/uapi/linux/videodev2.h                |  11 +
 15 files changed, 447 insertions(+), 20 deletions(-)

-- 
2.34.1


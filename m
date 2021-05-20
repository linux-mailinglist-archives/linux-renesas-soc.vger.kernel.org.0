Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA0E389E40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 May 2021 08:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhETGwP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 May 2021 02:52:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35664 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhETGwO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 May 2021 02:52:14 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98C1FD31;
        Thu, 20 May 2021 08:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621493452;
        bh=v3Vu6quVKrr1NnYuMwDm2STCc4CKzv9XPpREFWKebSs=;
        h=From:To:Cc:Subject:Date:From;
        b=cvjSm5wfQudgmwFSJRE1+molF48g9H2Jm6WKAlHKqUY6AbIi/8G3JFXTetIBrTZHR
         lxNk/fI9/m6JsXy7wSThexHZNK5dvzZIOxgNGoXPHjDG2JILuVIukqT1RvBYHvpUkM
         NFem5hZCst77F2S7qo5WmDQRvU1Yip39/X3/6yH8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 0/4] Converter R-Car DU to the DRM bridge connector helper
Date:   Thu, 20 May 2021 09:50:42 +0300
Message-Id: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series converts the R-Car DU driver to use the DRM bridge
connector helper drm_bridge_connector_init().

The bulk of the v1 series was converting the adv7511, simple-bridge and
dw-hdmi drivers to make connector creation optional (through the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag), and have already been merged. v2
included the remaining patches and has bitrotten. v3 rebased the code
and should be ready for merge.

Patch 1/4 adds support to the dw-hdmi driver to attach to a downstream
bridge if one is specified in DT. As the DT port number corresponding to
the video output differs between platforms that integrate the dw-hdmi
(some of them even don't have a video output port, which should probably
be fixed, but that's out of scope for this series), the port number has
to be specified by the platform glue layer.

Patch 2/4 then addresses the rcar-lvds driver. Instead of implementing
direct support for DRM_BRIDGE_ATTACH_NO_CONNECTOR, it simply removes
code that shouldn't have been in the driver in the first place by
switching to the panel bridge helper.

Patch 3/4 specifies the port number in the R-Car dw-hdmi glue layer, as
required by 1/4.

Patch 4/4 finally makes use of the drm_bridge_connector_init() helper.

The series has been tested on the Renesas R-Car Salvator-XS and Draak
boards with the VGA, HDMI and LVDS outputs.

Laurent Pinchart (4):
  drm: bridge: dw-hdmi: Attach to next bridge if available
  drm: rcar-du: lvds: Convert to DRM panel bridge helper
  drm: rcar-du: dw-hdmi: Set output port number
  drm: rcar-du: Use drm_bridge_connector_init() helper

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  54 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  26 ++++-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c    |   1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c       | 120 +++-------------------
 include/drm/bridge/dw_hdmi.h              |   2 +
 5 files changed, 89 insertions(+), 114 deletions(-)

-- 
Regards,

Laurent Pinchart


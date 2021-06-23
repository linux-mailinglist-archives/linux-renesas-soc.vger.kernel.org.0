Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDEFB3B1263
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFWDty (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhFWDty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FBFC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 20:47:37 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 229619B1;
        Wed, 23 Jun 2021 05:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420054;
        bh=FUJMD96YIFfbiVYtN8AI1kA3mqIF87nT5eldk0l6Wpo=;
        h=From:To:Cc:Subject:Date:From;
        b=dkGdnxwISlzIO1fPciQeh4ZVcSLyaN5aQ5US0cn2zB4jyUCVRqN8g6Zjfyhq4nJp7
         cQJbkiwAWNtVSRGeOISstxAqGoHqjhF1ohMWUxziUOdTprtK2cAIsnHkuigd2qnU38
         4MW/vpw4+yYLH206yUC4VhuDmExONl0Orblw2nts=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 00/15] R-Car V3U: DSI encoder driver
Date:   Wed, 23 Jun 2021 06:46:41 +0300
Message-Id: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series adds a driver for the DSI encoder found in the R-Car
V3U SoC, which is the first SoC in the family that supports DSI.

The driver is based on an implementation from the BSP written by Luu
Hoai, taken as-is in patch 02/15. The subsequent patches are cleanups.
I'm posting this version as an RFC to allow Luu to review the cleanups,
if desired. I've thus restricted the audience to the linux-renesas-soc
mailing list. The next, non-RFC version will squash all driver patches
into one and will be posted to dri-devel.

There's one open question related to whether the DSI encoder clock needs
to be controlled explicitly by the DU or not. Depending on the outcome
of the tests, the driver could be further simplified.

Kieran Bingham (2):
  drm: rcar-du: dsi: Use the correct compatible
  drm: rcar-du: dsi: Include the DSI header

LUU HOAI (1):
  drm: rcar-du: Add R-Car DSI driver

Laurent Pinchart (12):
  dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX
  drm: rcar-du: dsi: Reorganize probe function
  drm: rcar-du: dsi: Use dev_err_probe()
  drm: rcar-du: dsi: Shorten mipi_dsi variable name to dsi
  drm: rcar-du: dsi: Use dsi->dev consistently in probe()
  drm: rcar-du: dsi: Get next bridge in probe()
  drm: rcar-du: dsi: Simplify DT parsing
  drm: rcar-du: dsi: Add error handling in rcar_mipi_dsi_clk_enable()
  drm: rcar-du: dsi: Simplify error handling in rcar_mipi_dsi_enable()
  drm: rcar-du: dsi: Turn container_of() wrappers to inline functions
  drm: rcar-du: dsi: Various style and typo fixes
  drm: rcar-du: dsi: Use read_poll_timeout()

 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 +++
 drivers/gpu/drm/rcar-du/Kconfig               |   6 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 813 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h       |  26 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  | 172 ++++
 6 files changed, 1136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart


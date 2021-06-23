Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F983B1BC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhFWN7b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhFWN7a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:59:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F5DC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 06:57:13 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBE348B6;
        Wed, 23 Jun 2021 15:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624456632;
        bh=GEx8uiIOnApr4OXxJ6reuG9i7sC2s5RjkNiSXbR8EwE=;
        h=From:To:Cc:Subject:Date:From;
        b=nFSXJKvYoHdQX9aAnlD+NzZFfuAKKe306ROvBMu+Ws+CdCHCPBk3tITlKvzJf4T+Q
         jQX7z1/WukX18JPY0vcNVV8Rdnqr5PgyZG4V5eVDOqz1N2TmIp4rDOBrjhbh36h4bV
         5KChax0lkLPCzHy5XzhBpf10c6EyYAzDSGB1GrTM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] R-Car DU: Add DSI encoder driver for V3U
Date:   Wed, 23 Jun 2021 16:56:37 +0300
Message-Id: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
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
Hoai, with lots of further rework. If anyone is interested in the
history, a broken down v1 is available from [1].

The driver has been successfully tested on the Falcon board, which
connects an SN65DSI86 to the output of the DSI encoder. Further patches
are needed for the ti-sn65dsi86 driver to enable usage in plain DP
(non-eDP) mode, as the Falcon board has a mini-DP connector wired to the
output of the SN65DSI86. This is work in progress (see [2]).

[1] https://lore.kernel.org/linux-renesas-soc/189c7a07-29cd-39f4-1dec-56aa94c11fba@ideasonboard.com/T/#mafbe130386cbc8326f85cad46860813516ef4a80
[2] https://lore.kernel.org/linux-renesas-soc/20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com/

LUU HOAI (1):
  drm: rcar-du: Add R-Car DSI driver

Laurent Pinchart (1):
  dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX

 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 +++
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/rcar-du/Kconfig               |   6 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 827 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  | 172 ++++
 6 files changed, 1125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart


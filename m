Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8D82DB7F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 01:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgLPAvN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 19:51:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgLPAvM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 19:51:12 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E88F593;
        Wed, 16 Dec 2020 01:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608079830;
        bh=DShNNaqRJ/Gem++GOaQKiJ8Fhc6x6Uj4MSeUcvc1jOc=;
        h=From:To:Cc:Subject:Date:From;
        b=XWzbGF69OHcg5GbxiMLBcckhRnx43OdJu3vIT4YP+fRbIOCtRh9IX9k3kDH6Opt0J
         EB8skEMaYFJ6rZ0oQiNnvaVLNtQ2N5wcXAxiCql/aOwsVk0/vPmSfCaWcbGylkE6w/
         HyuL/E0n6wFAg7Zaa3Rzu0JWmEZfCPFt0gJvCu1U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/4] Converter R-Car DU to the DRM bridge connector helper
Date:   Wed, 16 Dec 2020 02:50:17 +0200
Message-Id: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
includes the remaining patches.

Patch 1/4 addresses the rcar-lvds driver. Instead of implementing direct
support for DRM_BRIDGE_ATTACH_NO_CONNECTOR, it simply removes code that
shouldn't have been in the driver in the first place by switching to the
panel bridge helper.

Patches 2/4 then adds support to the dw-hdmi driver to attach to a
downstream bridge if one is specified in DT. As the DT port number
corresponding to the video output differs between platforms that
integrate the dw-hdmi (some of them even don't have a video output port,
which should probably be fixed, but that's out of scope for this
series), the port number has to be specified by the platform glue layer.
Patch 3/4 does so for the R-Car dw-hdmi driver.

Patch 4/4 finally makes use of the drm_bridge_connector_init() helper.

The series depends on "[PATCH 27/27] drm: Add default modes for
connectors in unknown state" ([1]) to avoid a breakage on the VGA output
on R-Car Gen3 platforms. That patch has already been approved, and I'll
get it merged as a prerequisite.

The series has been tested on the Renesas R-Car Salvator-XS and Draak
boards with the VGA, HDMI and LVDS outputs.

[1] https://lore.kernel.org/dri-devel/20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com/

Laurent Pinchart (4):
  drm: rcar-du: lvds: Convert to DRM panel bridge helper
  drm: bridge: dw-hdmi: Attach to next bridge if available
  drm: rcar-du: dw-hdmi: Set output port number
  drm: rcar-du: Use drm_bridge_connector_init() helper

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  54 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  25 ++++-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c    |   1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c       | 120 +++-------------------
 include/drm/bridge/dw_hdmi.h              |   2 +
 5 files changed, 88 insertions(+), 114 deletions(-)

-- 
Regards,

Laurent Pinchart


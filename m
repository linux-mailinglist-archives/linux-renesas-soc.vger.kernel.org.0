Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 210AD115560
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 17:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfLFQdF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 11:33:05 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:55948 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726258AbfLFQdF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 11:33:05 -0500
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; 
   d="scan'208";a="33693100"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:03 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E6135400D4D7;
        Sat,  7 Dec 2019 01:32:57 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: [PATCH v4 0/7] Add dual-LVDS panel support to EK874
Date:   Fri,  6 Dec 2019 16:32:47 +0000
Message-Id: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds support for dual-LVDS panel IDK-2121WR
from Advantech:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm

V4 incorporates most of the comments received from v3, making it significantly
different from v3: patch "drm: rcar-du: lvds: Add dual-LVDS panels support"
has been split in 4 patches, patches
"dt-bindings: display: Add bindings for LVDS bus-timings" and
"dt-bindings: display: Add idk-2121wr binding" have been merged together,
and a few issues have been fixed.

Thanks,
Fab

Fabrizio Castro (7):
  drm: of: Add drm_of_lvds_get_dual_link_pixel_order
  drm: rcar-du: lvds: Improve identification of panels
  drm: rcar-du: lvds: Get dual link configuration from DT
  drm: rcar-du: lvds: Allow for even and odd pixels swap
  drm: rcar-du: lvds: Fix mode for companion encoder
  dt-bindings: display: Add idk-2121wr binding
  arm64: dts: renesas: Add EK874 board with idk-2121wr display support

 .../display/panel/advantech,idk-2121wr.yaml        | 128 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   3 +-
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++++++
 drivers/gpu/drm/drm_of.c                           | 104 +++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 143 ++++++++++++++-------
 include/drm/drm_of.h                               |  20 +++
 6 files changed, 468 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

-- 
2.7.4


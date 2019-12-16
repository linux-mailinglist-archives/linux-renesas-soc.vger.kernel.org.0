Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E843A121AA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 21:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfLPUMo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 15:12:44 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:48461 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726942AbfLPUMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 15:12:43 -0500
X-IronPort-AV: E=Sophos;i="5.69,322,1571670000"; 
   d="scan'208";a="34573533"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2019 05:12:42 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2789540CAF00;
        Tue, 17 Dec 2019 05:12:36 +0900 (JST)
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
Subject: [PATCH v5 0/6] Add dual-LVDS panel support to EK874
Date:   Mon, 16 Dec 2019 20:12:28 +0000
Message-Id: <1576527154-18391-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds support for dual-LVDS panel IDK-2121WR
from Advantech:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm

V5 incorporates the comments from Laurent on v4, including rebasing
the series on top of patch:
https://patchwork.kernel.org/patch/11290969/
As a result, patch "drm: rcar-du: lvds: Fix mode for companion encoder"
has been dropped.

Thanks,
Fab

Fabrizio Castro (6):
  drm: of: Add drm_of_lvds_get_dual_link_pixel_order
  drm: rcar-du: lvds: Improve identification of panels
  drm: rcar-du: lvds: Get dual link configuration from DT
  drm: rcar-du: lvds: Allow for even and odd pixels swap
  dt-bindings: display: Add idk-2121wr binding
  arm64: dts: renesas: Add EK874 board with idk-2121wr display support

 .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   3 +-
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 ++++++++++++++
 drivers/gpu/drm/drm_of.c                           | 116 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 172 ++++++++++++---------
 include/drm/drm_of.h                               |  20 +++
 6 files changed, 479 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

-- 
2.7.4


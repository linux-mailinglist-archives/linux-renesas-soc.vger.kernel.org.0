Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3B28E97C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbfHOLEt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:04:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:53536 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727814AbfHOLEs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:04:48 -0400
X-IronPort-AV: E=Sophos;i="5.64,389,1559487600"; 
   d="scan'208";a="23867444"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Aug 2019 20:04:46 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 911BD41773C3;
        Thu, 15 Aug 2019 20:04:38 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: [PATCH v2 0/9] Add dual-LVDS panel support to EK874
Date:   Thu, 15 Aug 2019 12:04:24 +0100
Message-Id: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds support for dual-LVDS panel IDK-2121WR
from Advantech:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
Dual link support is very recent for R-Car Gen3, and I couldn't
find much on dual link panels in the kernel either, therefore
comments are very welcome to get this right.

The panel doesn't come with the EK874 kit, but it's advertised as
supported, therefore this series adds a new dts file to support
the configuration of the EK874 + IDK-2121WR.

Laurent,

it appears that Rob has been busy converting the dt-bindings relevant to this
series, and his changes are now found in linux-next. Most notably
Documentation/devicetree/bindings/display/panel/panel-lvds.txt has now become
Documentation/devicetree/bindings/display/panel/lvds.yaml

You have already taken patch:
https://patchwork.kernel.org/patch/11072749/

as such the patch I am sending you is still related to:
Documentation/devicetree/bindings/display/panel/panel-lvds.txt

Patch "dt-bindings: display: Add bindings for Advantech IDK-2121WR" is still
assuming the format is .txt, as I am not too sure about what the protocol is in
this case? Shall we take this patch and convert it later to .yaml or shall I
convert it to .yaml straight away?

Please, let me know what's the best course of action.

v1->v2:
* dt-bindings: display: renesas: lvds: Document renesas,swap-data - dropped
* drm: rcar-du: lvds: Add data swap support - dropped
* drm: rcar-du: lvds: Do not look at ports for identifying bridges - dropped
* drm: rcar-du: lvds: Add support for dual link panels - dropped
* dt-bindings: display: renesas: lvds: RZ/G2E needs renesas,companion too - taken
* drm: rcar-du: lvds: Fix bridge_to_rcar_lvds - taken
* arm64: dts: renesas: r8a774c0: Point LVDS0 to its companion LVDS1 - taken
* arm64: dts: renesas: cat874: Add definition for 12V regulator -taken
* dt-bindings: panel: lvds: Add dual-link LVDS display support - reworked according to Laurent's feedback
* dt-bindings: display: Add bindings for Advantech IDK-2121WR - reworked according to Laurent's feedback
* drm: Rename drm_bridge_timings to drm_timings - new patch
* drm/timings: Add link flags - new patch
* drm/panel: Add timings field to drm_panel - new patch
* drm: rcar-du: lvds: Fix companion's mode - reworked according to Laurent's feedback
* drm: rcar-du: lvds: Add dual-LVDS panels support - new patch
* drm/panel: lvds: Add support for the IDK-2121WR - new patch
* arm64: dts: renesas: Add EK874 board with idk-2121wr display support - Made some changes

Thanks,
Fab

Fabrizio Castro (9):
  dt-bindings: panel: lvds: Add dual-link LVDS display support
  dt-bindings: display: Add bindings for Advantech IDK-2121WR
  drm: Rename drm_bridge_timings to drm_timings
  drm/timings: Add link flags
  drm/panel: Add timings field to drm_panel
  drm: rcar-du: lvds: Fix companion's mode
  drm: rcar-du: lvds: Add dual-LVDS panels support
  drm/panel: lvds: Add support for the IDK-2121WR
  arm64: dts: renesas: Add EK874 board with idk-2121wr display support

 .../display/panel/advantech,idk-2121wr.txt         |  56 +++++++++
 .../bindings/display/panel/panel-lvds.txt          |  95 ++++++++++++----
 arch/arm64/boot/dts/renesas/Makefile               |   3 +-
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++++++++
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |   6 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   6 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |   8 ++
 drivers/gpu/drm/pl111/pl111_display.c              |   2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 126 ++++++++++++++-------
 include/drm/drm_bridge.h                           |  40 +------
 include/drm/drm_panel.h                            |   3 +
 include/drm/drm_timings.h                          |  86 ++++++++++++++
 14 files changed, 439 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
 create mode 100644 include/drm/drm_timings.h

-- 
2.7.4


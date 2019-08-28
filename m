Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58EF7A09A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 20:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfH1Sg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 14:36:56 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:45272 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726711AbfH1Sgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 14:36:55 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="25166320"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 03:36:52 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D013D400A897;
        Thu, 29 Aug 2019 03:36:46 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
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
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
Date:   Wed, 28 Aug 2019 19:36:34 +0100
Message-Id: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds support for dual-LVDS panel IDK-2121WR
from Advantech:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm

V3 approaches the problem in a completely different way, we now
have two new properties to mark the ports in the DT as receiving
even pixels and odd pixels: dual-lvds-even-pixels and dual-lvds-odd-pixels,
which means device drivers should not use bridge specific or panel
specific dual_link flags. Also, in this case the DT describes the
connection fully.

In order for the solution to be generic, I have exported a new helper
(drm_of_lvds_get_dual_link_configuration) to walk the device tree,
and figure out if the connection is dual-LVDS. The same helper gives
information about the configuration of the connection. If Px is connected
to a port expecting even pixels and Py is connected to a port expecting
odd pixels, then the helper returns DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS
(like in the example below), otherwise it returns
DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS.


 --------            dual-lvds-even-pixels  --------
|        |----                         ----|        |
|        | Px |---------------------->| Pn |        |
|        |----                         ----|        |
| SOURCE |           dual-lvds-odd-pixels  |  SINK  |
|        |----                         ----|        |
|        | Py |---------------------->| Pm |        |
|        |----                         ----|        |
 --------                                   --------

The device driver for the encoder then will work out if with the current
wiring the pixels need swapping or not.

The same solution works for both panels and bridges.

Since the DT describes the connection fully, driver
drivers/gpu/drm/panel/panel-lvds.c works out-of-the-box, no changes
required, however, this implementation opens up a problem with the
dt-bindings.
Driver drivers/gpu/drm/panel/panel-lvds.c can still be pleased by
a port node, but also by a ports node.
I have created Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
with the idea of including it from panels and bridges dt-bindings
supporting dual-LVDS (and of course the dt-bindings for the specific
devices should say which port should be marked as what), but file
Documentation/devicetree/bindings/display/panel/lvds.yaml formally
requires property "port", while with this implementation it should require
OneOf "port" and "ports", and unfortunately I can't seem to find a neat way
aroud that, other than creating a new compatible string
(e.g. "panel-dual-lvds"), a new dt-binding document for it, and of course adding
support for the new compatible string to drivers/gpu/drm/panel/panel-lvds.c.
As a result, this series is missing (at least) a patch necessary to fully
document the new implementation within
Documentation/devicetree/bindings/display/panel/lvds.yaml

Rob, do you have any suggestions? Do you think this idea works ok from a
documentation point of view? By the way, I don't really know what I am doing
with the yaml dt-bindings, I hope you won't be horrified by this series :-P

I hope I was able to deliver the concept clearly, if not please just ask.

Comments are very much appreciated.

Thanks,
Fab

Fabrizio Castro (8):
  dt-bindings: display: Add bindings for LVDS bus-timings
  dt-bindings: display: Add idk-2121wr binding
  drm: Add bus timings helper
  drm: rcar-du: lvds: Add dual-LVDS panels support
  drm: bridge: thc63: Do not report input bus mode through bridge
    timings
  arm64: dts: renesas: Add EK874 board with idk-2121wr display support
  [HACK] arm64: dts: renesas: draak: Enable LVDS
  [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation

 .../bindings/display/bus-timings/lvds.yaml         |  38 +++++++
 .../display/panel/advantech,idk-2121wr.yaml        |  90 ++++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   3 +-
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  21 +++-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  26 +++--
 drivers/gpu/drm/Makefile                           |   3 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   9 +-
 drivers/gpu/drm/drm_bus_timings.c                  |  97 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 110 +++++++++++--------
 include/drm/drm_bridge.h                           |   8 --
 include/drm/drm_bus_timings.h                      |  21 ++++
 12 files changed, 473 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
 create mode 100644 drivers/gpu/drm/drm_bus_timings.c
 create mode 100644 include/drm/drm_bus_timings.h

-- 
2.7.4


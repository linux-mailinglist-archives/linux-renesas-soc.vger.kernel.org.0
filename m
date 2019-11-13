Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0DDFB427
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbfKMPvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:51:43 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:7195 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726276AbfKMPvn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:51:43 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31380879"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2019 00:51:41 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D48C1400ED49;
        Thu, 14 Nov 2019 00:51:36 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 00/13] Add LCD panel support to iwg20d
Date:   Wed, 13 Nov 2019 15:51:19 +0000
Message-Id: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The iW-RainboW-G20D-Qseven RZ/G1M,G1N Qseven Development Platform
comes with a 7" capacitive display kit from Emerging Display
Technologies Corporation (EDT). This series adds all that's
necessary for supporting it.

Thanks,
Fab

v3->v4:
* Reworked according to Laurent's and Jacopo's comments
v2->v3:
* Split the dt-schema patch in two patches as per Rob's comment
* Made fixes to the dt-schema according to Rob's comment
* Made fixes to the lvds-codec driver according to Jacopo's comments
* Added two new patches:
  * drm: Define DRM_MODE_CONNECTOR_PARALLEL
  * drm/panel: panel-simple: Add connector type for etm0700g0dh6
v1->v2:
* Convert dt-bindings to dt-schema

Fabrizio Castro (13):
  dt-bindings: display: bridge: Convert lvds-transmitter binding to
    json-schema
  dt-bindings: display: bridge: lvds-transmitter: Document
    powerdown-gpios
  dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt
  dt-bindings: display: bridge: lvds-transmitter: Document
    "ti,sn75lvds83"
  drm/bridge: Repurpose lvds-encoder.c
  drm/bridge: lvds-codec: Add "lvds-decoder" support
  drm/bridge: lvds-codec: Simplify panel DT node localisation
  dt-bindings: display: bridge: Repurpose lvds-encoder
  dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a
  ARM: dts: iwg20d-q7-common: Add LCD support
  ARM: shmobile_defconfig: Enable support for panels from EDT
  [HACK] drm/bridge: lvds-codec: Enforce device specific compatible
    strings
  [HACK] dt-bindings: display: bridge: lvds-codec: Absorb
    thine,thc63lvdm83d.txt

 .../bindings/display/bridge/lvds-codec.yaml        | 131 +++++++++++++++
 .../bindings/display/bridge/lvds-transmitter.txt   |  66 --------
 .../bindings/display/bridge/thine,thc63lvdm83d.txt |  50 ------
 .../bindings/display/bridge/ti,ds90c185.txt        |  55 -------
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |  85 ++++++++++
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi           |   1 -
 arch/arm/configs/shmobile_defconfig                |   3 +
 drivers/gpu/drm/bridge/Kconfig                     |   8 +-
 drivers/gpu/drm/bridge/Makefile                    |   2 +-
 .../drm/bridge/{lvds-encoder.c => lvds-codec.c}    | 179 +++++++++++++--------
 10 files changed, 333 insertions(+), 247 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
 rename drivers/gpu/drm/bridge/{lvds-encoder.c => lvds-codec.c} (25%)

-- 
2.7.4


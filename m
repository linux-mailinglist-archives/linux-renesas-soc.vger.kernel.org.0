Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871A9F3940
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfKGULM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:11:12 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:21886 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725893AbfKGULM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:11:12 -0500
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; 
   d="scan'208";a="30895643"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:11 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id ED01A4009F8D;
        Fri,  8 Nov 2019 05:11:06 +0900 (JST)
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
Subject: [PATCH v3 0/7] Add LCD panel support to iwg20d
Date:   Thu,  7 Nov 2019 20:10:56 +0000
Message-Id: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
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

v2->v3:
* Split the dt-schema patch in two pathes as per Rob's comment
* Made fixes to the dt-schema according to Rob's comment
* Made fixes to the lvds-codec driver according to Jacopo's comments
* Added two new patches:
  * drm: Define DRM_MODE_CONNECTOR_PARALLEL
  * drm/panel: panel-simple: Add connector type for etm0700g0dh6
v1->v2:
* Convert dt-bindings to dt-schema

Fabrizio Castro (7):
  dt-bindings: display: bridge: Convert lvds-transmitter binding to
    json-schema
  drm/bridge: Repurpose lvds-encoder.c
  dt-bindings: display: bridge: Repurpose lvds-encoder
  drm: Define DRM_MODE_CONNECTOR_PARALLEL
  drm/panel: panel-simple: Add connector type for etm0700g0dh6
  ARM: dts: iwg20d-q7-common: Add LCD support
  ARM: shmobile_defconfig: Enable support for panels from EDT

 .../bindings/display/bridge/lvds-codec.yaml        | 120 ++++++++++++++++
 .../bindings/display/bridge/lvds-transmitter.txt   |  66 ---------
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |  85 +++++++++++
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi           |   1 -
 arch/arm/configs/shmobile_defconfig                |   3 +
 drivers/gpu/drm/bridge/Kconfig                     |   8 +-
 drivers/gpu/drm/bridge/Makefile                    |   2 +-
 drivers/gpu/drm/bridge/lvds-codec.c                | 131 +++++++++++++++++
 drivers/gpu/drm/bridge/lvds-encoder.c              | 155 ---------------------
 drivers/gpu/drm/drm_connector.c                    |   1 +
 drivers/gpu/drm/panel/panel-simple.c               |   1 +
 include/uapi/drm/drm_mode.h                        |   1 +
 12 files changed, 347 insertions(+), 227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
 create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
 delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c

-- 
2.7.4


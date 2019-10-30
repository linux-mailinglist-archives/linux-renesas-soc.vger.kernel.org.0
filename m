Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B6EE9C86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2019 14:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3Nnn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Oct 2019 09:43:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:36129 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726222AbfJ3Nnm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 09:43:42 -0400
X-IronPort-AV: E=Sophos;i="5.68,247,1569250800"; 
   d="scan'208";a="30421349"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Oct 2019 22:43:41 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 17A84400CA10;
        Wed, 30 Oct 2019 22:43:36 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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
Subject: [PATCH 0/4] Add LCD panel support to iwg20d
Date:   Wed, 30 Oct 2019 13:43:30 +0000
Message-Id: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
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

Fabrizio Castro (4):
  drm/bridge: Repurpose lvds-encoder.c
  dt-bindings: display: bridge: Repurpose lvds-encoder
  ARM: dts: iwg20d-q7-common: Add LCD support
  ARM: shmobile_defconfig: Enable support for panels from EDT

 .../bindings/display/bridge/lvds-codec.txt         | 100 ++++++++++++
 .../bindings/display/bridge/lvds-transmitter.txt   |  66 --------
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |  85 +++++++++++
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi           |   1 -
 arch/arm/configs/shmobile_defconfig                |   3 +
 drivers/gpu/drm/bridge/Kconfig                     |   8 +-
 drivers/gpu/drm/bridge/Makefile                    |   2 +-
 drivers/gpu/drm/bridge/lvds-codec.c                | 169 +++++++++++++++++++++
 drivers/gpu/drm/bridge/lvds-encoder.c              | 155 -------------------
 9 files changed, 362 insertions(+), 227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
 create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
 delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c

-- 
2.7.4


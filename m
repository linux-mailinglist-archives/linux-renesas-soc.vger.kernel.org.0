Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B364E8E56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Mar 2022 08:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbiC1GvX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Mar 2022 02:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbiC1GvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Mar 2022 02:51:23 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DEC1C27FC8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Mar 2022 23:49:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,216,1643641200"; 
   d="scan'208";a="115903281"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Mar 2022 15:49:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.147])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E91844004186;
        Mon, 28 Mar 2022 15:49:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add RZ/G2L DSI driver
Date:   Mon, 28 Mar 2022 07:49:29 +0100
Message-Id: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to support the MIPI DSI encoder found in the RZ/G2L
SoC. It currently supports DSI mode only.

This unit supports MIPI Alliance Specification for Display Serial Interface (DSI) Specification. This unit provides a
solution for transmitting MIPI DSI compliant digital video and packets. Normative References are below.
* MIPI Alliance Specification for Display Serial Interface Version 1.3.1
* MIPI Alliance Specification for D-PHY Version 2.1

The following are key features of this unit.

* 1 channel
* The number of Lane: 4-lane
* Support up to Full HD (1920 × 1080), 60 fps (RGB888)
* Maximum Bandwidth: 1.5 Gbps per lane
* Support Output Data Format: RGB666 / RGB888

v1->v2:
 * Added full path for dsi-controller.yaml
 * Modeled DSI + D-PHY as single block and updated reg property
 * Fixed typo D_PHY->D-PHY
 * Updated description
 * Added interrupts and interrupt-names and updated the example 
 * Driver rework based on dt-binding changes (DSI + D-PHY) as single block
 * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
 * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
   and rzg2l_mipi_dsi_link_write
 * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
RFC->v1:
 * Added a ref to dsi-controller.yaml.
 * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
   and dropped DRM as it is implied by DRM_BRIDGE
 * Used devm_reset_control_get_exclusive() for reset handle
 * Removed bool hsclkmode from struct rzg2l_mipi_dsi
 * Added error check for pm, using pm_runtime_resume_and_get() instead of
   pm_runtime_get_sync()
 * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
 * Avoided read-modify-write stopping hsclock
 * Used devm_platform_ioremap_resource for resource allocation
 * Removed unnecessary assert call from probe and remove.
 * wrap the line after the PTR_ERR() in probe()
 * Updated reset failure messages in probe
 * Fixed the typo arstc->prstc
 * Made hex constants to lower case.
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-23-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
  drm: rcar-du: Add RZ/G2L DSI driver

 .../bindings/display/bridge/renesas,dsi.yaml  | 175 +++++
 drivers/gpu/drm/rcar-du/Kconfig               |   8 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 686 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 149 ++++
 5 files changed, 1019 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h

-- 
2.17.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F335BA87E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Sep 2022 10:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiIPIsW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Sep 2022 04:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiIPIsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 04:48:20 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2D66A832F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 01:48:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,320,1654527600"; 
   d="scan'208";a="133059332"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Sep 2022 17:48:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.23])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7DC2E41A78B3;
        Fri, 16 Sep 2022 17:48:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/2] Add RZ/G2L DSI driver
Date:   Fri, 16 Sep 2022 09:48:05 +0100
Message-Id: <20220916084807.640225-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to support the MIPI DSI encoder found in the RZ/G2L
SoC. It currently supports DSI video mode only.

This unit supports MIPI Alliance Specification for Display Serial Interface (DSI)
Specification. This unit provides a solution for transmitting MIPI DSI compliant
digital video and packets. Normative References are below.
* MIPI Alliance Specification for Display Serial Interface Version 1.3.1
* MIPI Alliance Specification for D-PHY Version 2.1

The following are key features of this unit.

* 1 channel
* The number of Lane: 4-lane
* Support up to Full HD (1920 × 1080), 60 fps (RGB888)
* Maximum Bandwidth: 1.5 Gbps per lane
* Support Output Data Format: RGB666 / RGB888

v6->v7:
 * Added rzg2l_mipi_dsi_stop_video() counterpart of rzg2l_mipi_dsi_start_video().
 * Error labels are named according to the cleanup operation they perform.
 * Restored Max lane capability read after dphy timing initialization
   as per the guide lines from SoC design team.
 * Added recommended lut values for the Global Operation Timing
   parameters for MIPI DPHY.
v5->v6:
 * Updated commit description
 * Moved handling of arst and prst from rzg2l_mipi_dsi_startup->runtime
   PM suspend/resume handlers.
 * Max lane capability read at probe(), and enforced in
   rzg2l_mipi_dsi_host_attach()
 * Simplified vich1ppsetr setting.
 * Renamed hsclk_running_mode,hsclk_mode->is_clk_cont.
 * Fixed typo in probe error message(arst->rst).
 * Reordered DRM bridge initaization in probe()
 * Updated typo in e-mail address.
v4->v5:
 * Added Ack from Sam.
 * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
   with drm_of_get_data_lanes_count_ep() in probe.
v3->v4:
 * Updated error handling in rzg2l_mipi_dsi_startup() and rzg2l_mipi_dsi_atomic_enable().
v2->v3:
 * Added Rb tag from Geert and Laurent
 * Fixed the typo "Receive" -> "transmit"
 * Added accepible values for data-lanes
 * Sorted Header file in the example
 * Added SoC specific compaible along with generic one.
 * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function instead
   of the memory pointer
 * Fixed the comment in rzg2l_mipi_dsi_startup()
 * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
 * DRM bridge parameter initialization moved to probe
 * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
 * Inserted the missing blank lane after return in probe()
 * Added missing MODULE_DEVICE_TABLE
 * Added include linux/bits.h in header file
 * Fixed various macros in header file.
 * Reorder the make file for DSI, so that it is no more dependent
   on RZ/G2L DU patch series.
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

 .../bindings/display/bridge/renesas,dsi.yaml  | 182 ++++
 drivers/gpu/drm/rcar-du/Kconfig               |   8 +
 drivers/gpu/drm/rcar-du/Makefile              |   2 +
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 782 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
 5 files changed, 1125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h

-- 
2.25.1


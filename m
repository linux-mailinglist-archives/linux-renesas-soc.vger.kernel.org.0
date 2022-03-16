Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236B24DB09A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Mar 2022 14:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbiCPNMk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Mar 2022 09:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356118AbiCPNMf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Mar 2022 09:12:35 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB64966AD9;
        Wed, 16 Mar 2022 06:11:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,186,1643641200"; 
   d="scan'208";a="113700574"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2022 22:11:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 61180429C365;
        Wed, 16 Mar 2022 22:11:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/7] Add RZ/G2L Display support
Date:   Wed, 16 Mar 2022 13:10:53 +0000
Message-Id: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
Video signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.

This patch series aims to add basic display support on RZ/G2L SMARC EVK
platform. The output from DSI is connected to ADV7535.

The DU controller is similar to R-Car as it is connected to VSPD,
so reusing most of R-Car code with new CRTC driver specific to
RZ/G2L

v1->v2:
 * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
 * Updated commit description for bindings
 * Removed LCDC references from bindings
 * Changed clock name from du.0->aclk from bindings
 * Changed reset name from du.0->du from bindings
 * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
 * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
 * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
 * Added forward declaration for struct reset_control

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220312084205.31462-2-biju.das.jz@bp.renesas.com/

RFC->v1:
 * Changed  minItems->maxItems for renesas,vsps.
 * Added RZ/G2L LCDC driver with special handling for CRTC reusing
   most of RCar DU code
 * Fixed the comments for num_rpf from rpf's->RPFs/ and vsp->VSP.
RFC:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-12-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-13-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-19-biju.das.jz@bp.renesas.com/

Biju Das (7):
  dt-bindings: display: renesas,du: Document r9a07g044l bindings
  drm: rcar-du: Add num_rpf to struct rcar_du_device_info
  drm: rcar-du: Add max_width and max_height to struct
    rcar_du_device_info
  drm: rcar-du: Move rcar_du_output_name() to rcar_du_common.c
  drm: rcar-du: Factorise rcar_du_{atomic_check,modeset_init}
  drm: rcar-du: Factorise
    rcar_du_vsp{complete,enable,plane_atomic_check}
  drm: rcar-du: Add RZ/G2L DU Support

 .../bindings/display/renesas,du.yaml          |  54 ++
 drivers/gpu/drm/rcar-du/Kconfig               |  18 +-
 drivers/gpu/drm/rcar-du/Makefile              |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_common.c      |  30 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   8 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 100 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |  31 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  23 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h       |  12 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  18 +-
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 705 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 221 ++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_plane.c      |  82 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  64 ++
 14 files changed, 1334 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_common.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_plane.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h

-- 
2.17.1


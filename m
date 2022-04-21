Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A4A50A5D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 18:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiDUQfH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 12:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiDUQeu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 12:34:50 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6CE55496B2;
        Thu, 21 Apr 2022 09:31:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,279,1643641200"; 
   d="scan'208";a="117591258"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Apr 2022 01:31:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.11])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9351140065CE;
        Fri, 22 Apr 2022 01:31:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/4] Add RZ/G2L Display support
Date:   Thu, 21 Apr 2022 17:31:24 +0100
Message-Id: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
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
so most of code is based on R-Car with new CRTC/DRM driver specific to
RZ/G2L

V2->v3:
 * Added new bindings for RZ/G2L DU
 * Removed indirection and created new DRM driver based on R-Car DU
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

Biju Das (4):
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  drm: rcar-du: Fix typo
  drm: rcar-du: Add num_rpf to struct rcar_du_device_info
  drm: rcar-du: Add RZ/G2L DU Support

 .../bindings/display/renesas,rzg2l-du.yaml    | 159 ++++
 drivers/gpu/drm/rcar-du/Kconfig               |  16 +-
 drivers/gpu/drm/rcar-du/Makefile              |   9 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  17 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |   8 +-
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 745 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h       | 104 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 192 +++++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h        | 102 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c    | 113 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h    |  29 +
 drivers/gpu/drm/rcar-du/rzg2l_du_group.h      |  32 +
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c        | 782 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h        |  43 +
 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  64 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c        | 420 ++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h        |  93 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c  | 247 ++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h  |  42 +
 20 files changed, 3212 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_group.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_writeback.h

-- 
2.25.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5225A6F40AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 May 2023 12:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbjEBKJW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 May 2023 06:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjEBKJV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2023 06:09:21 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3DBA1A5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 May 2023 03:09:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,243,1677510000"; 
   d="scan'208";a="161412823"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 May 2023 19:09:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6701B41C9BA9;
        Tue,  2 May 2023 19:09:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Date:   Tue,  2 May 2023 11:09:07 +0100
Message-Id: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.
 
The output from DSI is connected to ADV7535.

Created a vendor specific directory renesas and moved all renesas drm drivers
to it (rcar-du and shmobile). Then added support for RZ/G2L DU DRM driver by
creating rz_du directory.

Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922717E4CCFE07F3C25FBC986989@OS0PR01MB5922.jpnprd01.prod.outlook.com/#t

v8->v9:
 * Added Rb tag from Laurent and Acked-by tag from Kieran for patch#1.
 * Added Rb tag from Laurent and Geert for patch#3.
 * Dropped reset_control_assert() from error patch for rzg2l_du_crtc_get() as
   suggested by Philipp Zabel.
 * Added Rb tag from Laurent oatch#5.
 * Updated MAINTAINERS entries for common parts(Makefile and Kconfig).
v7->v8:
 * Moved rcar-du and shmobile DRM drivers to renesas specific vendor directory.
 * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
 * Added Rb tag from Rob for RZ/V2L DU bindings patch.
 * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating rz_du folder.
 * Updated MAINTAINERS entries.
v6->v7:
 * Split DU lib and  RZ/G2L du driver as separate patch series as
   DU support added to more platforms based on RZ/G2L alike SoCs.
 * Rebased to latest drm-tip.
 * Added patch #2 for binding support for RZ/V2L DU
 * Added patch #4 for driver support for RZ/V2L DU
 * Added patch #5 for SoC DTSI support for RZ/G2L DU
 * Added patch #6 for SoC DTSI support for RZ/V2L DU
 * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L} SoCs.
 * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
v5->v6:
 * Merged DU lib and RZ/G2L du driver in same patch series
 * Rebased to latest drm-misc.
 * Merged patch#1 to RZ/G2L Driver patch.
 * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
 * Optimized rzg2l_du_output_name() by removing unsupported outputs.

v4->v5:
 * Added Rb tag from Rob for binding patch.
 * Started using RCar DU libs(kms, vsp and encoder)
 * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
   rcar_du_format_info and rcar_du_encoder.
v3->v4:
 * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
 * started using same compatible for RZ/G2{L,LC}
 * Removed rzg2l_du_group.h and struct rzg2l_du_group
 * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
 * Removed rzg2l_du_group_restart
 * Updated rzg2l_du_crtc_set_display_timing
 * Removed mode_valid callback.
 * Updated rzg2l_du_crtc_create() parameters
 * Updated compatible
 * Removed RZG2L_DU_MAX_GROUPS
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

Biju Das (5):
  drm: Place Renesas drivers in a separate dir
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
  drm: Add RZ/G2L DU Support
  MAINTAINERS: Add maintainer for RZ DU drivers

 .../bindings/display/renesas,rzg2l-du.yaml    | 129 +++
 MAINTAINERS                                   |  16 +-
 drivers/gpu/drm/Kconfig                       |   4 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/renesas/Kconfig               |   5 +
 drivers/gpu/drm/renesas/Makefile              |   5 +
 drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig |   0
 .../gpu/drm/{ => renesas}/rcar-du/Makefile    |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c  |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_crtc.c  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_crtc.h  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_drv.c   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_drv.h   |   0
 .../{ => renesas}/rcar-du/rcar_du_encoder.c   |   0
 .../{ => renesas}/rcar-du/rcar_du_encoder.h   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_group.c |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_group.h |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_kms.c   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_kms.h   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_plane.c |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_plane.h |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_regs.h  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_vsp.c   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_vsp.h   |   0
 .../{ => renesas}/rcar-du/rcar_du_writeback.c |   0
 .../{ => renesas}/rcar-du/rcar_du_writeback.h |   0
 .../drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c  |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h |   0
 .../{ => renesas}/rcar-du/rcar_lvds_regs.h    |   0
 .../drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c |   0
 .../drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h |   0
 .../rcar-du/rcar_mipi_dsi_regs.h              |   0
 .../{ => renesas}/rcar-du/rzg2l_mipi_dsi.c    |   0
 .../rcar-du/rzg2l_mipi_dsi_regs.h             |   0
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 714 ++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  99 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
 .../gpu/drm/{ => renesas}/shmobile/Kconfig    |   0
 .../gpu/drm/{ => renesas}/shmobile/Makefile   |   0
 .../shmobile/shmob_drm_backlight.c            |   0
 .../shmobile/shmob_drm_backlight.h            |   0
 .../{ => renesas}/shmobile/shmob_drm_crtc.c   |   0
 .../{ => renesas}/shmobile/shmob_drm_crtc.h   |   0
 .../{ => renesas}/shmobile/shmob_drm_drv.c    |   0
 .../{ => renesas}/shmobile/shmob_drm_drv.h    |   0
 .../{ => renesas}/shmobile/shmob_drm_kms.c    |   0
 .../{ => renesas}/shmobile/shmob_drm_kms.h    |   0
 .../{ => renesas}/shmobile/shmob_drm_plane.c  |   0
 .../{ => renesas}/shmobile/shmob_drm_plane.h  |   0
 .../{ => renesas}/shmobile/shmob_drm_regs.h   |   0
 62 files changed, 2816 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 create mode 100644 drivers/gpu/drm/renesas/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/Makefile
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi_regs.h (100%)
 create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
 rename drivers/gpu/drm/{ => renesas}/shmobile/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_regs.h (100%)

-- 
2.25.1


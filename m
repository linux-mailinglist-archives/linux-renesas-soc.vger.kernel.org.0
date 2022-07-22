Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8194B57E4BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jul 2022 18:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235947AbiGVQtY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 12:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236010AbiGVQtS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 12:49:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EEE199670;
        Fri, 22 Jul 2022 09:49:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,186,1654527600"; 
   d="scan'208";a="128803935"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jul 2022 01:49:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 497DD40A263E;
        Sat, 23 Jul 2022 01:49:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 0/5] Add support for RZ/G2L VSPD
Date:   Fri, 22 Jul 2022 17:49:02 +0100
Message-Id: <20220722164907.16587-1-biju.das.jz@bp.renesas.com>
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

The RZ/G2L VSPD provides a single VSPD instance. It has the following
sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.

The VSPD block on RZ/G2L does not have a version register, so added a
new compatible string "renesas,r9a07g044-vsp2" with a data pointer containing
the info structure. Also the reset line is shared with the DU module.

This patch series is tested on RZ/G1N, RZ/G2M and RZ/G2L boards.

v11->v12:
 * Replaced read_poll_timeout_atomic-> udelay(1) as testing on RZ/G1N
   shows this delay is sufficient to avoid lock-up.
 * Removed Rb tags from patch#2.
v10->v11:
 * Added poll for reset status in order to avoid lock-up on R-Car Gen2
 * with vsp register access after deassert.

v9->v10
 * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}

V8->v9
 * Added Rb tag from Geert for patch#3
 * Replaced break with return info in case a Model match is found and
   removed additional check for non-match case.
 * Used generic check for matching SoCs with LBA feature.
 * Replaced the code comments RZ/G2L {SoC's,SoC} with RZ/G2L SoCs.
v7->v8:
 * Split the patch for adding s/w version, feature bit and RZ/G2L support
 * Added feature bit VSP1_HAS_NON_ZERO_LBA to device_info
 * Added .soc for RZ/G2L
 * Replaced the compatible "renesas,rzg2l-vsp2" -> "renesas,r9a07g044-vsp2"
 * Updated Clock-names to false for non RZ/G2L SoC's on binding doc
 * Added Rb tag from Laurent for bindings
v6->v7:
 * Added Rb tag from Kieran for patch#3
 * Added a quirk to handle LIF0 buffer attribute related
   changes for V3M and G2L.
 * Removed the macro for VSP HW version
v5->v6:
 * Rebased to media_staging and updated commit header
 * Removed LCDC reference clock description from bindings
 * Changed the clock name from du.0->aclk from bindings
 * Added Rb tag from Laurent for reset patch
 * Added forward declaration for struct reset_control
 * Updated vsp1_device_get() with changes suggested by Laurent
 * Updated error message for reset_control_get form ctrl->control.
 * Removed the extra tab from rzg2l_vsp2_device_info
 * Changed the function vsp1_lookup->vsp1_lookup_info and
   all info match related code moved here.
 * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
   distinguish HW & SW IP_VSP_Version.
 * Used 0x80 for RZG2L VSPD model and SoC identification
 * Updated Switch() for LIF0 buffer attribute handling.
v4->v5:
 * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
 * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
   for SoC identification for RZ/G2L SoC's.
v3->v4:
 * Restored error check for pm_runtime_resume_and_get and calls
   assert() in case of failure.
 * Added Rb tag from Geert
 * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M SoC's
v2->v3:
 * Added Rb tags from Krzysztof and Philipp
 * If reset_control_deassert() failed, return ret directly.
 * Fixed version comparison in vsp1_lookup()
v1->v2:
 * Used reference counted reset handle to perform deassert/assert
 * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
 * Added standalone device info for rzg2l-vsp2.
 * Added vsp1_lookup helper function.
 * Updated comments for LIF0 buffer attribute register
 * Used last ID for rzg2l-vsp2.
RFC->v1:
 * Added reset support as separate patch
 * Moved rstc just after the bus_master field in struct vsp1_device
 * Used data pointer containing info structure to retrieve version information
 * Updated commit description
 * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
 * Defined the clocks
 * Clock max Items is based on SoC Compatible string
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-20-biju.das.jz@bp.renesas.com/

Biju Das (5):
  media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD bindings
  media: renesas: vsp1: Add support to deassert/assert reset line
  media: renesas: vsp1: Add support for VSP software version
  media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA feature bit
  media: renesas: vsp1: Add support for RZ/G2L VSPD

 .../bindings/media/renesas,vsp1.yaml          |  53 ++++++---
 drivers/media/platform/renesas/vsp1/vsp1.h    |   4 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 101 +++++++++++++++---
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  12 +--
 .../media/platform/renesas/vsp1/vsp1_regs.h   |   6 ++
 5 files changed, 142 insertions(+), 34 deletions(-)

-- 
2.25.1


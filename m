Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8A3B5AB72D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 19:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233264AbiIBRIg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 13:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbiIBRIf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:08:35 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D436110D9B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 10:08:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,283,1654527600"; 
   d="scan'208";a="133510976"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Sep 2022 02:08:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E01440078DC;
        Sat,  3 Sep 2022 02:08:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/10] Add RCar DU lib support
Date:   Fri,  2 Sep 2022 18:08:16 +0100
Message-Id: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
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

Both RZ/G2L and RCar display system uses similar hardware pipeline for
display ie, it uses FCPV, VSPD and DU. Both FCPV and VSPD are almost
similar, but DU there are some differences like it does not have
plane/group registers.

Since the pipeline and software architecture are similar, we can reuse the
DU code for RCar to RZ/G2L as well.

This patch series adds RCar DU lib support(Encoder, vsp and KMS) by moving
common codes with some trivial changes to the lib.

The subsequent patch series will add support for RZ/G2L DU.

Note:
 * This patch series is based on drm-misc-next and du-next
 * The KConfig and Make file depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220829091901.641784-3-biju.das.jz@bp.renesas.com/

v1->v2:
 * Rebased on drm-misc-next and DU-next.
 * Fixed the warning reported by bot for patch#2.

Biju Das (10):
  drm: rcar-du: Add RZ/G2L reset and clocks to struct rcar_du_crtc
  drm: rcar-du: Add encoder lib support
  drm: rcar-du: Add kms lib support
  drm: rcar-du: Add vsp lib support
  drm: rcar-du: Move rcar_du_vsp_atomic_begin()
  drm: rcar-du: Move rcar_du_vsp_atomic_flush()
  drm: rcar-du: Move vsp rcar_du_vsp_{map,unmap}_fb()
  drm: rcar-du: Move rcar_du_dumb_create()
  drm: rcar-du: Move rcar_du_gem_prime_import_sg_table()
  drm: rcar-du: Add rcar_du_lib_vsp_init()

 drivers/gpu/drm/rcar-du/Kconfig               |  10 +
 drivers/gpu/drm/rcar-du/Makefile              |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  10 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 117 +-----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138 +++++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |  30 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 358 -----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h         |  29 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c     | 379 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h     |  41 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 258 +-----------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |  26 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c     | 286 +++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h     |  52 +++
 15 files changed, 961 insertions(+), 791 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h

-- 
2.25.1


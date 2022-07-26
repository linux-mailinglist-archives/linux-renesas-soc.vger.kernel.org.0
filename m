Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A035817A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 18:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiGZQmR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 12:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiGZQmQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 12:42:16 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9093BBE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jul 2022 09:42:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; 
   d="scan'208";a="129198076"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5A1704004CE0;
        Wed, 27 Jul 2022 01:42:11 +0900 (JST)
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
Subject: [PATCH 00/10] Add RCar DU lib support
Date:   Tue, 26 Jul 2022 17:41:58 +0100
Message-Id: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
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

Adding RCar DU lib support(Encoder, vsp and KMS) proved that it can save
50% code saving on RZ/G2L compared to patch series [1].

The current patchset contains just movement of codes with some trivial changes.

The subsequent patch series will have more additions to vsp and kms library.
There is also plan to add library support for DU DRM and DU CRTC
(Not yet ready/tested), which will further increase the common code.

Current patch set + subsequent patch sets are tested on both RZ/G2M, RZ/G1N and
RZ/G2L.

[1] https://lore.kernel.org/linux-renesas-soc/OS0PR01MB59226CE75483AD2B96833B3786949@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t

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
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 120 +-----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |  30 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 356 ----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h         |  31 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c     | 394 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h     |  42 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 249 +----------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |  66 +--
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c     | 288 +++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h     |  93 +++++
 15 files changed, 1020 insertions(+), 825 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h

-- 
2.25.1


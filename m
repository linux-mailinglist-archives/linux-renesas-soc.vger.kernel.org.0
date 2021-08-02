Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9C33DD519
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 14:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhHBMFQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 08:05:16 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:27978 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233446AbhHBMFQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 08:05:16 -0400
X-IronPort-AV: E=Sophos;i="5.84,288,1620658800"; 
   d="scan'208";a="89532917"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2021 21:05:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.138])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C5B41435635B;
        Mon,  2 Aug 2021 21:05:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 0/3] Add RZ/G2L DMAC support
Date:   Mon,  2 Aug 2021 13:04:57 +0100
Message-Id: <20210802120500.7635-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add DMAC support on RZ/G2L SoC's.

It is based on the work done by Chris Brandt for RZ/A DMA driver.

v5->v6:
 * Added Rb tag from Rob for binding patch
 * Fixed dma_addr_t and size_t format specifier issue reported by
   kernel test robot
 * Started using ARRAY_SIZE macro instead of  magic number in
   rz_dmac_ds_to_val_mapping function.

v4->v5:
 * Passing legacy slave channel configuration parameters using dmaengine_slave_config is prohibited.
   So started passing this parameters in DT instead, by encoding MID/RID values with channel parameters
   in the #dma-cells.
 * Removed Rb tag's of Geert and Rob since there is a modification in binding patch
 * Added 128 byte slave bus width support
 * Removed SoC dtsi and Defconfig patch from this series. Will send as separate patch.

Ref:-
  https://lore.kernel.org/linux-renesas-soc/20210719092535.4474-1-biju.das.jz@bp.renesas.com/T/#ma0b261df6d4400882204aaaaa014ddb59c479db4

v3->v4:
 * Added Rob's Rb tag for binding patch.
 * Incorporated Vinod and Geert's review comments.
v2->v3:
  * Described clocks and resets in binding file as per Rob's feedback.

v1->v2
 * Started using virtual DMAC
 * Added Geert's Rb tag for binding patch.

Biju Das (3):
  dt-bindings: dma: Document RZ/G2L bindings
  dmaengine: Extend the dma_slave_width for 128 bytes
  drivers: dma: sh: Add DMAC driver for RZ/G2L SoC

 .../bindings/dma/renesas,rz-dmac.yaml         | 130 +++
 drivers/dma/sh/Kconfig                        |   9 +
 drivers/dma/sh/Makefile                       |   1 +
 drivers/dma/sh/rz-dmac.c                      | 971 ++++++++++++++++++
 include/linux/dmaengine.h                     |   3 +-
 5 files changed, 1113 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
 create mode 100644 drivers/dma/sh/rz-dmac.c

-- 
2.17.1


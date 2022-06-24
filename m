Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6B855A07D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jun 2022 20:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiFXSDW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jun 2022 14:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiFXSDV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 14:03:21 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24795E00E;
        Fri, 24 Jun 2022 11:03:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,218,1650898800"; 
   d="scan'208";a="125577696"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2022 03:03:19 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0840740C554E;
        Sat, 25 Jun 2022 03:03:14 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add PLIC support for Renesas RZ/Five SoC
Date:   Fri, 24 Jun 2022 19:03:09 +0100
Message-Id: <20220624180311.3007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds PLIC support for Renesas RZ/Five SoC.

Sending this as an RFC based on the discussion [0].

This patches have been tested with I2C and DMAC interface as these
blocks have EDGE interrupts.

[0] https://lore.kernel.org/linux-arm-kernel/87o80a7t2z.wl-maz@kernel.org/T/

RFC-->v1:
* Fixed review comments pointed by Rob and Geert.
* Changed implementation for EDGE interrupt handling on Renesas RZ/Five SoC.

RFC: https://lore.kernel.org/linux-renesas-soc/
20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com/T/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: interrupt-controller: sifive,plic: Document Renesas
    RZ/Five SoC
  irqchip/sifive-plic: Add support for Renesas RZ/Five SoC

 .../sifive,plic-1.0.0.yaml                    | 40 +++++++-
 drivers/irqchip/irq-sifive-plic.c             | 95 ++++++++++++++++++-
 2 files changed, 127 insertions(+), 8 deletions(-)

-- 
2.25.1


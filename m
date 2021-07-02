Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C1D3BA1A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 15:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhGBNwt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 09:52:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:53181 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232754AbhGBNwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 09:52:49 -0400
X-IronPort-AV: E=Sophos;i="5.83,317,1616425200"; 
   d="scan'208";a="86361977"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2021 22:50:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7ECA64006189;
        Fri,  2 Jul 2021 22:50:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/9] Add RZ/G2L Sound support
Date:   Fri,  2 Jul 2021 14:50:01 +0100
Message-Id: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add ASoC support on RZ/G2L SoC's.

It is based on the work done by Chris Brandt for RZ/A ASoC driver.

This patch series is based on [1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rzg2l-update-clock-defs-v4


Biju Das (9):
  ASoC: dt-bindings: Document RZ/G2L bindings
  drivers: clk: renesas: r9a07g044-cpg: Add SSIF-2 clock and reset
    entries
  sound: soc: sh: Add RZ/G2L SSIF-2 driver
  arm64: dts: renesas: r9a07g044: Add external audio clock nodes
  arm64: dts: renesas: r9a07g044: Add SSI support
  arm64: defconfig: Enable ASoC sound support for RZ/G2L SoC
  ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
  sound: sh: rz-ssi: Add SSI DMAC support
  arm64: dts: renesas: r9a07g044: Add SSI DMA support

 .../bindings/sound/renesas,rz-ssi.yaml        |  100 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  105 ++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/renesas/r9a07g044-cpg.c           |   20 +
 sound/soc/sh/Kconfig                          |   10 +
 sound/soc/sh/Makefile                         |    4 +
 sound/soc/sh/rz-ssi.c                         | 1078 +++++++++++++++++
 7 files changed, 1318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
 create mode 100644 sound/soc/sh/rz-ssi.c


base-commit: 06c1e6911a7a76b446e4b00fc8bad5d8465932f8
-- 
2.17.1


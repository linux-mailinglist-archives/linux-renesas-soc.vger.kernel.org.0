Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD8E3A1B14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 18:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhFIQju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 12:39:50 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:61208 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231934AbhFIQjs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 12:39:48 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83736868"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2021 01:37:51 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7998B40A2A52;
        Thu, 10 Jun 2021 01:37:49 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] SoC identification support for RZ/G2L
Date:   Wed,  9 Jun 2021 17:37:14 +0100
Message-Id: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds support for RZ/G2{L,LC} SoC
identification.

SoC identification register is part of SYSC block and
currently no driver is added for SYSC block so just the
basic properties are added in binding documentation (and will
updated with the required properties once the driver is in
place) and this node is used in renesas-soc.c for SoC
identification.

Patches are based on top of [1] master branch and is dependent on
patch series [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=497355

Changes for v2:
* Added description for multiple interrupts in SYSC binding doc
* Added interrupt-names property in SYSC binding doc
* Update dtsi to included interrupt-names property for SYSC node
* Mapped entire SYSC block to read the device id
* Included RB tag for patch 1, 3

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation
    for SYSC controller
  soc: renesas: Add support to read LSI DEVID register of RZ/G2{L,LC}
    SoC's
  arm64: dts: renesas: r9a07g044: Add SYSC node to RZ/G2L SoC DTSI

 .../bindings/power/renesas,rzg2l-sysc.yaml    | 63 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 12 ++++
 drivers/soc/renesas/renesas-soc.c             | 33 +++++++++-
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml

-- 
2.17.1


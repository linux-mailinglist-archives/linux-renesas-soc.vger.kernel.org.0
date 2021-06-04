Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA34B39BF53
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 20:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhFDSL1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 14:11:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:12884 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229726AbhFDSL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 14:11:27 -0400
X-IronPort-AV: E=Sophos;i="5.83,248,1616425200"; 
   d="scan'208";a="83439026"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jun 2021 03:09:39 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E24F540C7B95;
        Sat,  5 Jun 2021 03:09:37 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] SoC identification support for RZ/G2L
Date:   Fri,  4 Jun 2021 19:09:30 +0100
Message-Id: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
updated with the required properties once the dirver is in
place) and this node is used in renesas-soc.c for SoC
identification.

This patches series is dependent on [1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=493701

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation
    for SYSC controller
  soc: renesas: Add support to read LSI DEVID register of RZ/G2{L,LC}
    SoC's
  arm64: dts: renesas: r9a07g044: Add SYSC node to RZ/G2L SoC DTSI

 .../bindings/power/renesas,rzg2l-sysc.yaml    | 50 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 10 ++++
 drivers/soc/renesas/renesas-soc.c             | 34 ++++++++++++-
 3 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml

-- 
2.17.1


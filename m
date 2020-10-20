Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37070293C44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Oct 2020 14:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406693AbgJTMwJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Oct 2020 08:52:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6503 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406027AbgJTMwJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 08:52:09 -0400
X-IronPort-AV: E=Sophos;i="5.77,397,1596466800"; 
   d="scan'208";a="60080887"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Oct 2020 21:52:08 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 431C8421A443;
        Tue, 20 Oct 2020 21:52:06 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 0/4] HiHope RZ/G2x add MIPI Adapter board support
Date:   Tue, 20 Oct 2020 13:51:30 +0100
Message-Id: <20201020125134.22625-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds support for MIPI Adapter V2.1 connected to
HiHope RZ/G2{HMN}.

Patches apply on top of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.11

Cheers,
Prabhakar

Changes for v2:
* patches {1,2,4}/4 unchanged
* patch 3/4 disabled csi40 and imx219 nodes

Lad Prabhakar (4):
  arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Add parent macro
    for each sensor
  arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to
    HiHope RZ/G2H
  arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to
    HiHope RZ/G2M
  arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to
    HiHope RZ/G2N

 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../aistarvision-mipi-adapter-2.1.dtsi        |   4 +-
 ...rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi | 109 ++++++++++++++++++
 .../r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts     |  29 +++++
 .../r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts     |  16 +++
 .../dts/renesas/r8a774c0-ek874-mipi-2.1.dts   |   3 +-
 .../r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts     |  16 +++
 7 files changed, 178 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts

-- 
2.17.1


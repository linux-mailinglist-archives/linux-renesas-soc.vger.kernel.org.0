Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307AD284AD5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Oct 2020 13:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgJFL1N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Oct 2020 07:27:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:39282 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725891AbgJFL1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Oct 2020 07:27:13 -0400
X-IronPort-AV: E=Sophos;i="5.77,342,1596466800"; 
   d="scan'208";a="59050092"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Oct 2020 20:27:12 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 288BE42CD75E;
        Tue,  6 Oct 2020 20:27:09 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] HiHope RZ/G2x add MIPI Adapter board support
Date:   Tue,  6 Oct 2020 12:26:57 +0100
Message-Id: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds support for MIPI Adapter V2.1 connected to
HiHope RZ/G2{HMN}.

Cheers,
Prabhakar

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
 .../r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts     |  16 +++
 .../r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts     |  16 +++
 .../dts/renesas/r8a774c0-ek874-mipi-2.1.dts   |   3 +-
 .../r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts     |  16 +++
 7 files changed, 165 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts

-- 
2.17.1


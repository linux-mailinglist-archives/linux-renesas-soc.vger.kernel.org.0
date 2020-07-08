Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1109218EF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 19:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgGHRsj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 13:48:39 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:48841 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgGHRsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 13:48:39 -0400
X-IronPort-AV: E=Sophos;i="5.75,328,1589209200"; 
   d="scan'208";a="51641764"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2020 02:48:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E89474005E3D;
        Thu,  9 Jul 2020 02:48:32 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/8] Add basic DT support for R8A774E1 SoC enabling HiHope RZ/G2H board
Date:   Wed,  8 Jul 2020 18:48:23 +0100
Message-Id: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds basic SOC DT support for RZ/G2H and enabling
HiHope RZ/G2H board. With these minimalist DT the HiHope RZ/G2H
board can be booted from initramfs/eMMC.

This patch series is dependent [1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=314235

Cheers,
Prabhakar


Lad Prabhakar (3):
  dt-bindings: serial: renesas,scif: Document r8a774e1 bindings
  dt-bindings: serial: renesas,hscif: Document r8a774e1 bindings
  dt-bindings: mmc: renesas,sdhi: Add r8a774e1 support

Marian-Cristian Rotariu (5):
  dt-bindings: irqchip: renesas-irqc: Document r8a774e1 bindings
  arm64: defconfig: Enable R8A774E1 SoC
  arm64: dts: renesas: Initial r8a774e1 SoC device tree
  arm64: dts: renesas: Add HiHope RZ/G2H main board support
  arm64: dts: renesas: Add HiHope RZ/G2H sub board support

 .../interrupt-controller/renesas,irqc.yaml    |   1 +
 .../devicetree/bindings/mmc/renesas,sdhi.txt  |   1 +
 .../bindings/serial/renesas,hscif.yaml        |   1 +
 .../bindings/serial/renesas,scif.yaml         |   1 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../arm64/boot/dts/renesas/hihope-common.dtsi |   4 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi  |   4 +-
 .../boot/dts/renesas/hihope-rzg2-ex.dtsi      |   2 +-
 .../dts/renesas/r8a774e1-hihope-rzg2h-ex.dts  |  15 +
 .../dts/renesas/r8a774e1-hihope-rzg2h.dts     |  26 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 652 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 12 files changed, 705 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1.dtsi

-- 
2.17.1


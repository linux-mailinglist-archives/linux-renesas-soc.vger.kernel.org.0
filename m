Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C561F0E08
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 20:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbgFGSf3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 14:35:29 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:50573 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726779AbgFGSf3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 14:35:29 -0400
X-IronPort-AV: E=Sophos;i="5.73,485,1583161200"; 
   d="scan'208";a="49036179"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jun 2020 03:35:27 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2C4BD40C7B88;
        Mon,  8 Jun 2020 03:35:24 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/11] Add support for HiHope RZ/G2M[N] Rev.3.0/4.0
Date:   Sun,  7 Jun 2020 19:34:35 +0100
Message-Id: <1591554886-21725-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds supports for HiHope RZ/G2M[N] Rev.3.0/4.0
boards.

Patches are based on top of renesas-arm-dt-for-v5.9 branch [1].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git

Cheers,
Prabhakar

Lad Prabhakar (11):
  arm64: dts: renesas: r8a774a1-hihope-rzg2m[-ex/-ex-idk-1110wr]: Rename
    HiHope RZ/G2M boards
  arm64: dts: renesas: r8a774b1-hihope-rzg2n[-ex]: Rename HiHope RZ/G2N
    boards
  arm64: dts: renesas: hihope-common: Separate out Rev.2.0 specific into
    hihope-common-rev2.dtsi file
  arm64: dts: renesas: Add HiHope RZ/G2M[N] Rev.3.0/4.0 specific into
    common file
  arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 main board support
  arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 sub board support
  arm64: dts: renesas: hihope-rzg2-ex: Separate out lvds specific nodes
    into common file
  arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 board with
    idk-1110wr display
  arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 main board support
  arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 sub board support
  arm64: dts: renesas: Add HiHope RZ/G2N Rev2.0/3.0/4.0 board with
    idk-1110wr display

 arch/arm64/boot/dts/renesas/Makefile          |  17 ++-
 .../boot/dts/renesas/hihope-common-rev2.dtsi  | 101 +++++++++++++
 .../boot/dts/renesas/hihope-common-rev4.dtsi  | 143 ++++++++++++++++++
 .../arm64/boot/dts/renesas/hihope-common.dtsi |  87 +----------
 .../boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi |  52 +++++++
 .../boot/dts/renesas/hihope-rzg2-ex.dtsi      |  37 -----
 .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts   |  43 +-----
 .../dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  |   6 +-
 ...a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts |  15 ++
 .../renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts |  19 +++
 .../renesas/r8a774a1-hihope-rzg2m-rev2.dts    |  38 +++++
 .../dts/renesas/r8a774a1-hihope-rzg2m.dts     |   5 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |   2 +
 .../r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts   |  15 ++
 .../dts/renesas/r8a774b1-hihope-rzg2n-ex.dts  |   6 +-
 ...a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts |  15 ++
 .../renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts |  15 ++
 .../renesas/r8a774b1-hihope-rzg2n-rev2.dts    |  42 +++++
 .../dts/renesas/r8a774b1-hihope-rzg2n.dts     |   5 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |   2 +
 20 files changed, 490 insertions(+), 175 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common-rev4.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts

-- 
2.17.1


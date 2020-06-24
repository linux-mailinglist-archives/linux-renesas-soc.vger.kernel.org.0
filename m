Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2C9207404
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389544AbgFXNMX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:12:23 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19703 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728843AbgFXNMX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:12:23 -0400
X-IronPort-AV: E=Sophos;i="5.75,275,1589209200"; 
   d="scan'208";a="50489587"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jun 2020 22:12:21 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 688D740062CE;
        Wed, 24 Jun 2020 22:12:19 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/11] Add support for HiHope RZ/G2M[N] Rev.3.0/4.0
Date:   Wed, 24 Jun 2020 14:11:59 +0100
Message-Id: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds supports for HiHope RZ/G2M[N] Rev.3.0/4.0
boards.

Patches are based on top of renesas-arm-dt-for-v5.9 branch [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git

Changes for v2:
* Added Reviewed-by tag from Geert
* Renamed hihope-common-rev2.dtsi to hihope-rev2.dtsi
* Added comment wrt SW43 in r8a774a1-hihope-rzg2m-rev2-ex.dts
* Renamed hihope-common-rev4.dtsi to hihope-rev4.dtsi
* LED node names in hihope-common.dtsi are updated according to Rev.4.0
* Removed extra line from patch 10/11

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
 .../arm64/boot/dts/renesas/hihope-common.dtsi |  71 +---------
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi  |  86 ++++++++++++
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi  | 124 ++++++++++++++++++
 .../boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi |  52 ++++++++
 .../boot/dts/renesas/hihope-rzg2-ex.dtsi      |  37 ------
 .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts   |  43 +-----
 .../dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  |   6 +-
 ...a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts |  15 +++
 .../renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts |  20 +++
 .../renesas/r8a774a1-hihope-rzg2m-rev2.dts    |  37 ++++++
 .../dts/renesas/r8a774a1-hihope-rzg2m.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |   2 +
 .../r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts   |  15 +++
 .../dts/renesas/r8a774b1-hihope-rzg2n-ex.dts  |   5 +-
 ...a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts |  15 +++
 .../renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts |  15 +++
 .../renesas/r8a774b1-hihope-rzg2n-rev2.dts    |  41 ++++++
 .../dts/renesas/r8a774b1-hihope-rzg2n.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |   2 +
 20 files changed, 456 insertions(+), 159 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
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


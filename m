Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956B13940FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 May 2021 12:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbhE1Khc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 May 2021 06:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236484AbhE1Kha (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 May 2021 06:37:30 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8178EC0613CE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 May 2021 03:35:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
        by baptiste.telenet-ops.be with bizsmtp
        id AAbs2500X20MPSF01AbsAd; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmZqK-00AD9W-Dr; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmXtU-007G6K-Gj; Fri, 28 May 2021 10:31:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas ARM DT updates for v5.14
Date:   Fri, 28 May 2021 10:30:50 +0200
Message-Id: <cover.1622188835.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622188833.git.geert+renesas@glider.be>
References: <cover.1622188833.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.14-tag1

for you to fetch changes up to 1b32fce42bff899dfb9b72962f46ca5542c7647c:

  ARM: dts: alt: Add SW2 as GPIO keys (2021-05-27 15:46:21 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.14

  - GPIO extender support for the Falcon development board,
  - Switches support for the ALT development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Adam Ford (5):
      ARM: dts: renesas: Add fck to etheravb-rcar-gen2 clock-names list
      arm64: dts: renesas: Add fck to etheravb-rcar-gen3 clock-names list
      arm64: dts: renesas: beacon kit: Setup AVB refclk
      arm64: dts: renesas: beacon: Fix USB extal reference
      arm64: dts: renesas: beacon: Fix USB ref clock references

Geert Uytterhoeven (4):
      ARM: dts: r8a7779, marzen: Fix DU clock names
      ARM: dts: koelsch: Rename sw2 to keyboard
      ARM: dts: rcar-gen1: Correct internal delay for i2c[123]
      ARM: dts: renesas: Move enable-method to CPU nodes

Niklas Söderlund (1):
      arm64: dts: renesas: falcon-csi-dsi: Add GPIO extenders

Valentine Barshak (2):
      arm64: dts: renesas: v3msk: Fix memory size
      arm64: dts: renesas: eagle: Add x1 clock

Wolfram Sang (2):
      arm64: dts: renesas: condor: Switch eMMC bus to 1V8
      ARM: dts: alt: Add SW2 as GPIO keys

 arch/arm/boot/dts/r8a7742.dtsi                     |  6 +++-
 arch/arm/boot/dts/r8a7743.dtsi                     |  4 ++-
 arch/arm/boot/dts/r8a7744.dtsi                     |  4 ++-
 arch/arm/boot/dts/r8a7745.dtsi                     |  4 ++-
 arch/arm/boot/dts/r8a77470.dtsi                    |  4 ++-
 arch/arm/boot/dts/r8a7778.dtsi                     |  3 ++
 arch/arm/boot/dts/r8a7779-marzen.dts               |  2 +-
 arch/arm/boot/dts/r8a7779.dtsi                     |  4 +++
 arch/arm/boot/dts/r8a7790.dtsi                     | 10 +++++-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  4 +--
 arch/arm/boot/dts/r8a7791.dtsi                     |  4 ++-
 arch/arm/boot/dts/r8a7792.dtsi                     |  4 ++-
 arch/arm/boot/dts/r8a7793.dtsi                     |  3 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  | 42 ++++++++++++++++++++++
 arch/arm/boot/dts/r8a7794.dtsi                     |  4 ++-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  4 +--
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |  8 +++--
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  8 +++++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |  2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |  8 +----
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  1 +
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  | 21 +++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  6 ++++
 34 files changed, 146 insertions(+), 25 deletions(-)

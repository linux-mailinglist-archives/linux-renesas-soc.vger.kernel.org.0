Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFF842EFE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 13:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238519AbhJOLqt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 07:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235360AbhJOLqs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 07:46:48 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68BDC061570
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Oct 2021 04:44:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ad48:4534:27c0:db4b])
        by baptiste.telenet-ops.be with bizsmtp
        id 6Bke260020SQF6f01Bkebj; Fri, 15 Oct 2021 13:44:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mbLdd-0053bD-Ns; Fri, 15 Oct 2021 13:44:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mbLdd-004hf4-AR; Fri, 15 Oct 2021 13:44:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v5.16 (take two)
Date:   Fri, 15 Oct 2021 13:44:30 +0200
Message-Id: <cover.1634298094.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi soc folks,

The following changes since commit 732e8ee0351c59ded4d88106437a7ad1cff4cb83:

  arm64: dts: renesas: rcar-gen3: Add missing Ethernet PHY resets (2021-09-28 09:59:26 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.16-tag2

for you to fetch changes up to 6be85db40135fb55883f35476a1edd00eb7a9a6b:

  mailmap: Fix text encoding for Niklas Söderlund (2021-10-15 09:50:12 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.16 (take two)

  - SPI Multi I/O Bus, SDHI, and Ethernet support for the RZ/G2L SoC,
  - SPI Multi I/O Bus, camera, and video-on support for the R-Car V3U
    SoC,
  - SPI FLASH support for the Falcon development board,
  - eMMC, microSD, and Ethernet support for the RZ/G2L SMARC EVK
    development board,
  - 2 GHz High-Performance support for the R-Car H3e-2G, M3e-2G, and
    M3Ne-2G SoCs,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      arm64: dts: renesas: r9a07g044: Add SDHI nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on SMARC platform
      arm64: dts: renesas: rzg2l-smarc: Enable microSD on SMARC platform
      arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable Ethernet

Duc Nguyen (1):
      arm64: dts: renesas: r8a779a0: Add RPC node

Geert Uytterhoeven (1):
      arm64: dts: renesas: rcar-gen3e: Add Cortex-A57 2 GHz opps

Lad Prabhakar (1):
      arm64: dts: renesas: r9a07g044: Add SPI Multi I/O Bus controller node

Niklas Söderlund (3):
      arm64: dts: renesas: r8a779a0: Add and connect all CSI-2, ISP and VIN nodes
      arm64: dts: renesas: Add ports node to all adv7482 nodes
      mailmap: Fix text encoding for Niklas Söderlund

Wolfram Sang (1):
      arm64: dts: renesas: falcon-cpu: Add SPI flash via RPC

 .mailmap                                           |    1 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   40 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   33 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 1349 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi          |    9 +
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi          |    9 +
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi          |    9 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   89 ++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  240 ++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |   63 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   54 +-
 11 files changed, 1850 insertions(+), 46 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

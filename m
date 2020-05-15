Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3EC1D4E19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 14:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgEOMu5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 08:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgEOMu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 08:50:56 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F78FC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 05:50:56 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad37:48f9:900a:523e])
        by baptiste.telenet-ops.be with bizsmtp
        id f0qp2200V1TfvYq010qp6s; Fri, 15 May 2020 14:50:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZZnd-0005Y5-Fs; Fri, 15 May 2020 14:50:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZZnd-0005we-DI; Fri, 15 May 2020 14:50:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v5.7 (take two)
Date:   Fri, 15 May 2020 14:50:43 +0200
Message-Id: <20200515125043.22811-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

The following changes since commit b704fc1da9b84d7145db550a13e2b7140f6b419b:

  ARM: dts: r7s9210: Remove bogus clock-names from OSTM nodes (2020-04-28 10:15:38 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v5.7-tag2

for you to fetch changes up to c8e233bfba3b21cb6b9814b4bfe2502478c7b895:

  ARM: dts: iwg20d-q7-dbcm-ca: Remove unneeded properties in hdmi@39 (2020-05-15 10:41:35 +0200)

----------------------------------------------------------------
Renesas fixes for v5.7 (take two)

  - Fix a wrong clock configuration on R-Mobile A1,
  - Minor fixes that are fast-tracked to avoid introducing regressions
    during conversion of DT bindings to json-schema.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: r8a7740: Add missing extal2 to CPG node

Ricardo Cañuelo (3):
      arm64: dts: renesas: Make hdmi encoder nodes compliant with DT bindings
      ARM: dts: renesas: Make hdmi encoder nodes compliant with DT bindings
      ARM: dts: iwg20d-q7-dbcm-ca: Remove unneeded properties in hdmi@39

 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi            |  2 --
 arch/arm/boot/dts/r8a7740.dtsi                      |  2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts |  2 --
 arch/arm/boot/dts/r8a7790-lager.dts                 |  2 --
 arch/arm/boot/dts/r8a7790-stout.dts                 |  2 --
 arch/arm/boot/dts/r8a7791-koelsch.dts               |  2 --
 arch/arm/boot/dts/r8a7791-porter.dts                |  2 --
 arch/arm/boot/dts/r8a7792-blanche.dts               |  2 --
 arch/arm/boot/dts/r8a7792-wheat.dts                 | 12 ++++--------
 arch/arm/boot/dts/r8a7793-gose.dts                  |  2 --
 arch/arm/boot/dts/r8a7794-silk.dts                  |  2 --
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts      |  2 --
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts      |  2 --
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts     |  2 --
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts      |  2 --
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts      |  2 --
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts      |  6 ++----
 17 files changed, 7 insertions(+), 41 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

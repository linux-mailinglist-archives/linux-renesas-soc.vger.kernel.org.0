Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DD42239DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 12:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQK6p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 06:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgGQK6p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 06:58:45 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DFAC08C5CE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 03:58:44 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id 4Ayg2300G4C55Sk01AygMx; Fri, 17 Jul 2020 12:58:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwO4e-0001Kd-JZ; Fri, 17 Jul 2020 12:58:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwNFA-00041e-L9; Fri, 17 Jul 2020 12:05:28 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v5.8
Date:   Fri, 17 Jul 2020 12:05:23 +0200
Message-Id: <20200717100523.15418-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v5.8-tag1

for you to fetch changes up to fecc5cfcd55f7aacc483726c405a951bd6aaaf2e:

  arm64: defconfig: Enable CONFIG_PCIE_RCAR_HOST (2020-07-13 10:45:50 +0200)

----------------------------------------------------------------
Renesas fixes for v5.8

  - Replace CONFIG_PCIE_RCAR by CONFIG_PCIE_RCAR_HOST in the defconfig,
    to unblock a planned Kconfig change.

Thanks for pulling!
----------------------------------------------------------------
Lad Prabhakar (1):
      arm64: defconfig: Enable CONFIG_PCIE_RCAR_HOST

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD6A6375A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Nov 2022 10:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiKXJz1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Nov 2022 04:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiKXJzN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2022 04:55:13 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FC3131836
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Nov 2022 01:55:10 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c970:f1ea:4e63:5f3b])
        by albert.telenet-ops.be with bizsmtp
        id o9v7280033AMMKv069v7ip; Thu, 24 Nov 2022 10:55:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oy8wk-001UtF-OW; Thu, 24 Nov 2022 10:55:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oy8wk-001vZD-3Z; Thu, 24 Nov 2022 10:55:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v6.2 (take three)
Date:   Thu, 24 Nov 2022 10:55:00 +0100
Message-Id: <cover.1669283381.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

The following changes since commit dcad240c15c10bebdccd1f29f1a44787528f2d76:

  kbuild: Cleanup DT Overlay intermediate files as appropriate (2022-11-18 14:45:30 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v6.2-tag3

for you to fetch changes up to 599cb2c6d76485c55b150868482c4003976327a1:

  arm64: dts: renesas: Rename DTB overlay source files from .dts to .dtso (2022-11-21 10:05:54 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v6.2 (take three)

  - Rename Renesas DTB overlay source files from .dts to .dtso.

Thanks for pulling!

----------------------------------------------------------------
Andrew Davis (1):
      arm64: dts: renesas: Rename DTB overlay source files from .dts to .dtso

Geert Uytterhoeven (1):
      Merge branch 'dt/dtbo-rename' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux into renesas-arm-dt-for-v6.2

 arch/arm/boot/dts/r8a7742.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |   2 +-
 arch/arm/boot/dts/r9a06g032.dtsi                   |  10 +-
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   1 +
 ...04xd12.dts => draak-ebisu-panel-aa104xd12.dtso} |   0
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  24 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  30 +-
 .../boot/dts/renesas/r8a779f0-spider-ethernet.dtsi |  90 +++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 126 +++-
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  89 ++-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 735 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         | 362 +++++-----
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  73 ++
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  17 +-
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  |  30 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  17 +-
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |   4 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  31 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   5 -
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   5 -
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  28 -
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi |   7 +
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |   7 -
 ...aa104xd12.dts => salvator-panel-aa104xd12.dtso} |   0
 27 files changed, 1350 insertions(+), 351 deletions(-)
 rename arch/arm64/boot/dts/renesas/{draak-ebisu-panel-aa104xd12.dts => draak-ebisu-panel-aa104xd12.dtso} (100%)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
 rename arch/arm64/boot/dts/renesas/{salvator-panel-aa104xd12.dts => salvator-panel-aa104xd12.dtso} (100%)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

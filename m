Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E5278EC91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbjHaLxP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346178AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221A810DE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by michel.telenet-ops.be with bizsmtp
        id gBse2A00M3874jb06Bse6K; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-00274K-4j;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIUV-IS;
        Thu, 31 Aug 2023 13:52:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/13] ARM: dts: renesas: LBSC and FLASH improvements
Date:   Thu, 31 Aug 2023 13:52:22 +0200
Message-Id: <cover.1693481518.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for various FLASH devices on the Blanche,
Genmai, Marzen, and RSK+RZA1 development boards.  As several of these
FLASH devices reside in the external address space of a (Local) Bus
State Controller, the current (too) minimal support for (L)BSC is
improved first.  All of this is preceded by two small fixes.

As FLASH on Blanche and Marzen conflicts with SMP, the last two patches
depend on [1], so I marked them RFC.

This has been tested on the APE6-EVM, Blanche, Genmai, Marzen, and
RSK+RZA1 development boards.

Thanks for your comments!

[1] "[PATCH/RFC 0/4] ARM: shmobile: Reserve boot area when SMP is
     enabled"
    https://lore.kernel.org/all/cover.1693409184.git.geert+renesas@glider.be

Geert Uytterhoeven (13):
  ARM: dts: renesas: ape6evm: Drop bogus "mtd-rom" compatible value
  ARM: dts: renesas: gr-peach: Remove unneeded probe-type property
  ARM: dts: renesas: Remove unused LBSC nodes from board DTS
  ARM: dts: renesas: r7s72100: Add BSC node
  ARM: dts: renesas: r8a7779: Add LBSC node
  ARM: dts: renesas: r8a7792: Add LBSC node
  ARM: dts: renesas: marzen: Move Ethernet node to LBSC
  ARM: dts: renesas: blanche: Move Ethernet node to LBSC
  ARM: dts: renesas: wheat: Move Ethernet node to LBSC
  ARM: dts: renesas: genmai: Add FLASH nodes
  ARM: dts: renesas: rskrza1: Add FLASH nodes
  ARM: dts: renesas: marzen: Add FLASH node
  ARM: dts: renesas: blanche: Add FLASH node

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 82 ++++++++++++++++++-
 .../boot/dts/renesas/r7s72100-gr-peach.dts    |  6 --
 .../arm/boot/dts/renesas/r7s72100-rskrza1.dts | 71 ++++++++++++++--
 arch/arm/boot/dts/renesas/r7s72100.dtsi       |  7 ++
 .../arm/boot/dts/renesas/r7s9210-rza2mevb.dts |  5 --
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts |  2 +-
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts  | 66 +++++++++++----
 arch/arm/boot/dts/renesas/r8a7779.dtsi        |  7 ++
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   |  5 --
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts |  5 --
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 66 +++++++++++----
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts   | 34 ++++----
 arch/arm/boot/dts/renesas/r8a7792.dtsi        |  7 ++
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     |  5 --
 14 files changed, 289 insertions(+), 79 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

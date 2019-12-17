Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79EF123515
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 19:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfLQSit (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 13:38:49 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:43512 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfLQSis (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 13:38:48 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id f6ei2100B5USYZQ016eiwo; Tue, 17 Dec 2019 19:38:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-0003aF-Io; Tue, 17 Dec 2019 19:38:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-00007v-FM; Tue, 17 Dec 2019 19:38:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] arm64: renesas: Split/rename R-Car H3 support
Date:   Tue, 17 Dec 2019 19:38:36 +0100
Message-Id: <20191217183841.432-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Despite using the same compatible values ("r8a7795"-based) because of
historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
(R8A77951) are really different SoCs, with different part numbers.

Hence this patch series splits the config symbols for R-Car H3, and
renames the related DTS files, to maintain a clear separation between
early (ES1.x) and later (ES2.0+) SoC revisions.  This will pave the way
for configuring out support for early SoC revisions, which can reduce
kernel size, especially in the pin control subsystem.
This is similar to the recent split of R8A7796 symbols for R-Car M3-W
(R8A77960) and M3-W+ (R8A77961)[1], and the related DTS file renames[2],
but different due to the sharing of compatible values between R-Car H3
ES1.x and H3 ES2.0+.

This series also includes the rename/cleanup of the ULCB DTS file names,
as suggested by Eugeniu Rosca.  As DTS files are already being renamed
for v5.6[2], it makes sense to combine them with other renames, to avoid
inconveniencing the user with multiple renames in multiple kernel
versions.

The pin control part will be handled in a separate patch.

For your convenience, all of this is available in the
topic/r8a7795-rename-v1 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

Thanks for your comments!

References:
  [1] "[PATCH v2 00/11] arm64: renesas: Add r8a77961 support"
      https://lore.kernel.org/linux-renesas-soc/20191023123342.13100-1-geert+renesas@glider.be/
  [2] "[PATCH/RFC] arm64: dts: renesas: Rename r8a7796* to r8a77960*"
      https://lore.kernel.org/linux-renesas-soc/20191211131311.23661-1-geert+renesas@glider.be/

Geert Uytterhoeven (5):
  arm64: dts: renesas: Rename r8a7795{-es1,}* to r8a7795[01]*
  arm64: dts: renesas: Drop redudant SoC prefixes from ULCB DTS file
    names
  arm64: dts: renesas: Sort DTBs in Makefile
  arm64: dts: renesas: Prepare for split of ARCH_R8A7795 into
    ARCH_R8A7795[01]
  soc: renesas: Add ARCH_R8A7795[01] for existing R-Car H3

 arch/arm64/boot/dts/renesas/Makefile          | 21 ++++++++++---------
 ...salvator-x.dts => r8a77950-salvator-x.dts} |  4 ++--
 ...795-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} |  4 ++--
 ...a7795-es1-h3ulcb.dts => r8a77950-ulcb.dts} |  4 ++--
 .../{r8a7795-es1.dtsi => r8a77950.dtsi}       |  4 ++--
 ...salvator-x.dts => r8a77951-salvator-x.dts} |  4 ++--
 ...lvator-xs.dts => r8a77951-salvator-xs.dts} |  8 +++----
 ...es1-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} |  4 ++--
 .../{r8a7795-h3ulcb.dts => r8a77951-ulcb.dts} |  4 ++--
 .../renesas/{r8a7795.dtsi => r8a77951.dtsi}   |  2 +-
 ...960-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} |  2 +-
 ...{r8a77960-m3ulcb.dts => r8a77960-ulcb.dts} |  0
 ...65-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} |  2 +-
 ...r8a77965-m3nulcb.dts => r8a77965-ulcb.dts} |  0
 drivers/soc/renesas/Kconfig                   |  8 +++++++
 15 files changed, 40 insertions(+), 31 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-salvator-x.dts => r8a77950-salvator-x.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} (75%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb.dts => r8a77950-ulcb.dts} (89%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1.dtsi => r8a77950.dtsi} (98%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-x.dts => r8a77951-salvator-x.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-xs.dts => r8a77951-salvator-xs.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} (75%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb.dts => r8a77951-ulcb.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a7795.dtsi => r8a77951.dtsi} (99%)
 rename arch/arm64/boot/dts/renesas/{r8a77960-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a77960-m3ulcb.dts => r8a77960-ulcb.dts} (100%)
 rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb.dts => r8a77965-ulcb.dts} (100%)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E6F39E5A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhFGRlD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 13:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbhFGRlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:41:02 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98643C061787
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:39:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c184:ea65:c3d6:a616])
        by michel.telenet-ops.be with bizsmtp
        id EHf9250031G4u2S06Hf9Ba; Mon, 07 Jun 2021 19:39:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDQ-00E7jD-Kq; Mon, 07 Jun 2021 19:39:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDP-007941-SW; Mon, 07 Jun 2021 19:39:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] arm64: dts: renesas: salvator-x(s): Factor out common optional parts
Date:   Mon,  7 Jun 2021 19:39:01 +0200
Message-Id: <cover.1623087028.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

The Renesas Salvator-X(S) family of boards are available with different
SiP options (R-Car H3 ES1.x, H3 ES2.0+, M3-W, M3-W+, M3-N).  To reduce
duplication of board descriptions, the parts common to all SoC and board
combinations are already factored out into salvator-common.dtsi,
salvator-x.dtsi, and salvator-xs.dtsi.  Still, there are a few board
features that are not common to all combos, as the corresponding support
is not present on all SoCs.

Hence this patch series moves out support for the second HDMI channel,
the SATA interface, and the third and fourth USB channels to
salvator-common.dtsi and/or salvator-xs.dtsi.  As these are not present
on all SoCs, its descriptions are protected by SOC_HAS_* preprocessor
symbols, defined in SoC-specific .dtsi files.

This series causes no changes in the generated DTB, except for the
enablement of the SATA device node on Salvator-X board with an R-Car
M3-N SiP, cfr. the comments in [PATCH 2/4].

Thanks for your comments!

Geert Uytterhoeven (4):
  arm64: dts: renesas: salvator-x(s): Factor out HDMI1 parts
  arm64: dts: renesas: salvator-x(s): Factor out SATA parts
  arm64: dts: renesas: salvator-x(s): Factor out USB ch2 parts
  arm64: dts: renesas: salvator-xs: Factor out USB ch3 parts

 .../boot/dts/renesas/r8a77950-salvator-x.dts  |  73 -----------
 arch/arm64/boot/dts/renesas/r8a77950.dtsi     |   2 +
 .../boot/dts/renesas/r8a77951-salvator-x.dts  |  73 -----------
 .../boot/dts/renesas/r8a77951-salvator-xs.dts | 122 ------------------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   5 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts |  14 --
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |   2 +
 .../boot/dts/renesas/salvator-common.dtsi     |  76 ++++++++++-
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi  |  56 ++++++++
 9 files changed, 140 insertions(+), 283 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

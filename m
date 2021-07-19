Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8823CE0E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 18:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346994AbhGSPSn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 11:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347444AbhGSPQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 11:16:36 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D45C0AC0D1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 08:10:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1844:c86f:c84a:fde8])
        by xavier.telenet-ops.be with bizsmtp
        id X3ej2500J2WKXR1013ejKc; Mon, 19 Jul 2021 17:38:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLv-000skr-9H; Mon, 19 Jul 2021 17:38:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLu-00Ajkc-EA; Mon, 19 Jul 2021 17:38:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/10] arm64: renesas: Add support for R Car H3e 2G-and M3e-2G
Date:   Mon, 19 Jul 2021 17:38:31 +0200
Message-Id: <cover.1626708063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

The new R-Car Gen3e SoCs are different gradings of the existing R-Car
Gen3 SoCs.  This series adds support for the first two members of the
family: R-Car H3e-2G (R8A779M1) and R-Car M3e-2G (R8A779M3), on the
Salvator-XS and ULCB (with and without Kingfisher) development boards.

Changes compared to v1[1]:
  - Add Reviewed-by, Acked-by.
  - Drop new fam_rcar_gen3e and soc_rcar_[hm]3e, just use the existing
    soc_rcar_{h3,m3_w},
  - Drop pinctrl fix, which has evolved independently[2],
  - Drop mmc fix, which has been superseded by a recent refactoring[3],
  - Drop 2 GHz turbo modes, as the official opp-microvolt values are not
    yet available,
  - Widen the audience.

This series has been tested on Salvator-X with R-Car H3 ES3.0 and
Salvator-XS with R-Car M3-W+.  For testing, a branch with dependencies
and fixups to prototype R-Car Gen3e development on older Gen3 SoCs can
be found at[4].

I plan to queue this in renesas-devel for v5.15.

Thanks for your comments!

[1] "[PATCH 00/14] arm64: renesas: Add support for R-Car H3e 2G-and M3e-2G"
    (https://lore.kernel.org/r/cover.1623315732.git.geert+renesas@glider.be/).
[2] "[PATCH v2] pinctrl: renesas: Fix pin control matching on R-Car H3e-2G"
    (https://lore.kernel.org/r/6cdc5bfa424461105779b56f455387e03560cf66.1626707688.git.geert+renesas@glider.be)
[3] "[PATCH v3] mmc: host: renesas_sdhi: Refactor renesas_sdhi_probe()"
    (https://lore.kernel.org/r/20210702112956.1065875-1-yoshihiro.shimoda.uh@renesas.com/)
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-gen3e-v2

Geert Uytterhoeven (10):
  dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and
    boards
  soc: renesas: Identify R-Car H3e-2G and M3e-2G
  arm64: dts: renesas: Add Renesas R8A779M1 SoC support
  arm64: dts: renesas: Add Renesas R8A779M3 SoC support
  arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e-2G
  arm64: dts: renesas: Add support for H3ULCB with R-Car H3e-2G
  arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car
    H3e-2G
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3e-2G
  arm64: dts: renesas: Add support for M3ULCB with R-Car M3e-2G
  arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car
    M3e-2G

 .../devicetree/bindings/arm/renesas.yaml      | 50 +++++++++++++----
 arch/arm64/boot/dts/renesas/Makefile          |  8 +++
 .../boot/dts/renesas/r8a779m1-salvator-xs.dts | 53 ++++++++++++++++++
 .../boot/dts/renesas/r8a779m1-ulcb-kf.dts     | 19 +++++++
 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts | 54 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi     | 12 +++++
 .../boot/dts/renesas/r8a779m3-salvator-xs.dts | 46 ++++++++++++++++
 .../boot/dts/renesas/r8a779m3-ulcb-kf.dts     | 18 +++++++
 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts | 45 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi     | 12 +++++
 drivers/soc/renesas/Kconfig                   |  2 +
 drivers/soc/renesas/renesas-soc.c             |  4 ++
 12 files changed, 312 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

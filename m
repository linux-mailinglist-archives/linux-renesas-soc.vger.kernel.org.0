Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117483EA374
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhHLLYy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236837AbhHLLYw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:52 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DCDC06179F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id gbQQ2500n1gJxCh01bQQYT; Thu, 12 Aug 2021 13:24:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002Fik-7J; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8ox-00742j-Ev; Thu, 12 Aug 2021 13:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/29] arm64: renesas: Add support for more R-Car Gen3e SoCs and boards
Date:   Thu, 12 Aug 2021 13:23:50 +0200
Message-Id: <cover.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

The new R-Car Gen3e SoCs are different gradings of the existing R-Car
Gen3 SoCs.  This patch series adds support for the remaining R-Car Gen3e
SoCs.

Changes compared to v1 (not posted publicly):
  - Drop "mmc: renesas_sdhi: Add support for more R-Car Gen3e SoCs"
    (obsoleted by "[PATCH v4] mmc: host: renesas_sdhi: Refactor
    renesas_sdhi_probe()"[1]),
  - Drop "ravb: Add support for R-Car E3e and D3e" (not needed as the
    affected code is meant for legacy DTBs only),
  - Drop "usb: gadget: udc: renesas_usb3: Add support for R-Car E3e"
    (obsoleted by "[PATCH] usb: gadget: udc: renesas_usb3: Fix
    soc_device_match() abuse"[2]),
  - Typo s/R8A779M/R8A779M0/,
  - Add Reviewed-by,
  - Drop new soc_rcar_*3*e, just use the existing soc_rcar_*3*.
  - Drop bogus "based" in model name,
  - Replace "D3" by "D3(e)", and "E3" by "E3(e)".

This has been tested on Salvator-XS with R-Car H3 ES2.0 and M3-N ES1.0,
Salvator-X with R-Car M3-W ES1.0, Ebisu-4D with R-Car E3 ES1.0, and
Draak with R-Car D3 ES1.0.

For testing, a branch with dependencies and fixups for prototyping R-Car
Gen3e development on older Gen3 SoCs can be found at[3].

Thanks for your comments!

[1] https://lore.kernel.org/r/20210729103234.480743-1-yoshihiro.shimoda.uh@renesas.com
[2] https://lore.kernel.org/r/760981fb4cd110d7cbfc9dcffa365e7c8b25c6e5.1628696960.git.geert+renesas@glider.be
[3] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-gen3e-extra-v2

Geert Uytterhoeven (29):
  dt-bindings: arm: renesas: Document more R-Car Gen3e Socs and boards
  soc: renesas: Identify more R-Car Gen3e SoCs
  arm64: dts: renesas: Factor out Draak board support
  arm64: dts: renesas: Factor out Ebisu board support
  arm64: dts: renesas: Add Renesas R8A779M0 SoC support
  arm64: dts: renesas: Add Renesas R8A779M2 SoC support
  arm64: dts: renesas: Add Renesas R8A779M4 SoC support
  arm64: dts: renesas: Add Renesas R8A779M5 SoC support
  arm64: dts: renesas: Add Renesas R8A779M6 SoC support
  arm64: dts: renesas: Add Renesas R8A779M7 SoC support
  arm64: dts: renesas: Add Renesas R8A779M8 SoC support
  arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e
  arm64: dts: renesas: Add support for H3ULCB with R-Car H3e
  arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3e
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3e
  arm64: dts: renesas: Add support for M3ULCB with R-Car M3e
  arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car M3e
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3Ne
  arm64: dts: renesas: Add support for M3NULCB with R-Car M3Ne
  arm64: dts: renesas: Add support for M3NULCB+Kingfisher with R-Car
    M3Ne
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3Ne-2G
  arm64: dts: renesas: Add support for M3NULCB with R-Car M3Ne-2G
  arm64: dts: renesas: Add support for M3NULCB+Kingfisher with R-Car
    M3Ne-2G
  arm64: dts: renesas: Add support for Ebisu with R-Car E3e
  arm64: dts: renesas: Add support for Draak with R-Car D3e
  arm64: dts: renesas: Add support for Salvator-XS with R-Car H3Ne
  arm64: dts: renesas: Add support for H3ULCB with R-Car H3Ne
  arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3Ne
  [RFC] arm64: dts: renesas: r8a779m5: Add Cortex-A57 2 GHz opp

 .../devicetree/bindings/arm/renesas.yaml      |  61 ++
 arch/arm64/boot/dts/renesas/Makefile          |  24 +
 .../{r8a77995-draak.dts => draak.dtsi}        |  10 +-
 .../{r8a77990-ebisu.dts => ebisu.dtsi}        |  10 +-
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 788 +-----------------
 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 671 +--------------
 .../boot/dts/renesas/r8a779m0-salvator-xs.dts |  53 ++
 .../boot/dts/renesas/r8a779m0-ulcb-kf.dts     |  19 +
 arch/arm64/boot/dts/renesas/r8a779m0-ulcb.dts |  53 ++
 arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 +
 .../boot/dts/renesas/r8a779m2-salvator-xs.dts |  46 +
 .../boot/dts/renesas/r8a779m2-ulcb-kf.dts     |  18 +
 arch/arm64/boot/dts/renesas/r8a779m2-ulcb.dts |  45 +
 arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 +
 .../boot/dts/renesas/r8a779m4-salvator-xs.dts |  36 +
 .../boot/dts/renesas/r8a779m4-ulcb-kf.dts     |  19 +
 arch/arm64/boot/dts/renesas/r8a779m4-ulcb.dts |  36 +
 arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 +
 .../boot/dts/renesas/r8a779m5-salvator-xs.dts |  36 +
 .../boot/dts/renesas/r8a779m5-ulcb-kf.dts     |  19 +
 arch/arm64/boot/dts/renesas/r8a779m5-ulcb.dts |  36 +
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi     |  21 +
 .../arm64/boot/dts/renesas/r8a779m6-ebisu.dts |  18 +
 arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 +
 .../arm64/boot/dts/renesas/r8a779m7-draak.dts |  19 +
 arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 +
 .../boot/dts/renesas/r8a779m8-salvator-xs.dts |  53 ++
 .../boot/dts/renesas/r8a779m8-ulcb-kf.dts     |  19 +
 arch/arm64/boot/dts/renesas/r8a779m8-ulcb.dts |  52 ++
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  12 +
 drivers/soc/renesas/Kconfig                   |   7 +-
 drivers/soc/renesas/renesas-soc.c             |   7 +
 32 files changed, 777 insertions(+), 1471 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a77995-draak.dts => draak.dtsi} (97%)
 copy arch/arm64/boot/dts/renesas/{r8a77990-ebisu.dts => ebisu.dtsi} (98%)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m0-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m0-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m0-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m2-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m2-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m2-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m6-ebisu.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m7-draak.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

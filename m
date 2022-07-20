Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7732857B245
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jul 2022 10:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiGTIIN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 04:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiGTIIM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 04:08:12 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EE140BE2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 01:08:11 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id xL89270064C55Sk06L89n8; Wed, 20 Jul 2022 10:08:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-004RZz-On; Wed, 20 Jul 2022 10:08:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-00EsMb-2c; Wed, 20 Jul 2022 10:08:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] arm64: dts: renesas: Add support for R-Car H3Ne-1.7G
Date:   Wed, 20 Jul 2022 10:08:01 +0200
Message-Id: <cover.1656072871.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the R-Car H3Ne-1.7G SoC (R8A779MB),
which is a different grading of the R-Car H3-N (R8A77951) SoC.  Board
support includes the Salvator-XS and H3ULCB development boards, and the
H3ULCB+Kingfisher board combo.  Note that unlike R-Car H3Ne (R8A779M8),
R-Car H3Ne-1.7G does support running the Cortex-A57 CPU cores at 1.7
GHz[1].

The last 3 patches are marked RFC, as I do not know which boards
will actually be produced with this SoC.

This has been prototyped and tested on Salvator-XS with R-Car H3 ES2.0.

I plan to queue (most) of this in renesas-devel for v5.21.

Thanks for your comments!

[1] [PATCH] arm64: dts: renesas: r8a779m8: Drop operating points above 1.5 GHz
    https://lore.kernel.org/r/aeb4530f7fbac8329b334dcb169382c836a5f32d.1655458564.git.geert+renesas@glider.be/

Geert Uytterhoeven (6):
  dt-bindings: arm: renesas: Document R-Car H3Ne-1.7G SoC and boards
  soc: renesas: Identify R-Car H3Ne-1.7G
  arm64: dts: renesas: Add Renesas R8A779MB SoC support
  arm64: dts: renesas: Add support for Salvator-XS with R-Car H3Ne-1.7G
  arm64: dts: renesas: Add support for H3ULCB with R-Car H3Ne-1.7G
  arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car
    H3Ne-1.7G

 .../devicetree/bindings/arm/renesas.yaml      |  9 ++++
 arch/arm64/boot/dts/renesas/Makefile          |  4 ++
 .../boot/dts/renesas/r8a779mb-salvator-xs.dts | 53 +++++++++++++++++++
 .../boot/dts/renesas/r8a779mb-ulcb-kf.dts     | 19 +++++++
 arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts | 53 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779mb.dtsi     | 12 +++++
 drivers/soc/renesas/renesas-soc.c             |  1 +
 7 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

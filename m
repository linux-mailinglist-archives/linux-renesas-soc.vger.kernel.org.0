Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5745564707B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Dec 2022 14:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbiLHNH4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Dec 2022 08:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiLHNHx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2022 08:07:53 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B0F2F4
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Dec 2022 05:07:46 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5574:4fdf:a801:888e])
        by albert.telenet-ops.be with bizsmtp
        id tp7k2800C2deJRf06p7kyk; Thu, 08 Dec 2022 14:07:45 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3GIF-002tBF-Ng; Thu, 08 Dec 2022 13:46:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3DeN-002fmq-2w; Thu, 08 Dec 2022 10:57:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tho Vu <tho.vu.wh@renesas.com>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] renesas: r8a779g0: Add support for boost mode
Date:   Thu,  8 Dec 2022 10:56:57 +0100
Message-Id: <cover.1670492384.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for running the Cortex-A76 CPU cores on
R-Car V4H at 1.8 GHz (High Performance mode aka "boost mode").

The first patch adds boost support to the clock driver.
The second patch contains an RFC improvement for the clock driver.
The third patch describes the 1.8 GHz operating point in DT.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: r8a779g0: Add custom clock for PLL2
  clk: renesas: rcar-gen4: Add support for fractional multiplication
  arm64: dts: renesas: r8a779g0: Add Cortex-A76 1.8 GHz opp

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi |   6 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c   |  14 +-
 drivers/clk/renesas/rcar-gen4-cpg.c       | 195 ++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h       |   1 +
 4 files changed, 209 insertions(+), 7 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

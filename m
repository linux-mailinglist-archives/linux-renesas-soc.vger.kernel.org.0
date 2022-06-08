Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98085437A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244503AbiFHPkd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 11:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244478AbiFHPkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 11:40:31 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7C01CC5FB
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 08:40:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by andre.telenet-ops.be with bizsmtp
        id gfgR270061qF9lr01fgRkM; Wed, 08 Jun 2022 17:40:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-003E0A-PR; Wed, 08 Jun 2022 17:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-008kJP-4K; Wed, 08 Jun 2022 17:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a779f0: CPU topology improvements
Date:   Wed,  8 Jun 2022 17:40:18 +0200
Message-Id: <cover.1654701480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Currently, the R-Car S4-8 DTS describes a single Cortex-A55 CPU core
only.  This patch series completes the description of the Cortex-A55
lusters by describing L3 caches, CPU cores 1-7, CPU map, PSCI for CPU bring up,
CPUIdle, and CPU core clocks.

This has been tested on the Spider development board, where now all 8
Cortex-A55 CPU cores are available after boot.  All but the first CPU
core can be controlled from sysfs (/sys/*/*/cpu/cpu[0-7]/online).
CPU core performance follows the CPU core clocks, when changing the
frequency of the latter.

I plan to queue this in renesas-devel for v5.20.

Thanks for your comments!

Geert Uytterhoeven (3):
  arm64: dts: renesas: r8a779f0: Add L3 cache controller
  arm64: dts: renesas: r8a779f0: Add secondary CA55 CPU cores
  arm64: dts: renesas: r8a779f0: Add CPU core clocks

Tho Vu (1):
  arm64: dts: renesas: r8a779f0: Add CPUIdle support

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 175 +++++++++++++++++++++-
 1 file changed, 170 insertions(+), 5 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

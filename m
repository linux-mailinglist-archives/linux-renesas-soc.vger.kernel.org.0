Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69AC97C85EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjJMMj0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjJMMjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:39:25 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6721FCF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2023 05:39:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
        by laurent.telenet-ops.be with bizsmtp
        id xQfM2A00H56FAx301QfMfy; Fri, 13 Oct 2023 14:39:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRl-006GgZ-TO;
        Fri, 13 Oct 2023 14:39:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRp-002Jnw-9y;
        Fri, 13 Oct 2023 14:39:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.7 (take two)
Date:   Fri, 13 Oct 2023 14:39:12 +0200
Message-Id: <cover.1697200117.git.geert+renesas@glider.be>
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

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.7.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.7 (take two)

    - Enable support for the Renesas RZ/G3S (R9A08G045) SoC in the arm64
      defconfig.

  [GIT PULL 2/3] Renesas DT binding updates for v6.7 (take two)

    - Document support for the Renesas RZ/G3S SMARC SoM and SMARC
      Carrier-II EVK development boards,
    - Document support for the Renesas R-Car S4 Starter Kit.

  [GIT PULL 3/3] Renesas DTS updates for v6.7 (take two)

    - Improve audio clock accuracy on the RZ/{G2L,G2LC,V2L} SMARC EVK
      development boards,
    - Add FLASH support for the Renesas Bock-W development board,
    - Add L2 cache and non-coherent DMA support on the RZ/Five SoC and the
      RZ/Five SMARC development board,
    - Add initial support for the RZ/G3S SoC and the RZ/G3S SMARC SoM and
      SMARC Carrier-II EVK development boards,
    - Add initial support for the R8A779F4 variant of the R-Car S4-8 SoC
      and the R-Car S4 Starter Kit development board,
    - Apply DT overlays to base DTBs to improve validation and usability.

  Note that this includes:
    - Tag clk-fixes-for-linus from the clock tree, which contains the
      fixed Versa3 clock generator clock index handling that was merged
      in v6.6-rc4,
    - Tag renesas-r9a08g045-dt-binding-defs-tag, which contains clock
      definitions for the Renesas RZ/G3S (R9A08G045) SoC, shared by the
      clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

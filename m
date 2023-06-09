Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2A372969D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 12:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241036AbjFIKP7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 06:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241569AbjFIKO5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 06:14:57 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F81049DB
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 03:06:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
        by michel.telenet-ops.be with bizsmtp
        id 6y6i2A00612zQ4r06y6iPh; Fri, 09 Jun 2023 12:06:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z0d-008L2L-1q;
        Fri, 09 Jun 2023 12:06:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z10-00G42n-1Q;
        Fri, 09 Jun 2023 12:06:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.5 (take two)
Date:   Fri,  9 Jun 2023 12:06:35 +0200
Message-Id: <cover.1686304609.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.5.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.5 (take two)

    - Enable support for the Renesas MTU3a counter in the arm64 defconfig.

  [GIT PULL 2/3] Renesas driver updates for v6.5 (take two)

    - Convert the R-Mobile SYSC driver to readl_poll_timeout_atomic().

  [GIT PULL 3/3] Renesas DTS updates for v6.5 (take two)

    - Add IOMMU support for PCIe devices on R-Car Gen3 and RZ/G2 SoCs,
    - Add HSCIF1 serial port support on Renesas ULCB boards equipped with
      the Shimafuji Kingfisher extension,
    - Miscellaneous fixes and improvements.

Note that the conversion to readl_poll_timeout_atomic() depends
on iopoll improvements, which are thus included through an immutable
branch in multiple pull requests:

  "[GIT PULL] clk: renesas: Updates for v6.5 (take two)" (for clk),
  "[GIT PULL 2/3] Renesas driver updates for v6.5 (take two)" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

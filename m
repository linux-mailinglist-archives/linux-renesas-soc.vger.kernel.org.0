Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45039766C38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 13:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbjG1L5M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 07:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233794AbjG1L5L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 07:57:11 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66960FA
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 04:57:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by laurent.telenet-ops.be with bizsmtp
        id Sbx62A0020d1nm801bx66X; Fri, 28 Jul 2023 13:57:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM5U-002mIg-Mr;
        Fri, 28 Jul 2023 13:57:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM5h-00AqNg-QH;
        Fri, 28 Jul 2023 13:57:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.6
Date:   Fri, 28 Jul 2023 13:56:59 +0200
Message-Id: <cover.1690545139.git.geert+renesas@glider.be>
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

This is my first pull request for the inclusion of Renesas SoC updates
for v6.5.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.6

    - Enable CSI driver support for Renesas RZ/V2M based platforms,
    - Enable MTU3a PWM and RAA215300 PMIC/RTC driver support, as used on
      Renesas RZ/{G2L,G2LC,G2UL,V2L} SMARC EVKs.

  [GIT PULL 2/3] Renesas ARM SoC updates for v6.6

    -   Drop unused OF includes.

  [GIT PULL 3/3] Renesas DTS updates for v6.6

    - Add Clocked Serial Interface (CSI) support for the RZ/V2M SoC,
    - Add PMIC, RTC, and PWM support for the RZ/G2L, RZ/G2LC, and RZ/V2L
      SMARC EVK development boards,
    - Add PWM (MTU3a) support for the RZ/G2UL and RZ/Five SoCs,
    - Add External interrupt (INTC-EX) support for the R-Car S4-8 SoC,
    - Add LED support for the Spider development board,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

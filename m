Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38FD729FBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 18:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241379AbjFIQLY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 12:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242134AbjFIQLU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 12:11:20 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674713C21
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 09:10:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
        by michel.telenet-ops.be with bizsmtp
        id 74Aw2A00G12zQ4r064AwJW; Fri, 09 Jun 2023 18:10:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7eh7-008M0X-AK;
        Fri, 09 Jun 2023 18:10:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7ehU-00GDY9-AR;
        Fri, 09 Jun 2023 18:10:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/3] Remove KZM9D board staging support
Date:   Fri,  9 Jun 2023 18:10:48 +0200
Message-Id: <cover.1686325857.git.geert+renesas@glider.be>
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

	Hi all,

Board staging was introduced to host temporarily legacy board support
for platforms that are under active conversion to DT.  Currently it
hosts:
  1. USB Gadget support for the Kyoto Microcomputer Co. KZM-A9-Dual
     (KZM9D) development board,
  2. Display support for the Atmark Techno Armadillo-800-EVA development
     board.

During the last few years, the KZM9D development board didn't receive
much love.  Also, no one really cared about the EMMA Mobile USB Gadget
driver, which is also hosted under staging.

Hence this RFC patch series removes the KZM9D board staging support,
together with the EMMA Mobile USB Gadget driver, and the legacy EMMA
Mobile EV2 clkdev registration.

Once the SH-Mobile LCDC DRM driver has been converted to atomic
modesetting and DT, the remaining parts of board staging can be removed,
together with legacy clkdev registration in the MSTP driver.

Thanks for your comments!

Geert Uytterhoeven (3):
  staging: emxx_udc: Remove EMMA Mobile USB Gadget driver
  staging: board: Remove KZM9D board staging code
  clk: renesas: emev2: Remove obsolete clkdev registration

 drivers/clk/renesas/clk-emev2.c     |    3 -
 drivers/staging/Kconfig             |    2 -
 drivers/staging/Makefile            |    1 -
 drivers/staging/board/Makefile      |    1 -
 drivers/staging/board/kzm9d.c       |   26 -
 drivers/staging/emxx_udc/Kconfig    |   11 -
 drivers/staging/emxx_udc/Makefile   |    2 -
 drivers/staging/emxx_udc/TODO       |    6 -
 drivers/staging/emxx_udc/emxx_udc.c | 3223 ---------------------------
 drivers/staging/emxx_udc/emxx_udc.h |  554 -----
 10 files changed, 3829 deletions(-)
 delete mode 100644 drivers/staging/board/kzm9d.c
 delete mode 100644 drivers/staging/emxx_udc/Kconfig
 delete mode 100644 drivers/staging/emxx_udc/Makefile
 delete mode 100644 drivers/staging/emxx_udc/TODO
 delete mode 100644 drivers/staging/emxx_udc/emxx_udc.c
 delete mode 100644 drivers/staging/emxx_udc/emxx_udc.h

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

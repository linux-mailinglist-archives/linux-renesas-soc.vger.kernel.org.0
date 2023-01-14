Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1045F66AB83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 14:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjANNXS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 08:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjANNXQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 08:23:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1102A59F5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 05:23:13 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 8dP92900T4C55Sk01dP9ei; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgUz-003z7E-W6;
        Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgV3-006HuH-M2;
        Sat, 14 Jan 2023 14:23:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.3
Date:   Sat, 14 Jan 2023 14:22:56 +0100
Message-Id: <cover.1673702287.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.3.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.3

    - Enable support for the Renesas RZ/G2L MIPI DSI, CSI-2, and Camera
      Receiving Unit drivers in the arm64 defconfig,
    - Refresh shmobile_defconfig for v6.1-rc5.

  [GIT PULL 2/3] Renesas driver updates for v6.3

    - Add missing A3DUL power domain on R-Car V4H.

  [GIT PULL 3/3] Renesas DT updates for v6.3

    - Enable watchdog and timer (OSTM) support for the RZ/Five SMARC EVK
      development board,
    - Add operating points for the Cortex-A55 CPU cores on the R-Car S4-8
      SoC,
    - Add display support for the R-Car V4H SoC and the White-Hawk
      development board,
    - Add eMMC and SDHI support for the RZ/V2M SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBA21BF36A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2020 10:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgD3Isy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Apr 2020 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726546AbgD3Isx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:48:53 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFCFC035495
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2020 01:48:53 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by albert.telenet-ops.be with bizsmtp
        id Ywor2200U0w8ZL606worP5; Thu, 30 Apr 2020 10:48:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0002l1-FK; Thu, 30 Apr 2020 10:48:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0000OK-E8; Thu, 30 Apr 2020 10:48:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v5.8
Date:   Thu, 30 Apr 2020 10:48:44 +0200
Message-Id: <20200430084849.1457-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.8.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v5.8

    - Refresh shmobile_defconfig for v5.7-rc1.

  [GIT PULL 2/5] Renesas ARM DT updates for v5.8

    - USB, UART, PWM, and PCIe support for R-Car M3-W+,
    - PWM (16-bit Timer Pulse Unit and PWM Timers) support for R-Car M2-W,
    - Minor fixes and cleanups.

  [GIT PULL 3/5] Renesas ARM SoC updates for v5.8

    - Add Basic support for the new RZ/G1H SoC.

  [GIT PULL 4/5] Renesas driver updates for v5.8

    - Add System Controller (SYSC) and Reset (RST) support for the new
      RZ/G1H (R8A7742) SoC.

  [GIT PULL 5/5] Renesas DT binding updates for v5.8

    - Document System Controller (SYSC) and Reset (RST) support for
      RZ/G1H.

Note that the new Renesas RZ/G1H DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 4/5] Renesas driver updates for v5.8" (for arm-soc),
  - "[GIT PULL] clk: renesas: Updates for v5.8" (for clk).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

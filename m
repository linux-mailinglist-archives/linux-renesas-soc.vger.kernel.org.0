Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133613417C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Mar 2021 09:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhCSIwS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Mar 2021 04:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhCSIv5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Mar 2021 04:51:57 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B6BC06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Mar 2021 01:51:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
        by baptiste.telenet-ops.be with bizsmtp
        id i8rt2400B3CXdgx018rtWS; Fri, 19 Mar 2021 09:51:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNArI-008kfs-PA; Fri, 19 Mar 2021 09:51:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNArI-00BMy0-4d; Fri, 19 Mar 2021 09:51:52 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas ARM SoC updates for v5.13
Date:   Fri, 19 Mar 2021 09:51:43 +0100
Message-Id: <20210319085146.2709844-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.13.

It consists of 2 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v5.13

    - Refresh shmobile_defconfig for v5.12-rc2.

  [GIT PULL 2/3] Renesas ARM DT updates for v5.13

    - OV7725 camera support for the iWave RainboW Qseven board (G21D), and
      its camera expansion board,
    - Add mmc aliases to fix /dev/mmcblkN order,
    - HDMI Display support for the R-Car Starter Kit Pro with R-Car M3-W+,
    - Support for running upstream kernels on the RZA2MEVB board, using
      the SDRAM present on the sub-board,
    - I2C EEPROM support for the Falcon development board,
    - Timer, thermal sensor, and CAN support for the R-Car V3U SoC.
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/3] Renesas driver updates for v5.13

    - Prepare rmobile-sysc for fw_devlink=on,
    - A minor cleanup.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

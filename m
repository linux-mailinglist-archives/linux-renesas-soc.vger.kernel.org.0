Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372E65B348F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 11:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiIIJyU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 05:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiIIJyJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:54:09 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2C4AA354
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 02:54:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by michel.telenet-ops.be with bizsmtp
        id Hlu6280050sKggw06lu6LB; Fri, 09 Sep 2022 11:54:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai5-004bsU-MM; Fri, 09 Sep 2022 11:54:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai4-004i3P-8G; Fri, 09 Sep 2022 11:54:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/14] arm64: dts: renesas: r8a779g0/white-hawk enhancements
Date:   Fri,  9 Sep 2022 11:53:47 +0200
Message-Id: <cover.1662715538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

This patch series adds more devices to the Device Tree source files for
the R-Car V4H SoC and the White Hawk board stack.

This has been tested on nfsroot, reboot, i2cdetect -r, reading
/sys/.../eeprom (all empty), pushing switches, and watching blinky LEDs.

For testing, this series and its dependencies can be found at [1].

This series is intended to be queued in renesas-devel for v6.1.

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/white-hawk-enhancements-v1

Geert Uytterhoeven (14):
  arm64: dts: renesas: r8a779g0: Add RWDT node
  arm64: dts: renesas: white-hawk-cpu: Enable watchdog timer
  arm64: dts: renesas: r8a779g0: Add pinctrl device node
  arm64: dts: renesas: white-hawk-cpu: Add serial port pin control
  arm64: dts: renesas: r8a779g0: Add I2C nodes
  arm64: dts: renesas: white-hawk: Add I2C0 and EEPROMs
  arm64: dts: renesas: white-hawk: Add CSI/DSI sub-board
  arm64: dts: renesas: white-hawk: Add Ethernet sub-board
  arm64: dts: renesas: r8a779f0: Add GPIO nodes
  arm64: dts: renesas: white-hawk-cpu: Add GP LEDs
  arm64: dts: renesas: white-hawk-cpu: Add push switches
  arm64: dts: renesas: r8a779g0: Add RAVB nodes
  arm64: dts: renesas: white-hawk: Move aliases and chosen
  arm64: dts: renesas: white-hawk-cpu: Add Ethernet support

 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 150 +++++++
 .../renesas/r8a779g0-white-hawk-csi-dsi.dtsi  |  15 +
 .../renesas/r8a779g0-white-hawk-ethernet.dtsi |  16 +
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  |  15 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 380 ++++++++++++++++++
 5 files changed, 570 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

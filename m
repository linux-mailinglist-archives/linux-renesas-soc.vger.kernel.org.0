Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67384A87A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 16:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351868AbiBCP0z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 10:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344047AbiBCP0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 10:26:55 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D42C06173D
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Feb 2022 07:26:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:15aa:ab80:d2f:edb])
        by baptiste.telenet-ops.be with bizsmtp
        id qfSs2600A4dXKBW01fSsfZ; Thu, 03 Feb 2022 16:26:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFe0Z-00D0pQ-TY; Thu, 03 Feb 2022 16:26:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFe0Z-002txm-9M; Thu, 03 Feb 2022 16:26:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: renesas: spider: Add I2C and EEPROM support
Date:   Thu,  3 Feb 2022 16:26:46 +0100
Message-Id: <cover.1643898884.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds I2C and EEPROM support for the Renesas R-Car
S4-8 SoC and the Spider development board.

It has been tested by reading /sys/bus/nvmem/devices/*/nvmem.
All three EEPROMs are empty, except for a (different for each
(sub)board) 32-bit value at offset 0x70.
As the AT24 EEPROM driver does not set the I2C_M_DMA_SAFE flag (it uses
regmap), DMA operation was tested by modifying the i2c-rcar driver to
ignore the lack of this flag.

For testing, this series and its dependencies (i2c driver updates,
pinctrl, clk, ...) can be found at[1].

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/r8a779f0-i2c-v1

Geert Uytterhoeven (3):
  arm64: dts: renesas: r8a779f0: Add I2C nodes
  arm64: dts: renesas: spider-cpu: Add I2C4 and EEPROMs
  arm64: dts: renesas: spider: Add Ethernet sub-board

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  20 ++++
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi |  15 +++
 .../boot/dts/renesas/r8a779f0-spider.dts      |  10 ++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 102 ++++++++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

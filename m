Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2694493B9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354982AbiASOCv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354984AbiASOCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:02:45 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79ACDC061746
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:02:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by baptiste.telenet-ops.be with bizsmtp
        id ke2g2600P2FKFx601e2gWM; Wed, 19 Jan 2022 15:02:41 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-00AS0i-Jl; Wed, 19 Jan 2022 15:02:40 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXr-009iGs-QH; Wed, 19 Jan 2022 15:02:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 00/15] arm64: renesas: Add-R-Car S4-8 Pin control support
Date:   Wed, 19 Jan 2022 15:02:17 +0100
Message-Id: <cover.1642599415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds pin control support for the Renesas R-Car S4-8
Soc on the Spider board, and enables pin control for the serial console.
It is based on patches in the BSP by LUU HOAI, with many changes on top
(see the individual patches).

This series is marked as an RFC because of 2 reasons:
  1. PFC register banks 4-7 do not seem to be accessible as-is using
     either the Control Domain (0xffd9....) or Application Domain
     (0xdfd9....) addresses, so currently you cannot configure pins
     controlled by these banks.
     How to make the Control Domain release the bus guard, so the
     registers become accessible?
  2. It this has been tested only lightly with remote access.

For testing, this series and its dependencies can be found at[1].

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/r8a779f0-pfc-v1

Geert Uytterhoeven (14):
  clk: renesas: r8a779f0: Add PFC clock
  pinctrl: renesas: Add PORT_GP_CFG_19 macros
  pinctrl: renesas: Initial R8A779F0 PFC support
  pinctrl: renesas: r8a779f0: Add SCIF pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add I2C pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add HSCIF pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add INTC-EX pins, groups, and function
  pinctrl: renesas: r8a779f0: Add MMC pins, groups, and function
  pinctrl: renesas: r8a779f0: Add MSIOF pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add PCIe pins, groups, and function
  pinctrl: renesas: r8a779f0: Add QSPI pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions
  arm64: dts: renesas: r8a779f0: Add pinctrl device node
  arm64: dts: renesas: spider: Complete SCIF3 description

LUU HOAI (1):
  dt-bindings: pinctrl: renesas,pfc: Document r8a779f0 support

 .../bindings/pinctrl/renesas,pfc.yaml         |    1 +
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |   23 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |    8 +
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       |    1 +
 drivers/pinctrl/renesas/Kconfig               |    5 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/core.c                |    6 +
 drivers/pinctrl/renesas/pfc-r8a779f0.c        | 3417 +++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h              |   19 +-
 9 files changed, 3479 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779f0.c

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

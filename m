Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F7A32D6BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 16:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbhCDPeO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 10:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235171AbhCDPdx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 10:33:53 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AACC061761
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Mar 2021 07:33:02 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:403a:b688:43fc:72a5])
        by andre.telenet-ops.be with bizsmtp
        id cFZ02400G0zmvuD01FZ0s7; Thu, 04 Mar 2021 16:33:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHpyF-004lvO-OI; Thu, 04 Mar 2021 16:32:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHpyE-00H213-VT; Thu, 04 Mar 2021 16:32:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/3] arm64: dts: renesas: falcon: Add I2C EEPROMs and sub-boards
Date:   Thu,  4 Mar 2021 16:32:54 +0100
Message-Id: <20210304153257.4059277-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds the device nodes for all I2C EEPROMs in the
Falcon board stack.  As some EEPROMs are located on sub-boards,
it also introduces individual .dtsi files for these sub-boards.
Note that (for now) these sub-boards don't have compatible values or
model strings, as I think this needs more discussion.

This has been tested on the Falcon boards in Magnus' and Kieran's farms.
The EEPROM on the CPU board in Magnus' farm contains some data.
All other EEPROMs are present, but in pristine state (all ones).

Changes compared to v1:
  - Move EEPROMs in sub-boards to separate .dtsi files and patches.

To be queued in renesas-devel for v5.13.

Thanks for your comments!

Geert Uytterhoeven (3):
  arm64: dts: renesas: falcon: Add I2C EEPROM nodes
  arm64: dts: renesas: falcon: Add CSI/DSI sub-board
  arm64: dts: renesas: falcon: Add Ethernet sub-board

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi     |  7 +++++++
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi | 15 +++++++++++++++
 .../dts/renesas/r8a779a0-falcon-ethernet.dtsi     | 15 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts   | 11 +++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

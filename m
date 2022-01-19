Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA686493BCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355048AbiASOPP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354938AbiASOPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:15:12 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6745DC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:15:12 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by baptiste.telenet-ops.be with bizsmtp
        id keFA2600j2FKFx601eFACd; Wed, 19 Jan 2022 15:15:10 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjy-00AS7v-Jq; Wed, 19 Jan 2022 15:15:10 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjy-009ii0-43; Wed, 19 Jan 2022 15:15:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/3] arm64: renesas: Add-R-Car S4-8 GPIO support
Date:   Wed, 19 Jan 2022 15:15:05 +0100
Message-Id: <cover.1642601310.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds GPIO support for the Renesas R-Car S4-8 Soc.
It is marked as an RFC because of 2 reasons:
  1. GPIO register banks 4-7 are disabled, as they do not seem to be
     accessible as-is using either the Control Domain (0xffd9....) or
     Application Domain (0xdfd9....) addresses.
     How to make the Control Domain release the bus guard, so the
     registers become accessible?
  2. This has been boot-tested, without using any actual GPIOs.

For testing, this series and its dependencies can be found at[1].

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/r8a779f0-gpio-v1

Geert Uytterhoeven (3):
  dt-bindings: gpio: renesas,rcar-gpio: Add r8a779f0 support
  gpio: rcar: Add R-Car Gen4 support
  arm64: dts: renesas: r8a779f0: Add GPIO nodes

 .../bindings/gpio/renesas,rcar-gpio.yaml      |   5 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 124 ++++++++++++++++++
 drivers/gpio/gpio-rcar.c                      |   7 +-
 3 files changed, 134 insertions(+), 2 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

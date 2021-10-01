Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC10141E9F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 11:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353264AbhJAJpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 05:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353236AbhJAJop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 05:44:45 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F59C06177C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 02:43:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
        by laurent.telenet-ops.be with bizsmtp
        id 0Zj12600B1ZoSwU01Zj1mE; Fri, 01 Oct 2021 11:43:01 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF46-000zIi-QA; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF45-00BE66-Sw; Fri, 01 Oct 2021 11:42:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.16
Date:   Fri,  1 Oct 2021 11:42:42 +0200
Message-Id: <cover.1633081144.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.15.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.16

    - Enable built-in (I2C, DMAC, USB PHY control) and modular (audio,
      ADC) build of drivers for the RZ/G2L SoC and SMARC EVK board,
    - Enable modular build of the Renesas TPU PWM driver for the R-Car
      V3U SoC.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.16

    - I2C EEPROM support on the RZA2MEVB development board,
    - DMA, USB2.0, and audio support for the RZ/G2L SoC,
    - USB2.0, I2C, audio, ADC, and CANFD support for the RZ/G2L SMARC EVK
      development board,
    - Support for more R-Car Gen3e SoCs (H3e, M3e, M3Ne(-2G), D3e, E3e,
      H3Ne),
    - PWM support for the R-Car M3-W+ and V3U SoCs,
    - IPMMU support for SDHI on the R-Car V3U SoC,
    - Switches support for the Falcon development board,
    - Improve Ethernet PHY descriptions to fix reset handling after kexec,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.16

    - Initial support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
      H3Ne SoCs.

  [GIT PULL 4/4] Renesas DT binding updates for v5.16

    - Document support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
      H3Ne SoCs and boards.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

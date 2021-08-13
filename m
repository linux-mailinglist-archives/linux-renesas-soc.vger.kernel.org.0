Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21ECD3EB3F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 12:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239357AbhHMKXV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 06:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240065AbhHMKXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 06:23:18 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415C3C061756
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 03:22:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
        by albert.telenet-ops.be with bizsmtp
        id gyNo2500B1MlFFN06yNo76; Fri, 13 Aug 2021 12:22:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUKu-002Wod-0H; Fri, 13 Aug 2021 12:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUKt-007SUX-G4; Fri, 13 Aug 2021 12:22:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v5.15 (take two)
Date:   Fri, 13 Aug 2021 12:22:34 +0200
Message-Id: <cover.1628849621.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.15.

It consists of two parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v5.15 (take two)

    - Pin control, ADC, and CANFD support for the RZ/G2L SoC,
    - Add interrupt-names properties to the Renesas RZ/A and RZ/G2L I2C
      Bus Interface.

  [GIT PULL 2/2] Renesas driver updates for v5.15 (take two)

    - Prefer memcpy() over strcpy().

Note that the first part includes another update (append-only) to the
Renesas RZ/G2L DT Binding Definitions, which are shared by driver and DT
source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.15" (for clk),
  - "[GIT PULL 1/2] Renesas ARM DT updates for v5.15 (take two)" (for
    soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

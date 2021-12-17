Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A354B47897B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 12:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbhLQLHW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 06:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbhLQLHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 06:07:20 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60C2C061401
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 03:07:19 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by baptiste.telenet-ops.be with bizsmtp
        id XP7H2600H250X3001P7HaP; Fri, 17 Dec 2021 12:07:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB53-005Y8R-1j; Fri, 17 Dec 2021 12:07:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB52-00AQSJ-Ej; Fri, 17 Dec 2021 12:07:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.17 (take two)
Date:   Fri, 17 Dec 2021 12:07:11 +0100
Message-Id: <cover.1639736716.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.17.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.17

    - Enable support for the new R-Car S4-8 SoC in the arm64 defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.17 (take two)

    - Initial support for the R-Car S4-8 SoC on the Spider CPU and
      BreakOut boards,
    - MIPI DSI display support for the R-Car V3u SoC and the Falcon board
      stack,
    - Thermal and GPU support for the RZ/G2L SoC and the RZ/G2L SMARC EVK
      development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.17 (take two)

    - Core support for the R-Car S4-8 (R8A779F0) SoC, including System
      Controller (SYSC) and Reset (RST) support.

  [GIT PULL 4/4] Renesas DT binding updates for v5.17 (take two)

    - Document support for the R-Car S4-8 Spider CPU and BreakOut boards.

Note that the new Renesas R-Car S4-8 DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.17 (take two)" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.17 (take two)" (for soc),
  - "[GIT PULL 3/4] Renesas driver updates for v5.17 (take two)" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

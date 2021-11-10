Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8818544C8B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbhKJTTJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:09 -0500
Received: from www.zeus03.de ([194.117.254.33]:54958 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232690AbhKJTTI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=MXUshFWRvrlja2L8855Tgb6xkmh
        XDycqY2KDS/dFBnM=; b=qyim/NaxosoR5Rsok72nM+5Fgx5z+aMfuyGJT1sJhmd
        KOelDPOHJlNjDqW0FdvwcuJXafTgklMxWFCAVbbn2fbP5tN82FEBXkQgPF0YT8nH
        WM0G4+c4T4WZzbzbzZjeqhss012kJ/vzrKbRCbqQMrPdGsavfv6wLnZq0R2sTIDs
        =
Received: (qmail 722296 invoked from network); 10 Nov 2021 20:16:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:18 +0100
X-UD-Smtp-Session: l3s3148p1@NlhPD3TQzpogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 00/21] clk/mmc: renesas_sdhi: refactor SDnH to be a separate clock
Date:   Wed, 10 Nov 2021 20:15:49 +0100
Message-Id: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the second RFC to refactor SDHI clocks so that SDnH is a
separate clock. The main advantage is that we can handle per-SoC quirks
regarding the clocks now in the SDHI driver rather than the clock
driver. This is where it belongs because only there we know which mode
needs which tuning. Also, the code is way cleaner and more readable now.

Geert seemed basically okay with this approach, so I continued to work
on it by addressing his comments and adding DT updates for all other
involved SoCs. I also excluded V3M now because it has a different SDnH
handling. It shouldn't be affected by this series. But it may be that we
need to add V3M SDnH handling later because it may be missing since
ever. If so, this series will make that additional task a lot easier.

The downside is that patch 4 looks messy. When switching from old to new
handling in the clock driver, I see no alternative to switch the MMC
driver in the same patch. clk_set_rate just has to work. However, the
MMC part is small, so I hope we can deal with it as an exception this
time. My suggestion is that Geert takes all the patches via his clk and
renesas-dt trees wich MMC acks from Ulf. Is this okay for you, guys?

These patches have been tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0,
M3N, E3, and V3U (remote only). On Gen2 a H2 has been tested. I tested
SDR104, HS200, HS400, and regular modes. All observed values and
relations in 'clk_summary' made perfect sense. Actually, this is the
first time all quirks are correctly handled. HS200 with 4tap was broken
before which was the initial reason for this patch series.

Detailed changes are in the patch descriptions.

A branch can be found here:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/separate-sdhn-v2

Looking forward to comments and testing.

Thanks and happy hacking,

   Wolfram

Wolfram Sang (21):
clk: renesas: rcar-gen3: add dummy SDnH clock
clk: renesas: rcar-gen3: add SDnH clock
clk: renesas: r8a779a0: add SDnH clock to V3U
mmc: sdhi: internal_dmac: flag non-standard SDnH handling for V3M
clk: renesas: rcar-gen3: switch to new SD clock handling
clk: renesas: rcar-gen3: remove outdated SD_SKIP_FIRST
dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
arm64: dts: reneas: r8a774a1: add SDnH clocks
arm64: dts: reneas: r8a774b1: add SDnH clocks
arm64: dts: reneas: r8a774c0: add SDnH clocks
arm64: dts: reneas: r8a774e1: add SDnH clocks
arm64: dts: reneas: r8a77951: add SDnH clocks
arm64: dts: reneas: r8a77960: add SDnH clocks
arm64: dts: reneas: r8a77961: add SDnH clocks
arm64: dts: reneas: r8a77965: add SDnH clocks
arm64: dts: reneas: r8a77980: add SDnH clocks
arm64: dts: reneas: r8a77990: add SDnH clocks
arm64: dts: reneas: r8a77995: add SDnH clocks
mmc: sdhi: use dev_err_probe when getting clock fails
mmc: sdhi: parse DT for SDnH
arm64: dts: reneas: r8a779a0: add SDnH clocks

.../devicetree/bindings/mmc/renesas,sdhi.yaml |  16 +-
arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |  12 +-
arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |  12 +-
arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   9 +-
arch/arm64/boot/dts/renesas/r8a774e1.dtsi     |  12 +-
arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  12 +-
arch/arm64/boot/dts/renesas/r8a77960.dtsi     |  12 +-
arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  12 +-
arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  12 +-
arch/arm64/boot/dts/renesas/r8a77980.dtsi     |   3 +-
arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   9 +-
arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   3 +-
arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   3 +-
drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  12 +-
drivers/clk/renesas/r8a774b1-cpg-mssr.c       |  12 +-
drivers/clk/renesas/r8a774c0-cpg-mssr.c       |   9 +-
drivers/clk/renesas/r8a774e1-cpg-mssr.c       |  12 +-
drivers/clk/renesas/r8a7795-cpg-mssr.c        |  12 +-
drivers/clk/renesas/r8a7796-cpg-mssr.c        |  12 +-
drivers/clk/renesas/r8a77965-cpg-mssr.c       |  12 +-
drivers/clk/renesas/r8a77980-cpg-mssr.c       |   3 +-
drivers/clk/renesas/r8a77990-cpg-mssr.c       |   9 +-
drivers/clk/renesas/r8a77995-cpg-mssr.c       |   3 +-
drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  17 +-
drivers/clk/renesas/rcar-cpg-lib.c            | 211 +++---------------
drivers/clk/renesas/rcar-cpg-lib.h            |   7 +-
drivers/clk/renesas/rcar-gen3-cpg.c           |  24 +-
drivers/clk/renesas/rcar-gen3-cpg.h           |   4 +
drivers/mmc/host/renesas_sdhi.h               |   4 +
drivers/mmc/host/renesas_sdhi_core.c          |  39 +++-
drivers/mmc/host/renesas_sdhi_internal_dmac.c |  21 ++
31 files changed, 261 insertions(+), 289 deletions(-)

-- 
2.30.2


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35EBA41B801
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 22:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242640AbhI1UKA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 16:10:00 -0400
Received: from www.zeus03.de ([194.117.254.33]:60720 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242638AbhI1UJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 16:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=VllxzAoyPmRjUQMfdLtFMrZRpCf
        R1IvoyEt2gW9BBPI=; b=KluvlGPO0rkUqddabSS692WlmoosKAE5pg1c4GJ+2ZM
        LAEl5iN+54xlb4vPzEB5SEgbeLI2xOk7RpbGGRrnqOcI+brEHXoV87qIV2h2Vvqi
        jyO4QLT07iWuuAJxDbRGfmeN5RKextvwJ92KR89sm2M0tApcW0b/OcPbM17H8PVM
        =
Received: (qmail 1377167 invoked from network); 28 Sep 2021 22:08:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 22:08:15 +0200
X-UD-Smtp-Session: l3s3148p1@PVLdxRPNcNIgAwDPXxnDADNsFyRXxb9N
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/9] clk/mmc: renesas_sdhi: refactor SDnH to be a seperate clock
Date:   Tue, 28 Sep 2021 22:07:55 +0200
Message-Id: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We wanted this for a long time, so finally here is the first RFC to
refactor SDHI clocks so that SDnH is a seperate clock. In general, the
new code looks much clearer to me, plus it is 80 lines shorter.

One downside is that patch 4 looks messy. When switching from old to new
handling in the clock driver, I see no alternative to switch the MMC
driver in the same patch. clk_set_rate just has to work. However, the
MMC part is small, so I hope we can deal with it as an exception this
time. Please read the patch description for details.

Another thing to discuss is the gating of SDn and SDnH. Documentation
says that SDnH should be gated/ungated depending on the selected
frequency, not depending on the number of users. I tried to handle this
via RuntimePM but its need to balance enable/disable calls added quite
some complexity to my prototype, and it was far from working. So, I
switched strategies and included the gating to the divider table. So,
for every divider, SDnH is correctly gated/ungated. SDn should be always
on, so this is handled there as well. If we want to save power, I think
we can still use RuntimePM to disable all clocks, as long as we make
sure the frequencies are set again when resuming. However, this all is
not a regression because RuntimePM currently does not work for SDHI
anyhow.

The third thing to discuss is probably the DT bindings. I just added DT
updates for R-Car H3 ES2.0 and M3-N, but will happily add the others
once we agreed on the bindings.

These patches have been tested on R-Car H3 ES2.0, M3N, and V3U. More
testing is needed on Gen2 to make sure no regressions happen. The base
branch is <renesas-devel-2021-09-28-v5.15-rc3>. A branch can be found
here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/separate-sdhn

Hopefully I haven't forgotten something important, but I think this is
it for now.

Looking forward to comments and testing.

Thanks and happy hacking,

   Wolfram


Wolfram Sang (9):
  clk: renesas: gen3-cpg: add dummy SDnH clock
  clk: renesas: add SDnH clock to Gen3 SoCs
  clk: renesas: r8a779a0: add SDnH clock to V3U
  clk: renesas: gen3: switch to new SD clock handling
  clk: renesas: gen3-cpg: remove outdated SD_SKIP_FIRST
  dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
  arm64: dts: r8a77951: add SDnH clocks
  arm64: dts: r8a77965: add SDnH clocks
  mmc: renesas_sdhi: parse DT for SDnH

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |   3 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  12 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  12 +-
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
 drivers/mmc/host/renesas_sdhi.h               |   1 +
 drivers/mmc/host/renesas_sdhi_core.c          |  36 ++-
 20 files changed, 170 insertions(+), 253 deletions(-)

-- 
2.30.2


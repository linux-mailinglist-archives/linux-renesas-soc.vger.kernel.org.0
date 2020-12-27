Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67EB2E3246
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 18:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgL0Rmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 12:42:52 -0500
Received: from www.zeus03.de ([194.117.254.33]:46724 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgL0Rmw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 12:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=6nOEJgrHuMyJRiP7Y/GclKld1qO
        GTPICoxsA54xoaw8=; b=UL6vbB0FBI08lotn/SH2oWNRTk2ySXkF4RIzDp2BlLE
        I0Zw3zjRcZvB+5FZSm0bM/7TKC1e1xvyB+g8DKA4rp9xrEfpe4Kj++ruviHNrsFz
        7mkFT0uHAr3ZJHAHPOcFPu4n3usVNzRqlHQn6JsFVC0qRxHAYxAD4xVjxQjWFC+8
        =
Received: (qmail 1556957 invoked from network); 27 Dec 2020 18:42:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 18:42:09 +0100
X-UD-Smtp-Session: l3s3148p1@7o74rHW3Tp5UhsuJ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: [PATCH 0/6] v3u: add SDHI/MMC support
Date:   Sun, 27 Dec 2020 18:41:54 +0100
Message-Id: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

So, this series adds SDHI/MMC support to the Renesas R-Car V3U SoC.
While SDHI is usually complicated, adding basic support to V3U was
refreshingly uncomplicated :) The crux was this time in the CPG driver.
In order to avoid code duplication, a CPG library was introduced, so we
can share the SD clock handling between generic Gen3, V3U, and hopefully
Gen4 later. The library turned out to be a quite nice solution for SDHI.
I am quite happy with it. I think we could have a similar benefit for
RPC, but we still need to see if this is enabled on V3U after all.

So much for now, looking forward to comments. The branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/sdhi

Happy hacking,

   Wolfram

Takeshi Saito (2):
  arm64: dts: renesas: r8a779a0: Add MMC node
  arm64: dts: renesas: falcon: Enable MMC

Wolfram Sang (4):
  dt-bindings: mmc: renesas,sdhi: Add r8a779a0 support
  clk: renesas: rcar-gen3: remove cpg_quirks access when registering SD
    clock
  clk: renesas: rcar-gen3: factor out CPG library
  clk: renesas: r8a779a0: add SDHI support

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |   1 +
 .../boot/dts/renesas/r8a779a0-falcon.dts      |  41 +++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |  12 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  17 +-
 drivers/clk/renesas/rcar-cpg-lib.c            | 270 ++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.h            |  33 +++
 drivers/clk/renesas/rcar-gen3-cpg.c           | 267 +----------------
 9 files changed, 387 insertions(+), 260 deletions(-)
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.c
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.h

-- 
2.28.0


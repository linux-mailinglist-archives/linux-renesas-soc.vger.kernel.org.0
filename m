Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803C3467662
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243778AbhLCLfK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243703AbhLCLe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:34:56 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4128C061758
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Dec 2021 03:31:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
        by baptiste.telenet-ops.be with bizsmtp
        id RnXV2600Y3eLghq01nXVzX; Fri, 03 Dec 2021 12:31:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6mn-002IYt-Bv; Fri, 03 Dec 2021 12:31:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6mm-000hRY-Pm; Fri, 03 Dec 2021 12:31:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.17
Date:   Fri,  3 Dec 2021 12:31:21 +0100
Message-Id: <cover.1638530614.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638530605.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.17-tag1

for you to fetch changes up to 217c7d1840b5377543eff84fe28409d0bd4d3433:

  dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks (2021-11-26 13:53:02 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.17

  - Document SDHI SDnH clocks on R-Car Gen2 and later,
  - Document core support for the R-Car S4-8 (R8A779F0) SoC.

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks

Wolfram Sang (1):
      dt-bindings: mmc: renesas,sdhi: Add optional SDnH clock

Yoshihiro Shimoda (3):
      dt-bindings: arm: renesas: Document R-Car S4-8 SoC DT bindings
      dt-bindings: reset: renesas,rst: Document r8a779f0 reset module
      dt-bindings: power: renesas,rcar-sysc: Document r8a779f0 SYSC bindings

 Documentation/devicetree/bindings/arm/renesas.yaml |  4 ++
 .../devicetree/bindings/mmc/renesas,sdhi.yaml      | 48 +++++++++++++++-------
 .../bindings/power/renesas,rcar-sysc.yaml          |  1 +
 .../devicetree/bindings/reset/renesas,rst.yaml     |  1 +
 4 files changed, 40 insertions(+), 14 deletions(-)

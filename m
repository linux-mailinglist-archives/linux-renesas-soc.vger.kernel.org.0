Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324AD478978
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 12:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbhLQLHV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 06:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235243AbhLQLHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 06:07:20 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB3BC06173F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 03:07:19 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by xavier.telenet-ops.be with bizsmtp
        id XP7H2600D250X3001P7HcR; Fri, 17 Dec 2021 12:07:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB53-005Y8T-6M; Fri, 17 Dec 2021 12:07:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB52-00AQST-GF; Fri, 17 Dec 2021 12:07:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v5.17 (take two)
Date:   Fri, 17 Dec 2021 12:07:13 +0100
Message-Id: <cover.1639736718.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639736716.git.geert+renesas@glider.be>
References: <cover.1639736716.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit cdda01947bbae8f1b1d19f8aac1f81ae5ce6f37e:

  arm64: dts: renesas: r8a779a0: Add DU support (2021-11-26 14:08:20 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.17-tag2

for you to fetch changes up to c9b7011768b5dbb68792b4bacad5ae913059ed74:

  arm64: dts: renesas: Fix pin controller node names (2021-12-17 10:34:18 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.17 (take two)

  - Initial support for the R-Car S4-8 SoC on the Spider CPU and
    BreakOut boards,
  - MIPI DSI display support for the R-Car V3u SoC and the Falcon board
    stack,
  - Thermal and GPU support for the RZ/G2L SoC and the RZ/G2L SMARC EVK
    development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (4):
      arm64: dts: renesas: r9a07g044: Add TSU node
      arm64: dts: renesas: r9a07g044: Create thermal zone to support IPA
      arm64: dts: renesas: r9a07g044: Add Mali-G31 GPU node
      arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator

Geert Uytterhoeven (2):
      Merge tag 'renesas-r8a779f0-dt-binding-defs-tag' into renesas-arm-dt-for-v5.17
      arm64: dts: renesas: Fix pin controller node names

Kieran Bingham (3):
      arm64: dts: renesas: Fix thermal bindings
      arm64: dts: renesas: r8a779a0: Add DSI encoders
      arm64: dts: renesas: falcon-cpu: Add DSI display output

Yoshihiro Shimoda (4):
      dt-bindings: power: Add r8a779f0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
      arm64: dts: renesas: Add Renesas R8A779F0 SoC support
      arm64: dts: renesas: Add Renesas Spider boards support

 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   4 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |  79 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  70 +++++++++++-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  36 ++++++
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts    |  22 ++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 109 ++++++++++++++++++-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  13 +++
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h      |  64 +++++++++++
 include/dt-bindings/power/r8a779f0-sysc.h          |  30 +++++
 18 files changed, 562 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0.dtsi
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779f0-sysc.h

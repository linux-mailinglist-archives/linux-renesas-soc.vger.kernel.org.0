Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC37766C39
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 13:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbjG1L5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 07:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjG1L5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 07:57:12 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6678EC3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 04:57:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by laurent.telenet-ops.be with bizsmtp
        id Sbx62A0050d1nm801bx66Y; Fri, 28 Jul 2023 13:57:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM5U-002mIn-Ny;
        Fri, 28 Jul 2023 13:57:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM5h-00AqNp-Sy;
        Fri, 28 Jul 2023 13:57:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.6
Date:   Fri, 28 Jul 2023 13:57:02 +0200
Message-Id: <cover.1690545144.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690545139.git.geert+renesas@glider.be>
References: <cover.1690545139.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 4c188fa183ebb45238ef16504c4c7606955cf9d4:

  arm64: dts: renesas: rzg2l: Update overfow/underflow IRQ names for MTU3 channels (2023-07-25 11:40:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.6-tag1

for you to fetch changes up to 406b5af40ed367eefcdb27440ea98f02c1d1ef0d:

  arm64: dts: renesas: spider-cpu: Add GP LEDs (2023-07-27 14:41:21 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.6

  - Add Clocked Serial Interface (CSI) support for the RZ/V2M SoC,
  - Add PMIC, RTC, and PWM support for the RZ/G2L, RZ/G2LC, and RZ/V2L
    SMARC EVK development boards,
  - Add PWM (MTU3a) support for the RZ/G2UL and RZ/Five SoCs,
  - Add External interrupt (INTC-EX) support for the R-Car S4-8 SoC,
  - Add LED support for the Spider development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (7):
      arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC
      arm64: dts: renesas: rzg2l-smarc: Add support for enabling MTU3
      arm64: dts: renesas: rzg2lc-smarc: Add support for enabling MTU3
      arm64: dts: renesas: rzg2lc-smarc-som: Add PHY interrupt support for ETH0
      arm64: dts: renesas: rzg2lc-smarc-som: Enable PMIC and built-in RTC
      arm64: dts: renesas: r9a07g043: Add MTU3a node
      arm64: dts: renesas: rzg2ul-smarc: Add support for enabling MTU3

Chris Paterson (1):
      arm64: dts: renesas: rzg2l: Fix txdv-skew-psec typos

Conor Dooley (1):
      riscv: dts: renesas: Clean up dtbs_check W=1 warning due to empty phy node

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g011: Add CSI nodes

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779f0: Add INTC-EX node
      arm64: dts: renesas: spider-cpu: Add GP LEDs

Krzysztof Kozlowski (4):
      arm64: dts: renesas: Minor whitespace cleanup around '='
      ARM: dts: renesas: Add missing space before {
      arm64: dts: renesas: Add missing space before {
      ARM dts: renesas: armadillo800eva: Switch to enable-gpios

 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   |  2 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |  2 +-
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi      |  4 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |  2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  4 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      | 20 +++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 15 +++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts | 11 ++++
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  | 12 ++++
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  | 21 +++++++
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  | 20 +++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         | 28 +++++++++
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |  4 +-
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 20 +++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   | 22 ++++++-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       | 23 ++++++-
 .../boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  9 +++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  | 26 +++++++-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      | 14 ++++-
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  6 ++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  4 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      | 13 ++++
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |  2 +
 24 files changed, 335 insertions(+), 19 deletions(-)

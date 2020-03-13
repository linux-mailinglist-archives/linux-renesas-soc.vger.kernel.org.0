Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1C0D184AEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2020 16:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMPn0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Mar 2020 11:43:26 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:50294 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgCMPnZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 11:43:25 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id DrjG2200Q5USYZQ01rjGwA; Fri, 13 Mar 2020 16:43:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jCmSy-0002sF-Ft; Fri, 13 Mar 2020 16:43:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jCmSy-0000RR-E4; Fri, 13 Mar 2020 16:43:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas ARM64 DT updates for v5.7 (take two)
Date:   Fri, 13 Mar 2020 16:43:03 +0100
Message-Id: <20200313154304.1636-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313154304.1636-1-geert+renesas@glider.be>
References: <20200313154304.1636-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 721b76195b31467e56851fbab3855e700f281270:

  arm64: dts: renesas: rzg2: Add reset control properties for display (2020-02-21 14:41:36 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.7-tag2

for you to fetch changes up to e30f56800e69db6d2763a1f7f64dfcc79f9b5ea7:

  arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display (2020-03-12 10:51:20 +0100)

----------------------------------------------------------------
Renesas ARM64 DT updates for v5.7 (take two)

  - Thermal support for R-Car M3-W+,
  - Support for the M3ULCB board with R-Car M3-W+,
  - CPUIdle support for R-Car M3-N and E3,
  - Display support for the HiHope RZ/G2M board,
  - A minor fix.

----------------------------------------------------------------
Fabrizio Castro (1):
      arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a77961: Add thermal nodes
      arm64: dts: renesas: r8a77961: salvator-xs: Fix memory unit-address

Takeshi Kihara (2):
      arm64: dts: renesas: r8a77965: Add CPUIdle support for CA57 cores
      arm64: dts: renesas: r8a77990: Add CPUIdle support for CA53 cores

Yuya Hamamachi (1):
      arm64: dts: renesas: Add support for M3ULCB with R-Car M3-W+

 arch/arm64/boot/dts/renesas/Makefile               |  2 +
 .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts        | 52 ++++++++++++++
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |  2 +-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      | 32 +++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 80 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 15 ++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 15 ++++
 7 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC0816FCDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 12:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgBZLCc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 06:02:32 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:55446 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbgBZLCc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 06:02:32 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 7P2V220095USYZQ06P2VLB; Wed, 26 Feb 2020 12:02:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-0002U5-9q; Wed, 26 Feb 2020 12:02:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-000529-8o; Wed, 26 Feb 2020 12:02:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas ARM64 DT updates for v5.7
Date:   Wed, 26 Feb 2020 12:02:20 +0100
Message-Id: <20200226110221.19288-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226110221.19288-1-geert+renesas@glider.be>
References: <20200226110221.19288-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.7-tag1

for you to fetch changes up to 721b76195b31467e56851fbab3855e700f281270:

  arm64: dts: renesas: rzg2: Add reset control properties for display (2020-02-21 14:41:36 +0100)

----------------------------------------------------------------
Renesas ARM64 DT updates for v5.7

  - CryptoCell support for R-Car M3-W, M3-W+, M3-N, E3, and D3,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (5):
      arm64: dts: renesas: rcar-gen3: Replace "vsps" by "renesas,vsps"
      arm64: dts: renesas: rcar-gen3: Add CCREE nodes
      arm64: dts: renesas: Remove use of ARCH_R8A7795
      arm64: dts: renesas: rcar-gen3: Add reset control properties for display
      arm64: dts: renesas: rzg2: Add reset control properties for display

Kieran Bingham (1):
      arm: dts: renesas: r8a77980: Remove r8a77970 DU compatible

 arch/arm64/boot/dts/renesas/Makefile      |  4 ----
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi |  7 ++++---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi |  7 ++++---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi |  8 +++++---
 arch/arm64/boot/dts/renesas/r8a77950.dtsi |  2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 11 ++++++-----
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 16 +++++++++++++---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi |  9 +++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 +++++++++++++---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |  4 +++-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |  7 ++++---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 14 +++++++++++---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 14 +++++++++++---
 13 files changed, 84 insertions(+), 35 deletions(-)

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD62A30FA54
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbhBDRyX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237753AbhBDRxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:53:02 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F76C061794
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id R5qf240044C55Sk015qf67; Thu, 04 Feb 2021 18:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im6-003Fgj-ML; Thu, 04 Feb 2021 18:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7eK2-006uUf-2p; Thu, 04 Feb 2021 14:05:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] arm: dts: renesas: Group tuples in cpus, playback, capture, and pin control properties
Date:   Thu,  4 Feb 2021 14:05:12 +0100
Message-Id: <20210204130517.1647073-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

To improve human readability and enable automatic validation, the tuples
in properties in DTS files should be grouped using angle brackets.
This series contains another round of updates for cpus, playback,
capture, and pin control properties.

Thanks for your comments!

Geert Uytterhoeven (5):
  ARM: dts: renesas: Group tuples in APMU cpus properties
  ARM: dts: renesas: Group tuples in playback and capture properties
  ARM: dts: renesas: Group tuples in pin control properties
  arm64: dts: renesas: Group tuples in playback and capture properties
  arm64: dts: renesas: Group tuples in pin control properties

 arch/arm/boot/dts/iwg20d-q7-common.dtsi                   | 4 ++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts                   | 4 ++--
 arch/arm/boot/dts/r8a7742.dtsi                            | 4 ++--
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts                    | 2 +-
 arch/arm/boot/dts/r8a7743.dtsi                            | 2 +-
 arch/arm/boot/dts/r8a7744.dtsi                            | 2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts               | 4 ++--
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts                    | 2 +-
 arch/arm/boot/dts/r8a7745.dtsi                            | 2 +-
 arch/arm/boot/dts/r8a77470.dtsi                           | 2 +-
 arch/arm/boot/dts/r8a7790-lager.dts                       | 8 ++++----
 arch/arm/boot/dts/r8a7790-stout.dts                       | 4 ++--
 arch/arm/boot/dts/r8a7790.dtsi                            | 4 ++--
 arch/arm/boot/dts/r8a7791-koelsch.dts                     | 8 ++++----
 arch/arm/boot/dts/r8a7791-porter.dts                      | 4 ++--
 arch/arm/boot/dts/r8a7791.dtsi                            | 2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts                     | 2 +-
 arch/arm/boot/dts/r8a7792-wheat.dts                       | 2 +-
 arch/arm/boot/dts/r8a7792.dtsi                            | 2 +-
 arch/arm/boot/dts/r8a7793-gose.dts                        | 8 ++++----
 arch/arm/boot/dts/r8a7793.dtsi                            | 2 +-
 arch/arm/boot/dts/r8a7794-alt.dts                         | 2 +-
 arch/arm/boot/dts/r8a7794-silk.dts                        | 6 +++---
 arch/arm/boot/dts/r8a7794.dtsi                            | 2 +-
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi              | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts           | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts            | 6 +++---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi          | 6 +++---
 arch/arm64/boot/dts/renesas/ulcb.dtsi                     | 6 +++---
 30 files changed, 56 insertions(+), 56 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

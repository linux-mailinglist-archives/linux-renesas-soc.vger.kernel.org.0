Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FEB40477B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 11:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhIIJEf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 05:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbhIIJEa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 05:04:30 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA1CC061575
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 02:03:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d44:646d:3ffb:9bbf])
        by albert.telenet-ops.be with bizsmtp
        id rl3K2500K3eH4vN06l3KGE; Thu, 09 Sep 2021 11:03:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxn-003D1b-AD; Thu, 09 Sep 2021 11:03:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxm-00BOuq-T3; Thu, 09 Sep 2021 11:03:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] renesas: Add missing Ethernet PHY resets
Date:   Thu,  9 Sep 2021 11:03:09 +0200
Message-Id: <cover.1631177442.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds Ethernet PHY resets to board DTS files that lack
them.  This allows software to control the PHY assert, and avoid relying
solely on boot loaders to bring PHYs out of reset.

To avoid kexec/unbind regressions, this depends on "[PATCH 0/9] renesas:
Add compatible properties to Ethernet PHY nodes"[1].

Thanks for your comments!

[1] https://lore.kernel.org/r/cover.1631174218.git.geert+renesas@glider.be

Geert Uytterhoeven (3):
  ARM: dts: r-mobile: Add missing Ethernet PHY resets
  ARM: dts: rzg1: Add missing Ethernet PHY resets
  arm64: dts: renesas: rcar-gen3: Add missing Ethernet PHY resets

 arch/arm/boot/dts/r8a73a4-ape6evm.dts           | 1 +
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts   | 1 +
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts          | 2 ++
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts          | 2 ++
 arch/arm64/boot/dts/renesas/draak.dtsi          | 1 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts  | 1 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts  | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 2 ++
 9 files changed, 14 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

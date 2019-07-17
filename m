Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF49E6BCAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2019 14:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfGQM5s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Jul 2019 08:57:48 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46394 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfGQM5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jul 2019 08:57:48 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ABF7525AD5F;
        Wed, 17 Jul 2019 22:57:46 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B55B8940270; Wed, 17 Jul 2019 14:57:44 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to 100Mbps
Date:   Wed, 17 Jul 2019 14:57:39 +0200
Message-Id: <20190717125739.21450-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

* According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
  August 24, 2018, the TX clock internal delay mode isn't supported
  on R-Car E3 (r8a77990) and D3 (r8a77995).

* TX clock internal delay mode is required for reliable 1Gbps communication
  using the KSZ9031RNX phy present on the Ebisu and Draak boards.

Thus, the E3 based Ebisu and D3 based Draak boards reliably use 1Gbps and
the speed should be limited to 100Mbps.

Based on work by Kazuya Mizuguchi.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

---

This is a repost of this change.

In earlier review Andrew Lunn suggested that we may be able to take a
different approach to this problem by using delays provided by the
KSZ9031RNX PHY. In particular MMD address 2h, Register 8h -
RGMII Clock Pad Skew.

I have consulted with Renesas regarding this suggestion, however,
unfortunately it appears that the delays provided by this solution
would be insufficient to allow for reliable 1Gbps communication.

At this point I believe the safest option is to apply this patch.
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 83fc13ac3fa1..3d3d6d438a05 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -271,6 +271,7 @@
 		interrupt-parent = <&gpio2>;
 		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+		max-speed = <100>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 0711170b26b1..eb153323ed13 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -175,6 +175,7 @@
 		reg = <0>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		max-speed = <100>;
 	};
 };
 
-- 
2.11.0


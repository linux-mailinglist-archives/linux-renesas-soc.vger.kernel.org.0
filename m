Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B35251D2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 18:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgHYQ2h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 12:28:37 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29306 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726104AbgHYQ2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 12:28:36 -0400
X-IronPort-AV: E=Sophos;i="5.76,353,1592838000"; 
   d="scan'208";a="55494896"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2020 01:28:34 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 328A2409E769;
        Wed, 26 Aug 2020 01:28:33 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 4/4] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication
Date:   Tue, 25 Aug 2020 17:27:18 +0100
Message-Id: <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for LED trigger on SD2 interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index 070fc9729b39..6d31d2401481 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -63,6 +63,16 @@
 		enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		sdhi2_led {
+			label = "sdio-led";
+			gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "mmc1";
+		};
+	};
+
 	lvds-receiver {
 		compatible = "ti,ds90cf384a", "lvds-decoder";
 		vcc-supply = <&vcc_3v3_tft1>;
-- 
2.17.1


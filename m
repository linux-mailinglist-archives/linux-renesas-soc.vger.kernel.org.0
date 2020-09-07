Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACCB25FDC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbgIGP5A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 11:57:00 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:2792 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730204AbgIGP4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 11:56:35 -0400
X-IronPort-AV: E=Sophos;i="5.76,402,1592838000"; 
   d="scan'208";a="56587380"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Sep 2020 00:56:34 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ABCF6400E4EF;
        Tue,  8 Sep 2020 00:56:32 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2 2/3] ARM: dts: r8a7742-iwg21d-q7: Add can1 support to carrier board
Date:   Mon,  7 Sep 2020 16:55:40 +0100
Message-Id: <20200907155541.2011-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables CAN1 interface exposed through connector J20 on the
carrier board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index 818f1a850c62..66881a473d6c 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -198,6 +198,13 @@
 	};
 };
 
+&can1 {
+	pinctrl-0 = <&can1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &cmt0 {
 	status = "okay";
 };
@@ -214,6 +221,15 @@
 	};
 };
 
+&gpio1 {
+	can-trx-en-gpio{
+		gpio-hog;
+		gpios = <28 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can-trx-en-gpio";
+	};
+};
+
 &hsusb {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
@@ -287,6 +303,11 @@
 		function = "tpu0";
 	};
 
+	can1_pins: can1 {
+		groups = "can1_data_b";
+		function = "can1";
+	};
+
 	i2c2_pins: i2c2 {
 		groups = "i2c2_b";
 		function = "i2c2";
-- 
2.17.1


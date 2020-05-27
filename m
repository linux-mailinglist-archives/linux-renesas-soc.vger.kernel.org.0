Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841551E4F35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 22:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgE0UYi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 16:24:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30112 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728482AbgE0UYi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 16:24:38 -0400
X-IronPort-AV: E=Sophos;i="5.73,442,1583161200"; 
   d="scan'208";a="48174913"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 May 2020 05:24:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D0CAB40E1B8A;
        Thu, 28 May 2020 05:24:34 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] ARM: dts: r8a7742-iwg21d-q7: Enable HSUSB, USB2.0 and XHCI
Date:   Wed, 27 May 2020 21:23:31 +0100
Message-Id: <1590611013-26029-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590611013-26029-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1590611013-26029-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for HSUB, USB2.0 and xhci on iWave RZ/G1H carrier board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index f23c2ba..f62485a 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -61,6 +61,32 @@
 	};
 };
 
+&hsusb {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pci0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	/* Disable hsusb to enable USB2.0 host mode support */
+	/* status = "okay"; */
+};
+
+&pci1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pci2 {
+	pinctrl-0 = <&usb2_pins>;
+	pinctrl-names = "default";
+	/* Disable xhci to enable USB2.0 host mode support */
+	/* status = "okay"; */
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii";
@@ -88,6 +114,21 @@
 		function = "sdhi2";
 		power-source = <1800>;
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		groups = "usb1";
+		function = "usb1";
+	};
+
+	usb2_pins: usb2 {
+		groups = "usb2";
+		function = "usb2";
+	};
 };
 
 &rwdt {
@@ -122,3 +163,13 @@
 	sd-uhs-sdr50;
 	status = "okay";
 };
+
+&usbphy {
+	status = "okay";
+};
+
+&xhci {
+	pinctrl-0 = <&usb2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.7.4


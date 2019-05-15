Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8AE1F3F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 14:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfEOMRD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 08:17:03 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24163 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726943AbfEOMQ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 08:16:57 -0400
X-IronPort-AV: E=Sophos;i="5.60,472,1549897200"; 
   d="scan'208";a="16017668"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 May 2019 21:16:55 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D5064400F515;
        Wed, 15 May 2019 21:16:52 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v6 6/7] arm64: dts: renesas: r8a774c0-cat874: Enable USB3.0 host/peripheral device node
Date:   Wed, 15 May 2019 13:09:11 +0100
Message-Id: <1557922152-16449-7-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables USB3.0 host/peripheral device node for r8a774c0
cat874 board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V5-->V6
  * No change
V4-->V5
  * No change
V3-->V4
  * No change
V2-->V3
  * No change
V1-->V2
  * No change
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 013a48c..b9ae7db 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -134,6 +134,11 @@
 		function = "sdhi0";
 		power-source = <1800>;
 	};
+
+	usb30_pins: usb30 {
+		groups = "usb30", "usb30_id";
+		function = "usb30";
+	};
 };
 
 &rwdt {
@@ -166,3 +171,15 @@
 	renesas,no-otg-pins;
 	status = "okay";
 };
+
+&usb3_peri0 {
+	companion = <&xhci0>;
+	status = "okay";
+};
+
+&xhci0 {
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E75C3400
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 14:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732725AbfJAMQK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 08:16:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:48654 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725821AbfJAMQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:16:10 -0400
X-IronPort-AV: E=Sophos;i="5.64,571,1559487600"; 
   d="scan'208";a="28015479"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2019 21:16:09 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7B4D14243F52;
        Tue,  1 Oct 2019 21:16:06 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 7/8] arm64: dts: renesas: hihope-rzg2-ex: Enable backlight
Date:   Tue,  1 Oct 2019 13:15:23 +0100
Message-Id: <1569932124-32010-8-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables backlight support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 4280b19..70f9a2a 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -13,6 +13,14 @@
 	chosen {
 		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 50000>;
+
+		brightness-levels = <0 2 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
 };
 
 &avb {
@@ -82,4 +90,16 @@
 		groups = "can1_data";
 		function = "can1";
 	};
+
+	pwm0_pins: pwm0 {
+		groups = "pwm0";
+		function = "pwm0";
+	};
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
-- 
2.7.4


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF7114D09F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 19:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgA2SlE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 13:41:04 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:42889 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727523AbgA2SlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 13:41:04 -0500
X-IronPort-AV: E=Sophos;i="5.70,378,1574089200"; 
   d="scan'208";a="37715617"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2020 03:41:03 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown [10.226.36.164])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8836E4007F2E;
        Thu, 30 Jan 2020 03:41:02 +0900 (JST)
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Chris Paterson <chris.paterson2@renesas.com>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: [PATCH 2/2] ARM: dts: iwg22d-sodimm: disable lcd for extension board
Date:   Wed, 29 Jan 2020 18:40:53 +0000
Message-Id: <1580323253-3281-3-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
References: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The two variants of the iW-G22D should be mutually exclusive, therefore
this patch disables the RGB LCD display when the HDMI extension board is
used.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 13 +++++++++++++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts         |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
index 2aeebfc..cb76469 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
@@ -108,6 +108,19 @@
 	};
 };
 
+&lcd_panel {
+	status = "disabled";
+
+	/* null reference to get rid of the dtc warning */
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <0>;
+			};
+		};
+	};
+};
+
 &pfc {
 	can1_pins: can1 {
 		groups = "can1_data_b";
diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 878113a..444adc6 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -98,7 +98,7 @@
 		pinctrl-names = "default";
 	};
 
-	lcd {
+	lcd_panel: lcd {
 		compatible = "edt,etm043080dh6gp", "simple-panel";
 		power-supply = <&vccq_panel>;
 
-- 
2.7.4


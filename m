Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E927A2BAE2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Nov 2020 16:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgKTPNy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Nov 2020 10:13:54 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:23669 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728923AbgKTPNy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 10:13:54 -0500
X-IronPort-AV: E=Sophos;i="5.78,356,1599490800"; 
   d="scan'208";a="63383353"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Nov 2020 00:13:51 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 290BB4004CFA;
        Sat, 21 Nov 2020 00:13:49 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add OV7725 nodes
Date:   Fri, 20 Nov 2020 15:13:43 +0000
Message-Id: <20201120151343.24175-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the ov7725 endpoint nodes to the camera daughter board. The ov7725
sensors can be populated on I2C{0,1,2,3} buses.

By default the VIN{0,1,2,3} are tied to OV5640{0,1,2,3} endpoints
respectively in the camera DB dts hence the remote-endpoint property in
OV7725{0,1,2,3} endpoints is commented out.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi All,

This patch is based on top of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.11

Cheers,
Prabhakar
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 98c3fbd89fa6..d1386bf7bdbe 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -108,6 +108,29 @@
 			};
 		};
 	};
+
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&mclk_cam1>;
+
+		port {
+			ov7725_0: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				/*
+				 * uncomment remote-endpoint property to
+				 * tie ov7725_0 to vin0ep also make
+				 * sure to comment/remove remote-endpoint
+				 * property from ov5640_0 endpoint and
+				 * replace remote-endpoint property in
+				 * vin0ep node with
+				 * remote-endpoint = <&ov7725_0>;
+				 */
+				/* remote-endpoint = <&vin0ep>; */
+			};
+		};
+	};
 };
 
 &i2c1 {
@@ -133,6 +156,29 @@
 			};
 		};
 	};
+
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&mclk_cam2>;
+
+		port {
+			ov7725_1: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				/*
+				 * uncomment remote-endpoint property to
+				 * tie ov7725_1 to vin1ep also make
+				 * sure to comment/remove remote-endpoint
+				 * property from ov5640_1 endpoint and
+				 * replace remote-endpoint property in
+				 * vin1ep node with
+				 * remote-endpoint = <&ov7725_1>;
+				 */
+				/* remote-endpoint = <&vin1ep>; */
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -152,6 +198,30 @@
 			};
 		};
 	};
+
+	ov7725@21 {
+		status = "disabled";
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&mclk_cam3>;
+
+		port {
+			ov7725_2: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				/*
+				 * uncomment remote-endpoint property to
+				 * tie ov7725_2 to vin2ep also make
+				 * sure to comment/remove remote-endpoint
+				 * property from ov5640_2 endpoint and
+				 * replace remote-endpoint property in
+				 * vin2ep node with
+				 * remote-endpoint = <&ov7725_2>;
+				 */
+				/* remote-endpoint = <&vin2ep>; */
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -177,6 +247,29 @@
 			};
 		};
 	};
+
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&mclk_cam4>;
+
+		port {
+			ov7725_3: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				/*
+				 * uncomment remote-endpoint property to
+				 * tie ov7725_3 to vin3ep also make
+				 * sure to comment/remove remote-endpoint
+				 * property from ov5640_3 endpoint and
+				 * replace remote-endpoint property in
+				 * vin3ep node with
+				 * remote-endpoint = <&ov7725_3>;
+				 */
+				/* remote-endpoint = <&vin3ep>; */
+			};
+		};
+	};
 };
 
 &pfc {
-- 
2.17.1


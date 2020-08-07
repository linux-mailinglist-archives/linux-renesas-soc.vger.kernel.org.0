Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1BFA23F23D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 19:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgHGRub (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 13:50:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29111 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728071AbgHGRuN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 13:50:13 -0400
X-IronPort-AV: E=Sophos;i="5.75,446,1589209200"; 
   d="scan'208";a="54150743"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Aug 2020 02:50:12 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BB0ED40061B5;
        Sat,  8 Aug 2020 02:50:09 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/7] ARM: dts: r8a7742: Add DU support
Date:   Fri,  7 Aug 2020 18:49:52 +0100
Message-Id: <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add du node to r8a7742 SoC DT. Boards that want to enable the DU
need to specify the output topology.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742.dtsi | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 4a8d27dff9f7..a979a4b3de61 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -1509,6 +1509,41 @@
 			resets = <&cpg 408>;
 		};
 
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a7742";
+			reg = <0 0xfeb00000 0 0x70000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
+				 <&cpg CPG_MOD 722>;
+			clock-names = "du.0", "du.1", "du.2";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+				port@1 {
+					reg = <1>;
+					du_out_lvds0: endpoint {
+					};
+				};
+				port@2 {
+					reg = <2>;
+					du_out_lvds1: endpoint {
+					};
+				};
+			};
+		};
+
 		prr: chipid@ff000044 {
 			compatible = "renesas,prr";
 			reg = <0 0xff000044 0 4>;
-- 
2.17.1


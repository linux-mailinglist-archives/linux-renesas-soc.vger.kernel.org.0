Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D0925F1DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 04:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgIGC7Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Sep 2020 22:59:16 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:48094 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726278AbgIGC7P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Sep 2020 22:59:15 -0400
Date:   07 Sep 2020 11:59:14 +0900
X-IronPort-AV: E=Sophos;i="5.76,400,1592838000"; 
   d="scan'208";a="56531124"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2020 11:59:14 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 111824179B94;
        Mon,  7 Sep 2020 11:59:14 +0900 (JST)
Message-ID: <87imcq70ru.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/9] arm64: dts: renesas: r8a77961: Add HDMI device nodes
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        (Renesas) shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
In-Reply-To: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds HDMI device nodes for R-Car M3-W+ (r8a77961) SoC.
This patch is test on R-Car M3-W+ Salvator-XS board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index dcd92f5abad6..5050cf8e7625 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2145,14 +2145,23 @@ port@1 {
 		};
 
 		hdmi0: hdmi@fead0000 {
+			compatible = "renesas,r8a77961-hdmi", "renesas,rcar-gen3-hdmi";
 			reg = <0 0xfead0000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A77961_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 729>;
+			status = "disabled";
 
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				port@0 {
 					reg = <0>;
+					dw_hdmi0_in: endpoint {
+						remote-endpoint = <&du_out_hdmi0>;
+					};
 				};
 				port@1 {
 					reg = <1>;
@@ -2191,6 +2200,7 @@ du_out_rgb: endpoint {
 				port@1 {
 					reg = <1>;
 					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
 					};
 				};
 				port@2 {
-- 
2.25.1


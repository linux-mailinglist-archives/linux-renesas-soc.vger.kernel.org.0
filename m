Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0462C879
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfE1ONc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:13:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48990 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfE1ONc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:32 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6414DFA6;
        Tue, 28 May 2019 16:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052810;
        bh=73AxSuuvONAgBvXC48e0yFmYlcerM+/RfyV/F3Wific=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K5fvN0zOmRctTTb2e5eLpfsa8ipkijSUX7qK4Vsy7duy1W4UqSh52xFP/41xgathz
         c/axpcn4juFQcQ35iacooWX24QfmX11ZJ+aJQQTipHtFDVGYkSfCW3CcNd+gEvq506
         K5ZqVurj7Ic5HVl8ucgxcQUdjoUBLWNlRrUvRy+4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 09/10] [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
Date:   Tue, 28 May 2019 17:12:33 +0300
Message-Id: <20190528141234.15425-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable and connect the second LVDS encoder to the second LVDS input of
the THC63LVD1024 for dual-link LVDS operation. This requires changing
the default settings of SW45 and SW47 to OFF and ON respectively.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index a7dc11e36fd9..0699f1c19b11 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -77,11 +77,18 @@
 
 			port@0 {
 				reg = <0>;
-				thc63lvd1024_in: endpoint {
+				thc63lvd1024_in0: endpoint {
 					remote-endpoint = <&lvds0_out>;
 				};
 			};
 
+			port@1 {
+				reg = <1>;
+				thc63lvd1024_in1: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+
 			port@2 {
 				reg = <2>;
 				thc63lvd1024_out: endpoint {
@@ -360,24 +367,27 @@
 	ports {
 		port@1 {
 			lvds0_out: endpoint {
-				remote-endpoint = <&thc63lvd1024_in>;
+				remote-endpoint = <&thc63lvd1024_in0>;
 			};
 		};
 	};
 };
 
 &lvds1 {
-	/*
-	 * Even though the LVDS1 output is not connected, the encoder must be
-	 * enabled to supply a pixel clock to the DU for the DPAD output when
-	 * LVDS0 is in use.
-	 */
 	status = "okay";
 
 	clocks = <&cpg CPG_MOD 727>,
 		 <&x12_clk>,
 		 <&extal_clk>;
 	clock-names = "fck", "dclkin.0", "extal";
+
+	ports {
+		port@1 {
+			lvds1_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in1>;
+			};
+		};
+	};
 };
 
 &ohci0 {
-- 
Regards,

Laurent Pinchart


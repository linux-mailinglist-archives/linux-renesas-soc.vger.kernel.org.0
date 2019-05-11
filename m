Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0E31A989
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfEKVHl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfEKVHl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:41 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 538241174;
        Sat, 11 May 2019 23:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608855;
        bh=A6sd4VuIe2ZbTib4ItGQ+3bJC9cymI4xbJ1WKcz83Og=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fReTdVSrC+NI0CU7d5X/6X3SwfYPDCHavTVZMF1O3USwhvqfGoQgnBcRGZpgyccw4
         k+P/4Pkq2io2Q9+xpCwsi4XpQXYVoasrE1glLFUM5q9yKR86oCmjG+QbG/yjRfLx18
         umf7jgPWi6WRDOWPUYrllPerCyea6QyPBZnb3bwk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 09/10] [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
Date:   Sun, 12 May 2019 00:07:01 +0300
Message-Id: <20190511210702.18394-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index db2bed1751b8..6af0e891c1ec 100644
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
@@ -349,17 +356,27 @@
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
+	status = "okay";
+
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


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5D24EACFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 14:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbiC2MVw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 08:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbiC2MVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 08:21:51 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408BD340F6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 05:20:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by laurent.telenet-ops.be with bizsmtp
        id CCL72700Y49QC4401CL7F1; Tue, 29 Mar 2022 14:20:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZApT-007GW5-Ds; Tue, 29 Mar 2022 14:20:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZApS-00CDdb-J8; Tue, 29 Mar 2022 14:20:06 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] arm64: dts: renesas: draak: Add RPC HyperFlash device node
Date:   Tue, 29 Mar 2022 14:20:02 +0200
Message-Id: <0f3d3018ecfcdce1bce67708708a6d3a98368b10.1648548339.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648548339.git.geert+renesas@glider.be>
References: <cover.1648548339.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the RPC HyperFlash device node along with its partitions to the
common Draak board DTS file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/draak.dtsi | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index eb0327c0df48f2e3..2a784ee6da49cb95 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -541,6 +541,12 @@ pwm1_pins: pwm1 {
 		function = "pwm1";
 	};
 
+	rpc_pins: rpc {
+		groups = "rpc_clk2", "rpc_ctrl", "rpc_data", "rpc_reset",
+			 "rpc_int";
+		function = "rpc";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data";
 		function = "scif2";
@@ -630,6 +636,58 @@ rsnd_for_ak4613: endpoint {
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&rpc_pins>;
+	pinctrl-names = "default";
+
+	/* Left disabled.  To be enabled by firmware when unlocked. */
+
+	flash@0 {
+		compatible = "cypress,hyperflash", "cfi-flash";
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			bl2@40000 {
+				reg = <0x00040000 0x140000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x040000>;
+				read-only;
+			};
+			tee@200000 {
+				reg = <0x00200000 0x440000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x100000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.25.1


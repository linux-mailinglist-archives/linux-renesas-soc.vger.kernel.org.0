Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9FBA50D32F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 18:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbiDXQPj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 12:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234064AbiDXQPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 12:15:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2B714EC40;
        Sun, 24 Apr 2022 09:12:35 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F53130B;
        Sun, 24 Apr 2022 18:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650816753;
        bh=LVghvwvLQjgAqXnNe8jCyw4B79pb1Ihc0+ZSTO/qRVQ=;
        h=From:To:Cc:Subject:Date:From;
        b=XaaJnhfmhsKiZlRpHDvtgYFFdWttoWa35KM0KUmZjvmN9jtVPBFs76uc+9dZ/ee/X
         TsIXswqdG0xODhzgOulDDKxA0ufcSjbUYkQf00eY+y5wFowXXEprc3oHsy15HXiDbl
         D7MKX1AC+bW7n/kav8mIZZ0eIjA+BfJk+e09XMjI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 1/2] arm64: dts: renesas: Remove empty lvds endpoints
Date:   Sun, 24 Apr 2022 19:12:27 +0300
Message-Id: <20220424161228.8147-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Endpoints node must have a remote-endpoint property, as endpoints only
exist to model a link between ports. Drop the empty lvds endpoints from
SoC dtsi files, they should be instead declared in the board dts or in
overlays.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Handle r8a77961.dtsi
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ----
 12 files changed, 30 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 12846125a4c9..a65ba7ba1cae 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2775,8 +2775,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index a4b406a346f9..90519af646c4 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2620,8 +2620,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index e123c8d1bab9..ff75ceec9fee 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1913,8 +1913,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
@@ -1940,8 +1938,6 @@ lvds1_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds1_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 989c1c00dcdc..aefed8e0037f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2895,8 +2895,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 4e87e8776a2b..383f5e199c17 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -3378,8 +3378,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 6f79da8cc8c0..de38a05e5746 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2975,8 +2975,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 68cbbb322acf..be84120d7650 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2760,8 +2760,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9f858af8b762..f00de3f660c5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2787,8 +2787,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 517892cf6294..ad021b2703ab 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1190,8 +1190,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 347c068ff2c5..71f7a5dad580 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1568,8 +1568,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 7e0f1aab2135..070a0c72cb67 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2074,8 +2074,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
@@ -2101,8 +2099,6 @@ lvds1_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds1_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index cac1f9467ffa..be746a7f1ce1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1393,8 +1393,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
@@ -1420,8 +1418,6 @@ lvds1_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds1_out: endpoint {
-					};
 				};
 			};
 		};

base-commit: 19df0cfa258cd42f7f106f6085f1e625f26283db
-- 
Regards,

Laurent Pinchart


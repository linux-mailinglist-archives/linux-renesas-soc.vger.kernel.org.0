Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3B2481634
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 20:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhL2TSq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 14:18:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35440 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhL2TSq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 14:18:46 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 297FA33F;
        Wed, 29 Dec 2021 20:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640805524;
        bh=yj5jJSNhXsBBXRAVQPygshzSyzvAydHP469ZnB2f+2c=;
        h=From:To:Cc:Subject:Date:From;
        b=Brv0TKF3lbjn76Ik4K8JlwPvlrVf5QEOw+W916yHD3aM3ZFiqXBnwIN17zean+lBt
         k7EaUr50bOCoFIUfxEPN6B5+hzd5tZB5ka2Y1Oh8KyfHiSt9H9LOy82aM0x8FhR1VU
         psO5CzQyHo4YRsEpjKD4A9HMPFuKv54NrzjV/8+0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 1/2] arm64: dts: renesas: Remove empty lvds endpoints
Date:   Wed, 29 Dec 2021 21:18:37 +0200
Message-Id: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Endpoints node must have a remote-endpoint property, as endpoints only
exist to model a link between ports. Drop the empty lvds endpoints from
SoC dtsi files, then should be instead declared in the board dts or in
overlays.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ----
 11 files changed, 28 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 6f4fffacfca2..9a8c1bd923af 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2771,8 +2771,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 0f7bdfc90a0d..8912c1665ed9 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2616,8 +2616,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index d597772c4c37..263f39fb8ad9 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1910,8 +1910,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
@@ -1937,8 +1935,6 @@ lvds1_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds1_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 379a1300272b..02b35e68a3fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2891,8 +2891,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1768a3e6bb8d..0919d8f540c4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -3362,8 +3362,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 2bd8169735d3..221ee1ec415d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2959,8 +2959,6 @@ lvds0_in: endpoint {
 				};
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 08df75606430..5f3046eee365 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2771,8 +2771,6 @@ lvds0_in: endpoint {
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
index 6347d15e66b6..29f1161da957 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1567,8 +1567,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 0ea300a8147d..735c46217835 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2059,8 +2059,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
@@ -2086,8 +2084,6 @@ lvds1_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds1_out: endpoint {
-					};
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 16ad5fc23a67..759505bd1a44 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1380,8 +1380,6 @@ lvds0_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds0_out: endpoint {
-					};
 				};
 			};
 		};
@@ -1407,8 +1405,6 @@ lvds1_in: endpoint {
 
 				port@1 {
 					reg = <1>;
-					lvds1_out: endpoint {
-					};
 				};
 			};
 		};

base-commit: 2b534e90a1e31c7fc9536b512b72274cc3575f4c
prerequisite-patch-id: 98434eb22c020924bc338316e54a7b42ea339e9f
prerequisite-patch-id: ce261c9865255051f2c2107a930b0f15ce862703
prerequisite-patch-id: 500ab746415c5421e41128c2b0db35987d8d7a49
prerequisite-patch-id: ad2d5ad025f9cfa0dc453d7e0b2aa96b4514afd7
prerequisite-patch-id: ac76bcc0f7b278863e362db083a7d64bbd0bd030
prerequisite-patch-id: c7a7c3a6b9dbbae18a768160db70d7010ea71ca5
-- 
Regards,

Laurent Pinchart


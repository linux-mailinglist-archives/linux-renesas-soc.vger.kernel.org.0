Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55675366EAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 17:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243774AbhDUPDM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 11:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243763AbhDUPDL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 11:03:11 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0C8C06138A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 08:02:36 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id v6so62677082ejo.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jn5tNV5miXDj8BGnx/R3zrH2hK5CK/Jy2LBfZOVrOLc=;
        b=ySvsEQI/9o6pFXnK48mCfD2zxAtBLphvY0ulvXnb8Z0jw/Lo7EFI5+GHxjD6I/fk0F
         ZwzTm4S9j1lYK7yZrRexOzDtE8run4FldSinzgsh2Rm4AOgoY4G3AXKG0n+y9Sg001JZ
         uFyMcCGBc3+IdoYAXVms4jIVwFsJ0tZRfQg+RP82Tp2TF2NnGirGS0UuYN6feL57a58s
         DzEakJUCGi/en3tHqd8oqOpKKqqLWFibmaBxuVkuItRu6RM82Ejhw/uxruUrPy3kNrEZ
         9JX6iHUswW+jAG7qWclcM6gZNJBtQ/ykMmsaVlr6UP0xSHhSNK9wOYclnAE39ZfrauOn
         Mnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jn5tNV5miXDj8BGnx/R3zrH2hK5CK/Jy2LBfZOVrOLc=;
        b=FHiZdBdcOG0kKDy3PQv81KFYvma9PCToKF1AXhDzNlL1wRqAhAKoHafBDE1DwTPrn/
         VqvOPdXP8bAOmmU15RqWgW6Ex1mUo5kHwXVMhCfBVZV6qu1QGLeVPsMjhesSE0mnuR53
         jalw+YBosNUQALyW6hhEHL0uS+COZAg4eIjUSTHqLn8WuerPyhwThsl7VsNBSzOukPmP
         1EO5MAMhp+mV9NPk4ZdUCCCndD4Br7OBxajfnVqZ7mpljDtvVxwMHu00ro2qv0FI9lY7
         U1VhRg8r9wKHTNCowcXxgjvoF1CT6G4eNz2tVNufx5HDatmaPCwcvigC/KPWCA5CkCsS
         HXCQ==
X-Gm-Message-State: AOAM531J194JUdt1qQ6quk/dLUwXIxHHK/LgYVKNS6+Xtxj5WOXvVe1i
        vfBAoqYVQgm8RxIWa9k5f1aqqLzrSU8WNppirsY=
X-Google-Smtp-Source: ABdhPJxDFLHDwd43iBZ1TB/FMg79ZqbipGIQVbMUMkLJI/gXtZKZrrwircaNxGcpJI09gTwlLZiDOQ==
X-Received: by 2002:a17:906:a10e:: with SMTP id t14mr32748913ejy.103.1619017355493;
        Wed, 21 Apr 2021 08:02:35 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id g11sm3692588edt.35.2021.04.21.08.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 08:02:35 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: Add port@0 node for all CSI-2 nodes to dtsi
Date:   Wed, 21 Apr 2021 17:02:21 +0200
Message-Id: <20210421150221.3202955-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The port@0 is a mandatory port, add or move the declaration to the CSI-2
nodes top declared in dtsi files instead of depending on dts files
adding them when describing the external connection.

This fixes validation warnings for DTB outputs that does not connect all
CSI-2 receivers to transmitters and thus declaring all port@0 nodes in
dts files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 ...hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi |  2 --
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77950.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi            | 12 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts       |  2 --
 arch/arm64/boot/dts/renesas/r8a77990.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi     |  3 ---
 15 files changed, 84 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
index c62ddb9b2ba565e9..3771144a2ce49a45 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
@@ -14,7 +14,6 @@ &csi20 {
 
 	ports {
 		port@0 {
-			reg = <0>;
 			csi20_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
@@ -29,7 +28,6 @@ &csi40 {
 
 	ports {
 		port@0 {
-			reg = <0>;
 			csi40_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d64fb8b1b86c3731..46f8dbf6890482d9 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2573,6 +2573,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2628,6 +2632,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 5b05474dc2727884..d16a4be5ef77a21b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2419,6 +2419,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2474,6 +2478,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 20fa3caa050e5d5e..1aef34447abd1b3d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1823,6 +1823,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 8eb006cbd9af4c98..1f51237ab0a648fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2709,6 +2709,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2764,6 +2768,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77950.dtsi b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
index 25b87da32eebb6dc..b643d3079db1e7aa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
@@ -192,6 +192,10 @@ ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			port@0 {
+				reg = <0>;
+			};
+
 			port@1 {
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 5c39152e45707441..85d66d15465ab2b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -3097,6 +3097,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -3152,6 +3156,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -3191,6 +3199,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 25d947a81b294a81..12476e354d746d0e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2761,6 +2761,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2816,6 +2820,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index ab081f14af9aa0fb..d9804768425a7603 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2499,6 +2499,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2554,6 +2558,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 657b20d3533bd398..dcb9df861d749692 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2575,6 +2575,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2630,6 +2634,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 5a5d5649332a8b1d..e8f6352c3665f44c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1106,6 +1106,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 1ffa4a995a7ab8ae..7b51d464de0eac8b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1439,6 +1439,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1478,6 +1482,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 295d34f1d216d963..4715e4a4abe064cd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -298,8 +298,6 @@ &csi40 {
 
 	ports {
 		port@0 {
-			reg = <0>;
-
 			csi40_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 5010f23fafcc7f98..0eaea58f4210d89a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1970,6 +1970,10 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+				};
+
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e18747df219f8118..453ffcef24fae1be 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -349,7 +349,6 @@ &csi20 {
 
 	ports {
 		port@0 {
-			reg = <0>;
 			csi20_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1>;
@@ -364,8 +363,6 @@ &csi40 {
 
 	ports {
 		port@0 {
-			reg = <0>;
-
 			csi40_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2 3 4>;
-- 
2.31.1


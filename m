Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4737442ACE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 21:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhJLTFF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 15:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbhJLTFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 15:05:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20361C061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 12:03:02 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id p13so442410edw.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=buZK/PlADbMCNy9YKy6Cm8IVH1ee3LcCrlFomKkKjoM=;
        b=X7vrlUEBZYrxI0RJ91YhOB8rqRHBi74vHuCdeekFAIqlT8CEJVd4RGpwvAvLUbZ6MP
         uux1JvhktXy+CPYJcMgSPj87F3IVDEihYOJUgZVb//nZQWRu1ZdE6wf8QOMFzB9uSxhd
         zeMPYF7295qRQ08NT9Xk+FjiX646nU8+5+S0PxSqdSQbsMYNyZue26mFFYNEeJz1so76
         PaspGjxZmauLOQjAxnEQmma/9vZG99Q31SEW4thkimWy4gSSdrf8UoKoFOzeJWcSDHgs
         kwZC4M4aIWL3dKuHNdp91y3pEvEvypL4j+4aznOWWfsLhabuPTYDVKjXVil8ukaNX1Dl
         LR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=buZK/PlADbMCNy9YKy6Cm8IVH1ee3LcCrlFomKkKjoM=;
        b=j2DlH5Tg7dYNu0z6Wymzzw9fvwTgnCauJCIvP3TcEA6CWxL4gCv0SuC2zfPF5G1niu
         eKng4V0HA8JLPhWnGPr6RU3Ei2A7BLq3tCanemf8FXwWNJYmIqKCMQnFvYGy5ulGZvhm
         I6KAf44YWpSnfY3lWxBFmiuphiLt5OCUi4SaVT/RoOoKJXEp9U7ATRrwUv+8OKDsM2Q1
         tYSc6QCztLi2bnHhpc1bZD7pZxYhHU/HUgMtINTV+2SiWqr6zRNpjecJPi8RyuUU2ogN
         fbDfA3Wm+CArcbbwEJ53iH24zfQZVzk4LiqbOAKlutk+QtOmm9io30tu6xY2PHuQLCPj
         yqFA==
X-Gm-Message-State: AOAM5318GumHuctV6JGVdhi/w3g9SW1g8vQf1+MtK74GYnjsR2j4RsTb
        xqygrYUbwq16bYWvOVUIudXpUwsFX3RLoY0x
X-Google-Smtp-Source: ABdhPJxY/Fa4472DSAPgNjyiLWrwLm6r+hooDKKWnRbIJ6Vrt1ZS3KRkzb7ueNqdu6t9zESpRuL85Q==
X-Received: by 2002:adf:9bd3:: with SMTP id e19mr35117567wrc.167.1634063680853;
        Tue, 12 Oct 2021 11:34:40 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h22sm3838106wmq.42.2021.10.12.11.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 11:34:40 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
Date:   Tue, 12 Oct 2021 20:34:31 +0200
Message-Id: <20211012183431.718691-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The different port@ entries of the adv7482 nodes shall be encapsulated
in a ports node, add one. This change do not change how the driver
parses the DT and no driver change is needed.

The change however makes it possible to validate the source files with a
correct json-schema.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 40 +++++++-------
 .../boot/dts/renesas/salvator-common.dtsi     | 54 ++++++++++---------
 2 files changed, 49 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 9c7146084ea1c779..b051e2f3aceb5a17 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -423,37 +423,39 @@ video-receiver@70 {
 		compatible = "adi,adv7482";
 		reg = <0x70>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		interrupt-parent = <&gpio0>;
 		interrupt-names = "intrq1", "intrq2";
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>,
 			     <17 IRQ_TYPE_LEVEL_LOW>;
 
-		port@7 {
-			reg = <7>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			adv7482_ain7: endpoint {
-				remote-endpoint = <&cvbs_con>;
+			port@7 {
+				reg = <7>;
+
+				adv7482_ain7: endpoint {
+					remote-endpoint = <&cvbs_con>;
+				};
 			};
-		};
 
-		port@8 {
-			reg = <8>;
+			port@8 {
+				reg = <8>;
 
-			adv7482_hdmi: endpoint {
-				remote-endpoint = <&hdmi_in_con>;
+				adv7482_hdmi: endpoint {
+					remote-endpoint = <&hdmi_in_con>;
+				};
 			};
-		};
 
-		port@a {
-			reg = <10>;
+			port@a {
+				reg = <10>;
 
-			adv7482_txa: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-				remote-endpoint = <&csi40_in>;
+				adv7482_txa: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+					remote-endpoint = <&csi40_in>;
+				};
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index eb1f3b82300b1601..5a55ed7a7efac181 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -524,47 +524,49 @@ video-receiver@70 {
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
 			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		interrupt-parent = <&gpio6>;
 		interrupt-names = "intrq1", "intrq2";
 		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
 			     <31 IRQ_TYPE_LEVEL_LOW>;
 
-		port@7 {
-			reg = <7>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			adv7482_ain7: endpoint {
-				remote-endpoint = <&cvbs_con>;
+			port@7 {
+				reg = <7>;
+
+				adv7482_ain7: endpoint {
+					remote-endpoint = <&cvbs_con>;
+				};
 			};
-		};
 
-		port@8 {
-			reg = <8>;
+			port@8 {
+				reg = <8>;
 
-			adv7482_hdmi: endpoint {
-				remote-endpoint = <&hdmi_in_con>;
+				adv7482_hdmi: endpoint {
+					remote-endpoint = <&hdmi_in_con>;
+				};
 			};
-		};
 
-		port@a {
-			reg = <10>;
+			port@a {
+				reg = <10>;
 
-			adv7482_txa: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&csi40_in>;
+				adv7482_txa: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
 			};
-		};
 
-		port@b {
-			reg = <11>;
+			port@b {
+				reg = <11>;
 
-			adv7482_txb: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1>;
-				remote-endpoint = <&csi20_in>;
+				adv7482_txb: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1>;
+					remote-endpoint = <&csi20_in>;
+				};
 			};
 		};
 	};
-- 
2.33.0


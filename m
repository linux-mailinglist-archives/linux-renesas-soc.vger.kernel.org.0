Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA46C43C3E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Oct 2021 09:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238468AbhJ0HdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Oct 2021 03:33:02 -0400
Received: from mail.iot.bzh ([51.75.236.24]:20838 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237061AbhJ0HdC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 03:33:02 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 250DE24FE1;
        Wed, 27 Oct 2021 09:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:in-reply-to:message-id
        :mime-version:references:reply-to:subject:subject:to:to; s=
        iot.bzh; bh=i6U/AV191o/UNrCkLrmv+5mGLLuxNwffMSa6Ec7U2cA=; b=ampq
        dCm6aYjP7iuIzz2eTt3pdSAldgTRGs63jZpN7PFjVdG/dlUAmjJDGVE/UTDDaLMh
        zHxwNDJpUmeO9JOAJsXd9OdLFkxjShURtRwQrmn5iwo/xo0235ICSUcXNWjBCTWw
        0rsYh/RnTGtwE1yJMyicEAxlrrEE+3WDWGLJelPs+LmVzs61ynu328sePxlCcznx
        8cvr+OHUlxy+RNc0FFM+zyYHRkOmp7tIzix+k+Mli5dx3RCFD4HU6RBNh7vvwvoB
        z45+e969HUxa4Y8eBESm85zY85uwHxwS8t1WI/u0X5LCU84+rbjg1DSak9xjs5IL
        YA5+1D2F9V9cSz19Aw==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [RFC PATCH 2/3] arm64: dts: renesas: r8a77951: Add CR7 realtime processor
Date:   Wed, 27 Oct 2021 09:30:19 +0200
Message-Id: <20211027073020.17055-3-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027073020.17055-1-julien.massot@iot.bzh>
References: <20211027073020.17055-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

r8a77951 as some other members of rcar gen3 soc series
has a Cortex R7 processor.
This processor shares the same mapped devices and memory mapping.

Choose 0x40040000 area to store the Cortex-R7 firmware.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
index 06d4e948eb0f..26ab7e3cca18 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
@@ -34,6 +34,17 @@ memory@700000000 {
 		device_type = "memory";
 		reg = <0x7 0x00000000 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cr7_ram: cr7_ram@40040000 {
+			no-map;
+			reg = <0x0 0x40040000 0x0 0x1fc0000>;
+		};
+	};
 };
 
 &du {
@@ -48,3 +59,8 @@ &du {
 	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
+
+&cr7_rproc {
+	memory-region = <&cr7_ram>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1768a3e6bb8d..3ee247fc5aec 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -366,6 +366,13 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		cr7_rproc: cr7 {
+			compatible = "renesas,rcar-cr7";
+			power-domains = <&sysc R8A7795_PD_CR7>;
+			resets = <&cpg 222>;
+			status = "disabled";
+		};
+
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
-- 
2.31.1



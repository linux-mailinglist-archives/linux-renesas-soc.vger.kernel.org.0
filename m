Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69AC30FA4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238131AbhBDRxO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:53:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238156AbhBDRwd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:52:33 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E2DC06178C
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id R5qf240084C55Sk015qf69; Thu, 04 Feb 2021 18:50:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im6-003Fgj-PY; Thu, 04 Feb 2021 18:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7f5G-006vw8-2F; Thu, 04 Feb 2021 14:54:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 5/6] ARM: dts: r8a73a4: Add APMU nodes
Date:   Thu,  4 Feb 2021 14:54:08 +0100
Message-Id: <20210204135409.1652604-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT nodes for the Advanced Power Management Units (APMU), and use the
enable-method to point out that the APMU should be used for SMP support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 9abf5e9bb240f0a2..f9c08c1bdcd687ba 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -19,6 +19,7 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -130,6 +131,18 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	apmu@e6151000 {
+		compatible = "renesas,r8a73a4-apmu", "renesas,apmu";
+		reg = <0 0xe6151000 0 0x188>;
+		cpus = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	apmu@e6152000 {
+		compatible = "renesas,r8a73a4-apmu", "renesas,apmu";
+		reg = <0 0xe6152000 0 0x188>;
+		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
 	dbsc1: memory-controller@e6790000 {
 		compatible = "renesas,dbsc-r8a73a4";
 		reg = <0 0xe6790000 0 0x10000>;
-- 
2.25.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DA230FA50
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbhBDRx5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:53:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238602AbhBDRxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:53:07 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A30BC0617A9
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id R5qf2400D4C55Sk015qf6A; Thu, 04 Feb 2021 18:50:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im6-003Fgj-QX; Thu, 04 Feb 2021 18:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7f5G-006vw3-1C; Thu, 04 Feb 2021 14:54:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/6] ARM: dts: r8a73a4: Add Media RAM for SMP jump stub
Date:   Thu,  4 Feb 2021 14:54:07 +0100
Message-Id: <20210204135409.1652604-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Mobile APE6 has 2 MiB of Media RAM.
Reserve 256 bytes for the jump stub for CPU core bringup.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index d498f848d34ab6ed..9abf5e9bb240f0a2 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -479,6 +479,19 @@ scifb3: serial@e6cf0000 {
 		status = "disabled";
 	};
 
+	meram: sram@e8080000 {
+		compatible = "mmio-sram";
+		reg = <0 0xe8080000 0 0x200000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0xe8080000 0x200000>;
+
+		smp-sram@0 {
+			compatible = "renesas,smp-sram";
+			reg = <0 0x100>;
+		};
+	};
+
 	sdhi0: mmc@ee100000 {
 		compatible = "renesas,sdhi-r8a73a4";
 		reg = <0 0xee100000 0 0x100>;
-- 
2.25.1


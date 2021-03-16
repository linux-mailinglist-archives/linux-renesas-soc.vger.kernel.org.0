Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D47F33D800
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 16:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhCPPrb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 11:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237433AbhCPPrK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:47:10 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74160C06175F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:47:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by albert.telenet-ops.be with bizsmtp
        id h3n72400B0UTkXy063n7qY; Tue, 16 Mar 2021 16:47:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuU-0089up-QO; Tue, 16 Mar 2021 16:47:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuU-00AD5J-75; Tue, 16 Mar 2021 16:47:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hoang Vo <hoang.vo.eb@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] arm64: dts: renesas: falcon: Move console config to CPU board DTS
Date:   Tue, 16 Mar 2021 16:47:03 +0100
Message-Id: <20210316154705.2433528-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316154705.2433528-1-geert+renesas@glider.be>
References: <20210316154705.2433528-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The serial console is located on the Falcon CPU board.  Hence move
serial console configuration from the main Falcon DTS file to the DTS
file that describes the CPU board.

Fixes: 63070d7c2270e8de ("arm64: dts: renesas: Add Renesas Falcon boards support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts      | 5 -----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 286a5d5b9b08ff88..44dbd34eecb43fb4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -12,6 +12,14 @@ / {
 	model = "Renesas Falcon CPU board";
 	compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
 
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 7bc964c36f331270..d6a9eddb14d9e9cc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -16,11 +16,6 @@ / {
 
 	aliases {
 		ethernet0 = &avb0;
-		serial0 = &scif0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
 	};
 };
 
-- 
2.25.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3443E2B5B7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 10:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgKQJDi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 04:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgKQJDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 04:03:35 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD41C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 01:03:34 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id tM3W2300z4C55Sk06M3Wun; Tue, 17 Nov 2020 10:03:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kewte-003A6P-LJ
        for linux-renesas-soc@vger.kernel.org; Tue, 17 Nov 2020 10:03:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kewte-008vqC-1U
        for linux-renesas-soc@vger.kernel.org; Tue, 17 Nov 2020 10:03:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 3/4] arm64: dts: renesas: r8a779a0: Add dmac1 placeholder node
Date:   Tue, 17 Nov 2020 10:03:28 +0100
Message-Id: <20201117090329.2128904-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117090329.2128904-1-geert+renesas@glider.be>
References: <20201117090329.2128904-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a placeholder node for the first Direct Memory Access Controller for
System (SYS-DMAC) instance, so it can be referred to from other device
nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, we could omit the DMA properties in PATCH 4/4.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index a3b1294c73952b3c..f1533b4946f4a725 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -245,6 +245,12 @@ scif0: serial@e6e60000 {
 			status = "disabled";
 		};
 
+		dmac1: dma-controller@e7350000 {
+			reg = <0 0xe7350000 0 0x1000>;
+			#dma-cells = <1>;
+			/* placeholder */
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.25.1


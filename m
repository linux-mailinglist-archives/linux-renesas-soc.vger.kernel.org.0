Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E613727E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 11:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhEDJPm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 05:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhEDJPk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 05:15:40 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35FEC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 02:14:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by michel.telenet-ops.be with bizsmtp
        id 0ZEj250033aEpPb06ZEjHx; Tue, 04 May 2021 11:14:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr8c-002jCO-NX; Tue, 04 May 2021 11:14:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr8b-00H7Ea-S5; Tue, 04 May 2021 11:14:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: eagle: Add x1 clock
Date:   Tue,  4 May 2021 11:14:34 +0200
Message-Id: <75a66bae21937da1c69e8024ce61b35aad4ac9b8.1620119570.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Valentine Barshak <valentine.barshak@cogentembedded.com>

This adds X1 clock which supplies a frequency of 148.5 MHz.
This clock is connected to the external dot clock input signal.

Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
[geert: Verified schematics]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 874a7fc2730b00db..5c84681703edad2e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -73,6 +73,12 @@ memory@48000000 {
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
+
+	x1_clk: x1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
 };
 
 &avb {
@@ -104,6 +110,8 @@ channel0 {
 };
 
 &du {
+	clocks = <&cpg CPG_MOD 724>, <&x1_clk>;
+	clock-names = "du.0", "dclkin.0";
 	status = "okay";
 };
 
-- 
2.25.1


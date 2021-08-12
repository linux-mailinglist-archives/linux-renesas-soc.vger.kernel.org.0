Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032733EA38A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236856AbhHLLZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236863AbhHLLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDE7C0617BF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQR250081gJxCh01bQR4x; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002Fim-PT; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-00746N-Eg; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 29/29] [RFC] arm64: dts: renesas: r8a779m5: Add Cortex-A57 2 GHz opp
Date:   Thu, 12 Aug 2021 13:24:19 +0200
Message-Id: <bbfb67c95e0c2bc3312bf46b7a28b6baa452786a.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a preliminary operating point for running the Cortex-A57 CPU cores
on R-Car M3Ne-2G at 2 GHz.

The opp-microvolt value depends on a future update of the Electrical
Characteristics for R-Car M3Ne-2G.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Change 2 GHz opp from 1020000 µV to 960000 µV, as per informal
    communication.
---
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779m5.dtsi b/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
index f0ef765f6cf87319..5ab9bbdd419be3cd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
@@ -10,3 +10,12 @@
 / {
 	compatible = "renesas,r8a779m5", "renesas,r8a77965";
 };
+
+&cluster0_opp {
+	opp-2000000000 {
+		opp-hz = /bits/ 64 <2000000000>;
+		opp-microvolt = <960000>;	// FIXME TBC
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
-- 
2.25.1


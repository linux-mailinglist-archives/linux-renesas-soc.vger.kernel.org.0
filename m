Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5CC3A2860
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhFJJjj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhFJJjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:37 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DDBC0617AF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by albert.telenet-ops.be with bizsmtp
        id FMdf2500P0wnyou06MdfEp; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH86-00FDXC-RT; Thu, 10 Jun 2021 11:37:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTmj-VC; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 13/14] arm64: dts: renesas: r8a779m1: Add Cortex-A57 2 GHz opp
Date:   Thu, 10 Jun 2021 11:37:26 +0200
Message-Id: <b190603bffa0bcc4e66a441fba04132635de3f0c.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623315732.git.geert+renesas@glider.be>
References: <cover.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a preliminary operating point for running the Cortex-A57 CPU cores
on R-Car H3e-2G at 2 GHz.

The opp-microvolt value depends on a future update of the Electrical
Characteristics for R-Car H3e-2G.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
index 0e9b04469b83c661..01b4e787e5749219 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
@@ -10,3 +10,12 @@
 / {
 	compatible = "renesas,r8a779m1", "renesas,r8a7795";
 };
+
+&cluster0_opp {
+	opp-2000000000 {
+		opp-hz = /bits/ 64 <2000000000>;
+		opp-microvolt = <1020000>;	// FIXME TBC
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
-- 
2.25.1


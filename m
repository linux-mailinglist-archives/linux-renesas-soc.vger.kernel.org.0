Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E812DE84F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 18:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbgLRRiV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 12:38:21 -0500
Received: from www.zeus03.de ([194.117.254.33]:35678 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728169AbgLRRiU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=9SXPjY9X7DmDyR
        YTpXoA8iUdYTm1ebGdtMfXB8+j11Y=; b=I+bWPLWCBEw+Kogh4Fm6ruAT/AWd38
        n1WlvKyNiCRKH+GTC+seb1Te56Sq+XdUS9DC3MGz3lvLo7EeMN47q4jRB+h7EYj6
        xt/NxOiqu9UlSyKhbfNgHzsEnvEloevHTIgguxlQejnL5yXZiQ23GXETD3V6L/tj
        mUtC35K82qcSY=
Received: (qmail 3906776 invoked from network); 18 Dec 2020 18:37:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2020 18:37:37 +0100
X-UD-Smtp-Session: l3s3148p1@HtN4kMC2apggAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: renesas: r8a779a0: Add RWDT node
Date:   Fri, 18 Dec 2020 18:37:28 +0100
Message-Id: <20201218173731.12839-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoang Vo <hoang.vo.eb@renesas.com>

Add a device node for the Watchdog Timer (WDT) controller on the
R8A779A0 SoC.

Signed-off-by: Hoang Vo <hoang.vo.eb@renesas.com>
[wsa: rebased to mainline]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 6cf77ce9aa93..1ca500f55096 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -85,6 +85,16 @@ rst: reset-controller@e6160000 {
 			reg = <0 0xe6160000 0 0x4000>;
 		};
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a779a0-wdt",
+				     "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			clocks = <&cpg CPG_MOD 907>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 907>;
+			status = "disabled";
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a779a0-sysc";
 			reg = <0 0xe6180000 0 0x4000>;
-- 
2.29.2


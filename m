Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583E9423A1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 10:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237757AbhJFJAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 05:00:37 -0400
Received: from www.zeus03.de ([194.117.254.33]:47600 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237758AbhJFJAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 05:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=6ycLKvhVw8JDOF
        1NXNMEjqIbEFwt7wLxiumpJ0o+hXM=; b=mewoaoEBg5f0ICdj2E8mZ3ZAPL/OLU
        Lz8+DH6HcKnEMKGl4oJ2dX9TtIGN11b6EkCF2fK9GOu7Q3oAy1N4BPCTltub7icb
        IVv3DVxzG46pY1JpMhD06NFMBHSB/J0jRj3NktE6Tw+AE/42IfTaomE37lh3Aluv
        G/Y2jWbT45WUk=
Received: (qmail 4135882 invoked from network); 6 Oct 2021 10:58:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2021 10:58:44 +0200
X-UD-Smtp-Session: l3s3148p1@5ZR1WqvNirggAwDPXwnIAEWfFJ7Kfqru
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: r8a779a0: Add RPC node
Date:   Wed,  6 Oct 2021 10:58:35 +0200
Message-Id: <20211006085836.42155-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006085836.42155-1-wsa+renesas@sang-engineering.com>
References: <20211006085836.42155-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Duc Nguyen <duc.nguyen.ub@renesas.com>

Add device node for RPC on R8A779A0 SoC.

Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
[wsa: rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 631d520cebee..2b3abdc80de8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1093,6 +1093,23 @@ mmc0: mmc@ee140000 {
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a779a0-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x04000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 629>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 629>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.30.2


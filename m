Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88D83FD64F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 11:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhIAJSd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 05:18:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:37104 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232048AbhIAJSd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 05:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=nXO0tnQDNfEBfa
        vTmrLeIO6iQa1Imj+fIiMiLBju45Y=; b=qrGJ5AMXDNiqe8a6fTzdWNlV3SQVxG
        39wea3pN5IFUz/Q1RLEuAvVbKAIGK8B6CfDMRoHxdPTwo8wEIAqgUO607dv4HC4g
        d8xWSZvKOKbp/O9Vm+y40rhM1XAMcRZhugdyRNBE4ajSyInn7DaOj03ZTLJ6DOFX
        5adI/V3TkPWiQ=
Received: (qmail 2978730 invoked from network); 1 Sep 2021 11:17:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2021 11:17:35 +0200
X-UD-Smtp-Session: l3s3148p1@mfdnievKVIMgARa4Rc4DAUbRC24QnL0V
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add TPU node
Date:   Wed,  1 Sep 2021 11:17:24 +0200
Message-Id: <20210901091725.35610-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
References: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Duc Nguyen <duc.nguyen.ub@renesas.com>

This patch adds TPU node for R-Car V3U (r8a779a0) SoC.

Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 78ca75f619f6..3b022abdf212 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1023,6 +1023,17 @@ msiof5: spi@e6c28000 {
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a779a0", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 718>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 718>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		dmac1: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779a0";
 			reg = <0 0xe7350000 0 0x1000>,
-- 
2.30.2


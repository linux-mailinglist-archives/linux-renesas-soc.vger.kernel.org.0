Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4095F3F953E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Aug 2021 09:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhH0HjS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Aug 2021 03:39:18 -0400
Received: from www.zeus03.de ([194.117.254.33]:58838 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244462AbhH0HjR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Aug 2021 03:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=37244KQwE6P++lJ7WVFU3U1LOZ7
        EA3iK4JvCO9J/+fQ=; b=abUzePqW1k8Py2u+syks06CfSaBgQf4JmKLyDCqPMA2
        fegCJoHR9Et05S5r/0eF77cxV4Xnvfo52doG1jWVWPVMZ3d02+neLFR/a9IkfhSk
        ceCCGHZHaydU6wL0puYBq3ZXyGZmqRfVeuylARMWGindlzmVsMJjJj3S6UlzJbjY
        =
Received: (qmail 1255271 invoked from network); 27 Aug 2021 09:38:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Aug 2021 09:38:28 +0200
X-UD-Smtp-Session: l3s3148p1@BrOKkYXKtI8gAwDPXwZ9AAGN8E2OINbg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: r8a77961: Add TPU device node
Date:   Fri, 27 Aug 2021 09:38:19 +0200
Message-Id: <20210827073819.29992-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the missing TPU node for the R-Car M3-W+ SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

When I wanted to enable TPU on M3-N for some testing, building M3-W+
DTBs failed due to this missing.

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 91b501e0121e..22da1c0436be 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1367,6 +1367,17 @@ scif5: serial@e6f30000 {
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a77961", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a77961",
 				     "renesas,rcar-gen3-msiof";
-- 
2.30.2


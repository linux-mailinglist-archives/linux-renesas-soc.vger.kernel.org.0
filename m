Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267803FD650
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 11:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243437AbhIAJSe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 05:18:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:37118 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243428AbhIAJSd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 05:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=tz22aSvl3Y+gmO
        +Ta2RaeF1iNeG4aEnPWG95FTFcIug=; b=iqO6IJhitZLa0+AS6V7j2Vfsgvgeln
        8hpcbn2bKoXwGGhJkAMv0+NPtkm5B932bMNICeOgaQu/YlksGrxy2BixiLU4OfLv
        enSut2DBhWILY38vUukJTHZQKcU5fV6S/8XqEox7gVATe66SHSdJt25KRt1qk5Ax
        Bklizt9/lMbnw=
Received: (qmail 2978758 invoked from network); 1 Sep 2021 11:17:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2021 11:17:35 +0200
X-UD-Smtp-Session: l3s3148p1@nzBvievKVoMgARa4Rc4DAUbRC24QnL0V
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [RFC PATCH 3/3] arm64: dts: r8a779a0-falcon-cpu: Add TPU support
Date:   Wed,  1 Sep 2021 11:17:25 +0200
Message-Id: <20210901091725.35610-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
References: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Duc Nguyen <duc.nguyen.ub@renesas.com>

This patch enables TPU channel 1 for the Falcon board.

Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Do we want this activated upstream? I think it is nice to have.

 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index a0a1a1da0d87..cf777c2799e8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -175,6 +175,11 @@ scif_clk_pins: scif_clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
+
+	tpu_pin: tpu {
+		groups = "tpu_to1";
+		function = "tpu";
+	};
 };
 
 &rwdt {
@@ -193,3 +198,10 @@ &scif0 {
 &scif_clk {
 	clock-frequency = <24000000>;
 };
+
+&tpu {
+	pinctrl-0 = <&tpu_pin>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.30.2


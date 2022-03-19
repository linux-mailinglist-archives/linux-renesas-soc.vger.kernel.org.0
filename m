Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A721D4E18D2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Mar 2022 23:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244289AbiCSWeq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Mar 2022 18:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244284AbiCSWen (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Mar 2022 18:34:43 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B834611A23
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Mar 2022 15:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=JBn/Isqmctzmo1
        vyZ+IX3VtD5iN5G8F49nlN2oib3qU=; b=SdI9Z/CQsOg/FS3Wg0s9/HQa9df80A
        UI5wfhXzDAG47PD3tDfEBZSbBjJ2rUfkn0Is2u+QSvugGDNxelD78svLU6jesyat
        oo5nilif3QsswbErJID3KWLvM6KKnk2trvB7Y9S9Tdgd0r+MStSSEx4rEla+a2AK
        Kg6XiTH3rSkuA=
Received: (qmail 252436 invoked from network); 19 Mar 2022 23:33:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2022 23:33:18 +0100
X-UD-Smtp-Session: l3s3148p1@/LyF2Zna1twgAQnoAFEUAKkXZRZ8X9Wv
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77961: Add i2c aliases
Date:   Sat, 19 Mar 2022 23:33:06 +0100
Message-Id: <20220319223306.60782-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319223306.60782-1-wsa+renesas@sang-engineering.com>
References: <20220319223306.60782-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: LUU HOAI <hoai.luu.ub@renesas.com>

Keep aligned with other Gen3 SoCs and sort the I2C busses.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 87bb903954ed..91ccd3dfd526 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -16,6 +16,17 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c_dvfs;
+	};
+
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
-- 
2.30.2


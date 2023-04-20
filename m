Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7CB36E8DE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Apr 2023 11:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbjDTJWM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Apr 2023 05:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234254AbjDTJWH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2023 05:22:07 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4A14234
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Apr 2023 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=k1; bh=R
        uBRtpql/t+f2+85+PW0362+bZB3WpTlh8rkpcCbnh8=; b=kIbJ2OybhE9nOi2jC
        Wjk2g9b5nyJh/6qoK6mpAetLOnsUp75a3m9GcwunEyFpQ4IKifpkn+jn+EU0FokQ
        2wc8zcfg3p8NOydiDqoiMulpDwbmFlvWrN31ViYSFsdNyR+3SpXr1xD9YaH+PNtT
        5LqafzCpkkgc+jDzpfR+Y0oRok=
Received: (qmail 4000172 invoked from network); 20 Apr 2023 11:21:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Apr 2023 11:21:47 +0200
X-UD-Smtp-Session: l3s3148p1@khvgEcH54M0ujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 3/3] drivers/thermal/rcar_gen3_thermal: add reading fuses for Gen4
Date:   Thu, 20 Apr 2023 11:21:27 +0200
Message-Id: <20230420092128.6073-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230420092128.6073-1-wsa+renesas@sang-engineering.com>
References: <20230420092128.6073-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The registers are differently named and at different offsets, but their
functionality is the same as for Gen3.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 44 +++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 39b382ee08c8..e01e27903e44 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -35,6 +35,12 @@
 #define REG_GEN3_PTAT2		0x60
 #define REG_GEN3_PTAT3		0x64
 #define REG_GEN3_THSCP		0x68
+#define REG_GEN4_THSFMON00	0x180
+#define REG_GEN4_THSFMON01	0x184
+#define REG_GEN4_THSFMON02	0x188
+#define REG_GEN4_THSFMON15	0x1BC
+#define REG_GEN4_THSFMON16	0x1C0
+#define REG_GEN4_THSFMON17	0x1C4
 
 /* IRQ{STR,MSK,EN} bits */
 #define IRQ_TEMP1		BIT(0)
@@ -55,6 +61,7 @@
 
 #define MCELSIUS(temp)	((temp) * 1000)
 #define GEN3_FUSE_MASK	0xFFF
+#define GEN4_FUSE_MASK	0xFFF
 
 #define TSC_MAX_NUM	5
 
@@ -272,6 +279,34 @@ static void rcar_gen3_thermal_read_fuses_gen3(struct rcar_gen3_thermal_priv *pri
 	}
 }
 
+static void rcar_gen3_thermal_read_fuses_gen4(struct rcar_gen3_thermal_priv *priv)
+{
+	unsigned int i;
+
+	/*
+	 * Set the pseudo calibration points with fused values.
+	 * PTAT is shared between all TSCs but only fused for the first
+	 * TSC while THCODEs are fused for each TSC.
+	 */
+	priv->ptat[0] = rcar_gen3_thermal_read(priv->tscs[0], REG_GEN4_THSFMON01) &
+		GEN4_FUSE_MASK;
+	priv->ptat[1] = rcar_gen3_thermal_read(priv->tscs[0], REG_GEN4_THSFMON02) &
+		GEN4_FUSE_MASK;
+	priv->ptat[2] = rcar_gen3_thermal_read(priv->tscs[0], REG_GEN4_THSFMON00) &
+		GEN4_FUSE_MASK;
+
+	for (i = 0; i < priv->num_tscs; i++) {
+		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+
+		tsc->thcode[0] = rcar_gen3_thermal_read(tsc, REG_GEN4_THSFMON16) &
+			GEN4_FUSE_MASK;
+		tsc->thcode[1] = rcar_gen3_thermal_read(tsc, REG_GEN4_THSFMON17) &
+			GEN4_FUSE_MASK;
+		tsc->thcode[2] = rcar_gen3_thermal_read(tsc, REG_GEN4_THSFMON15) &
+			GEN4_FUSE_MASK;
+	}
+}
+
 static bool rcar_gen3_thermal_read_fuses(struct rcar_gen3_thermal_priv *priv)
 {
 	unsigned int i;
@@ -343,6 +378,11 @@ static const struct rcar_thermal_info rcar_gen3_thermal_info = {
 	.read_fuses = rcar_gen3_thermal_read_fuses_gen3,
 };
 
+static const struct rcar_thermal_info rcar_gen4_thermal_info = {
+	.ths_tj_1 = 126,
+	.read_fuses = rcar_gen3_thermal_read_fuses_gen4,
+};
+
 static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
 	{
 		.compatible = "renesas,r8a774a1-thermal",
@@ -382,11 +422,11 @@ static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
 	},
 	{
 		.compatible = "renesas,r8a779f0-thermal",
-		.data = &rcar_gen3_thermal_info,
+		.data = &rcar_gen4_thermal_info,
 	},
 	{
 		.compatible = "renesas,r8a779g0-thermal",
-		.data = &rcar_gen3_thermal_info,
+		.data = &rcar_gen4_thermal_info,
 	},
 	{},
 };
-- 
2.30.2


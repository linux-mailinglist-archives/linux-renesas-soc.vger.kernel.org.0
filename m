Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4B755E0E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jun 2022 15:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345620AbiF1MXo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Jun 2022 08:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344426AbiF1MXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 08:23:42 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3D71208B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2022 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=J9ejt2rP4pl4lEYcgk5dd94+Tph
        d3sBI6yFRvsuSWV8=; b=OVXWVnpLIxgmS0J8kr9LHpgQMyL4aXG8o06Cu90Iag6
        Ma8YXoyjRiUxU4pWoxAEuoqOtGD6++wYkKFmufHGVAConB3Yilkvk+dffSV2AbUH
        jFSc2RUc9XObNLAkNh6rTZMPx+81gy1OaCifgrIxhmc+zszJNAtI19rz+EwbSHfQ
        =
Received: (qmail 2860617 invoked from network); 28 Jun 2022 14:23:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2022 14:23:37 +0200
X-UD-Smtp-Session: l3s3148p1@q5ofG4HirgVZD+zG
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] arm64: dts: renesas: ebisu: add port node to ak4613
Date:   Tue, 28 Jun 2022 14:23:30 +0200
Message-Id: <20220628122330.28323-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
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

My Ebisu complains about the missing node when booting:

 OF: graph: no port node found in /soc/i2c@e66d0000/codec@10
 ------------[ cut here ]------------
 WARNING: CPU: 1 PID: 37 at sound/soc/codecs/ak4613.c:873 ak4613_i2c_probe+0x274/0x2a0
 CPU: 1 PID: 37 Comm: kworker/u4:2 Not tainted 5.19.0-rc3-arm64-renesas-00003-g57c83727d651 #50
 Hardware name: Renesas Ebisu board based on r8a77990 (DT)

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Hi Morimoto-san, I have never done any sound stuff with R-Car. Is this
the correct approach which I copied over from Salvator boards?

All the best,

   Wolfram

 arch/arm64/boot/dts/renesas/ebisu.dtsi | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 8fc03491a11c..cec23a3287c0 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -478,6 +478,12 @@ ak4613: codec@10 {
 		asahi-kasei,out4-single-end;
 		asahi-kasei,out5-single-end;
 		asahi-kasei,out6-single-end;
+
+		port {
+			ak4613_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint0>;
+			};
+		};
 	};
 
 	cs2000: clk-multiplier@4f {
@@ -708,13 +714,23 @@ &rcar_sound {
 		 <&audio_clk_a>, <&cs2000>, <&audio_clk_c>,
 		 <&cpg CPG_CORE R8A77990_CLK_ZA2>;
 
-	rcar_sound,dai {
-		dai0 {
-			playback = <&ssi0>, <&src0>, <&dvc0>;
-			capture = <&ssi1>, <&src1>, <&dvc1>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		rsnd_port0: port@0 {
+			reg = <0>;
+			rsnd_endpoint0: endpoint {
+				remote-endpoint = <&ak4613_endpoint>;
+
+				dai-format = "left_j";
+				bitclock-master = <&rsnd_endpoint0>;
+				frame-master = <&rsnd_endpoint0>;
+
+				playback = <&ssi0>, <&src0>, <&dvc0>;
+				capture = <&ssi1>, <&src1>, <&dvc1>;
+			};
 		};
 	};
-
 };
 
 &rpc {
-- 
2.35.1


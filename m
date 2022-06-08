Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D86543AEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 19:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbiFHR6L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 13:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbiFHR6K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 13:58:10 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F2D1A15D7
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 10:58:09 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id h23so31891344ejj.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jun 2022 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbJTJTqHr0dGBNMfH/ZjjS3sOVzFeL1a0tr4KzjWyV0=;
        b=psWG4rm33xp9iIifihbZVEExr2EAmbM20xjY0pAR8WwtNhMxagYXvAi9pWVUDwNrI8
         vGOod8PCvh34Ljn+wbbX6lmUAWnbtN9BuzwSMDFnAePdCju76kTSmzs6nIlbX4Pr/aXa
         /YMjaOUkir+eraRyJZxI1A3TonlLGC06QzQDFp4DFrtxtTsqXeUgS5GmKLlDlYTKwGC/
         fSydHDXi/+owYAYRdakplPTfjC0gFhqS57aC2CmHU61WIagpEqdmXghJyYNX47TNEeV+
         dGh9f0hL7fk2ao6QAci9BZDHv6DrWjCFAjtUyWFXnjfBPwtJ4qweVEwgWV6RT4Qu48dS
         rITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbJTJTqHr0dGBNMfH/ZjjS3sOVzFeL1a0tr4KzjWyV0=;
        b=t8npXNLajZHoZbp1Tw6+sQ8Pf7bSG5jszBSVB5GOuoGz++VARh1PRMfeGFzPe1jC85
         9G/WOsMvUcBEdHkLxInVPoSyE01El2O0OMIV8jg0h81eG+pr2yAZwgGVF/Y9kJb5WX/x
         0qiqL8FI0w4zJuZRlHMogdqDUqTFtKU4cMJyB2QCWUBEbKmMibMlZ+EpO0Qh/WHXDAX5
         Oh7Ep5AupIgyNEyRpOUGHfQ1y4xQKQjPXZNm1TDhZTuSUHzPtlPqbh7+6t1jPelOT0Zv
         lcvC41KAEBlmvr3b8yVlGtp75JV1GRCcC2dHa8hFvou27SfG/Wo4RrU1JdnSx3WIb4dG
         2VFA==
X-Gm-Message-State: AOAM531LKmSP0zW7sqBsSKXtgVG1gUQIGIeIcAwhmC85wXkQP1TqGAd/
        oufv5rXx6I+74H0g7R6ji7fwwQ==
X-Google-Smtp-Source: ABdhPJyFUDSXM6s+ZSQ95mVNYOzqXV1dcg7jtz9JufLoE4uvIXrWSPrIQqxE9VuZ0sm39Ahgcyr9lA==
X-Received: by 2002:a17:907:a420:b0:6ff:1541:8d34 with SMTP id sg32-20020a170907a42000b006ff15418d34mr8389103ejc.447.1654711087678;
        Wed, 08 Jun 2022 10:58:07 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id j25-20020a50ed19000000b0042bcf1e0060sm12417111eds.65.2022.06.08.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:58:07 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: Add missing space after remote-endpoint
Date:   Wed,  8 Jun 2022 19:57:28 +0200
Message-Id: <20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the missing space after remote-endpoint in r8a774c0.dtsi and
r8a77990.dtsi before the typo spreads to other files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index b6aeb22e88364587..90588bbff7e0b8e8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1281,7 +1281,7 @@ port@1 {
 
 					vin4csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin4>;
+						remote-endpoint = <&csi40vin4>;
 					};
 				};
 			};
@@ -1309,7 +1309,7 @@ port@1 {
 
 					vin5csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin5>;
+						remote-endpoint = <&csi40vin5>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index d3302120263762f1..4c7c7feed7026778 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1324,7 +1324,7 @@ port@1 {
 
 					vin4csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin4>;
+						remote-endpoint = <&csi40vin4>;
 					};
 				};
 			};
@@ -1352,7 +1352,7 @@ port@1 {
 
 					vin5csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin5>;
+						remote-endpoint = <&csi40vin5>;
 					};
 				};
 			};
-- 
2.36.0


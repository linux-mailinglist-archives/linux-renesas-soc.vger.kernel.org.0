Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3692D7D252B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Oct 2023 20:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjJVSTc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 22 Oct 2023 14:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbjJVSTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Oct 2023 14:19:31 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D8E114
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Oct 2023 11:19:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso3845892a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Oct 2023 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697998768; x=1698603568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdR8staS9iz6QVoXJGhNT1d2+Q/SLlVUHj79j/Bzn60=;
        b=cRp8bnv3v+2grqbUobr68WN/ZPdaSwCdkbic5tQV6wf7qD/mVMQTX8tQMOBivFPZO8
         Jf0+qlrSx3McEJfSD2+FX9F88GmIWLZto/QN39iOkItSXj66R1wBNjUKpAKux3Ay9ucR
         Gs4KSQMt54tPhN3stx3hRPgnXSelpUP5MtQX34Ai/7E+ZjM5ZZR+wIGXgY0S8VjF0VZb
         kVFgiNG75FxzfMpwiq94Y3vvOwSz94cay9m87zymJXKgdRwOqgAcSDqjD21hAF19ypEq
         7LRvxgrXK1m+ff2ItdcxPH6vAk+pjuO2jhGAg6rV86ORX7nMJG9ldbbjCdxeLyq5CbmG
         fFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697998768; x=1698603568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdR8staS9iz6QVoXJGhNT1d2+Q/SLlVUHj79j/Bzn60=;
        b=c8Qsj7P3wHd7h407kncRiG6si2kHm1wuDEqNPIjqslmql5ylr31XBvF+0Y8/eqy219
         JXoBqjQXopGuTZsPhRFmnVfr0vJfK2E8y5u/w3Pnt3Tm1UwI8H5AvHXN0o9C9Dujk+cc
         yUVtC/Et3kns7kxiSVJmB23c/XcVMDPE+cyKFOZI96QiivWT4arTccZL97JxQnXeiumP
         U34PfStx9PmV4oX09Eh2DcDDXGwTiy9FIk8BAfa+pFrpYWhUO/3qA0Kb35PQk2G+CbGd
         j1S1E6lgn6t9FVMnLJ+NwY1IhbHeDL5V61iqHe6EeBIutkWzjuuW1b0fENDBp2s43E+l
         fY8g==
X-Gm-Message-State: AOJu0Ywl0YbJqyXpkUhQTBW1hs+qlb0nB0/JhxpOOz8L49/ov4/uIA3E
        CaR3ZQL+myQIg6oOroOKUHATyw==
X-Google-Smtp-Source: AGHT+IEb/THfFf6qQBOOrD8oXn+FSxi2CSAh0u7inxFOWu1rnKIr8t0gem15qvmPcd/xb89B3Ypkfw==
X-Received: by 2002:a05:6402:5186:b0:53f:9045:8cbe with SMTP id q6-20020a056402518600b0053f90458cbemr5444020edd.26.1697998768580;
        Sun, 22 Oct 2023 11:19:28 -0700 (PDT)
Received: from sleipner.berto.se (p4fca2773.dip0.t-ipconnect.de. [79.202.39.115])
        by smtp.googlemail.com with ESMTPSA id h12-20020aa7de0c000000b0053e43492ef1sm5035159edv.65.2023.10.22.11.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 11:19:28 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: renesas: draak: Move HDMI bus properties to correct node
Date:   Sun, 22 Oct 2023 20:19:10 +0200
Message-ID: <20231022181910.898040-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The bus properties for HDMI capture are defined on the incorrect node
for the VIN driver to be able to consume them. They are described on the
HDMI video source but they should be described on the VIN capture node,
move them.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/draak.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 08b3458a5025..953d1bb98f9d 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -424,9 +424,6 @@ port@2 {
 				 * VIN4 here.
 				 */
 				adv7612_out: endpoint {
-					pclk-sample = <0>;
-					hsync-active = <0>;
-					vsync-active = <0>;
 					remote-endpoint = <&vin4_in>;
 				};
 			};
@@ -735,6 +732,9 @@ &vin4 {
 	ports {
 		port {
 			vin4_in: endpoint {
+				pclk-sample = <0>;
+				hsync-active = <0>;
+				vsync-active = <0>;
 				remote-endpoint = <&adv7612_out>;
 			};
 		};
-- 
2.42.0


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB3D52C15A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 19:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241118AbiERR24 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 13:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241081AbiERR2x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 13:28:53 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3411519CEC4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 10:28:51 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id d3so1972150ilr.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 10:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AOx1LypXvhJE14nWPZ5PxL9FhVAWWtg9pDE4J4YMhoQ=;
        b=K0M9wXlEDBj1y6Wt13RE7Zj8BL4HiOajXSxtTGoZiTdjQiNeq4CluQVhZImvkSQbJ1
         i0uzSmq/gTkqqRm3em78DU8AYTuiF4zTPdIiiVw2gEFS/sy0xaV73lj9YD8wlNPZ/imK
         HzECX5Kc62AKFg57kdsUOv6Wduc2vFrCCMpNMmjoZ5MdFv/aH42veIxCRgeu35GtHygw
         gKsSsUoq/NTYe2onrvoeJ7tLskhs4CuFThgAwnWqao7Z/g5apgXNmL1GksJCFD6u9jH4
         Mgivs683kzl3+dllBbHBhIYwB/tos96yvxTsq+ysCFM21YX4fAvnbNzqg7OSYCy4ibs/
         CZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AOx1LypXvhJE14nWPZ5PxL9FhVAWWtg9pDE4J4YMhoQ=;
        b=By7nlIhFTU2JIYd4ErxH0J3Pwd18h+M+cBGV6B4zvIVWWCIsohAZkACZjz734ojyul
         JEks/5aeGLgbV2VjLvTKRJpGc/vL3WV3kxdhs6P6NpHQVTYe2XJoyzV2ZmQ9icYhdSVu
         o2po1sjWMDw+KKhe2tCAqQpfcm6da2nEry5ri9TiVwTJJfEafcmltfVDPcK1OziHpBSs
         lvZHDsGifr3BN8fsmg5DCtUFXO6eocRD9Tr4e3ZXBqqQNxG3133Z7Ol7gI33ORTKX9yx
         Kd8uJ29W/FymaFnTMottdll8CTbX+zgEhr6S3/jI7329oLqskSWYyq3NBvQSC+daalnj
         cT2A==
X-Gm-Message-State: AOAM532diVc1Xu/q2U/9yQGLmPZFJdgsIHRwOJ/p3p5SNu5/tSVm0BMn
        aB0YGxZZOyHBKCe/36Jvl+YgxZYKggTFeA==
X-Google-Smtp-Source: ABdhPJwUNHQWAYmQo+uc5LNqpMPNDRgZ/USR+VN+WwJn/IJjd0Pn21Yg8dlJhCl4V1z/EpCtb67DUw==
X-Received: by 2002:a05:6e02:1485:b0:2cd:fa3d:72b9 with SMTP id n5-20020a056e02148500b002cdfa3d72b9mr423352ilk.247.1652894930650;
        Wed, 18 May 2022 10:28:50 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a05663812cb00b0032ba5cbae2esm12858jas.144.2022.05.18.10.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 10:28:50 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     phil.edworthy@renesas.com,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/3] clk: renesas: r9a06g032: drop some unused fields
Date:   Wed, 18 May 2022 13:27:16 -0400
Message-Id: <20220518172808.1691450-2-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Minor cleanup, remove unused fields from struct r9a06g032_clkdesc.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 0baa6a06ada8..9dbcf9620fa0 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -47,11 +47,9 @@ struct r9a06g032_clkdesc {
 		struct {
 			u16 div, mul;
 		};
-		unsigned int factor;
-		unsigned int frequency;
 		/* for dual gate */
 		struct {
-			uint16_t group : 1, index: 3;
+			uint16_t group : 1;
 			u16 sel, g1, r1, g2, r2;
 		} dual;
 	};
@@ -84,7 +82,7 @@ struct r9a06g032_clkdesc {
 #define D_UGATE(_idx, _n, _src, _g, _gi, _g1, _r1, _g2, _r2) \
 	{ .type = K_DUALGATE, .index = R9A06G032_##_idx, \
 		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.dual = { .group = _g, .index = _gi, \
+		.dual = { .group = _g, \
 			.g1 = _g1, .r1 = _r1, .g2 = _g2, .r2 = _r2 }, }
 
 enum { K_GATE = 0, K_FFC, K_DIV, K_BITSEL, K_DUALGATE };
-- 
2.25.1


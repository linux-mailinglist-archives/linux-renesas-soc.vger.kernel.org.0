Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D58C7B0456
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 14:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjI0Min (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 08:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjI0Min (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 08:38:43 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4ED139
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 05:38:41 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-405361bba99so106327705e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 05:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818320; x=1696423120; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iv3thYPyIQ8GygicfHZHZp04/tIitP9GfIoOieD69Cs=;
        b=PAVvej6nT02WuWdyz3iOG0pIB59mAZ6AwvDrdGeZygRd9tWVf8Tczz8JzLcu9QD7IV
         61tzWha6DXsHM45EB/hefAC5qMTDw/89VvwWGogGv0/uz7pQaS9KMkX73o59jtWodIRV
         9Z/5S5WGPPoZ7i/RvbsoElgDARG3SOVBKixYLCP3r2kdCjI81WP9so6pr264frivB+zL
         1OMubEIDBxUhTrgrWQesc6DXs/LkYikjMn3mQO0ZP0CSqZ2I+B18/QxzK34VajRhY4MK
         S+X1lfeBm8erdqhtsPL8tDiqFRWu02bSt1UvbpfXbxkl3mINr5yRtS1Qo1Pzbl2SBPlN
         w1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818320; x=1696423120;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv3thYPyIQ8GygicfHZHZp04/tIitP9GfIoOieD69Cs=;
        b=DSP0LD91nsPzarakX+jOTVRNP2IdShXBlMLN/TvOhEpNZy5GzW7mWUv/Uxk+i/iSJP
         OAOlkyG9s4veFc79liDV5et04bWKDR3/SOEEG7RkWa3j6H5VD7qSc35KE1Px0VTx2STh
         VXZWRGOpbw2jCbnc1trM22Cu6CdjcbxuJPOroJGvCAUqXJ95RvokqwFXpnosz7rV0TIa
         AREMIyVJ87zIq6+B0YoG4+hZ6TAeAF5WLd7cu6PQmQa5S2nsxFMRlVM1nGlh84VM61HF
         ULkgR1d4AmiI9do2VCR9YyGpXQESvkEyJypbKe76JlkfjsI6BpyDzbwXhSTSRfVdiNB3
         YxCg==
X-Gm-Message-State: AOJu0YxXMEtcP258+QCa25tE+orn2sW4IA5HcTlnAd2VXhb1uCBN0exv
        dLiKgBkPHrtrdKbJViLZvgJfug==
X-Google-Smtp-Source: AGHT+IG+giG0uB2f0slqRXUC2s/Xr805TX2Mc8YoPELbwGNV0aJ3OYBXte08KuYU4ss+e25T8ZVO6g==
X-Received: by 2002:adf:f044:0:b0:321:521f:836f with SMTP id t4-20020adff044000000b00321521f836fmr1709032wro.26.1695818319926;
        Wed, 27 Sep 2023 05:38:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c12-20020adfed8c000000b0032179c4a46dsm16988190wro.100.2023.09.27.05.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:38:39 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:38:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: rcar: fix error code in probe()
Message-ID: <06d4de31-dfe5-432d-acab-600b01422155@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Return an error code if devm_reset_control_get_exclusive() fails.
The current code returns success.

Fixes: 0e864b552b23 ("i2c: rcar: reset controller is mandatory for Gen3+")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/busses/i2c-rcar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 8417d5bc662b..829ac053bbb7 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1153,8 +1153,10 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (IS_ERR(priv->rstc))
+		if (IS_ERR(priv->rstc)) {
+			ret = PTR_ERR(priv->rstc);
 			goto out_pm_put;
+		}
 
 		ret = reset_control_status(priv->rstc);
 		if (ret < 0)
-- 
2.39.2


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEC25AF1C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Sep 2022 19:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239369AbiIFRB5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Sep 2022 13:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238738AbiIFRAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 13:00:32 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2422647F8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Sep 2022 09:47:59 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id b5so16358000wrr.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Sep 2022 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XrpGuF2vxbaEuk6VfKG2/A6XesW21KLMiogPr2+Ux0s=;
        b=qAKEWIoNgOigeWuMnnQ7710KwiB9KxoCjnfatE43czuKubcbr+XgcpbHhJFUSvh++U
         /qpLFovGMOGfukaguXxplYgAo05apsKFPK93u7d/eirN+CgKxgC/XLzxnmLJWkBMg1Qa
         Qc1RBI2GlufsnAm4KdP6V2OMdwMMCXKcCs1wXLGCsAh5lnUjpODHMAo5fOj+H4YRdcHO
         wsFfH6uxYqoECguDKgDktWtBZBZri+wX3NlG/BokoGxrTJN+iCaBUzL79JVCKr8Nu0T7
         11AlYC74ufkcXGW2zUoBNXCec+r20e0D2HFb1ZuFB9Izc07tk5jQ1BpXH63NUpOahk7f
         YNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XrpGuF2vxbaEuk6VfKG2/A6XesW21KLMiogPr2+Ux0s=;
        b=uJCjyW1gOsMLYKqVc/9UJwNFVrADFVom/mov7snJbaMevDXhHsGkW4TT64ozCIGIXR
         EZWG1ezj80Bc47Jf7S7vG2eHQ10Jlmsl446k1ublI4QknGNrb1oATFvKwn8NNNlFaC72
         owx0NLqIgKGNH7oM8LhXx+WC+R1yhrLJ+wbxcA5RuBeGlYwBut1lrfQd/pJiPd6Tj7Mq
         1QjWFF1J5BE73c7DNsZU+p6Uv15tNXJjce5uql7U8cHh/nxFxFimN0d2l9+9O2ZSkyUp
         kKjcdXLGnFgbxDh/I0exhv6PjWRQxA1NcZN+VemSqX9ayuMqg8OSiOu9IATDa82kH4l4
         VSCA==
X-Gm-Message-State: ACgBeo2SZVxX/8vbprC2pCfxLPYcXSrms70XYSHE7UxOcFSqfZTFKqEU
        07IZyhBbjzrZxMN+jtMF5vbu4w==
X-Google-Smtp-Source: AA6agR6KijxpTZE70JOmNG2AY9zoGbp7ZufFdGRs4K90HaoUGdD4f2+XFgZJ5ovNh5VHRTD3uoKyfw==
X-Received: by 2002:adf:f051:0:b0:228:830a:4963 with SMTP id t17-20020adff051000000b00228830a4963mr6305270wro.586.1662482877759;
        Tue, 06 Sep 2022 09:47:57 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b0021f0ff1bc6csm7426600wrc.41.2022.09.06.09.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:47:57 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL
        DRIVERS)
Subject: [PATCH v3 16/30] thermal/drivers/rcar_gen3: Use the generic function to get the number of trips
Date:   Tue,  6 Sep 2022 18:47:06 +0200
Message-Id: <20220906164720.330701-17-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906164720.330701-1-daniel.lezcano@linaro.org>
References: <20220906164720.330701-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The thermal core framework allows to get the number of thermal trips,
use it instead of visiting the thermal core structure internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 4c1c6f89aa2f..4ef927437842 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -529,7 +529,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		if (ret)
 			goto error_unregister;
 
-		ret = of_thermal_get_ntrips(tsc->zone);
+		ret = thermal_zone_get_num_trips(tsc->zone);
 		if (ret < 0)
 			goto error_unregister;
 
-- 
2.34.1


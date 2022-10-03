Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665515F2D9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 11:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiJCJ3y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 05:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiJCJ3K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 05:29:10 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9484DF31
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 02:27:27 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id d12-20020a05600c3acc00b003b4c12e47f3so5480741wms.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XrpGuF2vxbaEuk6VfKG2/A6XesW21KLMiogPr2+Ux0s=;
        b=FwUjYB2T9AIbmzsYSBvKKCrMjm17HTvWwOASeQXEfBL+bsID1ypiKj38B2o73wNPnZ
         H7JokdH/viUXtBFWJDoT9UMCG3wLOqDDLsleZpO3qE7otsTFSOirgQezV3hRcIjJinDc
         FvZ6fxuFoLaA+uLAPeX98iW6dU3KhuFxEJJ6msX7KcEyYCgnRdd3mXykDJmaN8mq1UqL
         XghXhEjxJAUYOsEusCP2sbokgsVHFEn0u4YUnD3IYcj+9SLpLzHE3B0e5W2h25gleWU7
         SUCwhvoUm94R19mGmZf2YcM1wYSzK1y7dW1mgfFDr5qeOR2Bbq1Rg5R9MMpgQVF9ACvP
         sNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XrpGuF2vxbaEuk6VfKG2/A6XesW21KLMiogPr2+Ux0s=;
        b=8Me/rbs1A1jxT2mdropZj+/cfqoCo2sziTJ20EvWNPCRRNEkkaOmkcMks4i4VmeJoj
         l1nst4tb0WFU9P5y3Kw2sD7Delh/FX+rlznS5A46kWsbEut+9vFn89aYv6wqq6VogY47
         83uhm46ec2hWmVSTI2OEj34Tzfc8e27B84VPMRp4rW05UoDtRQjaDJz5cWe++1WzY5Id
         cerYwfVzyg6WYgIng4iOB8Eb1SBDyMuQV8wjpU4PvjUOx3G72y8Dye0WPSrSrWrQZLQV
         R9b5JxBW+LJrDfsgtsXD72htkopUq7qXq2nlRrz6tyqPZ4qo8ZX/90+T+fPdjP6lcpMW
         ECNQ==
X-Gm-Message-State: ACrzQf20EWa0T//4X45ZRDAJiRf8ND36J4Ifa7d6F3XKpqK7Qr0VErLd
        1TQXR/KNEFGnLu3S1ca8AwU6Cw==
X-Google-Smtp-Source: AMsMyM5CoTiedooJHR0qKnaNmrKMBIhIvE4B2WnI/NfMGQIrAouQKGzz3pCBUk7YCEc4DZcpXF+oEQ==
X-Received: by 2002:a05:600c:19ce:b0:3b9:c36f:f9e2 with SMTP id u14-20020a05600c19ce00b003b9c36ff9e2mr2242971wmq.110.1664789224486;
        Mon, 03 Oct 2022 02:27:04 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:f3a:9f5e:1605:a75a])
        by smtp.gmail.com with ESMTPSA id ay3-20020a5d6f03000000b0022cc157bf26sm9707520wrb.85.2022.10.03.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 02:27:04 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v8 15/29] thermal/drivers/rcar_gen3: Use the generic function to get the number of trips
Date:   Mon,  3 Oct 2022 11:25:48 +0200
Message-Id: <20221003092602.1323944-16-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003092602.1323944-1-daniel.lezcano@linaro.org>
References: <20221003092602.1323944-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3497E354D9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 09:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244199AbhDFHQs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 03:16:48 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:44919 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbhDFHQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:16:48 -0400
Received: by mail-lj1-f179.google.com with SMTP id u9so15238274ljd.11;
        Tue, 06 Apr 2021 00:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NUTRKCAJSPIjCVadXlxVAs0WfP1mvGI0BilMH14WAU8=;
        b=WTPLuJtZ//NAj1QCvebmCgsz+67WT1xTQHiZXJr3nmw+Cx65QJxri3f0tMhhQuJnl4
         gnhh9avEWbpaSo0dyosAEp65ltola4y5zzKM9Za1zrT/iR5SWRuBXQbW37IFYV0laRPf
         IOX4BkVQRW+1FZOZgPRxYoOWLAnPemLMqgg+cQL9TZiQcMBocIaR+ldF565Uql1oaI0L
         VGBFStXcQtKF2nJstIB0SRZPdipLDHV8ncdNWdvdmbDp0ptP+10ZudhAbnV1UlmXJmDn
         mhOql48aAyPbp0nfDGXsKstJHaug53ZcVfv8y54RP8KhBDeuUQ86s/uGt4VZ3zhYj2Bj
         f/hA==
X-Gm-Message-State: AOAM531jT/XTOz+sjpHywQyj3vylUvSgxTIeiqOp9sqUQorPjrMrQ39F
        Ia5cKEHnI9GE0y55t/IbijrRVmren6E/lQ==
X-Google-Smtp-Source: ABdhPJytLtkJgHYPWNa69nW42h6+4EDqID048rwy0Fy/M6zXpGyXsUkIwWqU4hdXbeH/ZG6a9HuxAg==
X-Received: by 2002:a2e:8009:: with SMTP id j9mr18716165ljg.364.1617693399353;
        Tue, 06 Apr 2021 00:16:39 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id v70sm2048789lfa.106.2021.04.06.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:16:38 -0700 (PDT)
Date:   Tue, 6 Apr 2021 10:16:33 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 7/7] regulator: bd9576: Fix the driver name in id table
Message-ID: <6cf3d6462b339193a50bbc12b781010c545fd72b.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver name was changed in MFD cell:
https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com/
Fix the ID table to match this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Please note - this patch is not really related to the series. This
change is related to separate MFD driver change and was only added
as part of this series to avoid the conflicts.

No changes since RFC-v2

 drivers/regulator/bd9576-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index 0d55d383d2aa..aeb816cf9ad3 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -1117,8 +1117,8 @@ static int bd957x_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd957x_pmic_id[] = {
-	{ "bd9573-pmic", ROHM_CHIP_TYPE_BD9573 },
-	{ "bd9576-pmic", ROHM_CHIP_TYPE_BD9576 },
+	{ "bd9573-regulator", ROHM_CHIP_TYPE_BD9573 },
+	{ "bd9576-regulator", ROHM_CHIP_TYPE_BD9576 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd957x_pmic_id);
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 

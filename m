Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F8F336FF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 11:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhCKKZE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 05:25:04 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:38685 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbhCKKYh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 05:24:37 -0500
Received: by mail-lf1-f54.google.com with SMTP id m22so38843276lfg.5;
        Thu, 11 Mar 2021 02:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kySRtoaDYBMk42VHXNaGFzj+3JjCHVgH4DSD5XDpza4=;
        b=HZp+DEZnipSsgv99qSagQXbCRcwmknNx8A0UpRgDGIX2zEM1BGuADlEHTzwErh3N1o
         2kT+Bhqd/txIOx7CtNEHx+v2HJWyop6/5c8VsCAu+/fYM7sTbYruim+gRNVx8TsPxG3Y
         Dz4uqZYyKCFeXwGuJaU0aHDcDDb8Rn44R9n3y4DxExUJDg3AcOUchYqQ87Ud0BB455R1
         DS5QHe8UUHD1It1SVGYI7zarTmF+R4yOMsj5r4t1EHfrCxbsbefWbdzN/L6kA1GQWVkw
         8Mn1MNJzBOmACUcRo9gtuGaA3ig3D3tW24DjRvhuet5shvWJnfX7Jfj10ghkAQmoB/zD
         1vlQ==
X-Gm-Message-State: AOAM531IUXgnIUjptq5J1X7ccQSUUMMS9z6YPUISLhYrktLCpemzE9fJ
        CMqr9Jz8zDkJqXAEvMAW5FQ=
X-Google-Smtp-Source: ABdhPJylw2jSlSVqoFrxaMD7bnHrpOQP28K/7cQCBq8O6HjVybGrIwl13A2Mn3Sa9HC/udXnFRWBig==
X-Received: by 2002:ac2:4d8e:: with SMTP id g14mr1901108lfe.572.1615458275619;
        Thu, 11 Mar 2021 02:24:35 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id c16sm690811lfb.302.2021.03.11.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 02:24:35 -0800 (PST)
Date:   Thu, 11 Mar 2021 12:24:29 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v3 7/7] regulator: bd9576: Fix the driver name in id table
Message-ID: <9fd467d447cd2e002fa218a065cd0674614b435f.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver name was changed in MFD cell:
https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com/
Fix the ID table to match this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
v3:
 - no changes
v2:
 - new patch

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

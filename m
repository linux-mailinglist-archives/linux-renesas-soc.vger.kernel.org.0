Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF473551F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 13:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241939AbhDFLWg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 07:22:36 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:44750 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241465AbhDFLWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 07:22:33 -0400
Received: by mail-lj1-f174.google.com with SMTP id u9so16034915ljd.11;
        Tue, 06 Apr 2021 04:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NUTRKCAJSPIjCVadXlxVAs0WfP1mvGI0BilMH14WAU8=;
        b=hLLeBTZ8pOeIPZMttO4C3SuHIKwm7hZ82vaxvg9Lop1uoY4+cd5GaQ2GgAWe/AGCpY
         FCcCbXwHoah2Mbp+ttc8tTNoU3MY2Sai4dprkvMtlrFNuNczE7+rmRgeEZNv6/K1Dlal
         1HfFsxOZW3MtdMgeY2DXxt/rNSWjkBxihkV5N2WEz1mK5Z08iNBclg64EgbTgAjscfnD
         Nar2MjvzwenZoVJTYzs+UxvBuFdy7Sb5PfDjbDlfoklB8VXTF3q+IzqMr+gd35V+rNk5
         flg637ESvq4rJMR6QaPTKlLUBBwzr5E0XM0m826p6Mw+FmEjjO8dKqoT4rXzbyt6CMS0
         GSyg==
X-Gm-Message-State: AOAM532a/5Gt3A2vIJ+TWKhVfuKjmSDkqnmWC093DY9f6ZZsNkfr46zo
        d7x2ezOcGf9S0N2f7AhLul4=
X-Google-Smtp-Source: ABdhPJweNyZ+HsWqqvMEvfV+BksHJq1l3p6Da8bpB9jL5ZIvhHFUE6C+AJ7oyHUrEkongo7q2dOapA==
X-Received: by 2002:a2e:b814:: with SMTP id u20mr18910317ljo.370.1617708144381;
        Tue, 06 Apr 2021 04:22:24 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id b34sm2163537ljf.137.2021.04.06.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:22:23 -0700 (PDT)
Date:   Tue, 6 Apr 2021 14:22:18 +0300
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
Subject: [PATCH v5 7/7] regulator: bd9576: Fix the driver name in id table
Message-ID: <6d527a928279d2346d2d413b3460c87b07852d40.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
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

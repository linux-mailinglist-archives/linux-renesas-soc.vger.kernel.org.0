Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D053E3568F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 12:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350629AbhDGKGw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 06:06:52 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:35370 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346542AbhDGKGX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 06:06:23 -0400
Received: by mail-lf1-f54.google.com with SMTP id w28so27509324lfn.2;
        Wed, 07 Apr 2021 03:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QYZKnG5sW48x9oFbbMIXt3sQ2d75rIBaQQRFZCVetlI=;
        b=Pf+rW2H16RVONAq2855JboC/H0BC0RQa2mlrl4Z82p7Q0w1jPFESVt7SukSqEoJDHz
         7R6NqojzAKMPgQmHy+fSC5/AB+WLTED4mt0CGqtgKd6yjb8kR7rnqzLN9Zp/EKQqsW8J
         /z14IfCOeCrwHBZR4gknDnGN4jvIc1PM4r1MbdlOdd9zyDG/jhNIpSs4003wKCQ4dE1C
         nnfwZ450IAzGan8YY+rLuHXFyXpQ1RA+1A5JytR0yB1ZVtGu9eTtdv0QZvhoZqJAuXY4
         amc8BkSAvHqCxN2Acro37usItmwfLiW0UNAPRs1iBaV9CTXFzJA4CsaXf6dByGir1n9d
         VPdQ==
X-Gm-Message-State: AOAM533K+F5PImSSaVEKgKMyDwtSH3/9DY81AjBSnIL1BiPDdd5ekT9y
        xJ6Y6rk8vWlxP1adYdFV/dA=
X-Google-Smtp-Source: ABdhPJw6HmzKrFkTQYXsR3w07jUqF3BkDOpNEPQ77/7ShZXmM3D9C1+viKOuezsYixzhLBjqUoXxTg==
X-Received: by 2002:a19:670c:: with SMTP id b12mr2014271lfc.441.1617789972333;
        Wed, 07 Apr 2021 03:06:12 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id h62sm2433228lfd.234.2021.04.07.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:06:11 -0700 (PDT)
Date:   Wed, 7 Apr 2021 13:06:05 +0300
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
Subject: [PATCH v6 7/8] regulator: bd9576: Fix the driver name in id table
Message-ID: <a80b9f989084b75619a573e166bfedc970f6f801.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
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
---
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

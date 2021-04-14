Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCABF35ECC8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 08:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348844AbhDNGAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 02:00:24 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:35646 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345214AbhDNGAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 02:00:23 -0400
Received: by mail-lf1-f53.google.com with SMTP id x19so761796lfa.2;
        Tue, 13 Apr 2021 23:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=azqoIxSs1K9CWPF3YorJnSs/J8lyHUiOa4jIjf4agX4=;
        b=IZ3n0apnUgGASI2ar7ZwxZulJ0mtGAopsh8z9tSSvGdfdRxz/VdE/wPJPXzzdqVNeF
         wxuGwC0cAQ1IHVHT2TB9dG1u94cB6pAxiSu72UDSTAFYFDpUHqQMdr5ziMYCHvryCB0O
         3Hogv+y4Y1v/xt5yvaElqE/Y//Tpb8hBKXFJPypdy7STI2eL/WgIEQ+MH2l0L6nIOlfo
         lq+X1qh+Ba4ZtGOpW8tuXGgl8qQg/H1XcZtk2O5hzDqJbnCVyh8dmsVLHDyb47CyH1el
         rAyWPyuA7OfdkSySFJh80Efd/uH0zOj3sTvAvw5aMhmYLZHX4W66EB2/WoudmCBXs/Ig
         7LgQ==
X-Gm-Message-State: AOAM530WWH2rAMcRnf3/BwPO05/a5Xsv9KD5FKm8EheaQAR3A/CxY/LW
        J8enqA+a/aNJ9e4KRvb8lsw=
X-Google-Smtp-Source: ABdhPJxU8Q3I9jXQHe0S2+OeiiwWSsUF59ZpceQvWeQO3OVaDDPOyiBr7yEM2EH59udtxgigUcJPzA==
X-Received: by 2002:a05:6512:ac2:: with SMTP id n2mr11616028lfu.194.1618380001695;
        Tue, 13 Apr 2021 23:00:01 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id u25sm4907226ljo.133.2021.04.13.23.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 23:00:01 -0700 (PDT)
Date:   Wed, 14 Apr 2021 08:59:54 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Mark Brown <broonie@kernel.org>, Kees Cook <keescook@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: [PATCH v7 8/9] regulator: bd9576: Fix the driver name in id table
Message-ID: <ffea769a48ca43879eb74f18f40a238ad5127369.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver name was changed in MFD cell:
https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com/
Fix the ID table to match this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
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

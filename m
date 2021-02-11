Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA867318AFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 13:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbhBKMkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 07:40:05 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:37550 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbhBKMhT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:37:19 -0500
Received: by mail-lf1-f47.google.com with SMTP id w36so7860324lfu.4;
        Thu, 11 Feb 2021 04:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BEYc1KpLEzvo5kSYZfGrwQM3KRwm1b2lfZYyXexWZu4=;
        b=VH4vA5eaDmGzUOYGHm3IOI/bJ70N4gSz0UgY50lfz8vQPzZDpYB2bWFKRSt9AWEVct
         48618//wLka3kGjw94skvUURS0DjRaLJUKy5EtoM4z9zrmgoA5e7sMp6pTae9r5CNwq9
         Tz1ZqCr0ZbFjPL7iR0vFtGwo6UpDfMXPlrINKV2g1BBYCx4OE+/Sthy4arnvuSAaOrOK
         NsI0iCB44dPvaAvt7iymI4/MN9v2tly+pBQtrb0KBqbtT8hfZ3veKqtxIIrCO+HuzUsJ
         bm+z3Wr+p4eIkecaftCiiGYQVHcz/Cx4qQQ9PP6XJcwpXGjFe3Ylsdobr/4c1zbm7r26
         mwfA==
X-Gm-Message-State: AOAM533ABYHxSFAXAadjoCyOdRUCVhFbeNXb4i3HIcamjBiXMWwZeFc/
        QMRzZjks6yo4ZQosXae/bY0=
X-Google-Smtp-Source: ABdhPJxdyVid28mVAXjh+nRn+59q3xrQHr7U1Cor2gQrpo6Nb6/fQrsOCfzYErmyn2sPLz9lNKsymA==
X-Received: by 2002:a19:810c:: with SMTP id c12mr4351687lfd.244.1613046996016;
        Thu, 11 Feb 2021 04:36:36 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id n12sm896522lji.99.2021.02.11.04.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:36:35 -0800 (PST)
Date:   Thu, 11 Feb 2021 14:36:29 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH 7/7] regulator: bd9576: Fix the driver name in id table
Message-ID: <074dbbeef9ee2d5440d8c9ed1424ff4e99bdc048.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver name was changed in MFD cell:
https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com/
Fix the ID table to match this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd9576-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index 8768f6145ec4..39d4cb04ac34 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -1087,8 +1087,8 @@ static int bd957x_probe(struct platform_device *pdev)
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

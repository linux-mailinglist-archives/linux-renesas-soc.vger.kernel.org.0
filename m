Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44A035ECCC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 08:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348978AbhDNGAn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 02:00:43 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:38733 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345214AbhDNGAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 02:00:42 -0400
Received: by mail-lf1-f42.google.com with SMTP id j18so31240981lfg.5;
        Tue, 13 Apr 2021 23:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f4Q2DJD3DV7OkSynlanBwzkwssjVc6YxaICi84VA+UM=;
        b=GzXOtX86BXEK5eU33ZzhWkwTVyiyu/enlgxl/SrAjfoZHK9ZP46dMovN2X0plumsln
         0zvT9TmBmMv5ynh6lctYA/MMBmJ2F1b6hsHNNm102j+BLH039w2BrTntcY3hUOZCtFpD
         srDlrmiMqM+x+GlbsLRpct8w9k7JV3opj9PCEwGc3JiH4mKyo3CDgbpZoZONA73wjJjy
         gDhgWXfJXmvEKnaPNj+GcQVpw6KJhfuNhZnplQeieTUHYy+e/RjJtVGCj3YtWSqpnRBK
         m+vC2V8CUwPBslDHGjWVB0V1wLCm6+iH7Zb9uXuZX81mLnm5AxgAgx+O6wbZBmsG6BZB
         7nZQ==
X-Gm-Message-State: AOAM531YTaVw7UueU6BUfUyio4JouUBXikoT1+nxMjt4OS07fq8QpEom
        k9v7KbYgoW34JZx7363VK7c=
X-Google-Smtp-Source: ABdhPJxKujG2wBrfUHPrlF/DdKRjT4FEXoJGh7s/PjOzpD3Sui6yZtGoMKr3dOoVNeNzWZ9WEYzYdg==
X-Received: by 2002:a19:6906:: with SMTP id e6mr18423553lfc.385.1618380020330;
        Tue, 13 Apr 2021 23:00:20 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id k9sm2285172lfg.64.2021.04.13.23.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 23:00:19 -0700 (PDT)
Date:   Wed, 14 Apr 2021 09:00:13 +0300
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
Subject: [PATCH v7 9/9] MAINTAINERS: Add reviewer for regulator irq_helpers
Message-ID: <5a544430d447fb9a261eee8c5856a586dcab55f1.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a reviewer entry for the regulator irq_helpers.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changelog:
 v6:
  - New patch
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fdc513392f4..c917d85feccd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19228,6 +19228,10 @@ F:	include/dt-bindings/regulator/
 F:	include/linux/regulator/
 K:	regulator_get_optional
 
+VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
+R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+F:	drivers/regulator/irq_helpers.c
+
 VRF
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
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

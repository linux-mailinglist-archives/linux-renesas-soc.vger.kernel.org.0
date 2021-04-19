Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AE136410C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Apr 2021 13:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238825AbhDSLwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 07:52:44 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:43739 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238740AbhDSLwo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 07:52:44 -0400
Received: by mail-lf1-f52.google.com with SMTP id y4so15315105lfl.10;
        Mon, 19 Apr 2021 04:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=erLfrBbpLUWpLE6PdeDVjwhIO9MmuoNkJg0M9PXeuA8=;
        b=jJRDfRV5d/npfTHA7c74l2k5gKiel2kA/Uycx4tzypXkc9eA9kMplGzQtfgZmM/JiS
         OkTtJafUz/oGlLFgxI1qt6YPFFzs5qBMBiSCi9CuKKMqcfBnOnRT97xGJI71ZHpLSeFA
         pkPd/u9nWStqpy37jDia1O6RVBpuRk3gqT36gKuBbGd+RoehlydnYNCiQFGSuPEKyau6
         XPlKGffxOb6gOc0k4uC1NOSgysokt+RlFM+f6A8wQXaW9aa2Im1vj4/Mg8M3vY69SE5a
         9+JOxksrYVgiA1POk+brM1ICqDHwCed/gd9PgbFJa2HIQyO7snzYW7jHD7GsFbCd5QAS
         P9Mw==
X-Gm-Message-State: AOAM530bATaWADbYgVtRtpYHBLTp34UCrxVDytXP9ejKGMX8t8Nb5Bmm
        FWB6UVg255V4yqqzUulj4eM=
X-Google-Smtp-Source: ABdhPJz2Wxtb44c8+VWlDOzt6Cq9/5JEraUVEhY0Aa5+oCik2p7E3OXuBvT5bWBcMeJqd8P2dVmYiQ==
X-Received: by 2002:a05:6512:b9e:: with SMTP id b30mr12070810lfv.278.1618833132362;
        Mon, 19 Apr 2021 04:52:12 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id i17sm1831134lja.22.2021.04.19.04.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 04:52:12 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:52:06 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
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
Subject: [PATCH v8 10/10] MAINTAINERS: Add reviewer for regulator irq_helpers
Message-ID: <04c5640243f04c695c8df9a01fadf935b5e59b57.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a reviewer entry for the regulator irq_helpers.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changelog:
 v7 - onwards
  - no changes
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

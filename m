Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A009835ECBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 07:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348408AbhDNF7g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 01:59:36 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:38547 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347993AbhDNF7g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 01:59:36 -0400
Received: by mail-lf1-f41.google.com with SMTP id j18so31236997lfg.5;
        Tue, 13 Apr 2021 22:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b9R0s+EDMZLI0RnpDaFC1Cm/LjqCeBrqvvjiWyeaZ0Q=;
        b=DqMDP66jtgYKubRjwk0jkED14xHASA7rZLUdlzmykHsaCQ4/9f7bDl/BrWO+SXxoy6
         VrHer0ZsWWLhJ6YAUJ5IlTbu48hmC9WpjaD/ClYcYjlYu/OuaMvqVHhgeUQmvZAqT//U
         wEA0sPSPshPhYgOJCQL0m2sGzFxe0sACKnhBRIvcibCqJJkApEL+aweuOTF6wAh2M3W5
         QSfyo+kz7L02kxQ+M2DCJOz+45rTbwQvEaAIil0mzSIES1MyqlUNGHp7FcmXmXptlfpd
         nt2KO/yT7NyojbyvLRAtpUY6DB1bQf5TDPK3xTaEvu34SlBzmJzmELqZNWdgRMG2KHDb
         SSgA==
X-Gm-Message-State: AOAM5335ptLxD1H4WxPPD1JN+OeW+WdXnt2O9ATTVc2w2fu7T+4MYQny
        0Tg9gdUmL1WNBwUnto3COlo=
X-Google-Smtp-Source: ABdhPJxCMFmJ9dEFPHovWAQeL7a4JthzzOkgk7X6gNAQ6VGP4KDAs9T4eGQV+4wVA15L46ITPje/xg==
X-Received: by 2002:ac2:504f:: with SMTP id a15mr7900641lfm.176.1618379953904;
        Tue, 13 Apr 2021 22:59:13 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id d8sm84581lfq.58.2021.04.13.22.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 22:59:13 -0700 (PDT)
Date:   Wed, 14 Apr 2021 08:59:07 +0300
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
Subject: [PATCH v7 6/9] dt-bindings: regulator: bd9576 add FET ON-resistance
 for OCW
Message-ID: <5213499b034d3b84c0144665287be0a926d089e8.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618377272.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v5 onwards:
  - No changes
v4:
  - Fixed the description indentiation
---
 .../bindings/regulator/rohm,bd9576-regulator.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
index b6515a0cee62..7cb74cc8c5d9 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
@@ -27,6 +27,12 @@ patternProperties:
       Properties for single regulator.
     $ref: "regulator.yaml#"
 
+    properties:
+      rohm,ocw-fet-ron-micro-ohms:
+        description: |
+          External FET's ON-resistance. Required if VoutS1 OCP/OCW is
+          to be set.
+
     required:
       - regulator-name
 
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

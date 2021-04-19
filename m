Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A93364100
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Apr 2021 13:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238951AbhDSLvg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 07:51:36 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:46772 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbhDSLvg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 07:51:36 -0400
Received: by mail-lf1-f47.google.com with SMTP id 12so55284972lfq.13;
        Mon, 19 Apr 2021 04:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZjC6yPawIleJWn4rthBNXTCZYN7M+ry107LxigA6vJA=;
        b=keaxxQ9aIn7dqPxGRfcUxXktNJytEI3JHXv5nZ8x4JAH9fcBC8CbmTUIsjLP+84+uK
         +1FyjtG6HsftUkbiw5X7ilYdgIOt/UXM/4XZ4dlIh88P9liAIrb3Ju24xildQKCS7YG1
         VQz7F2tUELqX4x4hAQ32JTwLo4h+sxFrTcyC9gbHT6MaHYMx410hZOoRJahZR9+WGRh1
         15DQgg7AlP0FkjficvPihuUvnR+FDWcVlnK8bTuuonmEKUD41O0LhhRpcFzYI4J9stu8
         EFude3MxVGwqvIyvwarN+nqg7XO5s6tHDCIPttIwUdCQ0On64ZUNU0PTggLK2jl9KHre
         fPgw==
X-Gm-Message-State: AOAM531zGKCc5153ZYqVPglqezDp6+kPW6RxLRfD/3LVMsInpzjc/ePB
        kFC8jt80oO01vxxZVIJLEQo=
X-Google-Smtp-Source: ABdhPJxbR0vRbvKWgmK2tPkaz3AUdij0MGbiIKCd/4exi6/H5HaLDuXV2BlcNaz0m3BvROaUi739fg==
X-Received: by 2002:a05:6512:2309:: with SMTP id o9mr12571603lfu.168.1618833065466;
        Mon, 19 Apr 2021 04:51:05 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id q14sm1836075ljj.124.2021.04.19.04.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 04:51:05 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:50:58 +0300
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
Subject: [PATCH v8 07/10] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <7a8ee942001f4b407d33eb7c1e6886936061635d.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
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

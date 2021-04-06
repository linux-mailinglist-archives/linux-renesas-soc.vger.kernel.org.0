Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62685354D92
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 09:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbhDFHOX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 03:14:23 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:42707 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234232AbhDFHOV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:14:21 -0400
Received: by mail-lf1-f42.google.com with SMTP id o10so21093548lfb.9;
        Tue, 06 Apr 2021 00:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7kQcHiL7FxmqddI0qJTkE8M2Db65qgn7MixWNdN02mg=;
        b=KZIpFlx7yYBaQ78ibua4kvwlPG7cyp2h1B5oFNwjw5/slWtKpjsoBg4rhUsqvdkZmb
         /gDR5rEWt4PukkjFY4jIbdG62Pi8RKpWBBSBL9DBs+73D0AMfeUPfo6muaYha3TP/Xiq
         kFoH7v1i2c4UoWZyj4lOv625pfcnM8IjGWqeQmNIcjuvH8irdGSkMsvU6aO9DFwi+jMI
         EWnkrtaBNT0HiXbzUlVawXjR87R/grR131mevqJ/SRv1KVe8wW2ysMNBQsi6q5BzYQAP
         I808Kipc7/wbFw2mCwykewOcDKj9O4WWAde4R07NEGhAlFYt9/sBKfZvWyrdLceaA046
         2rbw==
X-Gm-Message-State: AOAM533I95iVyi1ZzWf4HT72SvXudeibUXNcVhKQ+SBkojK+izXTZ15b
        z44H1jWTE8aDsc5ZozA3jOU=
X-Google-Smtp-Source: ABdhPJyE6TVxgNpZ/tPchX0HSWI8gtW+G0PN77AMSXVK5qo5+1UqpIqoLt45KiZfq8UoUR3Z9r93JQ==
X-Received: by 2002:ac2:4883:: with SMTP id x3mr19528278lfc.419.1617693251117;
        Tue, 06 Apr 2021 00:14:11 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id e9sm2112251ljj.52.2021.04.06.00.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:14:10 -0700 (PDT)
Date:   Tue, 6 Apr 2021 10:14:04 +0300
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
Subject: [PATCH v4 5/7] dt-bindings: regulator: bd9576 add FET ON-resistance
 for OCW
Message-ID: <34d37fcef80153b6c610826f885c0f6c36cdd93f.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../bindings/regulator/rohm,bd9576-regulator.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)
v4:
  - Fixed the description indentiation

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

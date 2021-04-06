Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664253551E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 13:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbhDFLUw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 07:20:52 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:46973 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbhDFLUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 07:20:51 -0400
Received: by mail-lf1-f43.google.com with SMTP id 12so21975220lfq.13;
        Tue, 06 Apr 2021 04:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wy+8bgk2mbDfD+oNkltaE1Rj5kfXGJ0enYfD+V2dU40=;
        b=cmlQFibvE25jaSc4hKulgWvFpO9VqZuVmJbbPYACh8X36JkqRcBL0yxmIGvlVS+Ltc
         CYXWAwJv0XaerrOkml74TIjQSfnvFNTLn2/56L8kGC20ni78qfb//MR0kl02vubVw9Jk
         8Zxb5cvbh/8u1IqQTPihsBcyXQjnfzyX0LeOTaguen3AQwfyBHNG7PJn7g1n0iV9MSar
         iybWpC3bZtcmtJT/Ks7DTDm22cCazzoae8bF+yCBF6MywufdfORLNRy+X6H3luRxeht3
         uaAaYYxR79+shsjpIjHKOgUinQuexH8wfiUmEKNbf7FcawTLtMkEOQNxLLF1NW2W2zJc
         puhg==
X-Gm-Message-State: AOAM533zmRa6yO/9p0mwHLIM91JneYqmyxvvZj7e2m67L/LBFg8Tetby
        4PRK/Vzw6I0/pHRRtjzrkJA=
X-Google-Smtp-Source: ABdhPJzJfSkDziKyjphTUFNUjWVOIsju/sH92ZtxzIVHzewsBwIP6HNdvyCFTiW8feZe7xRYxe1dvA==
X-Received: by 2002:ac2:5bcb:: with SMTP id u11mr19600255lfn.603.1617708040820;
        Tue, 06 Apr 2021 04:20:40 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id h206sm2125050lfd.4.2021.04.06.04.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:20:40 -0700 (PDT)
Date:   Tue, 6 Apr 2021 14:20:33 +0300
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
Subject: [PATCH v5 5/7] dt-bindings: regulator: bd9576 add FET ON-resistance
 for OCW
Message-ID: <3629967021c734d4ffac4d2863c1edcb5fad9c31.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
v5:
  - No changes
v4:
  - Fixed the description indentiation

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

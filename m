Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BECF318B00
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 13:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhBKMk6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 07:40:58 -0500
Received: from mail-lf1-f42.google.com ([209.85.167.42]:43524 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhBKMge (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:36:34 -0500
Received: by mail-lf1-f42.google.com with SMTP id d3so7811776lfg.10;
        Thu, 11 Feb 2021 04:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NPjb16F/Enmos5BdXGztjXZs5CJCxN0wXp5AiXsE5FM=;
        b=LzCWrBu9qKDT9oP5u0Ie+I/kjjHSYbZy/kH69OcFuEasyWp6sqmGsZQLtOfYVZlfJZ
         Kxf9bLiFz+/+sqgP/069dEzl2cK0ncpyAj34dHNBUcHIEl0TAp0ZD/6EUdD6pAzDTAIz
         YNx1Kc5+DIjALiO3Ynj6kq18zEM0I7GiDXBeM/pVZSalD/x0+g7Ai7OIcoX44dSGQkkp
         iLZLVcIbdtuEDlVljRotceLUlemTagWcpDuaLvQxmJCy7zI19gGBmiOgcWYVIpPKDHNM
         nTrNiiUSjJXxevKrNs7RXw0M4L1pnYKyBIO4AbppSrdupAfspIGZM+r662m9EeolBWbG
         c+HA==
X-Gm-Message-State: AOAM532dMZPQswrG9gQXCA67UmKFbuOlnXMpBRnQw1DVbV1hZzLLKWxG
        7Aadl6NDRKl3NYcTJkAtolk=
X-Google-Smtp-Source: ABdhPJxVGoucB8e6O/MTgeLno0yiF8jwESSuhPBRk1yyBvH/FQ2fgNm+QBMHaXjHOGowJ3UNODC7vA==
X-Received: by 2002:ac2:5df1:: with SMTP id z17mr4107208lfq.124.1613046948259;
        Thu, 11 Feb 2021 04:35:48 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id n7sm631989lfu.123.2021.02.11.04.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:35:47 -0800 (PST)
Date:   Thu, 11 Feb 2021 14:35:41 +0200
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
Subject: [RFC PATCH 5/7] dt-bindings: regulator: bd9576 add FET ON-resistance
 for OCW
Message-ID: <b7025d14fc8eb0eac95437ac62e74f64a7cf2b4c.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
index b6515a0cee62..ad3f57e9cd9b 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
@@ -27,6 +27,11 @@ patternProperties:
       Properties for single regulator.
     $ref: "regulator.yaml#"
 
+    properties:
+      rohm,ocw-fet-ron-milliohms:
+      description: External FET's ON-resistance. Required if VoutS1 OCP/OCW is
+        to be set.
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

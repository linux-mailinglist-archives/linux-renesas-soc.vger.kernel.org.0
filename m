Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FA0336FE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 11:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbhCKKYA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 05:24:00 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:34316 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbhCKKXl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 05:23:41 -0500
Received: by mail-lj1-f180.google.com with SMTP id f16so1442771ljm.1;
        Thu, 11 Mar 2021 02:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Dm5yOtVQTwxG6HM9ZGBXFFw4LTttf3R02OO0T8urqg=;
        b=kEPjv6nPfe39lUcgvK7eDka260sTihhHTxdwH+ta+B+VOVTam5/YCZ1QRTI+tIlyba
         NhTOWvL+Zi5FU1+1/VujQHScRccOcBApF/IIJKjil0cZ8hEdrLPOSxlwA2P0I6expEoy
         /HYRKZr5c6Wm8wTZImY/eNMKRDeKGPx5HFQlQHRbLXxIvwwG4eAXhpWL96fbPvJVyj5i
         E4CGybQoNEmZV/XBkL2Df/KMCR7O8vkV3VBNTp96zt2VjET4RqH9BzvxaxBrEsG+VDgx
         1wxLKDHJ0Tk37/WVPaUO0FAowVrZzqXwZ8IUbOCYQJYo+WgZHKr6gILd9jbXUfGsbB6M
         OKTQ==
X-Gm-Message-State: AOAM532QUMGShCkRN3w7h7cQ07v/gzOpYwc9k7Me4V6qnp7OrSfW8eYH
        R5yOSJ0wKW8cOO41w8Kb66Y=
X-Google-Smtp-Source: ABdhPJyMJ9N/J0lvp9CUuLdRI/gubn7qmao5bLoBReXHaKvWhd2uChvKHYgH4IxrzBnUmKlC9d2K0A==
X-Received: by 2002:a2e:161e:: with SMTP id w30mr4286671ljd.182.1615458220040;
        Thu, 11 Mar 2021 02:23:40 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id x1sm700121lff.97.2021.03.11.02.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 02:23:39 -0800 (PST)
Date:   Thu, 11 Mar 2021 12:23:33 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v3 5/7] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <6793280eb1a3376a1aa4d408a8931202050c828d.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
v3:
 - no changes
v2:
 - use standard micro-ohms suffix

 .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
index b6515a0cee62..9c119c1b1904 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
@@ -27,6 +27,11 @@ patternProperties:
       Properties for single regulator.
     $ref: "regulator.yaml#"
 
+    properties:
+      rohm,ocw-fet-ron-micro-ohms:
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

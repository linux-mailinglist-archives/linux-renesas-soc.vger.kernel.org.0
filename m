Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708363568EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 12:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350636AbhDGKGF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 06:06:05 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:33649 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350691AbhDGKFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 06:05:08 -0400
Received: by mail-lf1-f51.google.com with SMTP id o126so27640800lfa.0;
        Wed, 07 Apr 2021 03:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HPh1xRZoaKj1dkeLrpwAw4cXFw4YaUG5EWKUdl3Qzcg=;
        b=Odur6lHonzkyNZC9iLNm5cnLqzskyf/nF8sfWS8PCg7MzkLopl7oeDYwWevwnrweEN
         tcNaqbHI3/oU8mrK2QzfmC9MkG2IgYsyWps8YgbTr5dkSbMxPNrrmC2Rs5hi8vpivxSG
         wMHOqZtBft9zZd9A9+mqOixsrYNKWKFsbq863/cDZZpEyrw+n+MmZ4uKW634BuM92wpJ
         PsHqFl+gXlNuTwsI8aEKuz+8OobWHD/JhoKC2blrjvcgnUL7ALK1TvVGm4lystepk4im
         usiaDKo4cdXe1TGib8KVPyZIHkcB5N8eQTCIEpWm+AoLzqoUZCOoRBpLGM831y+f47y+
         VXRA==
X-Gm-Message-State: AOAM533Gi7PARg+DSqPt+PbxVUK8yPV0p0C5i5xuNwXO/1/6W8K53PlR
        jIJJwJfc73+WIYcCB8RHQH0=
X-Google-Smtp-Source: ABdhPJzAnruS0/Cz10VTP6+WZplQ3ndYp1Y0Uy7stfEvPbTkmzWHxVeNJtXX7UyvBsVUu4OCBSw6ww==
X-Received: by 2002:a19:c309:: with SMTP id t9mr1920039lff.348.1617789897908;
        Wed, 07 Apr 2021 03:04:57 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id x4sm2477141ljj.91.2021.04.07.03.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:04:57 -0700 (PDT)
Date:   Wed, 7 Apr 2021 13:04:51 +0300
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
Subject: [PATCH v6 5/8] dt-bindings: regulator: bd9576 add FET ON-resistance
 for OCW
Message-ID: <78743b448814a85280c484c0b2d4f4207008fd6e.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57833354D7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 09:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhDFHMt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 03:12:49 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:33608 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbhDFHMr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:12:47 -0400
Received: by mail-lf1-f43.google.com with SMTP id o126so21177272lfa.0;
        Tue, 06 Apr 2021 00:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=icCyWpEA8G5439EFxYe6sPGx23MqLXuvD2hZswbpOq0=;
        b=PCbSRubCIc4jucnb4AwsKhXAhu7jLVruGex9fdozlwl00byyi5etwNY7QTIxaBwApE
         9HbWybKqq8yQyp2iHWSiQr4Q6Zz8WCFvLwYoIgcmPYRdPNszSsu3TwMJwUmvPZNgA/BB
         ZyXddHaqs4NUly72dMi+WjR70pP6/gqP6W1xEUxYphtRlRJPqX9RHLE2uNlleVeUynLR
         wdXymbR7PCL8Gm16gfFq5TR9t0kQtdIb0D1LTzgV/yriXrt28krGwDJHZhXcAYHKOfh4
         GpU0TThh9rgqserMAdG2Qjzwjau4yVaETBgGHEmH+dyoz0jmShvMEi8ioWu5VBgeQCMg
         J6KQ==
X-Gm-Message-State: AOAM531cjrkTNQRLNt0lCS8NWkizBdTxQJtX3vZgvxncwkVe9K7vE6sU
        aqYM1uRGCW9KrjUoFd/QgIA=
X-Google-Smtp-Source: ABdhPJxlaIvg3CQvXrHtN3Kqk2glTYAizGJbQgRqMA0PbVXKNL3nO+KGa1ugpr/ezTZYOuEbXBc+/A==
X-Received: by 2002:a19:ad42:: with SMTP id s2mr19923209lfd.406.1617693157338;
        Tue, 06 Apr 2021 00:12:37 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id x8sm2053101lfc.8.2021.04.06.00.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:12:36 -0700 (PDT)
Date:   Tue, 6 Apr 2021 10:12:29 +0300
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
Subject: [PATCH v4 1/7] dt_bindings: Add protection limit properties
Message-ID: <9fea2d1693d7d2947a30e7fe0e99e3ca7e485998.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Support specifying protection/error/warning limits for regulator
over current, over temperature and over/under voltage.

Most of the PMICs support only "protection" feature but few
setups do also support error/warning level indications.

On many ICs most of the protection limits can't actually be set.
But for example the ampere limit for over-current protection on ROHM
BD9576 can be configured - or feature can be completely disabled.

Provide limit setting for all protections/errors for the sake of
the completeness and do that using own properties for all so that
not all users would need to set all levels when only one or few are
supported.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
No changes since RFC-v2

 .../bindings/regulator/regulator.yaml         | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 6d0bc9cd4040..a6ae9ecae5cc 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -117,6 +117,88 @@ properties:
     description: Enable over current protection.
     type: boolean
 
+  regulator-oc-protection-microamp:
+    description: Set over current protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted.
+
+  regulator-oc-error-microamp:
+    description: Set over current error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested.
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-oc-warn-microamp:
+    description: Set over current warning limit. This is a limit where hardware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted.
+
+  regulator-ov-protection-microvolt:
+    description: Set over voltage protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-ov-error-microvolt:
+    description: Set over voltage error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. Limit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-ov-warn-microvolt:
+    description: Set over voltage warning limit. This is a limit where hardware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as microvolt
+      offset from voltage set to regulator.
+
+  regulator-uv-protection-microvolt:
+    description: Set over under voltage protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-uv-error-microvolt:
+    description: Set under voltage error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. Limit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-uv-warn-microvolt:
+    description: Set over under voltage warning limit. This is a limit where
+      hardware is assumed still to be functional but approaching limit where
+      it gets damaged. Recovery actions should be initiated. Zero can be passed
+      to disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as microvolt
+      offset from voltage set to regulator.
+
+  regulator-temp-protection-kelvin:
+    description: Set over temperature protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted.
+
+  regulator-temp-error-kelvin:
+    description: Set over temperature error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-temp-warn-kelvin:
+    description: Set over temperature warning limit. This is a limit where
+      hardware is assumed still to be functional but approaching limit where it
+      gets damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted.
+
   regulator-active-discharge:
     description: |
       tristate, enable/disable active discharge of regulators. The values are:
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

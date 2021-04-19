Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D533640E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Apr 2021 13:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhDSLtC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 07:49:02 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:42772 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbhDSLs7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 07:48:59 -0400
Received: by mail-lj1-f175.google.com with SMTP id l22so31620442ljc.9;
        Mon, 19 Apr 2021 04:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J7crRi/h8pPP48l770iPX9pdtxPTTqKfvzb9h8aF7ts=;
        b=PqVRfTD/+E/NOuChr9y0Xu0OBv6BFwqeZGeTM5F5/HIszKSrS/Xz9y5sOFAj7zbcK8
         zVX3r5sWgCOfDFlcvlEbyTWo1/ZD+8/wzpZlVUR8WBIV5TAVwhVlKV1vi6cyUwH7r/wR
         UYVRMEyD7OMFn5GL+aUqdwKunmhYO4AWkuMGOSsm3G6BNyFBAdPRIcZq+niOcdml1LOX
         38DvOUHRujRKZ4QN9dopIupVAstezTzQl7E7n1aDRoaOwLiVIhQhOzuJlgPak2ej91cQ
         MrY9S/13bBAGzDASBFBWPwCPQ1KA/3/cNEQKAa6tEKjJj5+GfSLdo2rx6Nq5cTf8TVKW
         cbdw==
X-Gm-Message-State: AOAM532rdbRF8PKnFPgwO8cczIMngF/lJg8nLZeblLOzypdh9ooDwWY+
        z4gaWnc/H571xEvwO3zYDi8=
X-Google-Smtp-Source: ABdhPJy5E/SWqGKdKFX4CP7Kd/2EfDK2yQWClCsAA98kDczqdArTzCZUVzb94pvZJlKpGCG8racGCg==
X-Received: by 2002:a2e:864e:: with SMTP id i14mr11093474ljj.15.1618832908645;
        Mon, 19 Apr 2021 04:48:28 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id o1sm1766575lfg.159.2021.04.19.04.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 04:48:28 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:48:21 +0300
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
Subject: [PATCH v8 01/10] dt_bindings: Add protection limit properties
Message-ID: <169aee95444042a7557e630a028e86f1aed0dd62.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
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
---
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

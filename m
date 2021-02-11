Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24144318AEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 13:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbhBKMin (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 07:38:43 -0500
Received: from mail-lj1-f172.google.com ([209.85.208.172]:44681 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhBKMfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:35:11 -0500
Received: by mail-lj1-f172.google.com with SMTP id x1so501465ljj.11;
        Thu, 11 Feb 2021 04:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5v/cjtTmJg2RpKpRvNRPqO2XLjvgCacL1WtUm8zOfnA=;
        b=UszOAmYKZ5M+wc0ZH88yls+5ED/Lb7ECyP5yCpbtfzXq7hdNAC3VN7KEehd1Q5dBla
         Dp16yxUQ2TK63mrO0imH9kZpxfp95l/C5CmzY+3eIMQIzBlNs4su7uKrRYLcgjfU3kW3
         tt1q/ZyhP1Y0mk73qSIWNIxkEtXl7jUpvEg6fshxOhZkhQI5iHCZ5KOCrQu2eSqtzW+4
         +LOaAetLhMJyrGxOb9CWCtHYzX0pLKv6JkQ60ysSmTWIODUNYD24nv3mKyTN72gLOUJs
         Xlr9xqctpacDoBoSWerB5qvU4ixGJCSFr5Sg4/d2+po96crFLGToPMOF4KX/ixnSYcm5
         p7GQ==
X-Gm-Message-State: AOAM533zz2IVn5Mm+Pt6N/IdB/W+M0bCnj5lfLlDlVTzsXUrclpH9Fs4
        I3powc/qQ7CODTwyaeEfiko=
X-Google-Smtp-Source: ABdhPJxK/dYwsv+pjD2kxn36Gy9gjk0wC4yYlHAcf8kh0rRFFMI5TwptCAlairhIMcHQR8XshVvNaQ==
X-Received: by 2002:a2e:2c0d:: with SMTP id s13mr89345ljs.298.1613046868233;
        Thu, 11 Feb 2021 04:34:28 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id j137sm636583lfj.55.2021.02.11.04.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:34:27 -0800 (PST)
Date:   Thu, 11 Feb 2021 14:34:17 +0200
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
Subject: [RFC PATCH 1/7] dt_bindings: Add protection limit properties
Message-ID: <eacb8a0aad9190219b36763927602e9a566649c2.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
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
---
 .../bindings/regulator/regulator.yaml         | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 6d0bc9cd4040..47fff75f0554 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -117,6 +117,88 @@ properties:
     description: Enable over current protection.
     type: boolean
 
+  regulator-over-current-protection-microamp:
+    description: Set over current protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted.
+
+  regulator-over-current-error-microamp:
+    description: Set over current error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested.
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-over-current-warn-microamp:
+    description: Set over current warning limit. This is a limit where hardware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted.
+
+  regulator-over-voltage-protection-microvolt:
+    description: Set over voltage protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-over-voltage-error-microvolt:
+    description: Set over voltage error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. Limit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-over-voltage-warn-microvolt:
+    description: Set over voltage warning limit. This is a limit where hardware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as microvolt
+      offset from voltage set to regulator.
+
+  regulator-under-voltage-protection-microvolt:
+    description: Set over under voltage protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-under-voltage-error-microvolt:
+    description: Set under voltage error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. Limit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-under-voltage-warn-microvolt:
+    description: Set over under voltage warning limit. This is a limit where
+      hardware is assumed still to be functional but approaching limit where
+      it gets damaged. Recovery actions should be initiated. Zero can be passed
+      to disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as microvolt
+      offset from voltage set to regulator.
+
+  regulator-over-temperature-protection-kelvin:
+    description: Set over temperature protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted.
+
+  regulator-over-temperature-error-kelvin:
+    description: Set over temperature error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-over-temperature-warn-kelvin:
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

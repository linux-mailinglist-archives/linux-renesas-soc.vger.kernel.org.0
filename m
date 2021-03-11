Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20717336FD2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 11:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhCKKVv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 05:21:51 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:35749 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbhCKKVu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 05:21:50 -0500
Received: by mail-lf1-f50.google.com with SMTP id e7so38911884lft.2;
        Thu, 11 Mar 2021 02:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xDwLcoi1ZW1290iFrKYagYAph1kMtF0n65mh6ULNQJg=;
        b=tG7Ns8xB9JOgOxdQFu6FjzAuVO9FM/XRlO1m7owj8C8I0EWMyfvZcte/WU7SZ5cMGI
         sbjBJkePKdwMQMMoURKEHuK8eEY8Iua+EgqO/9W8A4ZPivkm0gu2XLK8hE30Daqvcq4n
         XzVUZ/cG8l4sPZl5DpFQMkvCVfMObNK7eEYg7elQ5nfgCkvvUV8SGrVPsloEHO8OFBkF
         UwlmJZHKXbwVMPMoay2bhT/lomwvxCv89chu8YTj7tyPsG/xIOkqbdqeTkbzQofuh9Az
         2IDB0v+nQzWNe5oJ2+CV5b/yHSzcELmsexnlkuaOGej5EwX2SE4cA1x0+6QSMpH3fs+v
         a9bw==
X-Gm-Message-State: AOAM5324z7fEWlUY6xBhtnzrAy5VoGSTOns+HcpiF1PISPGCLeHulVgX
        FKJnDNzOFNc2LXyho+H9c/A=
X-Google-Smtp-Source: ABdhPJxCe512DOJLgcdIIw5w8jnRrVwGOzebS0twUvg8SemcxYlqDWTkI0MH5NLQ449S6Iv+HNz6oQ==
X-Received: by 2002:a19:d61a:: with SMTP id n26mr1827321lfg.383.1615458108160;
        Thu, 11 Mar 2021 02:21:48 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id a1sm838602ljb.76.2021.03.11.02.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 02:21:47 -0800 (PST)
Date:   Thu, 11 Mar 2021 12:21:41 +0200
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
Subject: [RFC PATCH v3 1/7] dt_bindings: Add protection limit properties
Message-ID: <4a12be22a3ea1cf9114dd67f017f3adea431c5c4.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
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
v3:
 No changes.
v2:
 Shortended property names as suggested by Rob.

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

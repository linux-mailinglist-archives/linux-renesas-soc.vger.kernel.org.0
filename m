Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB87E3568FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 12:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346536AbhDGKHI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 06:07:08 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:46794 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244351AbhDGKGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 06:06:48 -0400
Received: by mail-lj1-f169.google.com with SMTP id u20so19913572lja.13;
        Wed, 07 Apr 2021 03:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Gvfrl9iHmqojQZyBLAUe+w/XFRz7PxAI+scFLNoAmw=;
        b=qL4/aaWju8xmvWPw0q14oP5adfhjzhG8xyCMuUn78C+dYDF5r+WKcWtPOZtirAGUXy
         JK8D1NjIu88PEPTYPXIU3xp8lNql3uX8mWUNLB4Zvw4RUKB4TCH+qIm78387WqiuQWfl
         G5AB7/AgGj1ifsHs892F56pal/TDOzw+/NRDNmKDBUnVeSTPCIbvpfDQ9YuexmFQpXNc
         DtDP664cfsyHKHrKsbvpUDVLPAK8kGVAgAWI1ukIdiQ0BwbIvaUpTEBTSmxuXDBinKgo
         J6Kub15LPWsJ+awp/HiyK24w7ckbdvlzTJOpHF9zT0OiZIJH8uqM6fEsdyVoab4SroOH
         YFkQ==
X-Gm-Message-State: AOAM5319ZDcqftyW/YzSuTxxdvs7ZkTwu/vLJ/93YhetWdfYuwCRGqqe
        nJ6dGlimgvfAgNUA6+9+tjA=
X-Google-Smtp-Source: ABdhPJycG++GnnNSF9Uwa9U/sGNyEigoxCCBk7AwDXyL2fb7oHVEsK5bK3513bl3uA+G5yp5QxYFjw==
X-Received: by 2002:a05:651c:3c3:: with SMTP id f3mr1632618ljp.105.1617789997624;
        Wed, 07 Apr 2021 03:06:37 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id y24sm2428638lfj.54.2021.04.07.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:06:36 -0700 (PDT)
Date:   Wed, 7 Apr 2021 13:06:31 +0300
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
Subject: [PATCH v6 8/8] MAINTAINERS: Add reviewer for regulator irq_helpers
Message-ID: <2b744faf8441df8ca145450ba68c2086ba6c1052.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a reviewer entry for the regulator irq_helpers.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changelog:
 v6:
  - New patch
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c80ad735b384..8ed6af3e66f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19211,6 +19211,10 @@ F:	include/dt-bindings/regulator/
 F:	include/linux/regulator/
 K:	regulator_get_optional
 
+VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
+R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+F:	drivers/regulator/irq_helpers.c
+
 VRF
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
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

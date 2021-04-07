Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE703568BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 12:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350575AbhDGKEE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 06:04:04 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:45848 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350501AbhDGKDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 06:03:32 -0400
Received: by mail-lf1-f41.google.com with SMTP id g8so27509906lfv.12;
        Wed, 07 Apr 2021 03:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PF17I0NH3tYVAA1Iv/q8DPWO007JsrI/3wrjpR3VDTQ=;
        b=ErQapZvxie9sdOspRJqNnfrDw/L873wXRbh6iSWo1q+FQdnLxTP3nitFI8nvFE1NwE
         H+U/uw+iFK2bpF4+Ci+qW93B3zJgcNXyQUD4yCZEhYZ/fEx9AmkphtQNInAuWTuhsFvd
         EHEKatlDr8voP9JzqtDaxiA1liBBSRXxvaHFxuRsY+ZclM3h0bmNLKO5CF/jjbJ/yrJ1
         UxcauNDVyMR0C3kuwjts+os+FVvjkpTJDZvARuZxBCvRZNU2rJPC+h3B7q7W5HtyEDVX
         sRa6t8PJ3EpdeB3q6/cRPm1x6UoKuPLg+chZSIjIBZBKfwpWaJKvn68f+JoHEEJyTYBU
         8E5g==
X-Gm-Message-State: AOAM532J9Fc2O03CBY4vgxn5nPOEVZQNkNIEKrvIFZafCNuBTjHxVokI
        Gwve5nxfK8fbTOJ2df1wgvY=
X-Google-Smtp-Source: ABdhPJwAboi9CjOAMTjr+NfQFz6zGL9bX+mfSc7IZMv8APLCGWNMV2T1FA6NlerIpG5wj+/eqeK9cQ==
X-Received: by 2002:a05:6512:1114:: with SMTP id l20mr1359564lfg.126.1617789800611;
        Wed, 07 Apr 2021 03:03:20 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id v137sm716388lfa.187.2021.04.07.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:03:20 -0700 (PDT)
Date:   Wed, 7 Apr 2021 13:03:11 +0300
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
Subject: [PATCH v6 2/8] regulator: add warning flags
Message-ID: <03ebe1f85fa85762f705a7bf29faf271c9fe3401.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add 'warning' level events and error flags to regulator core.
Current regulator core notifications are used to inform consumers
about errors where HW is misbehaving in such way it is assumed to
be broken/unrecoverable.

There are PMICs which are designed for system(s) that may have use
for regulator indications sent before HW is damaged so that some
board/consumer specific recovery-event can be performed while
continuing most of the normal operations.

Add new WARNING level events and notifications to be used for
that purpose.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes since RFC-v2
---
 include/linux/regulator/consumer.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 20e84a84fb77..f72ca73631be 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -119,6 +119,16 @@ struct regulator_dev;
 #define REGULATOR_EVENT_PRE_DISABLE		0x400
 #define REGULATOR_EVENT_ABORT_DISABLE		0x800
 #define REGULATOR_EVENT_ENABLE			0x1000
+/*
+ * Following notifications should be emitted only if detected condition
+ * is such that the HW is likely to still be working but consumers should
+ * take a recovery action to prevent problems esacalating into errors.
+ */
+#define REGULATOR_EVENT_UNDER_VOLTAGE_WARN	0x2000
+#define REGULATOR_EVENT_OVER_CURRENT_WARN	0x4000
+#define REGULATOR_EVENT_OVER_VOLTAGE_WARN	0x8000
+#define REGULATOR_EVENT_OVER_TEMP_WARN		0x10000
+#define REGULATOR_EVENT_WARN_MASK		0x1E000
 
 /*
  * Regulator errors that can be queried using regulator_get_error_flags
@@ -138,6 +148,10 @@ struct regulator_dev;
 #define REGULATOR_ERROR_FAIL			BIT(4)
 #define REGULATOR_ERROR_OVER_TEMP		BIT(5)
 
+#define REGULATOR_ERROR_UNDER_VOLTAGE_WARN	BIT(6)
+#define REGULATOR_ERROR_OVER_CURRENT_WARN	BIT(7)
+#define REGULATOR_ERROR_OVER_VOLTAGE_WARN	BIT(8)
+#define REGULATOR_ERROR_OVER_TEMP_WARN		BIT(9)
 
 /**
  * struct pre_voltage_change_data - Data sent with PRE_VOLTAGE_CHANGE event
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

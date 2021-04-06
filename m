Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697B73551D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 13:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241890AbhDFLTc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 07:19:32 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:46075 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbhDFLTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 07:19:31 -0400
Received: by mail-lf1-f49.google.com with SMTP id g8so22058974lfv.12;
        Tue, 06 Apr 2021 04:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lanXWWkCnnUsQptzren1s2UcTiYH4GtjBPSv5+mLE5s=;
        b=GiS92bFG3RsKDLrA2HGFMAVtRisJsoD6rn6h9UitdA4V3MhVjz4KxseangKEywpYKe
         kErJ3kZpQAl4gEL103Lyz0m0NT2SkkaYc77W6b7GHs4oeZ7DbbciCvTaowWBa/IzCPGz
         AfO/XPUIm4BANl2syQTulIVdb4W4aFoQvITjRZcm+zhUzc3XPxJT6xLiuiJqFhU4lmdd
         qhUNn23lfEPIv4cgO8HnjtBo9iiMcnPqsUBFFqDWOeoa7SBqaItcMkjKrXuugVmaUdex
         IFjVGV/KFW6f9evmZygdinkdrR23Yx9pp3adghcLJM1lPB4z0hLzwEjptT6RdltuwGHD
         qEPQ==
X-Gm-Message-State: AOAM531i6D1V/z2e4YRZX7K4Wc7AlHlDK6CU25tZN0hlhwkngW9zVqSW
        HDkgz2mLEuEXOAtRdrhobHQ=
X-Google-Smtp-Source: ABdhPJwv9HvXiKxYpP9TQR1YA+oW9MficZ9850WxMnuHXaQ1GhNIgL2OPI94ftV+RkFMndypT+2Hsw==
X-Received: by 2002:a05:6512:3a95:: with SMTP id q21mr20193590lfu.653.1617707962549;
        Tue, 06 Apr 2021 04:19:22 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id x1sm2117874lff.97.2021.04.06.04.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:19:21 -0700 (PDT)
Date:   Tue, 6 Apr 2021 14:19:15 +0300
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
Subject: [PATCH v5 2/7] regulator: add warning flags
Message-ID: <03ebe1f85fa85762f705a7bf29faf271c9fe3401.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
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

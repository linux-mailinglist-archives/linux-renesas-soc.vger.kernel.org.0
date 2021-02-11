Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCDB318AF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 13:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhBKMi5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 07:38:57 -0500
Received: from mail-lf1-f43.google.com ([209.85.167.43]:33212 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhBKMfc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:35:32 -0500
Received: by mail-lf1-f43.google.com with SMTP id b2so7886578lfq.0;
        Thu, 11 Feb 2021 04:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x6TZw+obX8DsydwkNebGYL0Sc7QmwV6s4HOdYPKBxHw=;
        b=f/RKuKE6mf1D8Ro2tOf+9xb9dvE96mRBolVMlIxtnnC8VAA2kj9EEJ4l/I/gv3qpEq
         t64xZ8p8lJLj0HT0Lvr1Wz/wiUZxOwugof7sNm+l0a7mhCp8w0AjE8p1sdU2HyIWgl2H
         CIDhGprDPZGpahIz7G/Q+YQXHDdmadL9ijTtHbZi8eB00S9KbByhClipAAw4u7FBeYUt
         g5ax8JzWN93RRGhGhDmh9LlV1IXWkxDSPilgnG8yzn3MwtVcV0xfzbb+PtdgVnAtvprL
         sYF6Ymvho2kYzeFohZvp78lBfNCUOCs1pA3mxt72e0tvilVs+61tgcIg14n7BIjGfHCG
         9smg==
X-Gm-Message-State: AOAM532EIOEM9AbnSe8DIheBl+BYcwJDkV3LVDHjgA204D/EbZIeMwQe
        2f0Z2mCREKQqTh7u577/0W8=
X-Google-Smtp-Source: ABdhPJxlHhG+xj+C0nTx2fx3+LCbxwcIuZR2sycsfftyoa8MkIC20+5FPDRp++sEy2GrUrfMCt4k8A==
X-Received: by 2002:a05:6512:201c:: with SMTP id a28mr4363766lfb.25.1613046888332;
        Thu, 11 Feb 2021 04:34:48 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id f5sm891715ljc.8.2021.02.11.04.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:34:47 -0800 (PST)
Date:   Thu, 11 Feb 2021 14:34:41 +0200
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
Subject: [RFC PATCH 2/7] regulator: add warning flags
Message-ID: <796abe0408e36c52a405b52738b27617b9e32325.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
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
 include/linux/regulator/consumer.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 2024944fd2f7..a5e2d9b9237c 100644
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

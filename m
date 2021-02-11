Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47363187DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 11:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhBKKP5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 05:15:57 -0500
Received: from mail-lj1-f173.google.com ([209.85.208.173]:41304 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhBKKNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 05:13:53 -0500
Received: by mail-lj1-f173.google.com with SMTP id e17so6677124ljl.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Feb 2021 02:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vbzohcwBtlUZH6ZLAK19lQqwlGPGKPmPpTbcsdgTlH8=;
        b=r2tpeUhoU6R6i5sMSy9WK7h0HhiYdCTv+LJ/2lqVgwT1VT9jWdwGCG5Fqw7BgEUKva
         ECw/PELL687CSIb2DeVEDNyF5lqtmCZ08uGGy7KjLz7YXhvTuY9eGUMdMGRIPuEna9dQ
         9IihewGXRZH5u/ws5NEXXB7YFTzAjILVOsScMXvo/FcskfEEh794YU3/rUqGQkusHgMG
         3pc3XtQqctsN/LkpQRL+2bkKjwhz80PzHKXCmeXbBLhHQot8s3kUqzOiAUhH6UwGJ7AY
         sJAZFl0Quv/VudkPPZwODVIKeAWLfU/dD/lgUaZnIRQtfSXOv28aKL2FvpLHaFNXFcdE
         bYeg==
X-Gm-Message-State: AOAM531V7YHYe6MWJ+9msbDYxIgsiCr9fIw7VT+O44G78nP4fqJSTTho
        Ur/lrOL3CRi6B73Iy1o5sb8=
X-Google-Smtp-Source: ABdhPJwBi5Z+BHiprZM28eksDuEFRdhCoZ1W4gDhbX4PdsqUWnMDGuiUV44XX1THNaxGQfFGVWRrHA==
X-Received: by 2002:a05:651c:1105:: with SMTP id d5mr4845523ljo.114.1613038391238;
        Thu, 11 Feb 2021 02:13:11 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id r19sm597577lff.214.2021.02.11.02.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 02:13:10 -0800 (PST)
Date:   Thu, 11 Feb 2021 12:13:04 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 6/6] mfd: bd9576: Add safety limit/monitoring registers
Message-ID: <f9d76bed70a440036b56be8a0928925d12db8463.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

ROHM BD9576 contains safety features like over/under voltage detection,
over curren detection and over temperature detection. Add the
configuration register information.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes since v7:
	New patch

 include/linux/mfd/rohm-bd957x.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/mfd/rohm-bd957x.h b/include/linux/mfd/rohm-bd957x.h
index 3f351a1ae4ab..2bd35260ee8e 100644
--- a/include/linux/mfd/rohm-bd957x.h
+++ b/include/linux/mfd/rohm-bd957x.h
@@ -116,6 +116,25 @@ enum {
 #define BD957X_REG_VOUT4_TUNE		0x59
 #define BD957X_REG_VOUTL1_TUNE		0x5c
 
+#define BD9576_REG_VOUT1_OVD		0x51
+#define BD9576_REG_VOUT1_UVD		0x52
+#define BD9576_REG_VOUT2_OVD		0x54
+#define BD9576_REG_VOUT2_UVD		0x55
+#define BD9576_REG_VOUT3_OVD		0x57
+#define BD9576_REG_VOUT3_UVD		0x58
+#define BD9576_REG_VOUT4_OVD		0x5a
+#define BD9576_REG_VOUT4_UVD		0x5b
+#define BD9576_REG_VOUTL1_OVD		0x5d
+#define BD9576_REG_VOUTL1_UVD		0x5e
+
+#define BD9576_MASK_XVD			0x7f
+
+#define BD9576_REG_VOUT1S_OCW		0x5f
+#define BD9576_REG_VOUT1S_OCP		0x60
+
+#define BD9576_MASK_VOUT1S_OCW		0x3f
+#define BD9576_MASK_VOUT1S_OCP		0x3f
+
 #define BD957X_MAX_REGISTER		0x61
 
 #endif
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

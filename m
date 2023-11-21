Return-Path: <linux-renesas-soc+bounces-43-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF17F32D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 16:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FDB4B21F65
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 15:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70DB5917C;
	Tue, 21 Nov 2023 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="C4Q2Qi4V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB941AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:46 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so7930721a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700582024; x=1701186824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7NjNd9CEagYnBdGkDCsdTNCadER1wmGC0fqJQ3aE7s=;
        b=C4Q2Qi4VCvAaszVloUiwBH0/nK9zWdcHAA/qlTrjrrXeTxampcTN9Oljy6XZ7dDiXY
         9QHN4R2LCYAnovYA1xDCwS167UNGVf3D100fXVpJDlMt3+oXiYESd8H0c6ZvAb9oDcNp
         0v9SODbrGJcf2a57+xSuhAd6ix9PNYuefoTmNAiqhkOoPzkVhUG44lwvhpIilLqkfr7i
         fNceqsrZ3sG3ISL5DHfgQc00juDIPqNqi7dXFPwoCqlBWgL0lqY1k9HGbrYgmgQxiM0Q
         D1nQVFPyQLHBC2eWUoHu/EzZJlH1MbuLSrSSrfv/1xUAsK+GrwmKdGOd/J5OV8j9V+qF
         t0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582024; x=1701186824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7NjNd9CEagYnBdGkDCsdTNCadER1wmGC0fqJQ3aE7s=;
        b=pZXLE5dmFablJCYAWChb04QZk1KECo3FnZH1WU4dWdg0k30Iys7pX/nfiZHELQJyEE
         fymbc21mKDLFuTNhWHk/muhCiufS0FFsiMRCpjPqhM1xUDfeYNfnxdH4xLG01vQ0ogWn
         qGxK3FyHWtLKWZuYea9a1tihHAz1tHL967XeFW5gfWmmx01y1gK6lSPnHGe39VWjZ2AO
         5p+Xm1mMnz9EwybovverkiGBbDY3Va/HRgGV3021+PTGQqV8zc2qwKjzfYufe1cBPdT7
         fDVWrtVn459MWdNGIrkc+1mNq/Tfb6cpZYrLcmItBPA1rkMl+jPS3UR6UqEozTAHmO8L
         CRfQ==
X-Gm-Message-State: AOJu0Yw9gyuiQtZJn0IGeMBtcmZfgY3xTXDv+ppJbHzWfwb5dY7c/juT
	Bn26b6KdJF+oBBSefQypV5fs/w==
X-Google-Smtp-Source: AGHT+IGaeCwvreDI3HuvQec1U9qsXvmgbpGRw6bV3x2kFKHLQWUSgeA4BoBICB4OpuMZZDihPh+2DQ==
X-Received: by 2002:a17:907:971d:b0:a00:40e7:c311 with SMTP id jg29-20020a170907971d00b00a0040e7c311mr3810382ejc.27.1700582024619;
        Tue, 21 Nov 2023 07:53:44 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id dv8-20020a170906b80800b009fdc15b5304sm2896853ejb.102.2023.11.21.07.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:53:44 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next v3 5/5] net: ethernet: renesas: rcar_gen4_ptp: Break out to module
Date: Tue, 21 Nov 2023 16:53:06 +0100
Message-ID: <20231121155306.515446-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Gen4 gPTP support will be shared between the existing Renesas
Ethernet Switch driver and the upcoming Renesas Ethernet-TSN driver. In
preparation for this break out the gPTP support to its own module.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Drop the unneeded 'depends on' line from Kconfig symbol
  RENESAS_GEN4_PTP.

* Changes since v1
- s/Gen3/Gen4/ in commit message.
- Add missing MODULE_AUTHOR() and MODULE_DESCRIPTION() definitions.
- Make Kconfig tristate depend on COMPILE_TEST. All drivers that make
  use of the shared code auto selects this anyhow.
---
 drivers/net/ethernet/renesas/Kconfig         | 9 +++++++++
 drivers/net/ethernet/renesas/Makefile        | 5 +++--
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 7 +++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index 8ef5b0241e64..733cbb6eb3ed 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -44,7 +44,16 @@ config RENESAS_ETHER_SWITCH
 	select CRC32
 	select MII
 	select PHYLINK
+	select RENESAS_GEN4_PTP
 	help
 	  Renesas Ethernet Switch device driver.
 
+config RENESAS_GEN4_PTP
+	tristate "Renesas R-Car Gen4 gPTP support" if COMPILE_TEST
+	select CRC32
+	select MII
+	select PHYLIB
+	help
+	  Renesas R-Car Gen4 gPTP device driver.
+
 endif # NET_VENDOR_RENESAS
diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
index e8fd85b5fe8f..9070acfd6aaf 100644
--- a/drivers/net/ethernet/renesas/Makefile
+++ b/drivers/net/ethernet/renesas/Makefile
@@ -8,5 +8,6 @@ obj-$(CONFIG_SH_ETH) += sh_eth.o
 ravb-objs := ravb_main.o ravb_ptp.o
 obj-$(CONFIG_RAVB) += ravb.o
 
-rswitch_drv-objs := rswitch.o rcar_gen4_ptp.o
-obj-$(CONFIG_RENESAS_ETHER_SWITCH) += rswitch_drv.o
+obj-$(CONFIG_RENESAS_ETHER_SWITCH) += rswitch.o
+
+obj-$(CONFIG_RENESAS_GEN4_PTP) += rcar_gen4_ptp.o
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 9583894634ae..72e7fcc56693 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -176,6 +176,7 @@ int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_register);
 
 int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv)
 {
@@ -183,6 +184,7 @@ int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv)
 
 	return ptp_clock_unregister(ptp_priv->clock);
 }
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_unregister);
 
 struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev)
 {
@@ -196,3 +198,8 @@ struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev)
 
 	return ptp;
 }
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_alloc);
+
+MODULE_AUTHOR("Yoshihiro Shimoda");
+MODULE_DESCRIPTION("Renesas R-Car Gen4 gPTP driver");
+MODULE_LICENSE("GPL");
-- 
2.42.1



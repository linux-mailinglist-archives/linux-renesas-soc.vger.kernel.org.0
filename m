Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8597EF677
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 17:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjKQQpE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 11:45:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235722AbjKQQpC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 11:45:02 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDA7D5C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:59 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32f7abbb8b4so1432324f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700239497; x=1700844297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqhIDcxNEg81oFdPwx3lGmpDRXkd6s3pq6VAhH62Gxk=;
        b=fIHBhpor5yQBD4C3m5U//ND7jXmoWAORkbHKdDfgRq8qyNg9Mj5z3CcL8phF54xrnC
         lts/P8SqsrcQgKTjOHKDHuL2chKKfs0TWsLREca12lLDZgPuwurLxMRKiIyhkZGaUvxA
         /3l3NZYeiP74RFye8qi4iy9z0rxE+y0noNFG8qCKTqojXnfqknz2HvGzRMllnAlygq++
         oyD8J7IuemIN1ZIfPh5YhrIUNHHCbEQnO8nvBrbXI/5Etxxtgzp3Fm0LzAZg5eHOP2lU
         kzVwS7YCFtQ33FFogYUmKrZp6Ef0JnVzRS+TJVR1RRMM1raau4Ratd5ehZdnQ7o9SUGj
         7vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239497; x=1700844297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqhIDcxNEg81oFdPwx3lGmpDRXkd6s3pq6VAhH62Gxk=;
        b=re7qGZXVr58X/wEIHdVVcDsbeEZOTnx789RNriQUqq7hH6heLf3MJ+N+QGSqaBTctL
         jQqp/D4n5w5drzLY0DS+W0D6YN1HjkrqxLLedKx5QL2F+uJtGN8UbS3PekuDD9KSil50
         lnOcVNGysAjzdL4ZuB3D0ZMRkg/yBN680IAfKSrTazLDjtjrYnGGMKQpjFhpnKs55CUK
         T/gEtjls6g18wmLLon/oPfw0KoFXWP1Y5N92W02d8tapVlZ/J20mF4PKfgAEwmRX6BW2
         AVqGS0BmoTW4Wpv0umS2NKaV9ivJuWy3h4UY7YeuHks35oSLWKQcRuL+7pkV3/rsK9xp
         xrAw==
X-Gm-Message-State: AOJu0YylgrNzY58O5XCZILTUTdHRaezQgbCF7JI8C9uPJqIvEMdWvN3w
        5txpvsXSLKMJW+2B9vbon8huJA==
X-Google-Smtp-Source: AGHT+IG4p40+Ydg5HZ9PFgPm5Au1XiB/mFDgarAZ1T4T0SCPDn/lpNR+oL99K9Mf7CfiWoCzlKqsFQ==
X-Received: by 2002:a5d:4085:0:b0:32f:b1ab:ee87 with SMTP id o5-20020a5d4085000000b0032fb1abee87mr12739258wrp.25.1700239497774;
        Fri, 17 Nov 2023 08:44:57 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id y10-20020adfee0a000000b0032dcb08bf94sm2791947wrn.60.2023.11.17.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 08:44:57 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 5/5] net: ethernet: renesas: rcar_gen4_ptp: Break out to module
Date:   Fri, 17 Nov 2023 17:43:32 +0100
Message-ID: <20231117164332.354443-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Gen3 gPTP support will be shared between the existing Renesas
Ethernet Switch driver and the upcoming Renesas Ethernet-TSN driver. In
preparation for this break out the gPTP support to its own module.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/Kconfig         | 10 ++++++++++
 drivers/net/ethernet/renesas/Makefile        |  5 +++--
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c |  5 +++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index 8ef5b0241e64..4e7d8546abe2 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -44,7 +44,17 @@ config RENESAS_ETHER_SWITCH
 	select CRC32
 	select MII
 	select PHYLINK
+	select RENESAS_GEN4_PTP
 	help
 	  Renesas Ethernet Switch device driver.
 
+config RENESAS_GEN4_PTP
+	tristate "Renesas R-Car Gen4 gPTP support"
+	depends on ARCH_RENESAS || COMPILE_TEST
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
index 59f6351e9ae9..22552a8f5430 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -166,6 +166,7 @@ int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_register);
 
 int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv)
 {
@@ -173,6 +174,7 @@ int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv)
 
 	return ptp_clock_unregister(ptp_priv->clock);
 }
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_unregister);
 
 struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev)
 {
@@ -186,3 +188,6 @@ struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev)
 
 	return ptp;
 }
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_alloc);
+
+MODULE_LICENSE("GPL");
-- 
2.42.1


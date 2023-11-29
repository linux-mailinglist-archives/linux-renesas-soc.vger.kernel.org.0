Return-Path: <linux-renesas-soc+bounces-393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A476E7FD535
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 12:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 344EDB218AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 11:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2775644385;
	Wed, 29 Nov 2023 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="LhDt/KJY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AECB1BCC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Nov 2023 03:12:28 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bbfad8758so1987804e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Nov 2023 03:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1701256346; x=1701861146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBMSQm5F8pVmCnY/bulP3HFHAamG32fRwIoKJs27D7o=;
        b=LhDt/KJYw6iJrjl+36Jb6fpaURgg2sqMGaWLM89TPpVvCjePTpSVIzAScRz5328HiO
         0yXnBxJKsk6d0OTSPQ2T3OdaTEiDvNoaAyLyW/LBm79UKb2Bh/9cUH1hCZt0VlPkzPwA
         o9TVUTEz5AmTVpUkpnJ841pCA7Tog8wd1UaEz1tPx6ZbPTCmKdPDum6KRbDrK+hqcxK9
         QIDMl6lstx0TqePOqb08tLHcYK2XBjtHKIcB04RstaTBTDlgPAIEwlAtlBAI5k68N5UG
         G6NyEP7x3oCYavJmwSOETRclPBmJmHjWbro+KnTUz0vzi21BeRPaRR1Mx17U15NRzNa6
         WYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256346; x=1701861146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBMSQm5F8pVmCnY/bulP3HFHAamG32fRwIoKJs27D7o=;
        b=Jy+6ztUc0BwKmCL2h6HZAd523RBicZnMzGKA8sRg15789eWS3alWNPyiE3MmHKYiJr
         ACSvF3HQN7wZICe9Em9TEc8McTFWNldtgtE8+pPnPZOIAA/kqf9PL9tOqVbYX79UI2UB
         GMIsFSP8DBYFtdt3YZ35ztwTzc0OFkW3Epdja8wUUb7SkYuHVSKKOm1nQY6g/t5CYQA4
         SBQYkRhsZ78jGW2MSvlbvnnfuqyqaL3/L6tZS9SQ4oc8dRG601c2tSOjnMab7aCCk3+f
         AsHf0aBweL26mQdP42uXG1KoMf9umVEO//4lKPyZvICE4K19VIz2MvqDSc2fImp2ccxX
         aXQQ==
X-Gm-Message-State: AOJu0Yztc3n2KK8l0Ya653EN+B3mWdmqKAW+vbfWjvE9srba04+3PoLV
	zxsBp1Wa/GkTO0DggFyTLpecuQ==
X-Google-Smtp-Source: AGHT+IGNT5IaHDF9qu71qNnqkrMg5xBAwZ03ypHava9eT1qI2m4YDP4NiX0bzUB8Wdai+vJna1ndQA==
X-Received: by 2002:a19:5207:0:b0:509:4530:e7fb with SMTP id m7-20020a195207000000b005094530e7fbmr11074662lfb.32.1701256345479;
        Wed, 29 Nov 2023 03:12:25 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id z2-20020a5d4402000000b003331a5b8df0sm1028816wrq.6.2023.11.29.03.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:12:25 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [net-next] net: ethernet: renesas: rcar_gen4_ptp: Depend on PTP_1588_CLOCK
Date: Wed, 29 Nov 2023 12:11:42 +0100
Message-ID: <20231129111142.3322667-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When breaking out the Gen4 gPTP support to its own module the dependency
on the PTP_1588_CLOCK framework was left as optional and only stated for
the driver using the module. This leads to issues when doing
COMPILE_TEST of RENESAS_GEN4_PTP separately and PTP_1588_CLOCK is built
as a module and the other as a built-in. Add an explicit depend on
PTP_1588_CLOCK.

While at it remove the optional support for PTP_1588_CLOCK from
RENESAS_ETHER_SWITCH as the driver unconditionally calls the Gen4 gPTP
module and thus also requires the PTP_1588_CLOCK framework.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 8c1c66235e03 ("net: ethernet: renesas: rcar_gen4_ptp: Break out to module")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index 733cbb6eb3ed..d6136fe5c206 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -40,7 +40,7 @@ config RAVB
 config RENESAS_ETHER_SWITCH
 	tristate "Renesas Ethernet Switch support"
 	depends on ARCH_RENESAS || COMPILE_TEST
-	depends on PTP_1588_CLOCK_OPTIONAL
+	depends on PTP_1588_CLOCK
 	select CRC32
 	select MII
 	select PHYLINK
@@ -50,6 +50,7 @@ config RENESAS_ETHER_SWITCH
 
 config RENESAS_GEN4_PTP
 	tristate "Renesas R-Car Gen4 gPTP support" if COMPILE_TEST
+	depends on PTP_1588_CLOCK
 	select CRC32
 	select MII
 	select PHYLIB
-- 
2.42.1



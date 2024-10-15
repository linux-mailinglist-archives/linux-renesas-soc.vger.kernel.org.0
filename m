Return-Path: <linux-renesas-soc+bounces-9780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BBF99F7C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D88283E3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA741FBF60;
	Tue, 15 Oct 2024 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nduW39EU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9741FAEE9;
	Tue, 15 Oct 2024 20:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022554; cv=none; b=lgFPQjYlCxEykBfgZ+Aplb9eBE9FiJ9YEPjKiBQocLnzw9K+UMNvXgPzhLXgUfiPrT/u/sMagD5KB7qHXkWH0vr+TyX+hL/OYn17WaoVwvBdCrI4cjmc4V4oxRKMdFl86IZmSVlHjoVWH14AcexK1W6m1Z4ytqw5Y382xPMpvIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022554; c=relaxed/simple;
	bh=75JVrD24v16KjLTu54UYmfXIQ+t/gyyF/L1I/wcTerw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlu/yQ9MnISsS3bX9c3oYyYTK2iE11wsTXOqZhqQvBg2piTaRqgNyaucroVkF6YdqCabstKp2q7rLQ2K8LrzoG8LTAkSBs78XbjLLX9WVwQvcxZVHSAfz0CsufZJ5lUbToig4OeWV2boDP7i9ajYclwQExu9tgEDw3tS+h2zyc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nduW39EU; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so2582669b3a.1;
        Tue, 15 Oct 2024 13:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022552; x=1729627352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkbSsN14s7NiTNL86cW8tgPqYzNs0WYgisqP89WFaog=;
        b=nduW39EUN3KwgTsqBfaFkh5qjQ1Ojw/KWWmuP6hWPOVZ5QJFmDc5/M7D80kqGGLX/m
         dxevo/m194PYfLurV+M3gmYoD4L1RjXprG7l5laxtb9XZYaPaFQiN53lZLfOlDSu625z
         kxKwidbJXnTKESpBN1/x0UR+Rb+gzbXcmWIOlvUEoVbTB2M871n5uNUwlKA0YOrE8e/z
         eUTFqH2vadbecZ5FwF6sVTTVe+Ntn+drlyercyjPJc5cvuEBVoVyLxsYXau+yy4bvEoB
         oEP53KFp9eF52/QNsxXbTU1DFfqpR+E7+WI3dRJCRJ2OJr4OoTbBss7SmHdoiOCtn88E
         1P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022552; x=1729627352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkbSsN14s7NiTNL86cW8tgPqYzNs0WYgisqP89WFaog=;
        b=DH6QEuDSVMTudCO4h1EnRPlk087yhapfwrLo0v2kighkIJv8CGOWpK2wdfA4cqwbjF
         qG2QU0Y/F2XxQLyBr42RecSHDg1hN5x2pDJFf89+IAqVirMjLMhatq8SxCtCeef8T4av
         OTJkmj63ITTjwrbD/ScGSYKLj7rSX7328hhVnUm5hL36JMyZaiUZE+SHaYjetgjs+Aew
         PhpvzF+6dbJNX9iSmwzl98wv51rwDcQAZWZ5kcW5s7GnbUS8pOR5SxoAN7LS09yup0WJ
         RzVkTmWviZM5EArJwwONJ3xJIL1L3lHljM4eyZGUxcKZjW+NA1uKcNjs+/bfEmYIQOx+
         9qFw==
X-Forwarded-Encrypted: i=1; AJvYcCVjf7eqfrgLfX07QlEZj8zeG6Ua8TcHjAnP9ypnB0IeEyHfpSfA6dcwRpOVmYV8B5twylMxYiEGm/16Y14=@vger.kernel.org, AJvYcCXW+xOkwgFFbDhUVIzCiPeOmZL4Q8sh4vdtsunGjjkPSeB/E6kT5P+fyoTjaaYpmKpL55oCIPybXIqZisXMKGAYujA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqmzE3MzvYlR8oaN1Konm4nHZJGvV0NK4zV2xx86MV6osx3kkr
	Kp+s7r3+UmJtVIcaTJUN8yVUvKEQdOfW0Q0zykurnQXZx0KnZqnG+HdqmQYP
X-Google-Smtp-Source: AGHT+IHT8+OniKvnjQhdouXGEqLFDigw3s1Mfix2D1tSbPNsJEovnUG50aU0s6KNRSlJY5pCviJkng==
X-Received: by 2002:a05:6a20:b2a8:b0:1d9:ae4:91ef with SMTP id adf61e73a8af0-1d90ae49d8cmr480037637.22.1729022551547;
        Tue, 15 Oct 2024 13:02:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCHv7 net-next 2/6] net: ibm: emac: remove custom init/exit functions
Date: Tue, 15 Oct 2024 13:02:17 -0700
Message-ID: <20241015200222.12452-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015200222.12452-1-rosenp@gmail.com>
References: <20241015200222.12452-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit c092d0be38f4 ("net: ibm: emac: remove all waiting code")
introduced EPROBE_DEFER support. Because of that, we can defer
initialization until all modules are ready instead of handling it
explicitly with custom init/exit functions.

As a consequence of removing explicit module initialization and
deferring probe until everything is ready, there's no need for custom
init and exit functions.

There are now module_init and module_exit calls but no real change in
functionality as these init and exit functions are no longer directly
called by core.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c  | 39 +--------------------------
 drivers/net/ethernet/ibm/emac/mal.c   | 10 +------
 drivers/net/ethernet/ibm/emac/mal.h   |  4 ---
 drivers/net/ethernet/ibm/emac/rgmii.c | 10 +------
 drivers/net/ethernet/ibm/emac/rgmii.h |  4 ---
 drivers/net/ethernet/ibm/emac/tah.c   | 10 +------
 drivers/net/ethernet/ibm/emac/tah.h   |  4 ---
 drivers/net/ethernet/ibm/emac/zmii.c  | 10 +------
 drivers/net/ethernet/ibm/emac/zmii.h  |  4 ---
 9 files changed, 5 insertions(+), 90 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 0edcb435e62f..644abd37cfb4 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -3283,42 +3283,10 @@ static void __init emac_make_bootlist(void)
 
 static int __init emac_init(void)
 {
-	int rc;
-
-	printk(KERN_INFO DRV_DESC ", version " DRV_VERSION "\n");
-
 	/* Build EMAC boot list */
 	emac_make_bootlist();
 
-	/* Init submodules */
-	rc = mal_init();
-	if (rc)
-		goto err;
-	rc = zmii_init();
-	if (rc)
-		goto err_mal;
-	rc = rgmii_init();
-	if (rc)
-		goto err_zmii;
-	rc = tah_init();
-	if (rc)
-		goto err_rgmii;
-	rc = platform_driver_register(&emac_driver);
-	if (rc)
-		goto err_tah;
-
-	return 0;
-
- err_tah:
-	tah_exit();
- err_rgmii:
-	rgmii_exit();
- err_zmii:
-	zmii_exit();
- err_mal:
-	mal_exit();
- err:
-	return rc;
+	return platform_driver_register(&emac_driver);
 }
 
 static void __exit emac_exit(void)
@@ -3327,11 +3295,6 @@ static void __exit emac_exit(void)
 
 	platform_driver_unregister(&emac_driver);
 
-	tah_exit();
-	rgmii_exit();
-	zmii_exit();
-	mal_exit();
-
 	/* Destroy EMAC boot list */
 	for (i = 0; i < EMAC_BOOT_LIST_SIZE; i++)
 		of_node_put(emac_boot_list[i]);
diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index c634534710d9..c66adb7f4e7a 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -781,12 +781,4 @@ static struct platform_driver mal_of_driver = {
 	.remove = mal_remove,
 };
 
-int __init mal_init(void)
-{
-	return platform_driver_register(&mal_of_driver);
-}
-
-void mal_exit(void)
-{
-	platform_driver_unregister(&mal_of_driver);
-}
+module_platform_driver(mal_of_driver);
diff --git a/drivers/net/ethernet/ibm/emac/mal.h b/drivers/net/ethernet/ibm/emac/mal.h
index e0ddc41186a2..2963b36be6f5 100644
--- a/drivers/net/ethernet/ibm/emac/mal.h
+++ b/drivers/net/ethernet/ibm/emac/mal.h
@@ -252,10 +252,6 @@ static inline int mal_has_feature(struct mal_instance *dev,
 		(MAL_FTRS_POSSIBLE & dev->features & feature);
 }
 
-/* Register MAL devices */
-int mal_init(void);
-void mal_exit(void);
-
 int mal_register_commac(struct mal_instance *mal,
 			struct mal_commac *commac);
 void mal_unregister_commac(struct mal_instance *mal,
diff --git a/drivers/net/ethernet/ibm/emac/rgmii.c b/drivers/net/ethernet/ibm/emac/rgmii.c
index 317c22d09172..f275ebeb7158 100644
--- a/drivers/net/ethernet/ibm/emac/rgmii.c
+++ b/drivers/net/ethernet/ibm/emac/rgmii.c
@@ -303,12 +303,4 @@ static struct platform_driver rgmii_driver = {
 	.remove = rgmii_remove,
 };
 
-int __init rgmii_init(void)
-{
-	return platform_driver_register(&rgmii_driver);
-}
-
-void rgmii_exit(void)
-{
-	platform_driver_unregister(&rgmii_driver);
-}
+module_platform_driver(rgmii_driver);
diff --git a/drivers/net/ethernet/ibm/emac/rgmii.h b/drivers/net/ethernet/ibm/emac/rgmii.h
index 8e4e36eed172..170bcd35039b 100644
--- a/drivers/net/ethernet/ibm/emac/rgmii.h
+++ b/drivers/net/ethernet/ibm/emac/rgmii.h
@@ -52,8 +52,6 @@ struct rgmii_instance {
 
 #ifdef CONFIG_IBM_EMAC_RGMII
 
-int rgmii_init(void);
-void rgmii_exit(void);
 int rgmii_attach(struct platform_device *ofdev, int input, int mode);
 void rgmii_detach(struct platform_device *ofdev, int input);
 void rgmii_get_mdio(struct platform_device *ofdev, int input);
@@ -64,8 +62,6 @@ void *rgmii_dump_regs(struct platform_device *ofdev, void *buf);
 
 #else
 
-# define rgmii_init()		0
-# define rgmii_exit()		do { } while(0)
 # define rgmii_attach(x,y,z)	(-ENXIO)
 # define rgmii_detach(x,y)	do { } while(0)
 # define rgmii_get_mdio(o,i)	do { } while (0)
diff --git a/drivers/net/ethernet/ibm/emac/tah.c b/drivers/net/ethernet/ibm/emac/tah.c
index c605c8ff933e..77e881efa598 100644
--- a/drivers/net/ethernet/ibm/emac/tah.c
+++ b/drivers/net/ethernet/ibm/emac/tah.c
@@ -161,12 +161,4 @@ static struct platform_driver tah_driver = {
 	.remove = tah_remove,
 };
 
-int __init tah_init(void)
-{
-	return platform_driver_register(&tah_driver);
-}
-
-void tah_exit(void)
-{
-	platform_driver_unregister(&tah_driver);
-}
+module_platform_driver(tah_driver);
diff --git a/drivers/net/ethernet/ibm/emac/tah.h b/drivers/net/ethernet/ibm/emac/tah.h
index 86c2b6b9d460..60c16cf7a41a 100644
--- a/drivers/net/ethernet/ibm/emac/tah.h
+++ b/drivers/net/ethernet/ibm/emac/tah.h
@@ -68,8 +68,6 @@ struct tah_instance {
 
 #ifdef CONFIG_IBM_EMAC_TAH
 
-int tah_init(void);
-void tah_exit(void);
 int tah_attach(struct platform_device *ofdev, int channel);
 void tah_detach(struct platform_device *ofdev, int channel);
 void tah_reset(struct platform_device *ofdev);
@@ -78,8 +76,6 @@ void *tah_dump_regs(struct platform_device *ofdev, void *buf);
 
 #else
 
-# define tah_init()		0
-# define tah_exit()		do { } while(0)
 # define tah_attach(x,y)	(-ENXIO)
 # define tah_detach(x,y)	do { } while(0)
 # define tah_reset(x)		do { } while(0)
diff --git a/drivers/net/ethernet/ibm/emac/zmii.c b/drivers/net/ethernet/ibm/emac/zmii.c
index 03bab3f95fe4..211e843fdc7e 100644
--- a/drivers/net/ethernet/ibm/emac/zmii.c
+++ b/drivers/net/ethernet/ibm/emac/zmii.c
@@ -309,12 +309,4 @@ static struct platform_driver zmii_driver = {
 	.remove = zmii_remove,
 };
 
-int __init zmii_init(void)
-{
-	return platform_driver_register(&zmii_driver);
-}
-
-void zmii_exit(void)
-{
-	platform_driver_unregister(&zmii_driver);
-}
+module_platform_driver(zmii_driver);
diff --git a/drivers/net/ethernet/ibm/emac/zmii.h b/drivers/net/ethernet/ibm/emac/zmii.h
index 65daedc78594..213de06d8ea2 100644
--- a/drivers/net/ethernet/ibm/emac/zmii.h
+++ b/drivers/net/ethernet/ibm/emac/zmii.h
@@ -48,8 +48,6 @@ struct zmii_instance {
 
 #ifdef CONFIG_IBM_EMAC_ZMII
 
-int zmii_init(void);
-void zmii_exit(void);
 int zmii_attach(struct platform_device *ofdev, int input,
 		phy_interface_t *mode);
 void zmii_detach(struct platform_device *ofdev, int input);
@@ -60,8 +58,6 @@ int zmii_get_regs_len(struct platform_device *ocpdev);
 void *zmii_dump_regs(struct platform_device *ofdev, void *buf);
 
 #else
-# define zmii_init()		0
-# define zmii_exit()		do { } while(0)
 # define zmii_attach(x,y,z)	(-ENXIO)
 # define zmii_detach(x,y)	do { } while(0)
 # define zmii_get_mdio(x,y)	do { } while(0)
-- 
2.47.0



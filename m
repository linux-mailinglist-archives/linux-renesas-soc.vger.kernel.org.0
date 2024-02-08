Return-Path: <linux-renesas-soc+bounces-2453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1184DF22
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729721F21A6C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 11:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C566F089;
	Thu,  8 Feb 2024 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nP+B2W6Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52B86BFD1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389906; cv=none; b=QTP4pc7D9pgNBpFWNw/1S1u90Cvu44KZAJDDGVsNk+V20arkp0ViElfKXIntoTS4IS8HSXAwXak5QYq06iYAEkmv2+LH2RPCKVCxkl2CehmBnlkZ9bkbYVqS05OA2W3TLeUVCL7F2be9o2Xbp9SAPUhxRGEAHMdQ8FpySZJQ184=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389906; c=relaxed/simple;
	bh=5Bxp/bh1w8OdWrrBUfJVFbG+B0G2CQq0vUog0du35XM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iN2b9uIhlSNgEJ7y6tSOA1GZE7C3FD/4k2lKTJ/hFj5WNyn4M4iks+neApRSq5sBTqlP666gFB2BR7WQlxEuxPu5qBLKZPNK5eTxXtSC0/zApyXSGyiQeMfILmi/yGWRvpIOFgyVrQSgSRmrCHr0EeX6BajFwGQO6aBvsD8EV5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nP+B2W6Y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4101fc00832so10278825e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 02:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707389903; x=1707994703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUJzDYVUY8Pgj6sj7mj4gZ0EMrX1aLG3gSh2cSQURAw=;
        b=nP+B2W6Y9CSNBEr+BnP0npn/yvJndSajM5K2lbjf1d2BLrnxR8V1TKgjjjGLiFf4Jy
         QnwYjko8Fta8vQoeJeMN21I+TRDc61mkCmRll1dlpeEQiBgQ0RXz4pyYIfCrlwa+qtoV
         7IzJCvY8T2gE0Hp9XFnS7nxgqKPbbgJCL3AzXxwC2ke23Nl3661icDZXUbccLawn+aIM
         ILDWgR0jVSvZcMQy0mpAdrSZwNkESXM8WMva2cntPcLKt7YnylIob8c6iRevI9HYf13Y
         VY6arnNFD75QmaiYEDyJZw/E9va/E09GpPhxmO1lpNc92nIPeyiCHBKKo9x+FVYMMIjT
         n+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389903; x=1707994703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUJzDYVUY8Pgj6sj7mj4gZ0EMrX1aLG3gSh2cSQURAw=;
        b=V7NUtwg9GQIrdGtGX7ixsU4NjmmeHYcKNDVqGhwM7Br0VxhPLb7go3hO2WkEB9Qw2M
         NMsawezYVvEVBc2R7Q+VAK+tDk7kiH17elRmvUwRcIQU/1zVhEoQDQ3RKpahoWGBLyuj
         aowTqRprytWxL8pjT5/U7DKPQRxR9rChKbkRmjjucU847CgrLSSM01dQdxt5ryN4On37
         +tE7Av2vnQnzUHignPRPBe46PUbfoBzbj3PuFT0voVvUHnKccmMgTmm0wYEoVOw03O3U
         nCnUhA0WiG6/aQsy424R3YuVYgWSA6ifpsI2JKIylzf7b+c4kdIuQqKMRCp7h0jQWrQx
         yLbg==
X-Gm-Message-State: AOJu0YyVzeDfAbfwrrBcfbSExk/kSPfvkJHcEKIqKw19QGnoOJd5EDnr
	eaE0/xvV9ATJTpzIJ7m61vUrhKXWXCcfC7+Hfm1E/NGbj1357iodOorHPpJgjxRu4Q5HYzsfjHz
	4
X-Google-Smtp-Source: AGHT+IEww1iqqyP4DIBybyp3NsKiGjG6e8Byuw7mujtspkeaGE/O0wJ1dQLvW7bcKiMSOLBXFM1I6Q==
X-Received: by 2002:a05:600c:68c8:b0:40f:ddb8:c854 with SMTP id jd8-20020a05600c68c800b0040fddb8c854mr6126526wmb.28.1707389903111;
        Thu, 08 Feb 2024 02:58:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi8c7Mg34IHZ8ix/mGLlRSEX7OtotNMwOELXd/6BdKlAO5TWQqgIV1zUKyS+f3lMIXYY7WvpSvc7JKxro/Hs3T+1eF5a6cV4lmL1uSRVNS7Q2Ho3jglqzq6BgOE8NCsbVKrUHuDhMzoAgHejx7l1NEtnVR8BNn7r2omljjCfT+RF0RIfkXZoxxmJxU1Q1Z5yh8A/8U3mj/j+ar62KzJ1MDCRIg2it+mYKyI3IPU6BCuUM0IcIEg42lMDhKE6PRJzKwJyda6BE4x8z3IQBvo//iyhQyzSoFAz+mbLlfbvu1dJztJ0zLLLF3PpxWCXwfL6bds49V7OQQOCmkapKVnh+MQhH1ovd9epedBzSvNQGrWXL/8kgX4uTd253WZp34Hh8mNbeEBtAOP76d15I0XzZrRLcH221pNfhk2UqTaxB8mmnklkM4Vp297FsbWFqZ6cDIrXJRHBqG2s22g1jaPTm1vCOjj2Zu5a74F6mwDrOGKEnpShyMURrsgvTQYn1kPgABvryRauqOzg==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id a6-20020adffac6000000b0033b4a52bfbfsm3344153wrs.57.2024.02.08.02.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:58:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 1/9] watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
Date: Thu,  8 Feb 2024 12:58:09 +0200
Message-Id: <20240208105817.2619703-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt driver is used only by ARCH_RZG2L and ARCH_R9A09G011
micro-architectures of Renesas. Thus, limit it's usage only to these.

Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none; this patch is introduced in v4

 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7d22051b15a2..f6cb63a0d889 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -910,7 +910,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2



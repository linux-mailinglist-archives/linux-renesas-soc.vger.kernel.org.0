Return-Path: <linux-renesas-soc+bounces-4447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7B89F8AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 15:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62570282A98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 13:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4675F16E87F;
	Wed, 10 Apr 2024 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bLpduocW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5824B16DEDE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756469; cv=none; b=ow5dvPmjnOrmGQWTPYuM2Zb6d8qGw8Axp7ZYnJn7aaBmd2M6sar03IFBMDMf3kMMkO9M2IozyFFoUeEuCbYbosjYxnqgXg/yLTAmx7AMIWzUNqSeXEepmioCpIOX+xNaCocXcd479WAPeL2Uxxh7WQjhrL+HCuF8qY8p97zfiPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756469; c=relaxed/simple;
	bh=AHg4r1igOHQ/H9MTzUFzqv2TctQMmFdO0mNsX/ev1eE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HbmV96i7M7d+S/ZJ4TPMyuW7/m1AxbTN0ARybDAWvN29Rh2EbFAa4zePGJbRUhEVu45u60Qdcw/K4Y1T0CdJB8PFmg0IE+4J+K01vEoAl4kS4NiDNWMR3ElYFRIWGdiDxM9RWLShd687fX+YbYPVCXd4aiqzotjtmX6j+2/79f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bLpduocW; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so80218301fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756465; x=1713361265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+lvKNL9MEQ6OHHG/4yYF9MfyhojBLzLY7o7MaWIK6A=;
        b=bLpduocW3SOZfigBjW9eI9gwZU75N7BWshSqBBh7X6azWnkDPhW0+53QKvOtKIXH5c
         XCWFi11lJI2rjzHy1TULTxqkhxIxKWxtGZXUap9aqtJ8Ql8s3gm+q1StobHoDu1gf++q
         BXBw+DSwzW+Gf6NMBPEoAzyQpNOKcRSyRuvC0FhD/e1TO3oPczl6rYYce6O9Eq2AHp6J
         8xYll2OnYuBQteynP/OGF1iwFNJMWj8TLx+kTLu35A/ZI3pQ4fbgiOlfws4Zb8LWhOzu
         SKl/2cAIr910zB/xfl4mtGPB/wgpkSHpKXFEsGLK8E9nYyhDAF544rBysUexGDbgwfXX
         u+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756465; x=1713361265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+lvKNL9MEQ6OHHG/4yYF9MfyhojBLzLY7o7MaWIK6A=;
        b=S+VaFo9q9Tpj/QfeStCp9nWF0d9HunWGIruI/CwRXE0bHrzDD4fIj90zoKVoDT3wl0
         U0aYMZmB4jh2U1cyF7yFz3mCB51hd/V8Np1Lk+nJobyw5IuFshDh8VcHiy8EKw+COLNN
         QwSid1OV28AbHOkHCOl2GTW3GgSbacHYr3v1ij8vNKF7o71ZixVQxQdVahViJQQS3c9X
         01bygczjIThTlC1QzmFmoqHXFWYs6SETiigQCIh3ITb5hu2uMddPtLVCMcoLpiuAeh49
         8nECrmIyJJFit0xZvUkdrmxjtbPI9p774ozSZdr2M8PLEWAXoWQObqOlvUAz+KSj9z+O
         b7uw==
X-Forwarded-Encrypted: i=1; AJvYcCWRI1LkboLPMAy7I8k9Ua/A69c0CIfj9CiE15MMuIzeTAkQB7HWaCEUElo63urgx4ixN6lvusoqnc8jrt5fnW7gEO+bY1sL1bHCSwNRQYSE95U=
X-Gm-Message-State: AOJu0YywlwqfENkl3+heeweFkVPp/XULra980XhRVWCUAPRoUPh+rsjA
	dr1GrF1Wboz07A103tX4ZKwMTCp8LZyEZTfsRugGi4E3kbBcIGx34wc5zjA6gmE=
X-Google-Smtp-Source: AGHT+IFYbRQ4lnDwqKIuup0OKWbE7mK3L/xVYd+kGdrzWnCZWAoH2Gm8LU9jCLdNJsOSjtPrTAQ8wA==
X-Received: by 2002:a05:651c:8b:b0:2d8:3eaf:86d2 with SMTP id 11-20020a05651c008b00b002d83eaf86d2mr2127105ljq.47.1712756465419;
        Wed, 10 Apr 2024 06:41:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:04 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
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
Subject: [PATCH RESEND v8 01/10] watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
Date: Wed, 10 Apr 2024 16:40:35 +0300
Message-Id: <20240410134044.2138310-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none; this patch is introduced in v4

 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 6bee137cfbe0..e2439967417a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -920,7 +920,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2



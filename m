Return-Path: <linux-renesas-soc+bounces-2837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F059585655E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 15:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBA81C23686
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 14:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1720A13246B;
	Thu, 15 Feb 2024 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NeAhvv37"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9DD131E4B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006137; cv=none; b=RhmImL4XtLfShza01VRj0JnPeH0ySbcvmW4r7r7bhisLGYE3C2DFSb7i3mLmlJz3/6Ux7IxGjifHNW8xighmIzOY4JTmBq97R9wvz9csl1BOg8tcMeiAz0FFNPUKsLLgEq+g84OBYmaR3wjsqhcUit9ETOQJaFo+DSjCEC+PKLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006137; c=relaxed/simple;
	bh=PiBNBbw25q+v4bUnUd4r2iTh5pT2QFis1M2ZPr8jCPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PX6gcH+Td0AYtuYxdOMvlP/dkmMaDrhjUXIxf/ms/D08cFxvavjPX/Bax88B3locFiZdGEHQSwry4gmn9H5M1F3R7ZzQBkVVWQ5QN7e1Ql9QfSw5Kyb83xfOvDrmKIJJQa08+flbep2PVIF3hsnoI17+fzrY7EB2P3D+TFun0Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NeAhvv37; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4122acb7e56so2154715e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006133; x=1708610933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdEY1bJU0PCtz4SwLFjp8WXUERePjgyQ1aqI/SAhvgU=;
        b=NeAhvv37VL+vkvn/JD+XqXXDTviR71ZQYllvY3uCAZphd/vn9zK4+R9IO4QbZxkWQ/
         k6EKXzeGTRAarL+LISLSr8EmEgBFj9vtGQFvP03Z/0NpJ9usU+SsaeggqyzA9ql/OCci
         DKkixL5GxMaGRPBM+HK5onrBDFxaNnDSHCYaublH3LS8dq+DntnJI14MgIC3NKnqHO1a
         q8vFji0S9Dai4Ln6s6XXCFelJnRUs330tbOQPeybV/KFLNZLaa+Hi9/8ckRidN18WLTh
         D1m9fUPE19cfX1q7kYvED0kTu66HVwoXsUf6DjJz22gZe7ukb/fA6JyJTW45TZ97s52X
         sh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006133; x=1708610933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdEY1bJU0PCtz4SwLFjp8WXUERePjgyQ1aqI/SAhvgU=;
        b=qgcOsr0o+XPPiS6XHd7hP7Vg+Y/7HlwVrLTRo+JkEyfW7CRpr0bxaI8x083wrEO/xE
         YqsnO7lGB31QId5T/ZuowPDx6Lw5jyki8JwyZqf90qUGPSsJdOVYCKJ6+0OhPcnRuKlP
         VOW0UUeHm6oT6pWPbzYKp1xcCgEASf3SphzaDV2DfANHFBdCv4ZflQJuWcT7WVBvjLA6
         fEMMSii7ALuScicCbiHVHn68gppcYIKo1nV+JR7r6FUPDuWqi41K+37TUEiWqSHdV3Qs
         +oJto03O0Ff36Z2zcETOjUxafpQNl7ESol3rF04N/I/NT5SQMHjiViyBV8Rh+C+8gY33
         ZBYg==
X-Forwarded-Encrypted: i=1; AJvYcCVEIDe5islpr48T5xbDHuyMvMutlXc1rvobML9bi4cBag5ZCtuLyc8ruiEgw8iwXHBQ/OKgm9wvxUmWw0yNJDuTXhOA78YWXwgi3WsvNb6Bcvw=
X-Gm-Message-State: AOJu0Yw+gAU9qGbfTd/XvT2IOMMfzpNnw44z6S992T3TGTG4RuS+koYS
	BDupWBn9JlHkCD6I+SEwQMLBlXZ5HumJA4CR34NUC6KJk0hqwHt0g2JK0ajE7Kw=
X-Google-Smtp-Source: AGHT+IF3AOeMhenbF5cV+9smoAlk3/5t8os0VHvo/WOcaUzNhe50dXel72ETmgnCHRS43Th3tLqYyw==
X-Received: by 2002:a05:600c:4f42:b0:412:6b9:2763 with SMTP id m2-20020a05600c4f4200b0041206b92763mr1459721wmq.21.1708006133489;
        Thu, 15 Feb 2024 06:08:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:08:52 -0800 (PST)
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
Subject: [PATCH v7 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Date: Thu, 15 Feb 2024 16:08:34 +0200
Message-Id: <20240215140841.2278657-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
clocks are enabled though pm_runtime_* specific APIs). To avoid building
a driver that doesn't work make explicit the dependency on CONFIG_PM.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- updated the dependency to PM || COMPILE_TEST to be able to
  compile-test the driver when compiling for a
  !(ARCH_RZG2L || ARCH_R9A09G011) platform and CONFIG_PM is disabled

Changes in v6:
- update patch description
- fixed the dependency on COMPILE_TEST previously introduced

Changes in v5:
- updated patch description
- added on a new line the dependency on PM and COMPILE_TEST

Changes in v4:
- s/ARCH_RENESAS/ARCH_RZG2L || ARCH_R9A09G011 due to patch 1/9

Changes in v3:
- make driver depend on PM; with that the "unmet direct dependency"
  Reported-by: kernel test robot <lkp@intel.com>
  was also fixed
- adapt commit message

Changes in v2:
- this patch is new

 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bdd1527bb916..cd2e29da7a54 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -922,6 +922,7 @@ config RENESAS_RZN1WDT
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
+	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2



Return-Path: <linux-renesas-soc+bounces-5742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7908D5AF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 08:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9D4285486
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 06:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CE481745;
	Fri, 31 May 2024 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="b3npg3Q5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E580C1F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 May 2024 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138674; cv=none; b=O8fmlavONR/nm0FVIjUeVbKSCHh+RBXqFOiGiomIbXkqfv6ser5HIcA14NKHkm0NKVmu/pjYCBclqeRgM1EOgppxszN4yoMbMUEEyydC5Gm8GKNEH7oKfzwmiRDyJzKK4tD06js7DI64x2Pddzx3uWtugAYkO730IsCbR3JAGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138674; c=relaxed/simple;
	bh=GuICZzQNErHvuG2P1OP6ZysijVVwTxA/SYYbpm8UHrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TjAQUU9gl3nuJxE0sEXucZJR/wllYRvJzaS9OQa34gjsI/uCo9kryssdwoPBGx5L5//7nN//qoN7U0zMYNi4UfW8/2mux5GLsXSMR3RBQclQOS0w43mEuA34STl2LtKPMF/5LdQT+Gjl2JlSU25j3li58C7vsU7ZwrcfIZlFGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=b3npg3Q5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6267778b3aso135641766b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138671; x=1717743471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eQAiMDX1+Kg2KUabFIpayCevJwzqOIZx5xL/Lss4a0=;
        b=b3npg3Q5qIO4eDJ2AchQCsa2o+utMNdr8J/DXWu7jb3/PPRAgTkbtgmnR0X7z0NC5/
         WvFa+Tlh/IhS2ZXwvLUwVqmJou6psSAXp4ygW+68l9ejIg/Qr7rS80D0tadbYB8yQQ/7
         I3qMD9sR7eReFR69cTJiNZhhpATzHl6pczEDFlVqSYAn36g8PWdl9zmNuTb0yWhhQ3wd
         QN9Oa0ecuS6k2jiWV+Opsn7tPm9YblPagX1Z48wibY6ICuAD7lF+l0XGuLhWxMtIhMTy
         41rcsK5EGJyOHrnGPHVmXMRXkDr8UxF38NTXkEn1IM0wLdXuSCR3iYYw1TiIB5lHYtYG
         SxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138671; x=1717743471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eQAiMDX1+Kg2KUabFIpayCevJwzqOIZx5xL/Lss4a0=;
        b=aR1eFlvfwOMJJM5B/0a1hBOXcjMcsX0uaARpPvx0l3nTV0G9sJlkJDajlv+/r/G8Ev
         EeK8qf7IFB+l+HPzZSSIPDw7eFuc+i2RVNHbah1CrKFGCzb5WXDyBXB1cF4/xRZ8+ri7
         ZA8bGB41zEjt0cnQIApDWrcP9zoCg83WsmAFJzUvqe8u81map3aT7aOmxXecrceVNhD1
         9L4iZWH39HeLrd+D6qFWjH68vywlUC0r9J7iXCDffPYtVU5NCgedzATCuLvzT8k51Ld3
         SXcO/L6fce3CPXp8dNUw1iclZOOmllrXtZ3zA/XBa774XRKmzr58RuX+yPYYB0Zac1Jt
         0Zjg==
X-Forwarded-Encrypted: i=1; AJvYcCUPm/To//V0ZF4t0BdbE//rLkSLPS6fdzT7CjK2C9SJypX708Ta05kSqIS/ytIdvzTy3s6QVcnR65JwlHdkqHElDtEARC0wn33SOF6vnYb5P08=
X-Gm-Message-State: AOJu0YyBXHW1QFYHk/9EL/Tus47VApaRcIoUVrHAM+QFjRWsVrCH1Rnv
	wJL0qrFgdB0rPWsCOe+9UgpFPSeF+32jADAkm/hCLzFmCqaUl2YPyYKWzh6YKCk=
X-Google-Smtp-Source: AGHT+IGSk70NB0y9kgfKXS+hqZbQ9AuxtHO2HT7L4I0+tcaJ+ORAwou2TNvbZ0iFs3nHKTNiXBfskg==
X-Received: by 2002:a17:906:3b9b:b0:a66:ebc8:ad2c with SMTP id a640c23a62f3a-a68208f10d4mr65313066b.42.1717138671087;
        Thu, 30 May 2024 23:57:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:57:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v9 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Date: Fri, 31 May 2024 09:57:16 +0300
Message-Id: <20240531065723.1085423-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v9:
- collected Guenter's Rb tag

Changes in v8:
- collected tags

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
Closes: https://lore.kernel.org/linux-devicetree/202402020445.TOBlFPcS-lkp@intel.com
  was also fixed
- adapt commit message

Changes in v2:
- this patch is new

 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ecd025dd0fef..20c5f4a6f30d 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -933,6 +933,7 @@ config RENESAS_RZN1WDT
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
+	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2



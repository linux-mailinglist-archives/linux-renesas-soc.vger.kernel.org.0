Return-Path: <linux-renesas-soc+bounces-5741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 269698D5AEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 08:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64E6EB249CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 06:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9F780BFF;
	Fri, 31 May 2024 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y1gdKvd3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191318061C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 May 2024 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138672; cv=none; b=pKCejUDlTO9NZDGm880x5OoePV6cRetWt3VuK+ySYtwwLVktR+GQwo225Kda0VdfXBlR0M2lwY0yTgpkEGPfbZuJP+JbVWJtL32idZ8kRPqPHciFHmftT9glnyxHyjPlHdif5QFiyp2y/k1zdlHfbEL83NzoviSI0TEJU+S772M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138672; c=relaxed/simple;
	bh=KgMx0i8jbWHauAAxmwUFPZ7zQN5X1U/Huq+oKN2DlV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lSNr4ELy6Wnjq5PovJ21VHm3NZouWCpMKQ8IzJhoBfWWtDLgC0s7P3a7hdwCAMjiHAsLeDmXI7sVSYrQ242VqXV0tfh7t7PSCtYtOY4LShKwMOGBOaIM7UVUnJdsmXdReSBj80bRiAtI7s9prKB9lrhWfWIhxOcmvXUHaWS9gHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Y1gdKvd3; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6858bdc9ddso25420866b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 23:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138667; x=1717743467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56EGmWH9L29k/ghjMWDXEhOzEmTvPfbWJTBIWdqS0Ww=;
        b=Y1gdKvd3O1JF2c5uXFqsUwH4RcyRJyHJBx88w+lKFm+YaXUsGvN94hDFjgbA5YgWuG
         HXPZh8xErNOBiIV3/HHqClsYPxlqDmCwYHpUPE5L1KiA6gBO6up+Y4tpXEL2QQ9pHNgS
         Hkp/Jehk6ZLqQniuSnZ0++7nVMHMLMDYgwrhrlhWEIB3PZv4zqeW+h5tsdYU31DimZYv
         WvYJm/7yNxjvwsdBYh97/ki4d5D58Bk5sN7Pn/eRDLu4JCfS7qqmMSuD9PAgwKQJ70KL
         NHZ9vFJ/k5C+IupHH3ajrcOkWOXatK2YLeJzseaI8rOyVd0fhBzqxRkSBWBhUdlbUAiP
         1PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138667; x=1717743467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56EGmWH9L29k/ghjMWDXEhOzEmTvPfbWJTBIWdqS0Ww=;
        b=JZmmG8n5ibey6ugWzJHMew83vG/Fn+ounSKnNxsLZIaLA41lIZD95vomV6eOzww6or
         XkVGbKbsEV0V++CfazqcFiDTh0aasO7D3oJKRZeNtGlPrJUhycE0uaYhVwQACcxXg3Bf
         kT2fb93VgPSe6psA1MeSUYsol2Doj3QvoxbmM0qZuTW5QAvciRhMQWAWx059KgH+Rz+V
         fkArrZQ22x2mD/8zqg+XGid+CJQTy8fU1AJl1QXk903SqQ9C2cLDFI6iInY+HtRxK20r
         XPoUGeICvdVyitlejXET3eABNOSm/5Lf/RX1+P5/GNy98CCBysiEjCJWw67W4UvYr6yW
         DblQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEl3BOcXz8TOrQcxC+2qhmyAsxdKRIsVWpoUNi6qIrIhqbp+eOaW6NmXHLDVXLFodwOkHXkcjisu8NoFA5HIY8q8mvoxRh8Vi1td8X0hdHcV0=
X-Gm-Message-State: AOJu0Yy+lOmPCF4b0uTxxdnxYrYcSk50D73mLbF8ernEXJKD7JnM5JBH
	Ha0sxAyB9zFLq2eP/xxpXLE/KyYLULAidYkjzrKDj0cvZDqaEx2fRblhtBvTf0g=
X-Google-Smtp-Source: AGHT+IFTaU3QXdFC/RjWg9XdH4ZV+nNRXlq3bOCRsJk8YyatlQCsixKO9wvoexCAIuImUNlIrXnzOA==
X-Received: by 2002:a17:906:2409:b0:a68:892c:ae22 with SMTP id a640c23a62f3a-a68892cc8c8mr19727266b.40.1717138667289;
        Thu, 30 May 2024 23:57:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:57:46 -0700 (PDT)
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
	claudiu.beznea.uj@bp.renesas.com
Subject: [PATCH v9 0/9] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Fri, 31 May 2024 09:57:14 +0300
Message-Id: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.

Patches do the following:
- patch 1/9 makes the driver depend on ARCH_RZG2L || ARCH_R9A09G011
- patch 2/9 makes the driver depend on PM
- patches 3-7/9 adds fixes and cleanups for the watchdog driver
- patch 8/9 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 9/9 documents the RZ/G3S support

Thank you,
Claudiu Beznea

Changes in v9:
- dropped patch "watchdog: rzg2l_wdt: Power on the PM domain in
  rzg2l_wdt_restart()" until further clarifications; this will not
  impact any behavior as the RZ/G3S power domain support is not
  instantiated
- on patch "watchdog: rzg2l_wdt: Remove reset de-assert from probe"
  call pm_runtime_put() in case the reset deassert fails

Changes in v8:
- added patch 9
- collected tags

Changes in v7:
- updated the dependency on patch 2/9

Changes in v6:
- update patch 2/9 description
- fixed the dependency on COMPILE_TEST previously introduced in patch
  2/9

Changes in v5:
- updated description of patch 2/9
- simplify the code in patch 2/9 by using on a new line:
  depends on PM || COMPILE_TEST

Changes in v4:
- added patch "watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
  ARCH_R9A09G011"
- collected tags

Changes in v3:
- make driver depend on PM not select it
- drop patches already accepted (patches 1, 10, 11 from v2)
- re-arranged the tags in patch 8/8 as they were messed by b4 am/shazam

Changes in v2:
- added patch "watchdog: rzg2l_wdt: Select PM"
- propagate the return status of rzg2l_wdt_start() to it's callers
  in patch "watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()" 
- propagate the return status of rzg2l_wdt_stop() to it's callers
  in patch "watchdog: rzg2l_wdt: Check return status of pm_runtime_put()" 
- removed pm_ptr() from patch "watchdog: rzg2l_wdt: Add suspend/resume support"
- s/G2UL/G2L in patch "dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support"
- collected tags

Claudiu Beznea (9):
  watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
    ARCH_R9A09G011
  watchdog: rzg2l_wdt: Make the driver depend on PM
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert from probe
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 drivers/watchdog/Kconfig                      |   3 +-
 drivers/watchdog/rzg2l_wdt.c                  | 113 ++++++++++--------
 3 files changed, 66 insertions(+), 51 deletions(-)

-- 
2.39.2



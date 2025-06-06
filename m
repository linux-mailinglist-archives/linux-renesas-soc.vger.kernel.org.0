Return-Path: <linux-renesas-soc+bounces-17887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89761AD011B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 13:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17D30189978A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 11:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D992874ED;
	Fri,  6 Jun 2025 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GKuliRjh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC62853EE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Jun 2025 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208681; cv=none; b=AVHGxXHHUTpVZhDbKgWTMUs4XcMbZxrbBj3+tEAyJRtFj4ywHJZ+NfaHqBE/gOqES858IV0HoYGvyczS5QsGd60j5DqPZY34Jx7pIzO2rYStClG2FLiYA98QjYbvGuOM/4Kd/lQ8K7t/WbUYO2llm3Sf8p3DEbHnT328KDwu9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208681; c=relaxed/simple;
	bh=xqceFklevNKHrB4ZeBPwo3lRayjsO/IEtbJhI2UtAgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUVntvhaz5IprJm8Q4jFSgfKrdSMexM/3Z0xWSXa13rcXDrvEIQmhK0baT9tv++uybr5TAM2VCtigymiZFZsOx30nWH/voQDCrd09crWk+MaVQg3y3pI2UjGNWuOjf79guBecidhklSpW0byYwtoobc6AiHRF0so5pya7XYCGLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GKuliRjh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad574992fcaso325195666b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jun 2025 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749208677; x=1749813477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Do+QkiJD6NZpQLNVX8MWxR+5B4FmjG9ealql6MxkGsQ=;
        b=GKuliRjh/3XQYYGRR4O1FIoUa7x4jjtwAglDorwOy/82DyRUFU+vIAL+r/bcUtL7Fn
         o3xuR1836fE3oss3v/3J1qAJZon4UHZCazi0vfZtRo2C5iYX55uDuV0+2zOX8Y41rKlQ
         iU7C9VKz1HxQJo3Evfec/iRDbs7RUOkjBr5e9U4+dSgvL2awhD5MIFDcXwIByUshzBVb
         NrozqBNUi7igNkxzizL3+wOW+uQWlasOeDNG1O6LyaKUUXZoX2DK8+qCMn7CYPFYP6Jt
         +2U1rIW7Srsjd2HxJmLwzuy+Uzf3//hne1ChpqDtlgXfUryqDp+lFO8Vf756/eM3xKCE
         ffzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749208677; x=1749813477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Do+QkiJD6NZpQLNVX8MWxR+5B4FmjG9ealql6MxkGsQ=;
        b=i04VCygyxP+OSAUHkeM+2WwhqakFoU7VD25qJMsMA1Ub2HoclqXfnzh2u3Q7SZMGxN
         /VoFJTuuHfOyNDbmh5hY38/SWGTrCcIjtVEvhj1GqFBBOs0q4/U3MVSHSEirXGLs2E8Q
         oricbz8kHfgrIBYAeML2oZU80hhRgrR/OD2RpvnPqubLW+kaluS2Zz5v/WH0t5jpIvAl
         B2D+Zg/SvdRaVfRc++ZsZ9JAMM2pWmj/uBa08N85gtkjgYj5HM8HFLzyFCHJIYmrskL7
         kY93RMylL3fE+IonFpRlRlM07JKLv/RPUfj45K1vOu0Im//bVVl4i9Pm+QGoQNpFHhX/
         aH0w==
X-Forwarded-Encrypted: i=1; AJvYcCVXYe0IujSGOBHnRE4pA15wmXw/hq+dppb/80Zycz64HK+WaySdUoVA2dgDLsQQSnTy2EgEt9Xu9oHat2gGROdvDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmN49E7hAX/I12D3n2fIaEvajK8+QpIybRXUww/PStOaLlV7m
	tE9/wjI9YqvY6vh596FmA7LB7rd7qQireNQy294dF4JnN8EG+hfIRaQmgmPYZ64ocFY=
X-Gm-Gg: ASbGncsgvyQfWxK8aLNhp3pSbCUB1KTzJXk/vZR2loqcHcVPVPDbpce7fPL5tKZnr8U
	x/tzPeFNXJyFNhmlyZqNDOCcXJmRgJWze0/Gy4j/cpw05NyDCiRPWbPfO/kK87j5TxpnbbX9Laz
	AKlsxGd7mjBBUJW7nricksKTWXEbJ8bqF+2fCwT4ozesJ9aQu/Lb6NB7z10Hav+Mgg3sdhdonf7
	GKlegfFjq8yfDn9xnfR6nvaqtwCvC7twO8sRCFhJH3xVG3Om70T88Obj795eXCIWKBzK8jdEoZT
	vJgy9qG8bKGqeb4k3VuvMTWKGD5RgKYs2232Wk2hywvqvKV5kwkHA9iMAShNw1FXACY8wuogsyk
	G78dgyxm8q1NaQXuS
X-Google-Smtp-Source: AGHT+IHWDvzZ+cK5XGmhp46aq4fLVkiHMu9QfV5rZevpbF7hqhSG/HrvSR909QCTjWOMJuFnjrtBHw==
X-Received: by 2002:a17:906:c14f:b0:ad5:55db:e40d with SMTP id a640c23a62f3a-ade1a978c16mr236485566b.34.1749208677061;
        Fri, 06 Jun 2025 04:17:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b566sm98704566b.164.2025.06.06.04.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:17:56 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/2] PM: domains: add devm_pm_domain_attach()
Date: Fri,  6 Jun 2025 14:17:47 +0300
Message-ID: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

As a result of discussion at [1], series adds the devm_pm_domain_attach()
and uses it in platform bus probe.

Please provide your feedback.

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com

Changes in v3:
- dropped the detach_power_off argument of devm_pm_domain_attach()
- use a single cleanup function
- fixed build warning

Changes in v2:
- add devm_pm_domain_attach()
- drop the devres grup open/close approach and use the newly added
  devm_pm_domain_attach()

Claudiu Beznea (2):
  PM: domains: Add devres variant for dev_pm_domain_attach()
  driver core: platform: Use devm_pm_domain_attach()

 drivers/base/platform.c     |  8 ++----
 drivers/base/power/common.c | 50 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  6 +++++
 3 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.43.0



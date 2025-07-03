Return-Path: <linux-renesas-soc+bounces-19084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6074AF7217
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 13:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C28F4E7D5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1552E339E;
	Thu,  3 Jul 2025 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l5K7sn4a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5E2DE6E2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542069; cv=none; b=WwLU8NWvGlvxq/VFiWZlLPdYwmUINjtELTtiZlwg9B/d37mIsBM7VWxdYWOr1QTrKDXZrLzC7skfU9j8sQrPUCjRw6ZbKL+kfAzPxSnRL10gD3yJrgwY/pWWKvve7/XCiT/BzlsBF5TkjaY9jEI4YEpSx6wlkVktE1s6lH7xwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542069; c=relaxed/simple;
	bh=UlZ75WOORNs4rZE+VlImTZa7mmm9FlJ031wXRJuG6f8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFBL1e6JPpp1OSkf1PWSUuWy/vrziYuemZKkq0cMRrHRcZO6DISs0BgyWIDYDBQ2Csk1FIXAhS7Dn4f3Wf6EhdEni/KY+p+CyGDZj84EQkP1HOfuKaxR/KHdD+ruBWEdknjbVc7mKS4Ycr51r02YqMBrSENfADXDOcDpmTHEaSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l5K7sn4a; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso9581402a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Jul 2025 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751542064; x=1752146864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6PMMz69qo04D/YT8nX2dE04S7ELr0QnXwz/uN4j+eI=;
        b=l5K7sn4an49hXSu3he2pRlapXvTrBiKvj+FIVPQKXU0QKgqq1ZePud52ttkBScRteZ
         KXf07vm94x6m/BCztn7+b1NfXByAPNtaOF4WgW5PRybd5ZcHmex4Qgt9l4IwyUsdlDQp
         fwrS0yw5nXaNTPLpAayTRgR3ARnJxCT3ug7Jtj3/o1ygmMbAMt1cub+cJjOjfZtVFKLA
         AeQxIDhtiB6JitMDJmtj8b24mgQ6rHhLiyCKZtE4/9ZRKv4yIc9UK9zd2d3MgYY4WYIH
         RANXc/agfr78NopjZLE6iJZab7To9BS5wWfsMRK/k66/NLaCdnY4/rrqvUrIfU8JHFHV
         odJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542064; x=1752146864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6PMMz69qo04D/YT8nX2dE04S7ELr0QnXwz/uN4j+eI=;
        b=TTEFxKEk96//2rhGVk3CppS4K2ySBgG2LnjJvghFvmpYTA9GKRGpMtuHCGhAxK0OVe
         ZA1vZP6jqILC849JB7+Pn92CORWjvbSqeyn2socjw4hw0i14H4zY+T78niv3kF0u487M
         39HM0O6qnG9fw2E7lSJ2Kmm6olV3isY7ehIfqoDzhj4C4LxsOLdm/eBEX8Nnx4lm0EOM
         Cgb353Orv4gStAga1ms1DX74N74nwILSk/lQtEeSJze98hCoFp0XKcTgpq28X1Q5ndhB
         N9PNUhUotH03QLTUUaFlGNG3frT/ibY/VGq5mzlFHraU7ft3MPSPECVKjyaHR8m3l8iP
         cWDA==
X-Forwarded-Encrypted: i=1; AJvYcCWupCV0b5S+zP3f2RTz7rbLJwK7G8shiQ8KusR4ON3DlNtwkmdYds1r/vzvMUVfqWy6LCE35Q5d2Q897gc32bH2Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYQQEYPBrCGhAzTOyIZrzO+X5mCo+UozB98h4euSK/Tg1zxdy
	yIBGeY2Tgwe2AjViD6x/0Tg6c6zIPMbDA6+9zkW+iPMkd3XTpV7vheYpWdczKi7rqIs=
X-Gm-Gg: ASbGncv1au7MmMLJ+1L+RI6kvzPce3T8YLosxYhfOYqzzyhb1z42gBxbFLabawYzpHj
	Ac37XtZCeKm5XOXHdZcPwLVeDtRxUQM5G+rl+FQXFO1locKd+CvLl8PEoiN6DTRxzj7JtILCrwW
	WDsaxhT5cKO6U4dsFe5j4IJA4u7cPLvm4wGVWJ0mTTby87/cMUwLsytN3ZOI5pNYpa2hcwO3dnp
	0FmwzlxiGWiEBJ63WSqV3rtDhMNEH6Db4OJsLm5i+zRJiRZ/dd1AZvBMGmHNzaBzOgYeLfRu4lE
	Gyzdzj75NuC9EenqMl4IF7pnssJz8DqGTSUst8YfTwvjJy4tGkgC1Rv+EUh7C5NG9iYeobhl44q
	Te8wXy63ZFkXmPfo=
X-Google-Smtp-Source: AGHT+IGodommfjTvSu9SmK2+f27lr5klD7Mc1oDRjQm+BoxfNtWb86krYFjqI4yPBXvjQSq606lSUA==
X-Received: by 2002:a17:907:2d94:b0:ae3:6744:3661 with SMTP id a640c23a62f3a-ae3c2da6359mr600970466b.44.1751542064239;
        Thu, 03 Jul 2025 04:27:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a75fsm1247016966b.67.2025.07.03.04.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:27:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: linux@armlinux.org.uk,
	gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	mathieu.poirier@linaro.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	robh@kernel.org,
	jirislaby@kernel.org,
	saravanak@google.com,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
Date: Thu,  3 Jul 2025 14:27:05 +0300
Message-ID: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
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

Series drops the dev_pm_domain_detach() from platform bus remove and
adds it in device_unbind_cleanup() to avoid runtime resumming the device
after it was detached from its PM domain.

Please provide your feedback.

Thank you,
Claudiu

Changes in v5:
- added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
  due to this a new patch was introduced
  "PM: domains: Add flags to specify power on attach/detach"

Changes in v4:
- added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
  and used in device_unbind_cleanup()

Changes in v3:
- add devm_pm_domain_attach()

Changes in v2:
- dropped the devres group open/close approach and use
  devm_pm_domain_attach()
- adjusted patch description to reflect the new approach


Claudiu Beznea (3):
  PM: domains: Add flags to specify power on attach/detach
  PM: domains: Detach on device_unbind_cleanup()
  driver core: platform: Drop dev_pm_domain_detach() call

 drivers/amba/bus.c                       |  4 ++--
 drivers/base/auxiliary.c                 |  2 +-
 drivers/base/dd.c                        |  2 ++
 drivers/base/platform.c                  |  9 +++------
 drivers/base/power/common.c              |  9 ++++++---
 drivers/clk/qcom/apcs-sdx55.c            |  2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
 drivers/i2c/i2c-core-base.c              |  2 +-
 drivers/mmc/core/sdio_bus.c              |  2 +-
 drivers/rpmsg/rpmsg_core.c               |  2 +-
 drivers/soundwire/bus_type.c             |  2 +-
 drivers/spi/spi.c                        |  2 +-
 drivers/tty/serdev/core.c                |  2 +-
 include/linux/pm.h                       |  1 +
 include/linux/pm_domain.h                | 10 ++++++++--
 15 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.43.0



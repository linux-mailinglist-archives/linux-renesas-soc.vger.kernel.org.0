Return-Path: <linux-renesas-soc+bounces-18370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893DADB2B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 15:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142913AA8DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639302EACF3;
	Mon, 16 Jun 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oJblHrE0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B02DBF65
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082050; cv=none; b=H0fciJ3/TP2eiUMH7MHpIVRYBH1FtWFuQ1OTmFwAuTNQtybub2ws97WmHS8xn9zHxmwwLLfhs6964lvJnha/zNbPWCwb9Tun7acFt2xemqgMtha8McBHFDrtMQyspPJjDNRVor+s5l/0sZZdrWHU32xQ5QxQKyhwhdnA8FJZlCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082050; c=relaxed/simple;
	bh=svE4SC3yD2VAnnKLAHEVk4+ObXPQzJ7EyNDf5HiDErA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjyiPgWxQq15e83Z076rOYpJ52WEkBnCMdA99k2slCjCJvoMXxA4yaEJqjB54FXZWSPpzqWT9e+mSs1CE7Itxe1OUaboB7RYVrEIQpYKzfIzQqImEqoI7NfHtwfPEOnONxQz5C3VcUVnWp1eSqBpQGzfiNOQvDOcb2u/Vup/W/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oJblHrE0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so663883766b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750082046; x=1750686846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAqKBohHrckCHj00ka3d3qdcyCUEgzr5W/g9gAi10Ic=;
        b=oJblHrE0dxDgkvrwuLoUj7MscYK/lN4Wy0ENCc54gNgK8XQqJxDcVBvelrluiB7dDc
         lL1RVX2nw4Yi01NaSZYXPHV/J/9/Ld8WXkpY9ctuAkb9Oe5kuUqwmKrE0lk9R88lXZA0
         yhspxS0R4IXKVjKGpQeHToSAjt4zbQcXLeZ3/8DZ6ISlSlXO9MlnJ9ppjW9WT78b2ELk
         3WDM6Ol4qseltYTMB7S4c+BAp2OtTsqg0uXtc0U8tCcIu55JaUDy+Y0ak/7GPusntSgP
         qxK6zgVYRaRCeeiNpGrTJOYXb+fLDE8Az0jdn7+Pc0hIqttV/7e89V0eqoN7qDZbxmql
         s3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082046; x=1750686846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAqKBohHrckCHj00ka3d3qdcyCUEgzr5W/g9gAi10Ic=;
        b=krhYnQjEkjbl9PUytQsMFTik48fnOLXdqQIXCalDim+qhC8Uh0/9GgO3/ruPCHKT/9
         eu+pTH1QpzR3ck1cnDpKbq+mcYzkSeu5J1eHRpYuRfO9xXD2OWCSfs1GFr+VHlO24+Xc
         9IuExqXL1KttftHos0u4BupP/knVueBq2Sll7j+7THeLg8ujMGS0qwtZvzgtCd7HVW6y
         h1NQofv7q8v1NOkF8hUE9sNynbVLkdbAZVPBCr5zp4l0LH92FlfDBczccw2Mua8x26On
         R4GA7bCyj7dEl99U0YQV3BGsXkXem9IAXWahO04cDs0fE8+hMn6kdLq9JDAf2B56/ZGA
         wsrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpUoWH5e5pI5gxRD36UFTM/DdCMdFQkkQeOO6KpgZ8UMQWGxLTAhJq3k90Nc5fevDOj3urmclJWhguJO1iUKSTIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfcepfFkHlIRNGwHOhERFSUEC+La0mcXgcILTcR7YSk3N/GJCi
	zD76Fnoko3XOBSSROXT7339dEwG8CUrFLGb4luWLOmL11VAZU+ZMLV6w7tUQ2OF5nAM=
X-Gm-Gg: ASbGncv7fgwJJQlaWDEGrSsJN+gGB8BxglJGes+upFRyjbIyr85RWq0c1it/jGXHnmJ
	PnQASg0b6myyduhOFzRjFK4j1qKki3azHlfXSQNBIxa8xq7v0Ebmvj6L4Ol/XwSeGpbYy9cqXxG
	9r3FGyElliJxZHNteNA5cUsb6BZU33QDI0ec/DxILsTGQNV+jpTkOABMeaT8/nrKiR1ltLsiSI5
	6ixj92cEqr1w3JF0PGw7O8dcWGApeWU2jU+XZv8N/nmXSFgonVJu82JqPcdMfhcn4QW3q0tu2TM
	w6fH0AQa9/t/Kh/0bviGAzP1+Zo+Zoj0MyVrVKnVFDxgLli1x18TZIv20Nqg9EKV1ME2CQGz0gt
	L6nBue62q2XV40J7eJwoQM+L5tQI=
X-Google-Smtp-Source: AGHT+IFCJHnvPKhcZEL3g4P9u4AcKsSY9xIC+tFOuoZRzGgFqNWr1jYsO6WAV1vgDYbQrUc3qilD/A==
X-Received: by 2002:a17:907:7e8c:b0:ade:4121:8d3d with SMTP id a640c23a62f3a-adfad2a1e75mr997444066b.12.1750082046246;
        Mon, 16 Jun 2025 06:54:06 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897a70bsm662748966b.154.2025.06.16.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:54:05 -0700 (PDT)
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
Subject: [PATCH v4 1/2] PM: domains: Detach on device_unbind_cleanup()
Date: Mon, 16 Jun 2025 16:53:56 +0300
Message-ID: <20250616135357.3929441-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616135357.3929441-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250616135357.3929441-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The dev_pm_domain_attach() function is typically used in bus code alongside
dev_pm_domain_detach(), often following patterns like:

static int bus_probe(struct device *_dev)
{
    struct bus_driver *drv = to_bus_driver(dev->driver);
    struct bus_device *dev = to_bus_device(_dev);
    int ret;

    // ...

    ret = dev_pm_domain_attach(_dev, true);
    if (ret)
        return ret;

    if (drv->probe)
        ret = drv->probe(dev);

    // ...
}

static void bus_remove(struct device *_dev)
{
    struct bus_driver *drv = to_bus_driver(dev->driver);
    struct bus_device *dev = to_bus_device(_dev);

    if (drv->remove)
        drv->remove(dev);
    dev_pm_domain_detach(_dev);
}

When the driver's probe function uses devres-managed resources that depend
on the power domain state, those resources are released later during
device_unbind_cleanup().

Releasing devres-managed resources that depend on the power domain state
after detaching the device from its PM domain can cause failures.

For example, if the driver uses devm_pm_runtime_enable() in its probe
function, and the device's clocks are managed by the PM domain, then
during removal the runtime PM is disabled in device_unbind_cleanup() after
the clocks have been removed from the PM domain. It may happen that the
devm_pm_runtime_enable() action causes the device to be runtime-resumed.
If the driver specific runtime PM APIs access registers directly, this
will lead to accessing device registers without clocks being enabled.
Similar issues may occur with other devres actions that access device
registers.

Add detach_power_off member to struct dev_pm_info, to be used later in
device_unbind_cleanup() as the power_off argument for
dev_pm_domain_detach(). This is a preparatory step toward removing
dev_pm_domain_detach() calls from bus remove functions. Since the current
PM domain detach functions (genpd_dev_pm_detach() and acpi_dev_pm_detach())
already set dev->pm_domain = NULL, there should be no issues with bus
drivers that still call dev_pm_domain_detach() in their remove functions.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- save dev->power.detach_power_off in dev_pm_domain_attach() and use
  it in device_unbind_cleanup() when detaching
- adjusted patch description

Changes in v3:
- dropped devm_pm_domain_detach_off(), devm_pm_domain_detach_on()
  and use a single function devm_pm_domain_detach()

Changes in v2:
- none; this patch is new

 drivers/base/dd.c           | 2 ++
 drivers/base/power/common.c | 3 +++
 include/linux/pm.h          | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index b526e0e0f52d..13ab98e033ea 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -25,6 +25,7 @@
 #include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/async.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/slab.h>
@@ -552,6 +553,7 @@ static void device_unbind_cleanup(struct device *dev)
 	dev->dma_range_map = NULL;
 	device_set_driver(dev, NULL);
 	dev_set_drvdata(dev, NULL);
+	dev_pm_domain_detach(dev, dev->power.detach_power_off);
 	if (dev->pm_domain && dev->pm_domain->dismiss)
 		dev->pm_domain->dismiss(dev);
 	pm_runtime_reinit(dev);
diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index 781968a128ff..a8f302ed27a5 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -111,6 +111,9 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
 	if (!ret)
 		ret = genpd_dev_pm_attach(dev);
 
+	if (dev->pm_domain)
+		dev->power.detach_power_off = power_on;
+
 	return ret < 0 ? ret : 0;
 }
 EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
diff --git a/include/linux/pm.h b/include/linux/pm.h
index f0bd8fbae4f2..dcbe2c1ef59b 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -720,6 +720,7 @@ struct dev_pm_info {
 	struct pm_subsys_data	*subsys_data;  /* Owned by the subsystem. */
 	void (*set_latency_tolerance)(struct device *, s32);
 	struct dev_pm_qos	*qos;
+	bool			detach_power_off:1;
 };
 
 extern int dev_pm_get_subsys_data(struct device *dev);
-- 
2.43.0



Return-Path: <linux-renesas-soc+bounces-18371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD384ADB29E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 15:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B637C169918
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2072EBDCB;
	Mon, 16 Jun 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mJs5kc8D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500A2DF3F3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082051; cv=none; b=nbPgd3cgO+kD7DZ/+UYzUGJctzIGRe1v3o8al+37sH4Vv/2+DfyuEMx0ZfU3hwhEYS2vANuoLLEQW+pp+tviMgl2dIn3SPSgBR92g2awpS6pCWGOTDBLpj0KQrbpYLwrim+/1Sg8KCPtL2e3liOGt1quUx6Lro3whR+w1zpiPK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082051; c=relaxed/simple;
	bh=KPy0qoeJ/cuWg3FcjfVl4wS9jR9Yuixd3J4F+C/TP+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qc3Jy49/7eTCblJe97HZ2JsrmVPE6k8FHKr0nZ9YTX057QBiahh5+QeJXMALqqP1/y81zP6YsqmYh9nfHVHeqsPG/1wKYckpgAsVwaNiBYSXh1ZNl6hkJVxldkiAEc030vg8LkrIXUonFmiJme9mOOuFNNT7Os7zfGAoN19rlIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mJs5kc8D; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so897562166b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 06:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750082048; x=1750686848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+LFH2EJZ/euycVAsLwJhPX7xP3RrLri+PWxKx7UufA=;
        b=mJs5kc8DGArf70tD7LKTbk2Ch48YO19BuG6jqGQLEKfPMUgBoELXMEnEu8Fa3syHrh
         H/9ZVlHsa7iTsefFDIdNsb4vPKHD/HwM0pjuNoC/h5lj8sNKMwOgliOryxvY7/jNPyvp
         ASflURqaqPVoGKw/rFQ17bue4hvqJGMundVBTFM+5+XN16fe8EZgDAtAh1/Bsn812eOD
         CqtRKG/FlSInBHaGHRL2nBJjoahuvEmpkQRC2JESossWbJXfWyiZav/0NJ1kLe2rZ6sI
         sH5VUbV2vdI7i4CSTko3v0p2ur78t/BHfsJ74QpTGcvXr/507HnnSlwLWByQ+NHYli03
         xdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082048; x=1750686848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+LFH2EJZ/euycVAsLwJhPX7xP3RrLri+PWxKx7UufA=;
        b=VUOsRZKmLxlIH5Pjz29Vk9OmaHDZaNhyWC8VUddS1rwzbLIWapQkm0wifHCafXvjhR
         fsGLdo5xoidAk0B0qX2i2XXzjTllTuf5YPR8ovoN0nBjrQllgqy1uqnX+r6tXsm4mgqE
         bscnr5bDToJ82g2hGAlVXqkvrGOYBaZtSHRMcvs6VoAgdGfWr0wWm60kqXoVnQKUQpAi
         xRjF+s4hC3qF/IDzSxKylp9/p6ls25Gjqq91Mbi4IoUMJuwkUuFiCh3mJerGiabGak/O
         hyIeL4LYp1xDVvFfv6j+3Q0Rw6tvdi68acrZUo7br5TDSZppBCvrJqnaIW67c+Rpe9VE
         m7dw==
X-Forwarded-Encrypted: i=1; AJvYcCXL6EBwlEgz7wgtXuDJ0Apdn2YRNKUwUX+XU05da4CSlfpQhW3Iq0/447L0IJuFkdOsqOrk1KgszCOJf0ifmAIT/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1GvdMbN9Ys1WIeIOQUfnkvqlGvPXOLHJI03Iz4j8eKsEt3GVg
	JigM4nc/W+aiP4NKY5IxoeVg7U9dGGptHkogLaCfoGpMnB1A27EbGk79lcVsAIXPuwQ=
X-Gm-Gg: ASbGncscIwaij/9NSXNcRw07oOLOAinh/eIX25w6lr21Azz1t+5lrxWv4sTYBPu2jig
	2nnjtidQ1mFuyZxKgZoQxfeZJV3zjZ6hEjweBomkINDkxGwg08AcUmiwV4wznikqHufSIAmspEn
	QoKirESnfsRfPZvi3R5w5S8GsfhbGpgQ9W2LM51OpMpzcKqpLw5gtZpZIOE3T153Q34i4Kr/SN8
	t6UnKRsjYtcRKJG8xs+esjKJHCikaBzes+KAyYg5kiEyKpt6lYWW0sA+YDrVXaYa1oAHpBXjkJS
	JBC/H0Khs/Bo99Z1tBGvn6cEV4fMRXgbKOPGnSmDcPSHYjdo8j24sTGxemG5dei9+TftTqXeKsY
	wyqk7PY73hjp+OHqk1mzjR8euCrk=
X-Google-Smtp-Source: AGHT+IGkfVytZQOP8rOyQhNTtUZWr9IH2eDQVY0gZwL9P8IewAvv89wj+c+jpi7sVu7bmVbj99zUhQ==
X-Received: by 2002:a17:907:94cb:b0:ad4:d9b2:6ee4 with SMTP id a640c23a62f3a-adfad65f792mr840462566b.49.1750082048005;
        Mon, 16 Jun 2025 06:54:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897a70bsm662748966b.154.2025.06.16.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:54:07 -0700 (PDT)
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
Subject: [PATCH v4 2/2] driver core: platform: Drop dev_pm_domain_detach() call
Date: Mon, 16 Jun 2025 16:53:57 +0300
Message-ID: <20250616135357.3929441-3-claudiu.beznea.uj@bp.renesas.com>
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

On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
clocks are managed through PM domains. These PM domains, registered on
behalf of the clock controller driver, are configured with
GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
clocks are enabled/disabled using runtime PM APIs. The power domains may
also have power_on/power_off support implemented. After the device PM
domain is powered off any CPU accesses to these domains leads to system
aborts.

During probe, devices are attached to the PM domain controlling their
clocks and power. Similarly, during removal, devices are detached from the
PM domain.

The detachment call stack is as follows:

device_driver_detach() ->
  device_release_driver_internal() ->
    __device_release_driver() ->
      device_remove() ->
        platform_remove() ->
	  dev_pm_domain_detach()

During driver unbind, after the device is detached from its PM domain,
the device_unbind_cleanup() function is called, which subsequently invokes
devres_release_all(). This function handles devres resource cleanup.

If runtime PM is enabled in driver probe via devm_pm_runtime_enable(), the
cleanup process triggers the action or reset function for disabling runtime
PM. This function is pm_runtime_disable_action(), which leads to the
following call stack of interest when called:

pm_runtime_disable_action() ->
  pm_runtime_dont_use_autosuspend() ->
    __pm_runtime_use_autosuspend() ->
      update_autosuspend() ->
        rpm_idle()

The rpm_idle() function attempts to resume the device at runtime. However,
at the point it is called, the device is no longer part of a PM domain
(which manages clocks and power states). If the driver implements its own
runtime PM APIs for specific functionalities - such as the rzg2l_adc
driver - while also relying on the power domain subsystem for power
management, rpm_idle() will invoke the driver's runtime PM API. However,
since the device is no longer part of a PM domain at this point, the PM
domain's runtime PM APIs will not be called. This leads to system aborts on
Renesas SoCs.

Another identified case is when a subsystem performs various cleanups
using device_unbind_cleanup(), calling driver-specific APIs in the process.
A known example is the thermal subsystem, which may call driver-specific
APIs to disable the thermal device. The relevant call stack in this case
is:

device_driver_detach() ->
  device_release_driver_internal() ->
    device_unbind_cleanup() ->
      devres_release_all() ->
        devm_thermal_of_zone_release() ->
	  thermal_zone_device_disable() ->
	    thermal_zone_device_set_mode() ->
	      struct thermal_zone_device_ops::change_mode()

At the moment the driver-specific change_mode() API is called, the device
is no longer part of its PM domain. Accessing its registers without proper
power management leads to system aborts.

Drop the call to dev_pm_domain_detach() from the platform bus remove
function and rely on the newly introduced call in device_unbind_cleanup().
This ensures the same effect, but the call now occurs after all
driver-specific devres resources have been freed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- dropped devm_pm_domain_attach() approach
- adjusted patch description to reflect this

Changes in v3:
- adjusted the call to devm_pm_domain_attach() as it now gets
  2 parameters

Changes in v2:
- dropped the devres group open/close approach and use
  devm_pm_domain_attach()
- adjusted patch description to reflect the new approach

 drivers/base/platform.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 075ec1d1b73a..2459be6aecf4 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1400,11 +1400,8 @@ static int platform_probe(struct device *_dev)
 	if (ret)
 		goto out;
 
-	if (drv->probe) {
+	if (drv->probe)
 		ret = drv->probe(dev);
-		if (ret)
-			dev_pm_domain_detach(_dev, true);
-	}
 
 out:
 	if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
@@ -1422,7 +1419,6 @@ static void platform_remove(struct device *_dev)
 
 	if (drv->remove)
 		drv->remove(dev);
-	dev_pm_domain_detach(_dev, true);
 }
 
 static void platform_shutdown(struct device *_dev)
-- 
2.43.0



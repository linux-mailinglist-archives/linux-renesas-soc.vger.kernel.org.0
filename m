Return-Path: <linux-renesas-soc+bounces-17507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27923AC3F3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 14:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3536B1898A31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 12:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B7A20127A;
	Mon, 26 May 2025 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LgBdsi46"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BEC1FFC4F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262083; cv=none; b=TeYtqe2UyFcQigB4jYrYYTYv1LRwQgcssyMKMHk0WQhq3HPPvZ2QA0VweKC4wwKnaFbltVkZ1SyZtFbW7WNNuLgCRFQ39eiQ5bKx/dkYqLCVo9w3Ibh/Pa1/sPoBCJvDDSO53lRyO6AO6j0UyXHM7R66Eosq6jz8PO+n4fAHzCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262083; c=relaxed/simple;
	bh=KWwzDCjjG18fT8xW6cAYE3VLd5IE15tUhmWcO65s6W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ltg2XYXiD8gRSu6d/AocWscowSWFOIWsmi7sIM07cgk6MFxQuei/rkS+u1ALFy8A+baebYT5AMox585Tm63HuHXhKVYER9CO4OnLjxr+3ZjOOYLmaW0MZ/j3yJ8PX0pSm6ocqOvCVBVyrnBlX04MR/Fr8Fk+3afHSgZJP9f6fes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LgBdsi46; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad216a5a59cso280729766b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748262079; x=1748866879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbJUWdOsVxF3giB8Ozh7+t9RUE5aBB4VpYJNrYUW3+w=;
        b=LgBdsi46z5+XwnfILszp4c8/5WuDQuBXLmggFxLUq1yvsDgncpyteGnl2BWvAyNMiR
         pvkh0wMQom90xhNCcjnp4RZ5i3KXUXi61vQeOUKtpCKhD/nFpjVeIHw4atVwdy7hdwX1
         z5XHLKDKumWau8QxOmzjXVHmOCqLypV4KfIcajFjS7C98LScKpbGyDseqBSKJD0BL89o
         3s10DCSvSWfnNVE8xE6V5DLn9u4FSF5n/QY5CKl4XdObcV1peaHpskKBmTaF2asCjr29
         YL63XYdncn69jIRPpk5KdCD2gAGWZNTW5lIr236eSNXShUXsF00Krl93WT59cDPvqBQ6
         rsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262079; x=1748866879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbJUWdOsVxF3giB8Ozh7+t9RUE5aBB4VpYJNrYUW3+w=;
        b=RyQVwuCRLPAc/krvDl7Xz84wVYjoVcKA608bWvdUotdTjlSRxzJOpyeK4nyTMjtt+M
         TbCY1hSdU3v4rhg4V/An04if9e7XUjUwfySrnTazLyFxsE+fIyZNZ0j97iziw1LsHzFL
         GT91Q/ldb6lcTr2Nd7r3UBx5140owdb5RdIRDll57TN5lZelhepaMSiyEu0yhtL8IGUa
         SrsLF7fpNnpCoXvVOrWnS20lDzkjjLzX881RLVjRyxrBtSkS/aPnLcyvGe6QwLtBhD9k
         8WvIRbsW/Rn4dgMU9bJ3iUqGD9cNjvetTm2Tc1gEkVey1DUuvLHQgUkhgvaJwf2KCAkB
         wK9A==
X-Forwarded-Encrypted: i=1; AJvYcCXy/fbuUAT83mIOtcqDsfLOc9HVHjTNYZhlCCASL+UAPYpMl8GuZd4c4LMPbjd383ZkeH8z/f3lQCfqUvuwdHsI+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7FsUqFqAwpA6GAtVnSwlv1+q3ZUnMkEwZSRgIlzRYngBHVv8c
	tDxRZfPufbeAMv/OWNzcGu97jnmaYZwkYbbxvvdP9FtRnfC24jFKP+e2zilhuPUWuzo=
X-Gm-Gg: ASbGncstg7SQBIYek3TaAHjPPfQRZ/rYjfBujQYFSWDtD47ZvAjBIUKOSJFXjKAzfHU
	1lvg6QbKnv78e94pUbc44RaYRhYoOxMhLmJfVJAff1pgszRZpk+5HDCuCygnplMUt5CfhLIsr8e
	R5lpdXV5zd2hCfUmbA3J141JzbNmYNMPoXvToN1h86F09VrqK7qL77pzBVLjIWdmSiuP1ORPVYF
	/YYpDrbVJ73UNhply9fpx88yuzQkppAceFg8nDdsAOgkdJYirPhvsH/Z+qhD8D+Mj4Joj26oRUP
	9kfSTR3WaKmHZoLFNpedsHByV4vKdUJTuTSjeFNs/+AYsn1kYR+oYSO1tA0byaS/FADETKs0zmL
	j/0b8
X-Google-Smtp-Source: AGHT+IFzn8pObOT2e9m03kGlgIH4jUcwkUCOFOcpQ8RfJK68WHE+CNfFZct1ljVHOLC2VTkxUWLOVg==
X-Received: by 2002:a17:907:7fa5:b0:ad4:cc66:1524 with SMTP id a640c23a62f3a-ad85b21206amr829348166b.54.1748262078944;
        Mon, 26 May 2025 05:21:18 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d071c36sm1687630066b.64.2025.05.26.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:21:18 -0700 (PDT)
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
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
Date: Mon, 26 May 2025 15:20:53 +0300
Message-ID: <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
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

Add devm_pm_domain_attach(). When replacing the dev_pm_domain_attach() and
dev_pm_domain_detach() in bus probe and bus remove, it ensures that the
device is detached from its PM domain in device_unbind_cleanup(), only
after all driver's devres-managed resources have been release.

For flexibility, the implemented devm_pm_domain_attach() has 2 state
arguments, one for the domain state on attach, one for the domain state on
detach.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/base/power/common.c | 59 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  8 +++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index 781968a128ff..6ef0924efe2e 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -115,6 +115,65 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
 
+/**
+ * devm_pm_domain_detach_off - devres action for devm_pm_domain_attach() to
+ * detach a device and power it off.
+ * @dev: device to detach.
+ *
+ * This function reverse the actions from devm_pm_domain_attach().
+ * It will be invoked during the remove phase from drivers implicitly.
+ */
+static void devm_pm_domain_detach_off(void *dev)
+{
+	dev_pm_domain_detach(dev, true);
+}
+
+/**
+ * devm_pm_domain_detach_on - devres action for devm_pm_domain_attach() to
+ * detach a device and power it on.
+ * @dev: device to detach.
+ *
+ * This function reverse the actions from devm_pm_domain_attach().
+ * It will be invoked during the remove phase from drivers implicitly.
+ */
+static void devm_pm_domain_detach_on(void *dev)
+{
+	dev_pm_domain_detach(dev, false);
+}
+
+/**
+ * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
+ * @dev: Device to attach.
+ * @attach_power_on: Use to indicate whether we should power on the device
+ *                   when attaching (true indicates the device is powered on
+ *                   when attaching).
+ * @detach_power_off: Used to indicate whether we should power off the device
+ *                    when detaching (true indicates the device is powered off
+ *                    when detaching).
+ *
+ * NOTE: this will also handle calling dev_pm_domain_detach() for
+ * you during remove phase.
+ *
+ * Returns 0 on successfully attached PM domain, or a negative error code in
+ * case of a failure.
+ */
+int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
+			  bool detach_power_off)
+{
+	int ret;
+
+	ret = dev_pm_domain_attach(dev, attach_power_on);
+	if (ret)
+		return ret;
+
+	if (detach_power_off)
+		return devm_add_action_or_reset(dev, devm_pm_domain_detach_off,
+						dev);
+
+	return devm_add_action_or_reset(dev, devm_pm_domain_detach_on, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_domain_attach);
+
 /**
  * dev_pm_domain_attach_by_id - Associate a device with one of its PM domains.
  * @dev: The device used to lookup the PM domain.
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..ee798b090d17 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -509,6 +509,8 @@ struct device *dev_pm_domain_attach_by_name(struct device *dev,
 int dev_pm_domain_attach_list(struct device *dev,
 			      const struct dev_pm_domain_attach_data *data,
 			      struct dev_pm_domain_list **list);
+int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
+			  bool detach_power_off);
 int devm_pm_domain_attach_list(struct device *dev,
 			       const struct dev_pm_domain_attach_data *data,
 			       struct dev_pm_domain_list **list);
@@ -539,6 +541,12 @@ static inline int dev_pm_domain_attach_list(struct device *dev,
 	return 0;
 }
 
+static int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
+				 bool detach_power_off)
+{
+	return 0;
+}
+
 static inline int devm_pm_domain_attach_list(struct device *dev,
 					     const struct dev_pm_domain_attach_data *data,
 					     struct dev_pm_domain_list **list)
-- 
2.43.0


